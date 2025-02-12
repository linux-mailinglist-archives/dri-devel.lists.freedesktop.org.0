Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60EA32ED4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A00010E962;
	Wed, 12 Feb 2025 18:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2yCpnVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9610E960;
 Wed, 12 Feb 2025 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739385750; x=1770921750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zxRU2WwRckIaowmUlBJW3gDSh/s4xs3PY2QrhIDM008=;
 b=m2yCpnVJlKT4xZ34+yYQqarokBjNcNWSArkzmOsrZBCbBzrpAX8GlhmM
 BvaQYuZudCHxl1lTb8M867irT5LDdTMT5lS83+XfkTc1Eyj+xGoC3VcvK
 IP5KwJCPinxijq5y0oW5u1TCRCfnifSWGGxxlYOgojRsORZ0UJa6kDYqm
 HfWzRHgbe3KRbINm53zdzgPUCDUL/4AMnUKwUTPJ9rnBRZn4HSAYKzId+
 pNIab3FkmwSMoqCbFm4PmgwtaWSThC4Kwr3sfgb5FL3s7FTIaDhkQwR/u
 2mcc/YFCFU+VjXGNCED460OLE7iQPgohQz3JlELZiml+hvh/W7n145lvs Q==;
X-CSE-ConnectionGUID: /oARhfz+RdqGlZDwLi5IhQ==
X-CSE-MsgGUID: 7Ewe5M6JRYmYh3dEqGP1FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40324446"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40324446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:42:19 -0800
X-CSE-ConnectionGUID: cMoZocMfSEiyHQrQrhhCWQ==
X-CSE-MsgGUID: efYjsVD7RMywTG3zB7ccQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113103325"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Feb 2025 10:42:16 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Feb 2025 20:42:15 +0200
Date: Wed, 12 Feb 2025 20:42:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ville.syrjala@intel.com,
 santhosh.reddy.guddati@intel.com, jani.saarinen@intel.com
Subject: Re: [PATCH v7 6/7] drm/i915/xe3: dirty rect support for FBC
Message-ID: <Z6zrh-NYXaaal4Iw@intel.com>
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
 <20250212131420.60026-7-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212131420.60026-7-vinod.govindapillai@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Feb 12, 2025 at 03:14:19PM +0200, Vinod Govindapillai wrote:
> Dirty rectangle feature allows FBC to recompress a subsection
> of a frame. When this feature is enabled, display will read
> the scan lines between dirty rectangle start line and dirty
> rectangle end line in subsequent frames.
> 
> Use the merged damage clip stored in the plane state to
> configure the FBC dirty rect areas.
> 
> v2: - Move dirty rect handling to fbc state (Ville)
> 
> v3: - Use intel_fbc_dirty_rect_update_noarm (Ville)
>     - Split plane damage collection and dirty rect preparation
>     - Handle case where dirty rect fall outside the visible region
> 
> v4: - A state variable to check if we need to update dirty rect
>     registers in case intel_fbc_can_flip_nuke() (Ville)
> 
> v5: - No need to use a separate valid flag, updates to the
>       conditions for prepare damage rect (Ville)
>     - Usage of locks in fbc dirty rect related functions (Ville)
> 
> Bspec: 68881, 71675, 73424
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  3 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +
>  drivers/gpu/drm/i915/display/intel_fbc.c      | 89 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_fbc.h      |  5 ++
>  4 files changed, 100 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index b4e94dd01173..6e749937f03c 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -805,6 +805,9 @@ void intel_plane_update_noarm(struct intel_dsb *dsb,
>  
>  	trace_intel_plane_update_noarm(plane_state, crtc);
>  
> +	if (plane->fbc)
> +		intel_fbc_dirty_rect_update_noarm(dsb, plane);
> +
>  	if (plane->update_noarm)
>  		plane->update_noarm(dsb, plane, crtc_state, plane_state);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9f8a8c94cf4c..b054c94dce0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7784,6 +7784,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  
>  	intel_atomic_prepare_plane_clear_colors(state);
>  
> +	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
> +		intel_fbc_prepare_dirty_rect(state, crtc);
> +
>  	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
>  		intel_atomic_dsb_finish(state, crtc);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 951dc81b7b97..8c92953b53f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -88,6 +88,7 @@ struct intel_fbc_state {
>  	u16 override_cfb_stride;
>  	u16 interval;
>  	s8 fence_id;
> +	struct drm_rect dirty_rect;
>  };
>  
>  struct intel_fbc {
> @@ -527,6 +528,9 @@ static void ilk_fbc_deactivate(struct intel_fbc *fbc)
>  	struct intel_display *display = fbc->display;
>  	u32 dpfc_ctl;
>  
> +	if (HAS_FBC_DIRTY_RECT(display))
> +		intel_de_write(display, XE3_FBC_DIRTY_CTL(fbc->id), 0);
> +
>  	/* Disable compression */
>  	dpfc_ctl = intel_de_read(display, ILK_DPFC_CONTROL(fbc->id));
>  	if (dpfc_ctl & DPFC_CTL_EN) {
> @@ -670,6 +674,10 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
>  	if (DISPLAY_VER(display) >= 20)
>  		intel_de_write(display, ILK_DPFC_CONTROL(fbc->id), dpfc_ctl);
>  
> +	if (HAS_FBC_DIRTY_RECT(display))
> +		intel_de_write(display, XE3_FBC_DIRTY_CTL(fbc->id),
> +			       FBC_DIRTY_RECT_EN);
> +
>  	intel_de_write(display, ILK_DPFC_CONTROL(fbc->id),
>  		       DPFC_CTL_EN | dpfc_ctl);
>  }
> @@ -1214,6 +1222,87 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
>  		return i8xx_fbc_tiling_valid(plane_state);
>  }
>  
> +static void
> +intel_fbc_dirty_rect_update(struct intel_dsb *dsb, struct intel_fbc *fbc)
> +{
> +	struct intel_display *display = fbc->display;
> +	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
> +
> +	lockdep_assert_held(&fbc->lock);
> +
> +	intel_de_write_dsb(display, dsb, XE3_FBC_DIRTY_RECT(fbc->id),
> +			   FBC_DIRTY_RECT_START_LINE(fbc_dirty_rect->y1) |
> +			   FBC_DIRTY_RECT_END_LINE(fbc_dirty_rect->y2));
> +}
> +
> +void
> +intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
> +				  struct intel_plane *plane)
> +{
> +	struct intel_display *display = to_intel_display(plane);
> +	struct intel_fbc *fbc = plane->fbc;
> +
> +	if (!HAS_FBC_DIRTY_RECT(display))
> +		return;
> +
> +	if (fbc->state.plane != plane)
> +		return;

That needs to be inside the lock.

> +
> +	mutex_lock(&fbc->lock);
> +
> +	intel_fbc_dirty_rect_update(dsb, fbc);
> +
> +	mutex_unlock(&fbc->lock);
> +}
> +
> +static void
> +__intel_fbc_prepare_dirty_rect(struct intel_plane *plane,
> +			       struct intel_plane_state *plane_state)
> +{
> +	struct intel_fbc *fbc = plane->fbc;
> +	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
> +	int y_offset = plane_state->view.color_plane[0].y;
> +	const struct drm_rect *damage = &plane_state->damage;
> +
> +	lockdep_assert_held(&fbc->lock);
> +
> +	/* In damage clip, x1/y1 are inclusive and x2/y2 are exclusive */
> +	fbc_dirty_rect->y1 = drm_rect_visible(damage) ? damage->y1 : y_offset;
> +	fbc_dirty_rect->y2 =
> +		drm_rect_visible(damage) ? damage->y2 - 1 : y_offset;
> +	fbc_dirty_rect->x1 = damage->x1;
> +	fbc_dirty_rect->x2 = damage->x2 - 1;

This looks rather messy:

Something like this would be more legible:

if (visible(damage)) {
	dirty_rect = damage;
} else {
	/* dirty rect must cover at least one line */
	drm_rect_init(dirty_rect ...);
}

Also the -1 for for the end line should be done in 
intel_fbc_dirty_rect_update() and not here. drm_rects
are always supposed to have exclusive end coordinates.

> +}
> +
> +void
> +intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
> +			     struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(state);
> +	struct intel_plane_state *plane_state;
> +	struct intel_plane *plane;
> +	int i;
> +
> +	if (!HAS_FBC_DIRTY_RECT(display))
> +		return;
> +
> +	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
> +		struct intel_fbc *fbc = plane->fbc;
> +
> +		if (!fbc || plane->pipe != crtc->pipe)
> +			continue;
> +
> +		if (fbc->state.plane != plane)
> +			continue;

Also belongs inside the lock.

> +
> +		mutex_lock(&fbc->lock);
> +
> +		__intel_fbc_prepare_dirty_rect(plane, plane_state);
> +
> +		mutex_unlock(&fbc->lock);
> +	}
> +}
> +
>  static void intel_fbc_update_state(struct intel_atomic_state *state,
>  				   struct intel_crtc *crtc,
>  				   struct intel_plane *plane)
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
> index ceae55458e14..fe48d0276eec 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.h
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.h
> @@ -14,6 +14,7 @@ struct intel_atomic_state;
>  struct intel_crtc;
>  struct intel_crtc_state;
>  struct intel_display;
> +struct intel_dsb;
>  struct intel_fbc;
>  struct intel_plane;
>  struct intel_plane_state;
> @@ -48,5 +49,9 @@ void intel_fbc_handle_fifo_underrun_irq(struct intel_display *display);
>  void intel_fbc_reset_underrun(struct intel_display *display);
>  void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc);
>  void intel_fbc_debugfs_register(struct intel_display *display);
> +void intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
> +				  struct intel_crtc *crtc);
> +void intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
> +				       struct intel_plane *plane);
>  
>  #endif /* __INTEL_FBC_H__ */
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
