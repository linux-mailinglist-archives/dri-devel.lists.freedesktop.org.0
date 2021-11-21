Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C53458368
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 13:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EFB6F8D5;
	Sun, 21 Nov 2021 12:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FFD6F8D7;
 Sun, 21 Nov 2021 12:35:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10174"; a="258472241"
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="258472241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 04:35:38 -0800
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="508574726"
Received: from dkaczoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.48.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 04:35:35 -0800
Date: Sun, 21 Nov 2021 13:35:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Rename gt to gt0
Message-ID: <YZo9FDLwSL52DeeE@intel.intel>
References: <20211117133456.688802-1-andi.shyti@linux.intel.com>
 <20211117133456.688802-3-andi.shyti@linux.intel.com>
 <163715857341.11567.6516227738264680366@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163715857341.11567.6516227738264680366@build.alporthouse.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -817,7 +817,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
> >          * maximum clocks following a vblank miss (see do_rps_boost()).
> >          */
> >         if (!state->rps_interactive) {
> > -               intel_rps_mark_interactive(&dev_priv->gt.rps, true);
> > +               intel_rps_mark_interactive(&dev_priv->gt0.rps, true);
> 
> This should be across all gt, so probably wants a fresh interface that
> takes i915 and does for_each_gt in a later patch. (Since we could be
> rendering on a remote tile to present on a display.)

To make it more generic this can be done by adding in rps a:

  /* the original intel_rps_mark_interactive */
  intel_rps_mark_interactive_gt(struct intel_rps *rps, bool interactive)
  {
  	...
  }
  
  intel_rps_mark_interactive(struct drm_i915_private *i915, bool interactive)
  {
  	for_each_gt(...)
  		intel_rps_mark_interactive_gt(...)
  }

but I think this should go on a different patch.

> >                 state->rps_interactive = true;
> >         }
> >  
> > @@ -851,7 +851,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
> >                 return;
> >  
> >         if (state->rps_interactive) {
> > -               intel_rps_mark_interactive(&dev_priv->gt.rps, false);
> > +               intel_rps_mark_interactive(&dev_priv->gt0.rps, false);
> >                 state->rps_interactive = false;
> >         }
> >  
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index 0ceee8ac66717..d4fcd8f236476 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -838,7 +838,7 @@ __intel_display_resume(struct drm_device *dev,
> >  static bool gpu_reset_clobbers_display(struct drm_i915_private *dev_priv)
> >  {
> >         return (INTEL_INFO(dev_priv)->gpu_reset_clobbers_display &&
> > -               intel_has_gpu_reset(&dev_priv->gt));
> > +               intel_has_gpu_reset(&dev_priv->gt0));
> 
> All these display consumers probably want to use
> dev_priv->ggtt->vm.gt, since the scanout capable GGTT would seem to be
> the defining feature.
> 
> to_scanout_gt(i915) ?

OK

> >  static bool pxp_is_borked(struct drm_i915_gem_object *obj)
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index ebd775cb1661c..c62253d0af044 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -237,7 +237,7 @@ static int proto_context_set_persistence(struct drm_i915_private *i915,
> >                  * colateral damage, and we should not pretend we can by
> >                  * exposing the interface.
> >                  */
> > -               if (!intel_has_reset_engine(&i915->gt))
> > +               if (!intel_has_reset_engine(&i915->gt0))
> >                         return -ENODEV;
> 
> Prep for all gt. A lot of these need an all-gt interface so we don't
> have for_each_gt spread all other the place.

agree... I think, though, this should go in a different patch.

> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > index ef22d4ed66ad6..69ad407eb15f3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > @@ -166,7 +166,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
> >         enum i915_cache_level src_level, dst_level;
> >         int ret;
> >  
> > -       if (!i915->gt.migrate.context || intel_gt_is_wedged(&i915->gt))
> > +       if (!i915->gt0.migrate.context || intel_gt_is_wedged(&i915->gt0))
> 
> This should already be looking at lmem->gt

Thanks... I will note this down for a different patch, as well.

> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > index 8f8bea08e734d..176ea5c7d422f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > @@ -116,7 +116,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
> >                         disabled |= (I915_SCHEDULER_CAP_ENABLED |
> >                                      I915_SCHEDULER_CAP_PRIORITY);
> >  
> > -               if (intel_uc_uses_guc_submission(&i915->gt.uc))
> > +               if (intel_uc_uses_guc_submission(&i915->gt0.uc))
> 
> This shouldn't be looking at gt at all, but if it must, that information
> must be coming via engine->gt. Kind of renders the mapping moot
> currently.

OK

> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index 07ff7ba7b2b71..63089e671a242 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -2302,7 +2302,7 @@ unsigned long i915_read_mch_val(void)
> >                 return 0;
> >  
> >         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> > -               struct intel_ips *ips = &i915->gt.rps.ips;
> > +               struct intel_ips *ips = &i915->gt0.rps.ips;
> 
> Make mchdev_get() return the gt or rps, at the slight cost of making the
> drm_dev_put() more complicated (but can be pushed into a mchdev_put for
> symmetry).

this is also valid, we mchdev_get is returning i915 only for the
runtime_pm. I will keep it for the next refactoring.

> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index a9727447c0379..4bfedc04f5c70 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -936,7 +936,7 @@ hsw_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  static void
> >  gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
> >  {
> > -       const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
> > +       const struct sseu_dev_info *sseu = &i915->gt0.info.sseu;
> 
> This feels like it should be pulling from uncore->gt, since the MCR is
> across an uncore.

This might need a better refactoring, rather than seeking for the
gt. Because:

  static void                                                 
  gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
  {                                                           
  	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
  
  		...
  }

  ...

  static void
  gen9_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
  {
          struct drm_i915_private *i915 = gt->i915;
  
          gen9_wa_init_mcr(i915, wal);
  
  		...
  }

I'll check how this has been handled in the multitile adaptation,
but in any case this is argument for a next patch.

> Overall though, rather than introduce bare &i915->gt0, how about pulling in
> the patch for to_gt(i915)?

As we discussed offline, Matt was suggesting to_root_gt() I will
take that idea.

Thanks a lot for your review!
Andi
