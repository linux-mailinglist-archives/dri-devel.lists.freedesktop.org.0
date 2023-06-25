Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA4473D2CD
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 19:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81710E189;
	Sun, 25 Jun 2023 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96A10E187
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 17:57:54 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QpzGT45BVz9sws;
 Sun, 25 Jun 2023 17:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687715873; bh=wL5gFq4qPA/bQC42adP4UcS+jOfFH7lhAXnLvKXmLEY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q7a2IMylwWtYK9JnX82lbT/YItfryZkt4xtYXJAVfT9Fgvcr6TkV6B/wjWjyHVXvE
 U1WsY4iQBPPOV9WbffoDh3VXzxpysoHs/9Jgo+HVGMDy07T0GKFQhHLU/mEQAfQL6L
 BPMk7NKN5KexQuByuedWnUvTD+KtZ5J7w0VwIWH4=
X-Riseup-User-ID: 3A6B08B0F68878D5FAE03F99CF32D0148DBA364384E24E2185F397D9B15C06CA
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QpzGP2GJJzJp9r;
 Sun, 25 Jun 2023 17:57:49 +0000 (UTC)
Message-ID: <435b78f2-7ca2-1b9f-c47d-aae1278d9a6c@riseup.net>
Date: Sun, 25 Jun 2023 14:57:46 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/6] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
Content-Language: en-US
To: Jim Shargo <jshargo@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-3-jshargo@chromium.org>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230623222353.97283-3-jshargo@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim,

On 6/23/23 19:23, Jim Shargo wrote:
> This change supports multiple CRTCs, encoders, connectors instead of one
> of each per device.
> 
> Since ConfigFS-based devices will support multiple crtcs, it's useful to
> move all of the writeback/composition data from being per-"output" to
> being per-CRTC.
> 
> Since there's still only ever one CRTC, this should be a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c  |  28 +++---
>   drivers/gpu/drm/vkms/vkms_crtc.c      |  95 +++++++++++---------
>   drivers/gpu/drm/vkms/vkms_drv.c       |  14 +--
>   drivers/gpu/drm/vkms/vkms_drv.h       |  65 +++++++++-----
>   drivers/gpu/drm/vkms/vkms_output.c    | 123 ++++++++++++++++++--------
>   drivers/gpu/drm/vkms/vkms_plane.c     |  44 ++++++---
>   drivers/gpu/drm/vkms/vkms_writeback.c |  26 +++---
>   7 files changed, 252 insertions(+), 143 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 1636ce3a79f9..75fa42e0ec07 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -230,13 +230,13 @@ void vkms_composer_worker(struct work_struct *work)
>   						composer_work);
>   	struct drm_crtc *crtc = crtc_state->base.crtc;
>   	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>   	bool crc_pending, wb_pending;
>   	u64 frame_start, frame_end;
>   	u32 crc32 = 0;
>   	int ret;
>   
> -	spin_lock_irq(&out->composer_lock);
> +	spin_lock_irq(&vkms_crtc->composer_lock);
>   	frame_start = crtc_state->frame_start;
>   	frame_end = crtc_state->frame_end;
>   	crc_pending = crtc_state->crc_pending;
> @@ -244,7 +244,7 @@ void vkms_composer_worker(struct work_struct *work)
>   	crtc_state->frame_start = 0;
>   	crtc_state->frame_end = 0;
>   	crtc_state->crc_pending = false;
> -	spin_unlock_irq(&out->composer_lock);
> +	spin_unlock_irq(&vkms_crtc->composer_lock);
>   
>   	/*
>   	 * We raced with the vblank hrtimer and previous work already computed
> @@ -262,10 +262,10 @@ void vkms_composer_worker(struct work_struct *work)
>   		return;
>   
>   	if (wb_pending) {
> -		drm_writeback_signal_completion(&out->wb_connector, 0);
> -		spin_lock_irq(&out->composer_lock);
> +		drm_writeback_signal_completion(&vkms_crtc->wb_connector, 0);
> +		spin_lock_irq(&vkms_crtc->composer_lock);
>   		crtc_state->wb_pending = false;
> -		spin_unlock_irq(&out->composer_lock);
> +		spin_unlock_irq(&vkms_crtc->composer_lock);
>   	}
>   
>   	/*
> @@ -315,25 +315,25 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>   	return 0;
>   }
>   
> -void vkms_set_composer(struct vkms_output *out, bool enabled)
> +void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
>   {
>   	bool old_enabled;
>   
>   	if (enabled)
> -		drm_crtc_vblank_get(&out->crtc);
> +		drm_crtc_vblank_get(&vkms_crtc->base);
>   
> -	spin_lock_irq(&out->lock);
> -	old_enabled = out->composer_enabled;
> -	out->composer_enabled = enabled;
> -	spin_unlock_irq(&out->lock);
> +	spin_lock_irq(&vkms_crtc->lock);
> +	old_enabled = vkms_crtc->composer_enabled;
> +	vkms_crtc->composer_enabled = enabled;
> +	spin_unlock_irq(&vkms_crtc->lock);
>   
>   	if (old_enabled)
> -		drm_crtc_vblank_put(&out->crtc);
> +		drm_crtc_vblank_put(&vkms_crtc->base);
>   }
>   
>   int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   {
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
>   	bool enabled = false;
>   	int ret = 0;
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 515f6772b866..d91e49c53adc 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -11,35 +11,34 @@
>   
>   static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   {
> -	struct vkms_output *output = container_of(timer, struct vkms_output,
> -						  vblank_hrtimer);
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_crtc *vkms_crtc = timer_to_vkms_crtc(timer);
> +	struct drm_crtc *crtc = &vkms_crtc->base;
>   	struct vkms_crtc_state *state;
>   	u64 ret_overrun;
>   	bool ret, fence_cookie;
>   
>   	fence_cookie = dma_fence_begin_signalling();
>   
> -	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> -					  output->period_ns);
> +	ret_overrun = hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
> +					  vkms_crtc->period_ns);
>   	if (ret_overrun != 1)
>   		pr_warn("%s: vblank timer overrun\n", __func__);
>   
> -	spin_lock(&output->lock);
> +	spin_lock(&vkms_crtc->lock);
>   	ret = drm_crtc_handle_vblank(crtc);
>   	if (!ret)
>   		DRM_ERROR("vkms failure on handling vblank");
>   
> -	state = output->composer_state;
> -	spin_unlock(&output->lock);
> +	state = vkms_crtc->composer_state;
> +	spin_unlock(&vkms_crtc->lock);
>   
> -	if (state && output->composer_enabled) {
> +	if (state && vkms_crtc->composer_enabled) {
>   		u64 frame = drm_crtc_accurate_vblank_count(crtc);
>   
>   		/* update frame_start only if a queued vkms_composer_worker()
>   		 * has read the data
>   		 */
> -		spin_lock(&output->composer_lock);
> +		spin_lock(&vkms_crtc->composer_lock);
>   		if (!state->crc_pending)
>   			state->frame_start = frame;
>   		else
> @@ -47,9 +46,10 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   					 state->frame_start, frame);
>   		state->frame_end = frame;
>   		state->crc_pending = true;
> -		spin_unlock(&output->composer_lock);
> +		spin_unlock(&vkms_crtc->composer_lock);
>   
> -		ret = queue_work(output->composer_workq, &state->composer_work);
> +		ret = queue_work(vkms_crtc->composer_workq,
> +				 &state->composer_work);
>   		if (!ret)
>   			DRM_DEBUG_DRIVER("Composer worker already queued\n");
>   	}
> @@ -62,25 +62,27 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   static int vkms_enable_vblank(struct drm_crtc *crtc)
>   {
>   	struct drm_device *dev = crtc->dev;
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>   	unsigned int pipe = drm_crtc_index(crtc);
>   	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>   
>   	drm_calc_timestamping_constants(crtc, &crtc->mode);
>   
> -	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	out->vblank_hrtimer.function = &vkms_vblank_simulate;
> -	out->period_ns = ktime_set(0, vblank->framedur_ns);
> -	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
> +	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC,
> +		     HRTIMER_MODE_REL);
> +	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
> +	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
> +	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns,
> +		      HRTIMER_MODE_REL);
>   
>   	return 0;
>   }
>   
>   static void vkms_disable_vblank(struct drm_crtc *crtc)
>   {
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>   
> -	hrtimer_cancel(&out->vblank_hrtimer);
> +	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
>   }
>   
>   static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> @@ -88,9 +90,8 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>   				      bool in_vblank_irq)
>   {
>   	struct drm_device *dev = crtc->dev;
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>   	unsigned int pipe = crtc->index;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -	struct vkms_output *output = &vkmsdev->output;
>   	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>   
>   	if (!READ_ONCE(vblank->enabled)) {
> @@ -98,7 +99,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>   		return true;
>   	}
>   
> -	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
> +	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
>   
>   	if (WARN_ON(*vblank_time == vblank->time))
>   		return true;
> @@ -110,7 +111,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>   	 * the vblank core expects. Therefore we need to always correct the
>   	 * timestampe by one frame.
>   	 */
> -	*vblank_time -= output->period_ns;
> +	*vblank_time -= vkms_crtc->period_ns;
>   
>   	return true;
>   }
> @@ -236,18 +237,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>   static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
>   {
> -	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>   
>   	/* This lock is held across the atomic commit to block vblank timer
>   	 * from scheduling vkms_composer_worker until the composer is updated
>   	 */
> -	spin_lock_irq(&vkms_output->lock);
> +	spin_lock_irq(&vkms_crtc->lock);
>   }
>   
>   static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
>   {
> -	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>   
>   	if (crtc->state->event) {
>   		spin_lock(&crtc->dev->event_lock);
> @@ -262,9 +263,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>   		crtc->state->event = NULL;
>   	}
>   
> -	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> +	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
>   
> -	spin_unlock_irq(&vkms_output->lock);
> +	spin_unlock_irq(&vkms_crtc->lock);
>   }
>   
>   static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
> @@ -275,27 +276,41 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>   	.atomic_disable	= vkms_crtc_atomic_disable,
>   };
>   
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor)
>   {
> -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct drm_device *dev = &vkmsdev->drm;
> +	struct vkms_crtc *vkms_crtc;
>   	int ret;
>   
> -	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +	if (vkmsdev->output.num_crtcs >= VKMS_MAX_OUTPUT_OBJECTS) {
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
> +
> +	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
>   					 &vkms_crtc_funcs, NULL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +		goto out_error;
>   	}
>   
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
>   
> -	spin_lock_init(&vkms_out->lock);
> -	spin_lock_init(&vkms_out->composer_lock);
> +	spin_lock_init(&vkms_crtc->lock);
> +	spin_lock_init(&vkms_crtc->composer_lock);
>   
> -	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> -	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> +	if (!vkms_crtc->composer_workq) {
> +		ret = -ENOMEM;
> +		goto out_error;
> +	}
> +
> +	return vkms_crtc;
>   
> -	return ret;
> +out_error:
> +	memset(vkms_crtc, 0, sizeof(*vkms_crtc));
> +	vkmsdev->output.num_crtcs -= 1;
> +	return ERR_PTR(ret);
>   }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index f07454fff046..aa2bee82b757 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -57,8 +57,8 @@ static void vkms_release(struct drm_device *dev)
>   {
>   	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
>   
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> +	for (int i = 0; i < vkms->output.num_crtcs; i++)
> +		destroy_workqueue(vkms->output.crtcs[i].composer_workq);

Is there no need to check if vkms->output.crtcs[i].composer_workq is
NULL?

>   }
>   
>   static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> @@ -185,15 +185,15 @@ static int vkms_platform_probe(struct platform_device *pdev)
>   		goto out_release_group;
>   	}
>   
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = vkms_modeset_init(vkms_device);
>   	if (ret) {
> -		DRM_ERROR("Failed to vblank\n");
> +		DRM_ERROR("Unable to initialize modesetting\n");
>   		goto out_release_group;
>   	}
>   
> -	ret = vkms_modeset_init(vkms_device);
> +	ret = drm_vblank_init(&vkms_device->drm, vkms_device->output.num_crtcs);
>   	if (ret) {
> -		DRM_ERROR("Unable to initialize modesetting\n");
> +		DRM_ERROR("Failed to vblank\n");
>   		goto out_release_group;
>   	}
>   
> @@ -202,7 +202,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
>   
>   	ret = drm_dev_register(&vkms_device->drm, 0);
>   	if (ret) {
> -		DRM_ERROR("Unable to register device\n");
> +		DRM_ERROR("Unable to register device with id %d\n", pdev->id);

I believe this belongs to the first patch.

>   		return ret;
>   	}
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index e87c8aea6fb3..4c3274838ec7 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -23,6 +23,9 @@
>   
>   #define NUM_OVERLAY_PLANES 8
>   
> +#define VKMS_MAX_OUTPUT_OBJECTS 16
> +#define VKMS_MAX_PLANES (3 * VKMS_MAX_OUTPUT_OBJECTS)
> +
>   struct vkms_frame_info {
>   	struct drm_framebuffer *fb;
>   	struct drm_rect src, dst;
> @@ -65,6 +68,25 @@ struct vkms_plane {
>   	struct drm_plane base;
>   };
>   
> +struct vkms_crtc {
> +	struct drm_crtc base;
> +
> +	struct drm_writeback_connector wb_connector;
> +	struct hrtimer vblank_hrtimer;
> +	ktime_t period_ns;
> +	struct drm_pending_vblank_event *event;
> +	/* ordered wq for composer_work */
> +	struct workqueue_struct *composer_workq;
> +	/* protects concurrent access to composer */
> +	spinlock_t lock;
> +
> +	/* protected by @lock */
> +	bool composer_enabled;
> +	struct vkms_crtc_state *composer_state;
> +
> +	spinlock_t composer_lock;
> +};
> +
>   /**
>    * vkms_crtc_state - Driver specific CRTC state
>    * @base: base CRTC state

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e..f69621822c1b 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -8,6 +8,8 @@
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
>   
>   #include "vkms_drv.h"
>   #include "vkms_formats.h"
> @@ -65,6 +67,20 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
>   	kfree(vkms_state);
>   }
>   
> +static void vkms_plane_destroy(struct drm_plane *plane)
> +{
> +	struct vkms_plane *vkms_plane =
> +		container_of(plane, struct vkms_plane, base);
> +
> +	if (plane->state) {
> +		vkms_plane_destroy_state(plane, plane->state);
> +		plane->state = NULL;
> +	}
> +
> +	drm_plane_cleanup(plane);
> +	memset(vkms_plane, 0, sizeof(struct vkms_plane));
> +}
> +
>   static void vkms_plane_reset(struct drm_plane *plane)
>   {
>   	struct vkms_plane_state *vkms_state;
> @@ -84,11 +100,12 @@ static void vkms_plane_reset(struct drm_plane *plane)
>   }
>   
>   static const struct drm_plane_funcs vkms_plane_funcs = {
> -	.update_plane		= drm_atomic_helper_update_plane,
> -	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.reset			= vkms_plane_reset,

I believe that there is no need to change this lines.

> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = vkms_plane_destroy,
> +	.reset = vkms_plane_reset,
>   	.atomic_duplicate_state = vkms_plane_duplicate_state,
> -	.atomic_destroy_state	= vkms_plane_destroy_state,
> +	.atomic_destroy_state = vkms_plane_destroy_state,
>   };
>   
>   static void vkms_plane_atomic_update(struct drm_plane *plane,
> @@ -198,17 +215,22 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>   };
>   
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type)
>   {
>   	struct drm_device *dev = &vkmsdev->drm;
> +	struct vkms_output *output = &vkmsdev->output;
>   	struct vkms_plane *plane;
> +	int ret;
>   
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> -					   &vkms_plane_funcs,
> -					   vkms_formats, ARRAY_SIZE(vkms_formats),
> -					   NULL, type, NULL);
> -	if (IS_ERR(plane))
> -		return plane;
> +	if (output->num_planes >= VKMS_MAX_PLANES)
> +		return ERR_PTR(-ENOMEM);
> +
> +	plane = &output->planes[output->num_planes++];
> +	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
> +				       vkms_formats, ARRAY_SIZE(vkms_formats),
> +				       NULL, type, NULL);

Wouldn't be possible to use drmm_universal_plane_alloc?

Best Regards,
- Maíra

> +	if (ret)
> +		return ERR_PTR(ret);
>   
>   	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 84a51cd281b9..b90bcbd0a0e0 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   
>   #include <linux/iosys-map.h>
> +#include <linux/kernel.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_edid.h>
> @@ -101,7 +102,8 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>   				struct drm_writeback_job *job)
>   {
>   	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_crtc *vkms_crtc =
> +		container_of(connector, struct vkms_crtc, wb_connector);
>   
>   	if (!job->fb)
>   		return;
> @@ -110,8 +112,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>   
>   	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
>   
> -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	vkms_set_composer(vkms_crtc, false);
>   	kfree(vkmsjob);
>   }
>   
> @@ -120,11 +121,11 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>   {
>   	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
>   											 conn);
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output = &vkmsdev->output;
> -	struct drm_writeback_connector *wb_conn = &output->wb_connector;
> +	struct vkms_crtc *vkms_crtc =
> +		drm_crtc_to_vkms_crtc(connector_state->crtc);
> +	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
>   	struct drm_connector_state *conn_state = wb_conn->base.state;
> -	struct vkms_crtc_state *crtc_state = output->composer_state;
> +	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
>   	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
>   	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
>   	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
> @@ -135,18 +136,18 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>   	if (!conn_state)
>   		return;
>   
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(vkms_crtc, true);
>   
>   	active_wb = conn_state->writeback_job->priv;
>   	wb_frame_info = &active_wb->wb_frame_info;
>   
> -	spin_lock_irq(&output->composer_lock);
> +	spin_lock_irq(&vkms_crtc->composer_lock);
>   	crtc_state->active_writeback = active_wb;
>   	wb_frame_info->offset = fb->offsets[0];
>   	wb_frame_info->pitch = fb->pitches[0];
>   	wb_frame_info->cpp = fb->format->cpp[0];
>   	crtc_state->wb_pending = true;
> -	spin_unlock_irq(&output->composer_lock);
> +	spin_unlock_irq(&vkms_crtc->composer_lock);
>   	drm_writeback_queue_job(wb_conn, connector_state);
>   	active_wb->wb_write = get_line_to_frame_function(wb_format);
>   	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
> @@ -160,9 +161,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>   	.atomic_commit = vkms_wb_atomic_commit,
>   };
>   
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_crtc *vkms_crtc)
>   {
> -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
>   
>   	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>   
