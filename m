Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE4842140
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FEF112F2D;
	Tue, 30 Jan 2024 10:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA742112F2D;
 Tue, 30 Jan 2024 10:28:40 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlM1-00000001Y1G-44up; Tue, 30 Jan 2024 12:28:38 +0200
Message-ID: <1e12671ba315fa9a9682a0656debb377055f00bd.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:28:33 +0200
In-Reply-To: <246c0c275d05c919d959983e1784e3f7347f4540.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <246c0c275d05c919d959983e1784e3f7347f4540.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 08/10] drm/i915: use drm_printf() with the
 drm_err_printer intead of pr_err()
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> There's already a related drm_printer. Use it to preserve the context
> instead of a separate pr_err().
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c | 6 +++---
>  drivers/gpu/drm/i915/selftests/i915_active.c        | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/driver=
s/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> index be827318275c..ef014df4c4fc 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> @@ -124,7 +124,7 @@ static int __live_idle_pulse(struct intel_engine_cs *=
engine,
>  	if (engine_sync_barrier(engine)) {
>  		struct drm_printer m =3D drm_err_printer(&engine->i915->drm, "pulse");
> =20
> -		pr_err("%s: no heartbeat pulse?\n", engine->name);
> +		drm_printf(&m, "%s: no heartbeat pulse?\n", engine->name);
>  		intel_engine_dump(engine, &m, "%s", engine->name);
> =20
>  		err =3D -ETIME;
> @@ -138,8 +138,8 @@ static int __live_idle_pulse(struct intel_engine_cs *=
engine,
>  	if (!i915_active_is_idle(&p->active)) {
>  		struct drm_printer m =3D drm_err_printer(&engine->i915->drm, "pulse");
> =20
> -		pr_err("%s: heartbeat pulse did not flush idle tasks\n",
> -		       engine->name);
> +		drm_printf(&m, "%s: heartbeat pulse did not flush idle tasks\n",
> +			   engine->name);
>  		i915_active_print(&p->active, &m);
> =20
>  		err =3D -EINVAL;
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/d=
rm/i915/selftests/i915_active.c
> index 8886752ade63..0d89d70b9c36 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -158,7 +158,7 @@ static int live_active_wait(void *arg)
>  	if (!READ_ONCE(active->retired)) {
>  		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> =20
> -		pr_err("i915_active not retired after waiting!\n");
> +		drm_printf(&p, "i915_active not retired after waiting!\n");
>  		i915_active_print(&active->base, &p);
> =20
>  		err =3D -EINVAL;
> @@ -191,7 +191,7 @@ static int live_active_retire(void *arg)
>  	if (!READ_ONCE(active->retired)) {
>  		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> =20
> -		pr_err("i915_active not retired after flushing!\n");
> +		drm_printf(&p, "i915_active not retired after flushing!\n");
>  		i915_active_print(&active->base, &p);
> =20
>  		err =3D -EINVAL;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
