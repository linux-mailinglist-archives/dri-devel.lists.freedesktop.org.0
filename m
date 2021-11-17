Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433B4548D9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5766E6E4BB;
	Wed, 17 Nov 2021 14:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 985 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 14:32:43 UTC
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829E76E483;
 Wed, 17 Nov 2021 14:32:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 151790-1500050 for multiple; Wed, 17 Nov 2021 14:16:15 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211117133456.688802-3-andi.shyti@linux.intel.com>
References: <20211117133456.688802-1-andi.shyti@linux.intel.com>
 <20211117133456.688802-3-andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Rename gt to gt0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Intel GFX <intel-gfx@lists.freedesktop.org>
Date: Wed, 17 Nov 2021 14:16:13 +0000
Message-ID: <163715857341.11567.6516227738264680366@build.alporthouse.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Michał Winiarski <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2021-11-17 13:34:56)
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/=
gpu/drm/i915/display/intel_atomic_plane.c
> index 089fb4658b216..0bbf8c0c42eac 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -817,7 +817,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>          * maximum clocks following a vblank miss (see do_rps_boost()).
>          */
>         if (!state->rps_interactive) {
> -               intel_rps_mark_interactive(&dev_priv->gt.rps, true);
> +               intel_rps_mark_interactive(&dev_priv->gt0.rps, true);

This should be across all gt, so probably wants a fresh interface that
takes i915 and does for_each_gt in a later patch. (Since we could be
rendering on a remote tile to present on a display.)

>                 state->rps_interactive =3D true;
>         }
> =20
> @@ -851,7 +851,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>                 return;
> =20
>         if (state->rps_interactive) {
> -               intel_rps_mark_interactive(&dev_priv->gt.rps, false);
> +               intel_rps_mark_interactive(&dev_priv->gt0.rps, false);
>                 state->rps_interactive =3D false;
>         }
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 0ceee8ac66717..d4fcd8f236476 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -838,7 +838,7 @@ __intel_display_resume(struct drm_device *dev,
>  static bool gpu_reset_clobbers_display(struct drm_i915_private *dev_priv)
>  {
>         return (INTEL_INFO(dev_priv)->gpu_reset_clobbers_display &&
> -               intel_has_gpu_reset(&dev_priv->gt));
> +               intel_has_gpu_reset(&dev_priv->gt0));

All these display consumers probably want to use
dev_priv->ggtt->vm.gt, since the scanout capable GGTT would seem to be
the defining feature.

to_scanout_gt(i915) ?

>  static bool pxp_is_borked(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index ebd775cb1661c..c62253d0af044 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -237,7 +237,7 @@ static int proto_context_set_persistence(struct drm_i=
915_private *i915,
>                  * colateral damage, and we should not pretend we can by
>                  * exposing the interface.
>                  */
> -               if (!intel_has_reset_engine(&i915->gt))
> +               if (!intel_has_reset_engine(&i915->gt0))
>                         return -ENODEV;

Prep for all gt. A lot of these need an all-gt interface so we don't
have for_each_gt spread all other the place.

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_ttm_move.c
> index ef22d4ed66ad6..69ad407eb15f3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -166,7 +166,7 @@ static struct dma_fence *i915_ttm_accel_move(struct t=
tm_buffer_object *bo,
>         enum i915_cache_level src_level, dst_level;
>         int ret;
> =20
> -       if (!i915->gt.migrate.context || intel_gt_is_wedged(&i915->gt))
> +       if (!i915->gt0.migrate.context || intel_gt_is_wedged(&i915->gt0))

This should already be looking at lmem->gt

> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/dr=
m/i915/gt/intel_engine_user.c
> index 8f8bea08e734d..176ea5c7d422f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -116,7 +116,7 @@ static void set_scheduler_caps(struct drm_i915_privat=
e *i915)
>                         disabled |=3D (I915_SCHEDULER_CAP_ENABLED |
>                                      I915_SCHEDULER_CAP_PRIORITY);
> =20
> -               if (intel_uc_uses_guc_submission(&i915->gt.uc))
> +               if (intel_uc_uses_guc_submission(&i915->gt0.uc))

This shouldn't be looking at gt at all, but if it must, that information
must be coming via engine->gt. Kind of renders the mapping moot
currently.
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/g=
t/intel_rps.c
> index 07ff7ba7b2b71..63089e671a242 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2302,7 +2302,7 @@ unsigned long i915_read_mch_val(void)
>                 return 0;
> =20
>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> -               struct intel_ips *ips =3D &i915->gt.rps.ips;
> +               struct intel_ips *ips =3D &i915->gt0.rps.ips;

Make mchdev_get() return the gt or rps, at the slight cost of making the
drm_dev_put() more complicated (but can be pushed into a mchdev_put for
symmetry).

> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index a9727447c0379..4bfedc04f5c70 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -936,7 +936,7 @@ hsw_gt_workarounds_init(struct intel_gt *gt, struct i=
915_wa_list *wal)
>  static void
>  gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
>  {
> -       const struct sseu_dev_info *sseu =3D &i915->gt.info.sseu;
> +       const struct sseu_dev_info *sseu =3D &i915->gt0.info.sseu;

This feels like it should be pulling from uncore->gt, since the MCR is
across an uncore.

Overall though, rather than introduce bare &i915->gt0, how about pulling in
the patch for to_gt(i915)?
-Chris
