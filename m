Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519494CB0A4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 22:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B38710E2D7;
	Wed,  2 Mar 2022 21:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 978 seconds by postgrey-1.36 at gabe;
 Wed, 02 Mar 2022 21:06:42 UTC
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15F210E299;
 Wed,  2 Mar 2022 21:06:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=109.170.220.31; 
Received: from localhost (unverified [109.170.220.31]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 1078884-1500050 for multiple; Wed, 02 Mar 2022 20:50:20 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220302182657.1483623-1-fei.yang@intel.com>
References: <20220302182657.1483623-1-fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org, fei.yang@intel.com,
 intel-gfx@lists.freedesktop.org
Date: Wed, 02 Mar 2022 20:50:19 +0000
Message-ID: <164625421996.6785.4140948249426110978@build.alporthouse.com>
User-Agent: alot/0.9
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting fei.yang@intel.com (2022-03-02 18:26:57)
> From: Fei Yang <fei.yang@intel.com>
>=20
> GPU hangs have been observed when multiple engines write to the
> same aux_inv register at the same time. To avoid this each engine
> should only invalidate its own auxiliary table. The function
> gen12_emit_flush_xcs() currently invalidate the auxiliary table for
> all engines because the rq->engine is not necessarily the engine
> eventually carrying out the request, and potentially the engine
> could even be a virtual one (with engine->instance being -1).
> With this patch, auxiliary table invalidation is done only for the
> engine executing the request. And the mmio address for the aux_inv
> register is set after the engine instance becomes certain.
>=20
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 41 ++++---------------
>  .../drm/i915/gt/intel_execlists_submission.c  | 38 +++++++++++++++++
>  drivers/gpu/drm/i915/i915_request.h           |  2 +
>  3 files changed, 47 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i=
915/gt/gen8_engine_cs.c
> index b1b9c3fd7bf9..af62e2bc2c9b 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,30 +165,6 @@ static u32 preparser_disable(bool state)
>         return MI_ARB_CHECK | 1 << 8 | state;
>  }
> =20
> -static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
> -{
> -       static const i915_reg_t vd[] =3D {
> -               GEN12_VD0_AUX_NV,
> -               GEN12_VD1_AUX_NV,
> -               GEN12_VD2_AUX_NV,
> -               GEN12_VD3_AUX_NV,
> -       };
> -
> -       static const i915_reg_t ve[] =3D {
> -               GEN12_VE0_AUX_NV,
> -               GEN12_VE1_AUX_NV,
> -       };
> -
> -       if (engine->class =3D=3D VIDEO_DECODE_CLASS)
> -               return vd[engine->instance];
> -
> -       if (engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS)
> -               return ve[engine->instance];
> -
> -       GEM_BUG_ON("unknown aux_inv reg\n");
> -       return INVALID_MMIO_REG;
> -}
> -
>  static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
>  {
>         *cs++ =3D MI_LOAD_REGISTER_IMM(1);
> @@ -288,7 +264,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32=
 mode)
>         if (mode & EMIT_INVALIDATE)
>                 aux_inv =3D rq->engine->mask & ~BIT(BCS0);
>         if (aux_inv)
> -               cmd +=3D 2 * hweight32(aux_inv) + 2;
> +               cmd +=3D 4;
> =20
>         cs =3D intel_ring_begin(rq, cmd);
>         if (IS_ERR(cs))
> @@ -319,16 +295,13 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u=
32 mode)
>         *cs++ =3D 0; /* value */
> =20
>         if (aux_inv) { /* hsdes: 1809175790 */
> -               struct intel_engine_cs *engine;
> -               unsigned int tmp;
> -
> -               *cs++ =3D MI_LOAD_REGISTER_IMM(hweight32(aux_inv));
> -               for_each_engine_masked(engine, rq->engine->gt, aux_inv, t=
mp) {
> -                       *cs++ =3D i915_mmio_reg_offset(aux_inv_reg(engine=
));
> -                       *cs++ =3D AUX_INV;
> -               }
> +               *cs++ =3D MI_LOAD_REGISTER_IMM(1);
> +               rq->vd_ve_aux_inv =3D cs;
> +               *cs++ =3D 0; /* address to be set at submission to HW */
> +               *cs++ =3D AUX_INV;
>                 *cs++ =3D MI_NOOP;
> -       }
> +       } else
> +               rq->vd_ve_aux_inv =3D NULL;
> =20
>         if (mode & EMIT_INVALIDATE)
>                 *cs++ =3D preparser_disable(false);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drive=
rs/gpu/drm/i915/gt/intel_execlists_submission.c
> index 1c602d4ae297..a018de6dcac5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1258,6 +1258,34 @@ static bool completed(const struct i915_request *r=
q)
>         return __i915_request_is_complete(rq);
>  }
> =20
> +static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
> +{
> +       static const i915_reg_t vd[] =3D {
> +               GEN12_VD0_AUX_NV,
> +               GEN12_VD1_AUX_NV,
> +               GEN12_VD2_AUX_NV,
> +               GEN12_VD3_AUX_NV,
> +       };
> +
> +       static const i915_reg_t ve[] =3D {
> +               GEN12_VE0_AUX_NV,
> +               GEN12_VE1_AUX_NV,
> +       };
> +
> +       if (engine->class =3D=3D VIDEO_DECODE_CLASS) {
> +               GEM_BUG_ON(engine->instance >=3D ARRAY_SIZE(vd));
> +               return vd[engine->instance];
> +       }
> +
> +       if (engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS) {
> +               GEM_BUG_ON(engine->instance >=3D ARRAY_SIZE(ve));
> +               return ve[engine->instance];
> +       }
> +
> +       GEM_BUG_ON("unknown aux_inv reg\n");
> +       return INVALID_MMIO_REG;
> +}
> +
>  static void execlists_dequeue(struct intel_engine_cs *engine)
>  {
>         struct intel_engine_execlists * const execlists =3D &engine->exec=
lists;
> @@ -1538,6 +1566,16 @@ static void execlists_dequeue(struct intel_engine_=
cs *engine)
>                         }
> =20
>                         if (__i915_request_submit(rq)) {
> +                               /* hsdes: 1809175790 */
> +                               if ((GRAPHICS_VER(engine->i915) =3D=3D 12=
) &&
> +                                   rq->vd_ve_aux_inv &&
> +                                   (engine->class =3D=3D VIDEO_DECODE_CL=
ASS ||
> +                                    engine->class =3D=3D VIDEO_ENHANCEME=
NT_CLASS)) {

We do not need the extra checks here; we just do as we are told. We only
tell ourselves to apply the fixup when required.

> +                                       *rq->vd_ve_aux_inv =3D i915_mmio_=
reg_offset

Likewise, vd_ve is overspecific, aux_inv_fixup or aux_inv_wa (or
wa_aux_iv, fixup_aux_inv).

> +                                               (aux_inv_reg(engine));
> +                                       rq->vd_ve_aux_inv =3D NULL;

Move this to i915_request initialisation so that we only set aux_inv
when required, which probably explains the extra defence.

> +                                       rq->execution_mask =3D engine->ma=
sk;
> +                               }
>                                 if (!merge) {
>                                         *port++ =3D i915_request_get(last=
);
>                                         last =3D NULL;
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i=
915_request.h
> index 28b1f9db5487..69de32e5e15d 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -350,6 +350,8 @@ struct i915_request {
>                 struct list_head link;
>                 unsigned long delay;
>         } mock;)
> +
> +       u32 *vd_ve_aux_inv;

Not at the end of the struct; that's where we put things in the dungeon.
The selftest struct should be last; I do hope no one has been putting
things at random places in the struct without considering the layout and
semantics. From the flow, this is akin to batch, capture_list; before
emitted_jiffies would be a good spot.
-Chris
