Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56C98EDA3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE1A10E7FE;
	Thu,  3 Oct 2024 11:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVw7wn9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBE610E1D9;
 Thu,  3 Oct 2024 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727953983; x=1759489983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WiRV4533xNr5zAZkoiBjO3qNeSd14U+MWioKdMGUBck=;
 b=UVw7wn9ZomBEYhUovSdygJp+WBZ8AkHgru+nKEPSQI1JhAlnQSqphjT4
 kL6e7mymzTgfcnLuK9YusyjEDr43QHCi+PmMyqic1ppIS2iUrTYCEZR9a
 R+ZmyGWTNePFFZB8A8+9awSKdv8XujEnyJaDT/ZxOu8dae+oe61R6Cb8b
 GIGKxmbRfF3JJ2X04kf2gpnDHtKA7oaE6ifTmh9ZBr0EJi/7EgbMVfOxe
 UgTxWIRZom1rWZQI7TE70baMHhJ+AlemlHInfhrSGFLUcuWFR2xS/Iyga
 4KsKLtAgIv5FZi25wGNMKQoQfqkHeO4nYSc7tDChUsy3UNmxCfkjAo+4N A==;
X-CSE-ConnectionGUID: b9VquoYMQRir4fiiHHJUWQ==
X-CSE-MsgGUID: WJGSGW+mSrOjGbFbWtdBSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012439"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:12:09 -0700
X-CSE-ConnectionGUID: qvVQ22/BRWWLLttHvKJdCA==
X-CSE-MsgGUID: aKIcLiEkQW2IO9HmVRYMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74421930"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:12:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:12:01 +0300
Date: Thu, 3 Oct 2024 14:12:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Move plane->{fb,old_fb,crtc} to legacy
 sub-structure
Message-ID: <Zv58AalhFaMgh7c5@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002182200.15363-2-ville.syrjala@linux.intel.com>
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

On Wed, Oct 02, 2024 at 09:21:59PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Hide the plane->fb/etc. footguns better by stashing them inside
> a "legacy" sub struct.
> 
> Eventually maybe we could turn 'legacy' into a pointer
> that only exists on legacy drivers to completely prevent
> any abuse by atomic drivers...

Hmm. I should probably make it a pointer from the start,
to avoid having to go through the same churn yet again.

> 
> Side note: _dpu_plane_set_danger_state() looks completely
> broken.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Link: https://www.youtube.com/watch?v=gtCCi2mSN80
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 12 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 12 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 12 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 12 ++--
>  drivers/gpu/drm/drm_atomic.c                  |  6 +-
>  drivers/gpu/drm/drm_crtc.c                    | 22 +++----
>  drivers/gpu/drm/drm_crtc_helper.c             | 20 +++---
>  drivers/gpu/drm/drm_fb_helper.c               |  2 +-
>  drivers/gpu/drm/drm_framebuffer.c             |  4 +-
>  drivers/gpu/drm/drm_plane.c                   | 64 +++++++++----------
>  drivers/gpu/drm/gma500/cdv_intel_display.c    |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c         |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |  3 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  2 +-
>  drivers/gpu/drm/gma500/gma_display.c          | 14 ++--
>  drivers/gpu/drm/gma500/oaktrail_crtc.c        |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_display.c    |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c       |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  2 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c              |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  6 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       | 16 ++---
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  2 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        | 16 ++---
>  drivers/gpu/drm/radeon/evergreen.c            |  2 +-
>  drivers/gpu/drm/radeon/r100.c                 |  6 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c    |  3 +-
>  drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  4 +-
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c   | 14 ++--
>  drivers/gpu/drm/radeon/rs600.c                |  2 +-
>  drivers/gpu/drm/radeon/rv770.c                |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
>  include/drm/drm_plane.h                       | 52 +++++++--------
>  38 files changed, 173 insertions(+), 169 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 344e0a9ee08a..90973470b6da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -94,7 +94,7 @@ static void amdgpu_connector_property_change_mode(struct drm_encoder *encoder)
>  
>  	if (crtc && crtc->enabled) {
>  		drm_crtc_helper_set_mode(crtc, &crtc->mode,
> -					 crtc->x, crtc->y, crtc->primary->fb);
> +					 crtc->x, crtc->y, crtc->primary->legacy.fb);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b119d27271c1..1b1448a58543 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -216,7 +216,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
>  	work->async = (page_flip_flags & DRM_MODE_PAGE_FLIP_ASYNC) != 0;
>  
>  	/* schedule unpin of the old buffer */
> -	obj = crtc->primary->fb->obj[0];
> +	obj = crtc->primary->legacy.fb->obj[0];
>  
>  	/* take a reference to the old object */
>  	work->old_abo = gem_to_amdgpu_bo(obj);
> @@ -280,7 +280,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
>  	DRM_DEBUG_DRIVER("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_PENDING, work: %p,\n",
>  					 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
>  	/* update crtc fb */
> -	crtc->primary->fb = fb;
> +	crtc->primary->legacy.fb = fb;
>  	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  	amdgpu_display_flip_work_func(&work->flip_work.work);
>  	return 0;
> @@ -1715,7 +1715,7 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
>  	/* unpin the front buffers and cursors */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
> -		struct drm_framebuffer *fb = crtc->primary->fb;
> +		struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  		struct amdgpu_bo *robj;
>  
>  		if (amdgpu_crtc->cursor_bo && !adev->enable_virtual_display) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 70c1399f738d..db19854f04f2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -235,7 +235,7 @@ static void dce_v10_0_page_flip(struct amdgpu_device *adev,
>  				int crtc_id, u64 crtc_base, bool async)
>  {
>  	struct amdgpu_crtc *amdgpu_crtc = adev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->legacy.fb;
>  	u32 tmp;
>  
>  	/* flip at hsync for async, default is vsync */
> @@ -1861,7 +1861,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	bool bypass_lut = false;
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -1869,7 +1869,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	/* If atomic, assume fb object is pinned & idle & fenced and
>  	 * just update base pointers
> @@ -2074,7 +2074,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	/* set pageflip to happen anywhere in vblank interval */
>  	WREG32(mmMASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		abo = gem_to_amdgpu_bo(fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r != 0))
> @@ -2557,11 +2557,11 @@ static void dce_v10_0_crtc_disable(struct drm_crtc *crtc)
>  	int i;
>  
>  	dce_v10_0_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> -	if (crtc->primary->fb) {
> +	if (crtc->primary->legacy.fb) {
>  		int r;
>  		struct amdgpu_bo *abo;
>  
> -		abo = gem_to_amdgpu_bo(crtc->primary->fb->obj[0]);
> +		abo = gem_to_amdgpu_bo(crtc->primary->legacy.fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r))
>  			DRM_ERROR("failed to reserve abo before unpin\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index f154c24499c8..af889d0b6826 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -259,7 +259,7 @@ static void dce_v11_0_page_flip(struct amdgpu_device *adev,
>  				int crtc_id, u64 crtc_base, bool async)
>  {
>  	struct amdgpu_crtc *amdgpu_crtc = adev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->legacy.fb;
>  	u32 tmp;
>  
>  	/* flip immediate for async, default is vsync */
> @@ -1911,7 +1911,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	bool bypass_lut = false;
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -1919,7 +1919,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	/* If atomic, assume fb object is pinned & idle & fenced and
>  	 * just update base pointers
> @@ -2124,7 +2124,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	/* set pageflip to happen anywhere in vblank interval */
>  	WREG32(mmCRTC_MASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		abo = gem_to_amdgpu_bo(fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r != 0))
> @@ -2641,11 +2641,11 @@ static void dce_v11_0_crtc_disable(struct drm_crtc *crtc)
>  	int i;
>  
>  	dce_v11_0_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> -	if (crtc->primary->fb) {
> +	if (crtc->primary->legacy.fb) {
>  		int r;
>  		struct amdgpu_bo *abo;
>  
> -		abo = gem_to_amdgpu_bo(crtc->primary->fb->obj[0]);
> +		abo = gem_to_amdgpu_bo(crtc->primary->legacy.fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r))
>  			DRM_ERROR("failed to reserve abo before unpin\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index a7fcb135827f..d55be18957b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -195,7 +195,7 @@ static void dce_v6_0_page_flip(struct amdgpu_device *adev,
>  			       int crtc_id, u64 crtc_base, bool async)
>  {
>  	struct amdgpu_crtc *amdgpu_crtc = adev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->legacy.fb;
>  
>  	/* flip at hsync for async, default is vsync */
>  	WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, async ?
> @@ -1841,7 +1841,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	bool bypass_lut = false;
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -1849,7 +1849,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	/* If atomic, assume fb object is pinned & idle & fenced and
>  	 * just update base pointers
> @@ -2032,7 +2032,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	/* set pageflip to happen anywhere in vblank interval */
>  	WREG32(mmMASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		abo = gem_to_amdgpu_bo(fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r != 0))
> @@ -2472,11 +2472,11 @@ static void dce_v6_0_crtc_disable(struct drm_crtc *crtc)
>  	int i;
>  
>  	dce_v6_0_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> -	if (crtc->primary->fb) {
> +	if (crtc->primary->legacy.fb) {
>  		int r;
>  		struct amdgpu_bo *abo;
>  
> -		abo = gem_to_amdgpu_bo(crtc->primary->fb->obj[0]);
> +		abo = gem_to_amdgpu_bo(crtc->primary->legacy.fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r))
>  			DRM_ERROR("failed to reserve abo before unpin\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 77ac3f114d24..7a24d5835107 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -186,7 +186,7 @@ static void dce_v8_0_page_flip(struct amdgpu_device *adev,
>  			       int crtc_id, u64 crtc_base, bool async)
>  {
>  	struct amdgpu_crtc *amdgpu_crtc = adev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = amdgpu_crtc->base.primary->legacy.fb;
>  
>  	/* flip at hsync for async, default is vsync */
>  	WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, async ?
> @@ -1808,7 +1808,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	bool bypass_lut = false;
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -1816,7 +1816,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	/* If atomic, assume fb object is pinned & idle & fenced and
>  	 * just update base pointers
> @@ -2001,7 +2001,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
>  	/* set pageflip to happen anywhere in vblank interval */
>  	WREG32(mmMASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		abo = gem_to_amdgpu_bo(fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r != 0))
> @@ -2476,11 +2476,11 @@ static void dce_v8_0_crtc_disable(struct drm_crtc *crtc)
>  	int i;
>  
>  	dce_v8_0_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> -	if (crtc->primary->fb) {
> +	if (crtc->primary->legacy.fb) {
>  		int r;
>  		struct amdgpu_bo *abo;
>  
> -		abo = gem_to_amdgpu_bo(crtc->primary->fb->obj[0]);
> +		abo = gem_to_amdgpu_bo(crtc->primary->legacy.fb->obj[0]);
>  		r = amdgpu_bo_reserve(abo, true);
>  		if (unlikely(r))
>  			DRM_ERROR("failed to reserve abo before unpin\n");
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 0fc99da93afe..4cfabc8d20e5 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -530,9 +530,9 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>  	WARN_ON(!state->acquire_ctx);
>  
>  	/* the legacy pointers should never be set */
> -	WARN_ON(plane->fb);
> -	WARN_ON(plane->old_fb);
> -	WARN_ON(plane->crtc);
> +	WARN_ON(plane->legacy.fb);
> +	WARN_ON(plane->legacy.old_fb);
> +	WARN_ON(plane->legacy.crtc);
>  
>  	plane_state = drm_atomic_get_existing_plane_state(state, plane);
>  	if (plane_state)
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 3488ff067c69..db9e6253949f 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -544,8 +544,8 @@ int drm_mode_getcrtc(struct drm_device *dev,
>  	drm_modeset_lock(&plane->mutex, NULL);
>  	if (plane->state && plane->state->fb)
>  		crtc_resp->fb_id = plane->state->fb->base.id;
> -	else if (!plane->state && plane->fb)
> -		crtc_resp->fb_id = plane->fb->base.id;
> +	else if (!plane->state && plane->legacy.fb)
> +		crtc_resp->fb_id = plane->legacy.fb->base.id;
>  	else
>  		crtc_resp->fb_id = 0;
>  
> @@ -600,7 +600,7 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
>  	drm_for_each_crtc(tmp, crtc->dev) {
>  		struct drm_plane *plane = tmp->primary;
>  
> -		plane->old_fb = plane->fb;
> +		plane->legacy.old_fb = plane->legacy.fb;
>  	}
>  
>  	fb = set->fb;
> @@ -609,18 +609,18 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
>  	if (ret == 0) {
>  		struct drm_plane *plane = crtc->primary;
>  
> -		plane->crtc = fb ? crtc : NULL;
> -		plane->fb = fb;
> +		plane->legacy.crtc = fb ? crtc : NULL;
> +		plane->legacy.fb = fb;
>  	}
>  
>  	drm_for_each_crtc(tmp, crtc->dev) {
>  		struct drm_plane *plane = tmp->primary;
>  
> -		if (plane->fb)
> -			drm_framebuffer_get(plane->fb);
> -		if (plane->old_fb)
> -			drm_framebuffer_put(plane->old_fb);
> -		plane->old_fb = NULL;
> +		if (plane->legacy.fb)
> +			drm_framebuffer_get(plane->legacy.fb);
> +		if (plane->legacy.old_fb)
> +			drm_framebuffer_put(plane->legacy.old_fb);
> +		plane->legacy.old_fb = NULL;
>  	}
>  
>  	return ret;
> @@ -739,7 +739,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  			if (plane->state)
>  				old_fb = plane->state->fb;
>  			else
> -				old_fb = plane->fb;
> +				old_fb = plane->legacy.fb;
>  
>  			if (!old_fb) {
>  				drm_dbg_kms(dev, "CRTC doesn't have current FB\n");
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index 0955f1c385dd..1df4a05f7a01 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -204,7 +204,7 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
>  				(*crtc_funcs->disable)(crtc);
>  			else
>  				(*crtc_funcs->dpms)(crtc, DRM_MODE_DPMS_OFF);
> -			crtc->primary->fb = NULL;
> +			crtc->primary->legacy.fb = NULL;
>  		}
>  	}
>  }
> @@ -635,17 +635,17 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  	save_set.mode = &set->crtc->mode;
>  	save_set.x = set->crtc->x;
>  	save_set.y = set->crtc->y;
> -	save_set.fb = set->crtc->primary->fb;
> +	save_set.fb = set->crtc->primary->legacy.fb;
>  
>  	/* We should be able to check here if the fb has the same properties
>  	 * and then just flip_or_move it */
> -	if (set->crtc->primary->fb != set->fb) {
> +	if (set->crtc->primary->legacy.fb != set->fb) {
>  		/* If we have no fb then treat it as a full mode set */
> -		if (set->crtc->primary->fb == NULL) {
> +		if (set->crtc->primary->legacy.fb == NULL) {
>  			drm_dbg_kms(dev, "[CRTC:%d:%s] no fb, full mode set\n",
>  				    set->crtc->base.id, set->crtc->name);
>  			mode_changed = true;
> -		} else if (set->fb->format != set->crtc->primary->fb->format) {
> +		} else if (set->fb->format != set->crtc->primary->legacy.fb->format) {
>  			mode_changed = true;
>  		} else
>  			fb_changed = true;
> @@ -768,13 +768,13 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  		if (drm_helper_crtc_in_use(set->crtc)) {
>  			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace: " DRM_MODE_FMT "\n",
>  				    set->crtc->base.id, set->crtc->name, DRM_MODE_ARG(set->mode));
> -			set->crtc->primary->fb = set->fb;
> +			set->crtc->primary->legacy.fb = set->fb;
>  			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
>  						      set->x, set->y,
>  						      save_set.fb)) {
>  				drm_err(dev, "[CRTC:%d:%s] failed to set mode\n",
>  					set->crtc->base.id, set->crtc->name);
> -				set->crtc->primary->fb = save_set.fb;
> +				set->crtc->primary->legacy.fb = save_set.fb;
>  				ret = -EINVAL;
>  				goto fail;
>  			}
> @@ -790,13 +790,13 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  	} else if (fb_changed) {
>  		set->crtc->x = set->x;
>  		set->crtc->y = set->y;
> -		set->crtc->primary->fb = set->fb;
> +		set->crtc->primary->legacy.fb = set->fb;
>  		ret = crtc_funcs->mode_set_base(set->crtc,
>  						set->x, set->y, save_set.fb);
>  		if (ret != 0) {
>  			set->crtc->x = save_set.x;
>  			set->crtc->y = save_set.y;
> -			set->crtc->primary->fb = save_set.fb;
> +			set->crtc->primary->legacy.fb = save_set.fb;
>  			goto fail;
>  		}
>  	}
> @@ -997,7 +997,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
>  			continue;
>  
>  		ret = drm_crtc_helper_set_mode(crtc, &crtc->mode,
> -					       crtc->x, crtc->y, crtc->primary->fb);
> +					       crtc->x, crtc->y, crtc->primary->legacy.fb);
>  
>  		/* Restoring the old config should never fail! */
>  		if (ret == false)
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d5e8994345bb..fd9d804e3672 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -189,7 +189,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
>  			continue;
>  
>  		funcs = crtc->helper_private;
> -		fb = crtc->primary->fb;
> +		fb = crtc->primary->legacy.fb;
>  
>  		if (!crtc->enabled)
>  			continue;
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 47e6e8577b62..ab7d4d4c0917 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -1081,7 +1081,7 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  	drm_modeset_lock_all(dev);
>  	/* remove from any CRTC */
>  	drm_for_each_crtc(crtc, dev) {
> -		if (crtc->primary->fb == fb) {
> +		if (crtc->primary->legacy.fb == fb) {
>  			drm_dbg_kms(dev,
>  				    "Disabling [CRTC:%d:%s] because [FB:%d] is removed\n",
>  				    crtc->base.id, crtc->name, fb->base.id);
> @@ -1093,7 +1093,7 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  	}
>  
>  	drm_for_each_plane(plane, dev) {
> -		if (plane->fb == fb) {
> +		if (plane->legacy.fb == fb) {
>  			drm_dbg_kms(dev,
>  				    "Disabling [PLANE:%d:%s] because [FB:%d] is removed\n",
>  				    plane->base.id, plane->name, fb->base.id);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index a28b22fdd7a4..4b077110238a 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -723,23 +723,23 @@ void drm_plane_force_disable(struct drm_plane *plane)
>  {
>  	int ret;
>  
> -	if (!plane->fb)
> +	if (!plane->legacy.fb)
>  		return;
>  
>  	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>  
> -	plane->old_fb = plane->fb;
> +	plane->legacy.old_fb = plane->legacy.fb;
>  	ret = plane->funcs->disable_plane(plane, NULL);
>  	if (ret) {
>  		DRM_ERROR("failed to disable plane with busy fb\n");
> -		plane->old_fb = NULL;
> +		plane->legacy.old_fb = NULL;
>  		return;
>  	}
>  	/* disconnect the plane from the fb and crtc: */
> -	drm_framebuffer_put(plane->old_fb);
> -	plane->old_fb = NULL;
> -	plane->fb = NULL;
> -	plane->crtc = NULL;
> +	drm_framebuffer_put(plane->legacy.old_fb);
> +	plane->legacy.old_fb = NULL;
> +	plane->legacy.fb = NULL;
> +	plane->legacy.crtc = NULL;
>  }
>  EXPORT_SYMBOL(drm_plane_force_disable);
>  
> @@ -840,15 +840,15 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
>  	drm_modeset_lock(&plane->mutex, NULL);
>  	if (plane->state && plane->state->crtc && drm_lease_held(file_priv, plane->state->crtc->base.id))
>  		plane_resp->crtc_id = plane->state->crtc->base.id;
> -	else if (!plane->state && plane->crtc && drm_lease_held(file_priv, plane->crtc->base.id))
> -		plane_resp->crtc_id = plane->crtc->base.id;
> +	else if (!plane->state && plane->legacy.crtc && drm_lease_held(file_priv, plane->legacy.crtc->base.id))
> +		plane_resp->crtc_id = plane->legacy.crtc->base.id;
>  	else
>  		plane_resp->crtc_id = 0;
>  
>  	if (plane->state && plane->state->fb)
>  		plane_resp->fb_id = plane->state->fb->base.id;
> -	else if (!plane->state && plane->fb)
> -		plane_resp->fb_id = plane->fb->base.id;
> +	else if (!plane->state && plane->legacy.fb)
> +		plane_resp->fb_id = plane->legacy.fb->base.id;
>  	else
>  		plane_resp->fb_id = 0;
>  	drm_modeset_unlock(&plane->mutex);
> @@ -1004,13 +1004,13 @@ static int __setplane_internal(struct drm_plane *plane,
>  
>  	/* No fb means shut it down */
>  	if (!fb) {
> -		plane->old_fb = plane->fb;
> +		plane->legacy.old_fb = plane->legacy.fb;
>  		ret = plane->funcs->disable_plane(plane, ctx);
>  		if (!ret) {
> -			plane->crtc = NULL;
> -			plane->fb = NULL;
> +			plane->legacy.crtc = NULL;
> +			plane->legacy.fb = NULL;
>  		} else {
> -			plane->old_fb = NULL;
> +			plane->legacy.old_fb = NULL;
>  		}
>  		goto out;
>  	}
> @@ -1021,22 +1021,22 @@ static int __setplane_internal(struct drm_plane *plane,
>  	if (ret)
>  		goto out;
>  
> -	plane->old_fb = plane->fb;
> +	plane->legacy.old_fb = plane->legacy.fb;
>  	ret = plane->funcs->update_plane(plane, crtc, fb,
>  					 crtc_x, crtc_y, crtc_w, crtc_h,
>  					 src_x, src_y, src_w, src_h, ctx);
>  	if (!ret) {
> -		plane->crtc = crtc;
> -		plane->fb = fb;
> -		drm_framebuffer_get(plane->fb);
> +		plane->legacy.crtc = crtc;
> +		plane->legacy.fb = fb;
> +		drm_framebuffer_get(plane->legacy.fb);
>  	} else {
> -		plane->old_fb = NULL;
> +		plane->legacy.old_fb = NULL;
>  	}
>  
>  out:
> -	if (plane->old_fb)
> -		drm_framebuffer_put(plane->old_fb);
> -	plane->old_fb = NULL;
> +	if (plane->legacy.old_fb)
> +		drm_framebuffer_put(plane->legacy.old_fb);
> +	plane->legacy.old_fb = NULL;
>  
>  	return ret;
>  }
> @@ -1178,7 +1178,7 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
>  	int ret = 0;
>  
>  	BUG_ON(!plane);
> -	WARN_ON(plane->crtc != crtc && plane->crtc != NULL);
> +	WARN_ON(plane->legacy.crtc != crtc && plane->legacy.crtc != NULL);
>  
>  	/*
>  	 * Obtain fb we'll be using (either new or existing) and take an extra
> @@ -1204,7 +1204,7 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
>  		if (plane->state)
>  			fb = plane->state->fb;
>  		else
> -			fb = plane->fb;
> +			fb = plane->legacy.fb;
>  
>  		if (fb)
>  			drm_framebuffer_get(fb);
> @@ -1441,7 +1441,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	if (plane->state)
>  		old_fb = plane->state->fb;
>  	else
> -		old_fb = plane->fb;
> +		old_fb = plane->legacy.fb;
>  
>  	if (old_fb == NULL) {
>  		/* The framebuffer is currently unbound, presumably
> @@ -1506,7 +1506,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		}
>  	}
>  
> -	plane->old_fb = plane->fb;
> +	plane->legacy.old_fb = plane->legacy.fb;
>  	if (crtc->funcs->page_flip_target)
>  		ret = crtc->funcs->page_flip_target(crtc, fb, e,
>  						    page_flip->flags,
> @@ -1519,10 +1519,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		if (page_flip->flags & DRM_MODE_PAGE_FLIP_EVENT)
>  			drm_event_cancel_free(dev, &e->base);
>  		/* Keep the old fb, don't unref it. */
> -		plane->old_fb = NULL;
> +		plane->legacy.old_fb = NULL;
>  	} else {
>  		if (!plane->state) {
> -			plane->fb = fb;
> +			plane->legacy.fb = fb;
>  			drm_framebuffer_get(fb);
>  		}
>  	}
> @@ -1531,9 +1531,9 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	if (fb)
>  		drm_framebuffer_put(fb);
>  	fb = NULL;
> -	if (plane->old_fb)
> -		drm_framebuffer_put(plane->old_fb);
> -	plane->old_fb = NULL;
> +	if (plane->legacy.old_fb)
> +		drm_framebuffer_put(plane->legacy.old_fb);
> +	plane->legacy.old_fb = NULL;
>  
>  	if (ret == -EDEADLK) {
>  		ret = drm_modeset_backoff(&ctx);
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
> index bbd0abdd8382..faef6f724446 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> @@ -462,7 +462,7 @@ static bool cdv_intel_pipe_enabled(struct drm_device *dev, int pipe)
>  	crtc = dev_priv->pipe_to_crtc_mapping[pipe];
>  	gma_crtc = to_gma_crtc(crtc);
>  
> -	if (crtc->primary->fb == NULL || !gma_crtc->active)
> +	if (crtc->primary->legacy.fb == NULL || !gma_crtc->active)
>  		return false;
>  	return true;
>  }
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index cc2ed9b3fd2d..49851881e41e 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1849,7 +1849,7 @@ cdv_intel_dp_set_property(struct drm_connector *connector,
>  		struct drm_crtc *crtc = encoder->base.crtc;
>  		drm_crtc_helper_set_mode(crtc, &crtc->mode,
>  					 crtc->x, crtc->y,
> -					 crtc->primary->fb);
> +					 crtc->primary->legacy.fb);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> index 2d95e0471291..16968c94bfd3 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> @@ -191,7 +191,8 @@ static int cdv_hdmi_set_property(struct drm_connector *connector,
>  		    crtc->saved_mode.vdisplay != 0) {
>  			if (centre) {
>  				if (!drm_crtc_helper_set_mode(encoder->crtc, &crtc->saved_mode,
> -					    encoder->crtc->x, encoder->crtc->y, encoder->crtc->primary->fb))
> +							      encoder->crtc->x, encoder->crtc->y,
> +							      encoder->crtc->primary->legacy.fb))
>  					return -1;
>  			} else {
>  				const struct drm_encoder_helper_funcs *helpers
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> index f3a4517bdf27..b607355b85dd 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -375,7 +375,7 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
>  						      &crtc->saved_mode,
>  						      encoder->crtc->x,
>  						      encoder->crtc->y,
> -						      encoder->crtc->primary->fb))
> +						      encoder->crtc->primary->legacy.fb))
>  				return -1;
>  		}
>  	} else if (!strcmp(property->name, "backlight") && encoder) {
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index f65e90d890f4..f2f8a95c8d39 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -61,7 +61,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
>  	struct drm_device *dev = crtc->dev;
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>  	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
> -	struct drm_framebuffer *fb = crtc->primary->fb;
> +	struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  	struct psb_gem_object *pobj;
>  	int pipe = gma_crtc->pipe;
>  	const struct psb_offset *map = &dev_priv->regmap[pipe];
> @@ -490,8 +490,8 @@ void gma_crtc_disable(struct drm_crtc *crtc)
>  
>  	crtc_funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
>  
> -	if (crtc->primary->fb) {
> -		pobj = to_psb_gem_object(crtc->primary->fb->obj[0]);
> +	if (crtc->primary->legacy.fb) {
> +		pobj = to_psb_gem_object(crtc->primary->legacy.fb->obj[0]);
>  		psb_gem_unpin(pobj);
>  	}
>  }
> @@ -515,8 +515,8 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
>  		       struct drm_modeset_acquire_ctx *ctx)
>  {
>  	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
> -	struct drm_framebuffer *current_fb = crtc->primary->fb;
> -	struct drm_framebuffer *old_fb = crtc->primary->old_fb;
> +	struct drm_framebuffer *current_fb = crtc->primary->legacy.fb;
> +	struct drm_framebuffer *old_fb = crtc->primary->legacy.old_fb;
>  	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
>  	struct drm_device *dev = crtc->dev;
>  	unsigned long flags;
> @@ -526,7 +526,7 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
>  		return -EINVAL;
>  
>  	/* Using mode_set_base requires the new fb to be set already. */
> -	crtc->primary->fb = fb;
> +	crtc->primary->legacy.fb = fb;
>  
>  	if (event) {
>  		spin_lock_irqsave(&dev->event_lock, flags);
> @@ -552,7 +552,7 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
>  
>  	/* Restore previous fb in case of failure. */
>  	if (ret)
> -		crtc->primary->fb = current_fb;
> +		crtc->primary->legacy.fb = current_fb;
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> index de8ccfe9890f..2c23b86a1ace 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> @@ -595,7 +595,7 @@ static int oaktrail_pipe_set_base(struct drm_crtc *crtc,
>  	struct drm_device *dev = crtc->dev;
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>  	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
> -	struct drm_framebuffer *fb = crtc->primary->fb;
> +	struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  	int pipe = gma_crtc->pipe;
>  	const struct psb_offset *map = &dev_priv->regmap[pipe];
>  	unsigned long start, offset;
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> index ff46e88c4768..03da68427318 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -112,7 +112,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
>  	const struct gma_limit_t *limit;
>  
>  	/* No scan out no play */
> -	if (crtc->primary->fb == NULL) {
> +	if (crtc->primary->legacy.fb == NULL) {
>  		crtc_funcs->mode_set_base(crtc, x, y, old_fb);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> index 138f153d38ba..1e80bc865843 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> @@ -570,7 +570,7 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
>  						      &crtc->saved_mode,
>  						      encoder->crtc->x,
>  						      encoder->crtc->y,
> -						      encoder->crtc->primary->fb))
> +						      encoder->crtc->primary->legacy.fb))
>  				goto set_prop_error;
>  		}
>  	} else if (!strcmp(property->name, "backlight")) {
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> index 8dafff963ca8..9fab87f17dc9 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -1727,7 +1727,7 @@ psb_intel_sdvo_set_property(struct drm_connector *connector,
>  	if (psb_intel_sdvo->base.base.crtc) {
>  		struct drm_crtc *crtc = psb_intel_sdvo->base.base.crtc;
>  		drm_crtc_helper_set_mode(crtc, &crtc->mode, crtc->x,
> -					 crtc->y, crtc->primary->fb);
> +					 crtc->y, crtc->primary->legacy.fb);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
> index 131512a5f3bd..058cb389b8ec 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -364,7 +364,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
>  		if (crtc)
>  			drm_crtc_helper_set_mode(crtc, &crtc->mode,
>  						 crtc->x, crtc->y,
> -						 crtc->primary->fb);
> +						 crtc->primary->legacy.fb);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 9bcae53c4f45..9bd800a42253 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -122,11 +122,11 @@ static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool enable)
>  	struct drm_plane *plane;
>  
>  	drm_for_each_plane(plane, kms->dev) {
> -		if (plane->fb && plane->state) {
> +		if (plane->legacy.fb && plane->state) {
>  			dpu_plane_danger_signal_ctrl(plane, enable);
>  			DPU_DEBUG("plane:%d img:%dx%d ",
> -				plane->base.id, plane->fb->width,
> -				plane->fb->height);
> +				plane->base.id, plane->legacy.fb->width,
> +				plane->legacy.fb->height);
>  			DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
>  				plane->state->src_x >> 16,
>  				plane->state->src_y >> 16,
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 67146f1e8482..4cbc3976b180 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -239,7 +239,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
>  	struct drm_device *dev = crtc->dev;
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
>  	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
> -	struct drm_framebuffer *fb = crtc->primary->fb;
> +	struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  
>  	/* Calculate our timings */
>  	int horizDisplay	= (mode->crtc_hdisplay >> 3)		- 1;
> @@ -465,7 +465,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
>  	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
>  	struct nv04_crtc_reg *savep = &nv04_display(dev)->saved_reg.crtc_reg[nv_crtc->index];
> -	const struct drm_framebuffer *fb = crtc->primary->fb;
> +	const struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  	struct drm_encoder *encoder;
>  	bool lvds_output = false, tmds_output = false, tv_output = false,
>  		off_chip_digital = false;
> @@ -610,7 +610,7 @@ static int
>  nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
>  {
>  	struct nv04_display *disp = nv04_display(crtc->dev);
> -	struct drm_framebuffer *fb = crtc->primary->fb;
> +	struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
>  	int ret;
> @@ -826,7 +826,7 @@ nv_crtc_gamma_set(struct drm_crtc *crtc, u16 *r, u16 *g, u16 *b,
>  	 * mark the lut values as dirty by setting depth==0, and it'll be
>  	 * uploaded on the first mode_set_base()
>  	 */
> -	if (!nv_crtc->base.primary->fb) {
> +	if (!nv_crtc->base.primary->legacy.fb) {
>  		nv_crtc->lut.depth = 0;
>  		return 0;
>  	}
> @@ -852,7 +852,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
>  	NV_DEBUG(drm, "index %d\n", nv_crtc->index);
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		NV_DEBUG(drm, "No FB bound\n");
>  		return 0;
>  	}
> @@ -863,7 +863,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
>  	if (atomic) {
>  		drm_fb = passed_fb;
>  	} else {
> -		drm_fb = crtc->primary->fb;
> +		drm_fb = crtc->primary->legacy.fb;
>  	}
>  
>  	nvbo = nouveau_gem_object(drm_fb->obj[0]);
> @@ -1157,7 +1157,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
>  	const int swap_interval = (flags & DRM_MODE_PAGE_FLIP_ASYNC) ? 0 : 1;
>  	struct drm_device *dev = crtc->dev;
>  	struct nouveau_drm *drm = nouveau_drm(dev);
> -	struct drm_framebuffer *old_fb = crtc->primary->fb;
> +	struct drm_framebuffer *old_fb = crtc->primary->legacy.fb;
>  	struct nouveau_bo *old_bo = nouveau_gem_object(old_fb->obj[0]);
>  	struct nouveau_bo *new_bo = nouveau_gem_object(fb->obj[0]);
>  	struct nv04_page_flip_state *s;
> @@ -1237,7 +1237,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
>  	mutex_unlock(&cli->mutex);
>  
>  	/* Update the crtc struct and cleanup */
> -	crtc->primary->fb = fb;
> +	crtc->primary->legacy.fb = fb;
>  
>  	nouveau_bo_fence(old_bo, fence, false);
>  	ttm_bo_unreserve(&old_bo->bo);
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> index 504c421aa176..be49c7180622 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> @@ -291,7 +291,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>  	struct drm_display_mode *output_mode = &nv_encoder->mode;
>  	struct drm_connector *connector = &nv_connector->base;
> -	const struct drm_framebuffer *fb = encoder->crtc->primary->fb;
> +	const struct drm_framebuffer *fb = encoder->crtc->primary->legacy.fb;
>  	uint32_t mode_ratio, panel_ratio;
>  
>  	NV_DEBUG(drm, "Output mode on CRTC %d:\n", nv_crtc->index);
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> index f71199a39bc4..45097913794c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> @@ -76,7 +76,7 @@ nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
>  
>  	/* Un-pin FB and cursors so they'll be evicted to system memory. */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -		struct drm_framebuffer *fb = crtc->primary->fb;
> +		struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  		struct nouveau_bo *nvbo;
>  
>  		if (!fb || !fb->obj[0])
> @@ -128,7 +128,7 @@ nv04_display_init(struct drm_device *dev, bool resume, bool runtime)
>  
>  	/* Re-pin FB/cursors. */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -		struct drm_framebuffer *fb = crtc->primary->fb;
> +		struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  		struct nouveau_bo *nvbo;
>  
>  		if (!fb || !fb->obj[0])
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 3ecb101d23e9..4bc8039e6ee0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -756,7 +756,7 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
>  		if (crtc)
>  			drm_crtc_helper_set_mode(crtc, &crtc->mode,
>  						 crtc->x, crtc->y,
> -						 crtc->primary->fb);
> +						 crtc->primary->legacy.fb);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index 9b3a3a9d60e2..36e4663186c8 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -1150,7 +1150,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
>  	bool bypass_lut = false;
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -1158,7 +1158,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	/* If atomic, assume fb object is pinned & idle & fenced and
>  	 * just update base pointers
> @@ -1437,7 +1437,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
>  	/* set pageflip to happen anywhere in vblank interval */
>  	WREG32(EVERGREEN_MASTER_UPDATE_MODE + radeon_crtc->crtc_offset, 0);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		rbo = gem_to_radeon_bo(fb->obj[0]);
>  		r = radeon_bo_reserve(rbo, false);
>  		if (unlikely(r != 0))
> @@ -1470,7 +1470,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
>  	bool bypass_lut = false;
>  
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -1478,7 +1478,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	obj = target_fb->obj[0];
>  	rbo = gem_to_radeon_bo(obj);
> @@ -1645,7 +1645,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
>  	/* set pageflip to happen only at start of vblank interval (front porch) */
>  	WREG32(AVIVO_D1MODE_MASTER_UPDATE_MODE + radeon_crtc->crtc_offset, 3);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		rbo = gem_to_radeon_bo(fb->obj[0]);
>  		r = radeon_bo_reserve(rbo, false);
>  		if (unlikely(r != 0))
> @@ -2150,11 +2150,11 @@ static void atombios_crtc_disable(struct drm_crtc *crtc)
>  	int i;
>  
>  	atombios_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> -	if (crtc->primary->fb) {
> +	if (crtc->primary->legacy.fb) {
>  		int r;
>  		struct radeon_bo *rbo;
>  
> -		rbo = gem_to_radeon_bo(crtc->primary->fb->obj[0]);
> +		rbo = gem_to_radeon_bo(crtc->primary->legacy.fb->obj[0]);
>  		r = radeon_bo_reserve(rbo, false);
>  		if (unlikely(r))
>  			DRM_ERROR("failed to reserve rbo before unpin\n");
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index bc4ab71613a5..2cbcf7cfdc3c 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -1417,7 +1417,7 @@ void evergreen_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_base,
>  			 bool async)
>  {
>  	struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = radeon_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = radeon_crtc->base.primary->legacy.fb;
>  
>  	/* flip at hsync for async, default is vsync */
>  	WREG32(EVERGREEN_GRPH_FLIP_CONTROL + radeon_crtc->crtc_offset,
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 80703417d8a1..1aa3126ab6d9 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -165,7 +165,7 @@ void r100_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_base, bool
>  {
>  	struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[crtc_id];
>  	uint32_t crtc_pitch, pitch_pixels;
> -	struct drm_framebuffer *fb = radeon_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = radeon_crtc->base.primary->legacy.fb;
>  	u32 tmp = ((u32)crtc_base) | RADEON_CRTC_OFFSET__OFFSET_LOCK;
>  	int i;
>  
> @@ -3244,7 +3244,7 @@ void r100_bandwidth_update(struct radeon_device *rdev)
>  
>  	if (rdev->mode_info.crtcs[0]->base.enabled) {
>  		const struct drm_framebuffer *fb =
> -			rdev->mode_info.crtcs[0]->base.primary->fb;
> +			rdev->mode_info.crtcs[0]->base.primary->legacy.fb;
>  
>  		mode1 = &rdev->mode_info.crtcs[0]->base.mode;
>  		pixel_bytes1 = fb->format->cpp[0];
> @@ -3252,7 +3252,7 @@ void r100_bandwidth_update(struct radeon_device *rdev)
>  	if (!(rdev->flags & RADEON_SINGLE_CRTC)) {
>  		if (rdev->mode_info.crtcs[1]->base.enabled) {
>  			const struct drm_framebuffer *fb =
> -				rdev->mode_info.crtcs[1]->base.primary->fb;
> +				rdev->mode_info.crtcs[1]->base.primary->legacy.fb;
>  
>  			mode2 = &rdev->mode_info.crtcs[1]->base.mode;
>  			pixel_bytes2 = fb->format->cpp[0];
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 528a8f3677c2..dbe0f75cfea7 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -92,7 +92,8 @@ static void radeon_property_change_mode(struct drm_encoder *encoder)
>  
>  	if (crtc && crtc->enabled) {
>  		drm_crtc_helper_set_mode(crtc, &crtc->mode,
> -					 crtc->x, crtc->y, crtc->primary->fb);
> +					 crtc->x, crtc->y,
> +					 crtc->primary->legacy.fb);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 554b236c2328..edea6d3638e5 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1572,7 +1572,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>  	/* unpin the front buffers and cursors */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  		struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
> -		struct drm_framebuffer *fb = crtc->primary->fb;
> +		struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  		struct radeon_bo *robj;
>  
>  		if (radeon_crtc->cursor_bo) {
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 8f5f8abcb1b4..55f80424f514 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -506,7 +506,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  	work->async = (page_flip_flags & DRM_MODE_PAGE_FLIP_ASYNC) != 0;
>  
>  	/* schedule unpin of the old buffer */
> -	obj = crtc->primary->fb->obj[0];
> +	obj = crtc->primary->legacy.fb->obj[0];
>  
>  	/* take a reference to the old object */
>  	drm_gem_object_get(obj);
> @@ -595,7 +595,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  	radeon_crtc->flip_work = work;
>  
>  	/* update crtc fb */
> -	crtc->primary->fb = fb;
> +	crtc->primary->legacy.fb = fb;
>  
>  	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> index 825b351ff53c..6b37b301ea1f 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> @@ -390,7 +390,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
>  
>  	DRM_DEBUG_KMS("\n");
>  	/* no fb bound */
> -	if (!atomic && !crtc->primary->fb) {
> +	if (!atomic && !crtc->primary->legacy.fb) {
>  		DRM_DEBUG_KMS("No FB bound\n");
>  		return 0;
>  	}
> @@ -398,7 +398,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
>  	if (atomic)
>  		target_fb = fb;
>  	else
> -		target_fb = crtc->primary->fb;
> +		target_fb = crtc->primary->legacy.fb;
>  
>  	switch (target_fb->format->cpp[0] * 8) {
>  	case 8:
> @@ -445,7 +445,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
>  		 * We don't shutdown the display controller because new buffer
>  		 * will end up in same spot.
>  		 */
> -		if (!atomic && fb && fb != crtc->primary->fb) {
> +		if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  			struct radeon_bo *old_rbo;
>  			unsigned long nsize, osize;
>  
> @@ -555,7 +555,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
>  	WREG32(RADEON_CRTC_OFFSET + radeon_crtc->crtc_offset, crtc_offset);
>  	WREG32(RADEON_CRTC_PITCH + radeon_crtc->crtc_offset, crtc_pitch);
>  
> -	if (!atomic && fb && fb != crtc->primary->fb) {
> +	if (!atomic && fb && fb != crtc->primary->legacy.fb) {
>  		rbo = gem_to_radeon_bo(fb->obj[0]);
>  		r = radeon_bo_reserve(rbo, false);
>  		if (unlikely(r != 0))
> @@ -575,7 +575,7 @@ static bool radeon_set_crtc_timing(struct drm_crtc *crtc, struct drm_display_mod
>  	struct drm_device *dev = crtc->dev;
>  	struct radeon_device *rdev = dev->dev_private;
>  	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
> -	const struct drm_framebuffer *fb = crtc->primary->fb;
> +	const struct drm_framebuffer *fb = crtc->primary->legacy.fb;
>  	struct drm_encoder *encoder;
>  	int format;
>  	int hsync_start;
> @@ -1088,11 +1088,11 @@ static void radeon_crtc_commit(struct drm_crtc *crtc)
>  static void radeon_crtc_disable(struct drm_crtc *crtc)
>  {
>  	radeon_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> -	if (crtc->primary->fb) {
> +	if (crtc->primary->legacy.fb) {
>  		int r;
>  		struct radeon_bo *rbo;
>  
> -		rbo = gem_to_radeon_bo(crtc->primary->fb->obj[0]);
> +		rbo = gem_to_radeon_bo(crtc->primary->legacy.fb->obj[0]);
>  		r = radeon_bo_reserve(rbo, false);
>  		if (unlikely(r))
>  			DRM_ERROR("failed to reserve rbo before unpin\n");
> diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
> index 88c8e91ea651..335df822b330 100644
> --- a/drivers/gpu/drm/radeon/rs600.c
> +++ b/drivers/gpu/drm/radeon/rs600.c
> @@ -119,7 +119,7 @@ void avivo_wait_for_vblank(struct radeon_device *rdev, int crtc)
>  void rs600_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_base, bool async)
>  {
>  	struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = radeon_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = radeon_crtc->base.primary->legacy.fb;
>  	u32 tmp = RREG32(AVIVO_D1GRPH_UPDATE + radeon_crtc->crtc_offset);
>  	int i;
>  
> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
> index 7d4b0bf59109..4f3f19500adf 100644
> --- a/drivers/gpu/drm/radeon/rv770.c
> +++ b/drivers/gpu/drm/radeon/rv770.c
> @@ -800,7 +800,7 @@ u32 rv770_get_xclk(struct radeon_device *rdev)
>  void rv770_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_base, bool async)
>  {
>  	struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[crtc_id];
> -	struct drm_framebuffer *fb = radeon_crtc->base.primary->fb;
> +	struct drm_framebuffer *fb = radeon_crtc->base.primary->legacy.fb;
>  	u32 tmp = RREG32(AVIVO_D1GRPH_UPDATE + radeon_crtc->crtc_offset);
>  	int i;
>  
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index f161f40d8ce4..14fce5c33e03 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1097,7 +1097,7 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
>  		crtc_state = drm_atomic_get_existing_crtc_state(state,
>  								new_plane_state->crtc);
>  	else /* Special case for asynchronous cursor updates. */
> -		crtc_state = plane->crtc->state;
> +		crtc_state = plane->legacy.crtc->state;
>  
>  	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
>  						   min_scale, max_scale,
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index dd718c62ac31..a2d91ee4b40c 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -663,31 +663,33 @@ struct drm_plane {
>  	/** @modifier_count: Size of the array pointed at by @modifier_count. */
>  	unsigned int modifier_count;
>  
> -	/**
> -	 * @crtc:
> -	 *
> -	 * Currently bound CRTC, only meaningful for non-atomic drivers. For
> -	 * atomic drivers this is forced to be NULL, atomic drivers should
> -	 * instead check &drm_plane_state.crtc.
> -	 */
> -	struct drm_crtc *crtc;
> -
> -	/**
> -	 * @fb:
> -	 *
> -	 * Currently bound framebuffer, only meaningful for non-atomic drivers.
> -	 * For atomic drivers this is forced to be NULL, atomic drivers should
> -	 * instead check &drm_plane_state.fb.
> -	 */
> -	struct drm_framebuffer *fb;
> -
> -	/**
> -	 * @old_fb:
> -	 *
> -	 * Temporary tracking of the old fb while a modeset is ongoing. Only
> -	 * used by non-atomic drivers, forced to be NULL for atomic drivers.
> -	 */
> -	struct drm_framebuffer *old_fb;
> +	struct {
> +		/**
> +		 * @crtc:
> +		 *
> +		 * Currently bound CRTC, only meaningful for non-atomic drivers. For
> +		 * atomic drivers this is forced to be NULL, atomic drivers should
> +		 * instead check &drm_plane_state.crtc.
> +		 */
> +		struct drm_crtc *crtc;
> +
> +		/**
> +		 * @fb:
> +		 *
> +		 * Currently bound framebuffer, only meaningful for non-atomic drivers.
> +		 * For atomic drivers this is forced to be NULL, atomic drivers should
> +		 * instead check &drm_plane_state.fb.
> +		 */
> +		struct drm_framebuffer *fb;
> +
> +		/**
> +		 * @old_fb:
> +		 *
> +		 * Temporary tracking of the old fb while a modeset is ongoing. Only
> +		 * used by non-atomic drivers, forced to be NULL for atomic drivers.
> +		 */
> +		struct drm_framebuffer *old_fb;
> +	} legacy;
>  
>  	/** @funcs: plane control functions */
>  	const struct drm_plane_funcs *funcs;
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
