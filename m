Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC4CAF8C4
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E48310E1C6;
	Tue,  9 Dec 2025 10:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNqIsd5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA3810E1C4;
 Tue,  9 Dec 2025 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765274738; x=1796810738;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+8PNIpqao4gwCNS0FoQhRQXyUQY/bMpuk3YesNh7wS0=;
 b=bNqIsd5+tluSNBgV9A5kLG3OR+QF2H3OKAslEPhfeyaCYvRnLjCY1jKO
 /ruiLcRKMd9m7iChE4SOkV/2IkjfJh1yMOoc5uAf0QmbpmZ7X5DJlwuP7
 1u0N39GtlVqkw2UYJy6ubMXSjOgom8hxoFoOnWk2Szz5N1BEEnzPvmWF1
 ZcLUqcPdWzpuIN6IPR0m2rD+Vk3FV/e82yqD4kuZX8KmgSUCMKC2yZYof
 I2kqOBLAPoRCMZHvgrwr6YYapRca5UXb9yBEcaVaTnuf0xnw+xHI7+UlO
 9N7EKFZi6UN5xOZGccnh9jm9GQKxrD2XWft3miRlNYpniAiYTGzZVu/bc A==;
X-CSE-ConnectionGUID: PU72oEm2RVS3VFRxuqKlmQ==
X-CSE-MsgGUID: 2/MV0OhDRKeVNSVB/qGvOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78586232"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="78586232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:05:37 -0800
X-CSE-ConnectionGUID: xWeu3ElyQi6i/GWLNwbNGQ==
X-CSE-MsgGUID: iQnX3SzbRF2KJ5nERNqz4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195463535"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:05:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Nicholas.Kazlauskas@amd.com, simona@ffwll.ch,
 airlied@gmail.com, Leo Li <sunpeng.li@amd.com>,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
In-Reply-To: <20251201231807.287414-1-sunpeng.li@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251201231807.287414-1-sunpeng.li@amd.com>
Date: Tue, 09 Dec 2025 12:05:31 +0200
Message-ID: <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 01 Dec 2025, <sunpeng.li@amd.com> wrote:
> From: Leo Li <sunpeng.li@amd.com>
>
> Some drivers need to perform blocking operations prior to enabling
> vblank interrupts. A display hardware spin-up from a low-power state
> that requires synchronization with the rest of the driver via a mutex,
> for example.
>
> To support this, introduce a new drm_crtc_vblank_prepare() helper that
> calls back into the driver -- if implemented -- for the driver to do
> such preparation work.
>
> In DRM core, call this helper before drm_vblank_get(). Drivers can
> choose to call this if they implement the callback in the future.

Have you considered hiding all of this inside drm_vblank.c? Call prepare
in drm_crtc_vblank_get() and a couple of other places? And actually
don't call it on !drm_dev_has_vblank(dev)?

There's just so much littering all over the place with the prepare, and
it seems brittle. Especially when you expect not only the drm core but
also the relevant drivers to call drm_crtc_vblank_prepare() when needed.

There does seem to be a few places in amdgpu that wrap the
drm_crtc_vblank_get() inside dev->event_lock, but is there really any
need to do so? Do the get first, and grab the event_lock after?

Some random comments inline.

Cc: Ville


BR,
Jani.


>
> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  8 ++++
>  drivers/gpu/drm/drm_fb_helper.c     |  4 ++
>  drivers/gpu/drm/drm_plane.c         |  4 ++
>  drivers/gpu/drm/drm_vblank.c        | 69 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank_work.c   |  8 ++++
>  include/drm/drm_crtc.h              | 27 +++++++++++
>  include/drm/drm_vblank.h            |  1 +
>  7 files changed, 121 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ef56b474acf59..e52dd41f83117 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1264,6 +1264,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  		if (!drm_dev_has_vblank(dev))
>  			continue;
>  
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			continue;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		/*
>  		 * Self-refresh is not a true "disable"; ensure vblank remains
> @@ -1815,6 +1819,10 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>  		if (!new_crtc_state->active)
>  			continue;
>  
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret != 0)
> +			continue;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret != 0)
>  			continue;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 11a5b60cb9ce4..7400942fd7d1d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1103,6 +1103,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  		 * enabled, otherwise just don't do anythintg,
>  		 * not even report an error.
>  		 */
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			break;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (!ret) {
>  			drm_crtc_wait_one_vblank(crtc);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 38f82391bfda5..f2e40eaa385e6 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1421,6 +1421,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		u32 current_vblank;
>  		int r;
>  
> +		r = drm_crtc_vblank_prepare(crtc);
> +		if (r)
> +			return r;
> +
>  		r = drm_crtc_vblank_get(crtc);
>  		if (r)
>  			return r;
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 46f59883183d9..4dac3228c021f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1194,6 +1194,30 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  	return ret;
>  }
>  
> +/**
> + * drm_crtc_vblank_prepare - prepare to enable vblank interrupts
> + *
> + * @crtc: which CRTC to prepare
> + *
> + * Some drivers may need to run blocking operations to prepare for enabling
> + * vblank interrupts. This function calls the prepare_enable_vblank callback, if
> + * available, to allow drivers to do that.
> + *
> + * The spin-up may call blocking functions, such as mutex_lock(). Therefore,
> + * this must be called from process context, where sleeping is allowed.
> + *
> + * Also see &drm_crtc_funcs.prepare_enable_vblank.
> + *
> + * Returns: Zero on success or a negative error code on failure.
> + */
> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc)
> +{
> +	if (crtc->funcs->prepare_enable_vblank)
> +		return crtc->funcs->prepare_enable_vblank(crtc);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_vblank_prepare);
> +
>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> @@ -1288,12 +1312,22 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> +	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);

Initialization...

>  	int ret;
>  	u64 last;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> +	crtc = drm_crtc_from_index(dev, pipe);

...and another initialization.

But really, this function needs to die, and you'll have the crtc without
looking it up [1]. I'd really love to land that first to not make that
*and* this series harder for absolutely no reason.

[1] https://lore.kernel.org/r/2a17538a24f1d12c3c82d9cde03363195b64d0cf.1764933891.git.jani.nikula@intel.com

> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (drm_WARN(dev, ret,
> +			     "prepare vblank failed on crtc %i, ret=%i\n",
> +			     pipe, ret))

Do we really need the warning backtraces or debug logs for every call?
There's one driver that needs the call, and it always returns 0. And
there's like a hundred lines of debug logging in this patch.

If you insist, please at least use the [CRTC:%d:%s] style logging, and
make it all somehow consistent.

> +			return;
> +	}
> +
>  	ret = drm_vblank_get(dev, pipe);
>  	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
>  		     pipe, ret))
> @@ -1485,10 +1519,18 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> +	int ret;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		drm_WARN_ON(dev, ret);
> +		if (ret)
> +			return;
> +	}
> +
>  	spin_lock_irq(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>  		    pipe, vblank->enabled, vblank->inmodeset);
> @@ -1796,6 +1838,17 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  		return 0;
>  	}
>  
> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret) {
> +			drm_dbg_core(dev,
> +				     "prepare vblank failed on crtc %i, ret=%i\n",
> +				     pipe, ret);
> +			return ret;
> +		}
> +	}
> +
>  	ret = drm_vblank_get(dev, pipe);
>  	if (ret) {
>  		drm_dbg_core(dev,
> @@ -2031,6 +2084,14 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  		READ_ONCE(vblank->enabled);
>  
>  	if (!vblank_enabled) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret) {
> +			drm_dbg_core(dev,
> +				     "prepare vblank failed on crtc %i, ret=%i\n",
> +				     pipe, ret);
> +			return ret;
> +		}
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret) {
>  			drm_dbg_core(dev,
> @@ -2098,6 +2159,14 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (e == NULL)
>  		return -ENOMEM;
>  
> +	ret = drm_crtc_vblank_prepare(crtc);
> +	if (ret) {
> +		drm_dbg_core(dev,
> +			     "prepare vblank failed on crtc %i, ret=%i\n",
> +			     pipe, ret);
> +		return ret;
> +	}
> +
>  	ret = drm_crtc_vblank_get(crtc);
>  	if (ret) {
>  		drm_dbg_core(dev,
> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
> index e4e1873f0e1e1..582ee7fd94adf 100644
> --- a/drivers/gpu/drm/drm_vblank_work.c
> +++ b/drivers/gpu/drm/drm_vblank_work.c
> @@ -113,11 +113,19 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>  {
>  	struct drm_vblank_crtc *vblank = work->vblank;
>  	struct drm_device *dev = vblank->dev;
> +	struct drm_crtc *crtc;
>  	u64 cur_vbl;
>  	unsigned long irqflags;
>  	bool passed, inmodeset, rescheduling = false, wake = false;
>  	int ret = 0;
>  
> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	spin_lock_irqsave(&dev->event_lock, irqflags);
>  	if (work->cancelling)
>  		goto out;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a..456cf9ba0143a 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -860,6 +860,33 @@ struct drm_crtc_funcs {
>  	 */
>  	u32 (*get_vblank_counter)(struct drm_crtc *crtc);
>  
> +	/**
> +	 * @prepare_enable_vblank:
> +	 *
> +	 * An optional callback for preparing to enable vblank interrupts. It
> +	 * allows drivers to perform blocking operations, and thus is called
> +	 * without any vblank spinlocks. Consequently, this callback is not
> +	 * synchronized with the rest of drm_vblank management; drivers are
> +	 * responsible for ensuring it won't race with drm_vblank and it's other
> +	 * driver callbacks.
> +	 *
> +	 * For example, drivers may use this to spin-up hardware from a low
> +	 * power state -- which may require blocking operations -- such that
> +	 * hardware registers are available to read/write. However, the driver
> +	 * must be careful as to when to reenter low-power state, such that it
> +	 * won't race with enable_vblank.
> +	 *
> +	 * It is called unconditionally, regardless of whether vblank interrupts
> +	 * are already enabled or not.
> +	 *
> +	 * This callback is optional. If not set, no preparation is performed.
> +	 *
> +	 * Returns:
> +	 *
> +	 * Zero on success, negative errno on failure.
> +	 */
> +	int (*prepare_enable_vblank)(struct drm_crtc *crtc);
> +
>  	/**
>  	 * @enable_vblank:
>  	 *
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 151ab1e85b1b7..5abc367aa4376 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -272,6 +272,7 @@ void drm_vblank_set_event(struct drm_pending_vblank_event *e,
>  			  ktime_t *now);
>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
>  bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc);
>  int drm_crtc_vblank_get(struct drm_crtc *crtc);
>  void drm_crtc_vblank_put(struct drm_crtc *crtc);
>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);

-- 
Jani Nikula, Intel
