Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A7A9581AC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FB010E554;
	Tue, 20 Aug 2024 09:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jXrxzHG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0794C10E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:09:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so42074225e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724144986; x=1724749786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0q3EX2LKuybo+dJ0IuBL5hou37iJownnUZzfVeG1/M=;
 b=jXrxzHG774bT9RTf3wBpPpBOZCeB+gMmk3HkUugkNU3iMYUwoV5Z/EG8+0QTK6KyYL
 8biJkHHUvcZyKEWAIzfrRnOW1Bt2345FpyOdvHkHjKUycWlZNkYmVHqZRNZOqBISuIrP
 uBwabD2+w9qjP8G1ta6xEr9OCgFYhvsCVVBBM645D5+pzuM4YaJEd8tR5Yn8GwLkB8/b
 vjguKbsKxwumoq5AnkJbBe5Xu8mb4xDbINYSDnIZulzKOsZq1R5a1Kpcpnas4sWWKJBJ
 D104zy3ioh7Qf9bYtCyxaFIfesCZU2E14r6MoTd7b85hrDNCa8GFO4tz3j1XDFE3y3Ds
 IW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724144986; x=1724749786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0q3EX2LKuybo+dJ0IuBL5hou37iJownnUZzfVeG1/M=;
 b=TdV1qIuhTadgkkvqibwGLCdZMVPZ38aXE2/3Xc5jmR2DKofipc4nT9OUo15hqXFgSg
 ZDZmnDGb7oTr+rWl9dsvC85vmcW/O6j0ojQLFuZOO99Ouccbe5Wy5QksnrwjuhNDbRm/
 HCUQ7Do00LrFZgG8kJYzWyttRfUVNlv/8k2h9tGTjbg0hqfW7HmhIOVQ2vpJvtdLqvM5
 qK0Ct1tLlrayAwFX7CD1dIcU7i8G937f3PV102/62iMmyvqlIGL3q4jamJ5X4LoNwTYe
 f454eexluAAJwhZUbLq7jZtsqQ+dceRQeCbRsknosG8Ucrspgeod2vRtDdrR7QN3No2Q
 yfaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFVwGgTVP2wYilp5jtCGSJEUm4DxVnjjwdqqJkotdgY/HjD+jlNiEOA9quhjZcJyZw7oSiD0hkDfvfZ7Ix2qduGkNdnrlvlxUSNWj+HN/w
X-Gm-Message-State: AOJu0Yx/dnMdDY6omE7JyEc40i4bIkDCvAqMJqBdmPmAQWggj+vXDOHJ
 wy+2WqZJpuxBVXFlAzFiwXpkvsPMJr73hkplAGP1DNesDOhup3fU
X-Google-Smtp-Source: AGHT+IEnFM5M9DMhsQmCohO8Zl6xh53EIGTT29UF+JCf0WSDfX7HLeEUsS39IUyV31jUq+rBDYkc4A==
X-Received: by 2002:a05:600c:1d0a:b0:426:6eac:8314 with SMTP id
 5b1f17b1804b1-429ed7856a8mr101148025e9.1.1724144985982; 
 Tue, 20 Aug 2024 02:09:45 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7cfc6sm191852735e9.42.2024.08.20.02.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:09:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH RFC 3/4] drm/vkms: Switch to managed for crtc
Date: Tue, 20 Aug 2024 11:09:44 +0200
Message-ID: <20240820090944.2883-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-vkms-managed-v1-3-7ab8b8921103@bootlin.com>
References: <20240814-google-vkms-managed-v1-3-7ab8b8921103@bootlin.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The current VKMS driver uses non-managed function to create crtcs. It

s/crtcs/CRTCs

> is not an issue yet, but in order to support multiple devices easly,

s/easly/easily

> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I think that this patch is doing different things that we could split in simpler
diffs.

Moving the code from vkms_output.c to vkms_drv.c be its own patch.

I'm not sure whether the calls to drm_mode_crtc_set_gamma_size() and
drm_crtc_enable_color_mgmt() should go here or they belong to a different patch.

Other than that, I added a couple of comments:

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  10 +--
>  drivers/gpu/drm/vkms/vkms_composer.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  75 ++++++++++++-------
>  drivers/gpu/drm/vkms/vkms_crtc.h      |  19 +++--
>  drivers/gpu/drm/vkms/vkms_drv.c       | 134 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/vkms/vkms_drv.h       |  43 -----------
>  drivers/gpu/drm/vkms/vkms_output.c    | 135 ----------------------------------
>  drivers/gpu/drm/vkms/vkms_writeback.c |  20 +++--
>  drivers/gpu/drm/vkms/vkms_writeback.h |   2 +-
>  9 files changed, 197 insertions(+), 243 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 15ef07ed304e..9b2f578c2eb1 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -515,7 +515,7 @@ void vkms_composer_worker(struct work_struct *work)
>  							  composer_work);
>  	struct drm_crtc *crtc = crtc_state->base.crtc;
>  	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
>  	bool crc_pending, wb_pending;
>  	u64 frame_start, frame_end;
>  	u32 crc32 = 0;
> @@ -616,12 +616,12 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>  	return 0;
>  }
>  
> -void vkms_set_composer(struct vkms_output *out, bool enabled)
> +void vkms_set_composer(struct vkms_crtc *out, bool enabled)
>  {
>  	bool old_enabled;
>  
>  	if (enabled)
> -		drm_crtc_vblank_get(&out->crtc);
> +		drm_crtc_vblank_get(&out->base);
>  
>  	spin_lock_irq(&out->lock);
>  	old_enabled = out->composer_enabled;
> @@ -629,12 +629,12 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
>  	spin_unlock_irq(&out->lock);
>  
>  	if (old_enabled)
> -		drm_crtc_vblank_put(&out->crtc);
> +		drm_crtc_vblank_put(&out->base);
>  }
>  
>  int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  {
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
>  	bool enabled = false;
>  	int ret = 0;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> index 91b33af1e013..77efd2e3a63a 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.h
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -7,7 +7,7 @@
>  #include "vkms_crtc.h"
>  
>  void vkms_composer_worker(struct work_struct *work);
> -void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_set_composer(struct vkms_crtc *out, bool enabled);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc, size_t *count);
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 6fae43932b60..47e62fb3e404 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -6,6 +6,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_print.h>
>  
>  #include "vkms_crtc.h"
> @@ -14,9 +16,8 @@
>  
>  static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  {
> -	struct vkms_output *output = container_of(timer, struct vkms_output,
> -						  vblank_hrtimer);
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_crtc *output = hrtimer_to_vkms_crtc(timer);
> +	struct drm_crtc *crtc = &output->base;
>  	struct vkms_crtc_state *state;
>  	u64 ret_overrun;
>  	bool ret, fence_cookie;
> @@ -64,8 +65,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  
>  static int vkms_enable_vblank(struct drm_crtc *crtc)
>  {
> +	struct drm_device *dev = crtc->dev;

I think this variable should throw warning because it is unused.

I imagine you are already doing it but you can compile with "make W=1 C=1" to
get this errors in the log.

>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
>  
>  	drm_calc_timestamping_constants(crtc, &crtc->mode);
>  
> @@ -79,7 +81,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
>  
>  static void vkms_disable_vblank(struct drm_crtc *crtc)
>  {
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
>  
>  	hrtimer_cancel(&out->vblank_hrtimer);
>  }
> @@ -89,8 +91,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  				      bool in_vblank_irq)
>  {
>  	struct drm_device *dev = crtc->dev;

This one should throw a warning as well.

> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_crtc *output = drm_crtc_to_vkms_crtc(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	if (!READ_ONCE(vblank->enabled)) {
> @@ -137,7 +138,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crtc)
>  static void vkms_atomic_crtc_destroy_state(struct drm_crtc *crtc,
>  					   struct drm_crtc_state *state)
>  {
> -	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(state);
> +	struct vkms_crtc_state *vkms_state = drm_crtc_state_to_vkms_crtc_state(state);
>  
>  	__drm_atomic_helper_crtc_destroy_state(state);
>  
> @@ -178,7 +179,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>  									  crtc);
> -	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc_state);
> +	struct vkms_crtc_state *vkms_state = drm_crtc_state_to_vkms_crtc_state(crtc_state);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
>  	int i = 0, ret;
> @@ -234,7 +235,7 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> -	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_output = drm_crtc_to_vkms_crtc(crtc);
>  
>  	/* This lock is held across the atomic commit to block vblank timer
>  	 * from scheduling vkms_composer_worker until the composer is updated
> @@ -245,7 +246,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> -	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_output = drm_crtc_to_vkms_crtc(crtc);
>  
>  	if (crtc->state->event) {
>  		spin_lock(&crtc->dev->event_lock);
> @@ -260,7 +261,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  		crtc->state->event = NULL;
>  	}
>  
> -	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> +	vkms_output->composer_state = drm_crtc_state_to_vkms_crtc_state(crtc->state);
>  
>  	spin_unlock_irq(&vkms_output->lock);
>  }
> @@ -273,30 +274,48 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  	.atomic_disable	= vkms_crtc_atomic_disable,
>  };
>  
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +static void vkms_crtc_destroy_workqueue(struct drm_device *dev, void *raw_vkms_crtc)
> +{
> +	struct vkms_crtc *vkms_crtc = raw_vkms_crtc;
> +
> +	destroy_workqueue(vkms_crtc->composer_workq);

I think that you might need to check "if (vkms_crtc->composer_workq)" first.

Check "git show 2fe2a8f40c21" for the explanation.

> +}
> +
> +struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor)
>  {
> -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct drm_device *dev = &vkmsdev->drm;
> +	struct vkms_crtc *vkms_crtc;
>  	int ret;
>  
> -	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					 &vkms_crtc_funcs, NULL);
> +	vkms_crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base, primary, cursor,
> +						&vkms_crtc_funcs, NULL);
> +	if (IS_ERR(vkms_crtc)) {
> +		DRM_DEV_ERROR(vkmsdev->drm.dev, "Failed to init CRTC\n");

Why DRM_DEV_ERROR() instead of DRM_ERROR()?

> +		return vkms_crtc;
> +	}
> +
> +	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
> +
> +	ret = drm_mode_crtc_set_gamma_size(&vkms_crtc->base, VKMS_LUT_SIZE);
>  	if (ret) {
> -		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +		DRM_DEV_ERROR(vkmsdev->drm.dev, "Failed to set gamma size\n");
> +		return ERR_PTR(ret);
>  	}
>  
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	drm_crtc_enable_color_mgmt(&vkms_crtc->base, 0, false, VKMS_LUT_SIZE);
>  
> -	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> +	spin_lock_init(&vkms_crtc->lock);
> +	spin_lock_init(&vkms_crtc->composer_lock);
>  
> -	spin_lock_init(&vkms_out->lock);
> -	spin_lock_init(&vkms_out->composer_lock);
> +	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> +	if (!vkms_crtc->composer_workq)
> +		return ERR_PTR(-ENOMEM);
>  
> -	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> -	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +	ret = drmm_add_action_or_reset(&vkmsdev->drm, vkms_crtc_destroy_workqueue, vkms_crtc);

&vkmsdev->drm => dev

> +	if (ret)
> +		return ERR_PTR(ret);
>  
> -	return ret;
> +	return vkms_crtc;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.h b/drivers/gpu/drm/vkms/vkms_crtc.h
> index 9f5ce21f3425..dde28884a0a5 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.h
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.h
> @@ -48,7 +48,6 @@ struct vkms_crtc_state {
>   * @wb_connecter: DRM writeback connector used for this output
>   * @vblank_hrtimer:
>   * @period_ns:
> - * @event:
>   * @composer_workq: Ordered workqueue for composer_work
>   * @lock: Lock used to project concurrent acces to the composer
>   * @composer_enabled: Protected by @lock.
> @@ -61,7 +60,6 @@ struct vkms_crtc {
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> -	struct drm_pending_vblank_event *event;

Commit f3a47a269119 ("drm/vkms: Remove event from vkms_output") removed this
field. You might need to rebase this patch.

>  	struct workqueue_struct *composer_workq;
>  	spinlock_t lock;
>  
> @@ -71,17 +69,22 @@ struct vkms_crtc {
>  	spinlock_t composer_lock;
>  };
>  
> -#define to_vkms_crtc_state(target)\
> +#define drm_crtc_state_to_vkms_crtc_state(target)\
>  	container_of(target, struct vkms_crtc_state, base)
>  
> +#define drm_crtc_to_vkms_crtc(target) \
> +	container_of(target, struct vkms_crtc, base)
> +
> +#define hrtimer_to_vkms_crtc(target) \
> +	container_of(target, struct vkms_crtc, vblank_hrtimer)
> +
>  /**
>   * vkms_crtc_init() - Initialize a crtc for vkms
> - * @dev: drm_device associated with the vkms buffer
> - * @crtc: uninitialized crtc device
> + * @vkmsdev: drm_device associated with the vkms buffer
>   * @primary: primary plane to attach to the crtc
>   * @cursor plane to attach to the crtc
>   */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> -
> +struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor);
>  #endif //_VKMS_CRTC_H
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 5907877bdfa0..e79832e10f3c 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -31,6 +31,7 @@
>  
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
>  
>  #define DRIVER_NAME	"vkms"
>  #define DRIVER_DESC	"Virtual Kernel Mode Setting"
> @@ -46,7 +47,8 @@ MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
>  
>  static bool enable_writeback = true;
>  module_param_named(enable_writeback, enable_writeback, bool, 0444);
> -MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
> +MODULE_PARM_DESC(enable_writeback,
> +		 "Enable/Disable writeback connector support");

Unwanted change?

>  static bool enable_overlay;
>  module_param_named(enable_overlay, enable_overlay, bool, 0444);
> @@ -54,14 +56,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>  
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
> -static void vkms_release(struct drm_device *dev)
> -{
> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> -
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> -}
> -
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  {
>  	struct drm_device *dev = old_state->dev;
> @@ -82,7 +76,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>  
>  	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
> -		struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(old_crtc_state);
> +		struct vkms_crtc_state *vkms_state =
> +			drm_crtc_state_to_vkms_crtc_state(old_crtc_state);
>  
>  		flush_work(&vkms_state->composer_work);
>  	}
> @@ -109,7 +104,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
>  
>  static const struct drm_driver vkms_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> -	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
>  
> @@ -148,6 +142,124 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
>  	.atomic_commit_tail = vkms_atomic_commit_tail,
>  };
>  
> +static const struct drm_connector_funcs vkms_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs vkms_encoder_funcs = {};
> +
> +static int vkms_conn_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +
> +	/* Use the default modes list from drm */
> +	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> +	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> +
> +	return count;
> +}
> +
> +static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> +	.get_modes = vkms_conn_get_modes,
> +};
> +
> +static int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc)
> +{
> +	struct drm_device *dev = &vkmsdev->drm;
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder;
> +	struct vkms_crtc *crtc;
> +	struct drm_plane *plane;
> +	struct vkms_plane *primary, *cursor, *overlay = NULL;
> +	int ret;
> +	int writeback;
> +	unsigned int n;
> +
> +	/*
> +	 * Initialize used plane. One primary plane is required to perform the composition.
> +	 *
> +	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> +	 * composition.
> +	 */
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc);
> +	if (IS_ERR(primary))
> +		return PTR_ERR(primary);
> +
> +	if (vkmsdev->config->overlay) {
> +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtc);
> +			if (IS_ERR(overlay))
> +				return PTR_ERR(overlay);
> +		}
> +	}
> +
> +	if (vkmsdev->config->cursor) {
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, possible_crtc);
> +		if (IS_ERR(cursor))
> +			return PTR_ERR(cursor);
> +	}
> +
> +	/* [1]: Initialize the crtc component */
> +	crtc = vkms_crtc_init(vkmsdev, &primary->base,
> +			      cursor ? &cursor->base : NULL);
> +	if (IS_ERR(crtc))
> +		return PTR_ERR(crtc);
> +
> +	/* Enable the output's CRTC for all the planes */
> +	drm_for_each_plane(plane, &vkmsdev->drm) {
> +		plane->possible_crtcs |= drm_crtc_mask(&crtc->base);
> +	}
> +
> +	/* Initialize the connector component */
> +	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
> +	if (!connector)
> +		return -ENOMEM;
> +
> +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +	if (ret) {
> +		DRM_ERROR("Failed to init connector\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> +
> +	/* Initialize the encoder component */
> +	encoder = drmm_kzalloc(&vkmsdev->drm, sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return -ENOMEM;
> +
> +	ret = drmm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> +				DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (ret) {
> +		DRM_ERROR("Failed to init encoder\n");
> +		return ret;
> +	}
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&crtc->base);
> +
> +	/* Attach the encoder and the connector */
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret) {
> +		DRM_ERROR("Failed to attach connector to encoder\n");
> +		return ret;
> +	}
> +
> +	/* Initialize the writeback component */
> +	if (vkmsdev->config->writeback) {
> +		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> +		if (writeback)
> +			DRM_ERROR("Failed to init writeback connector\n");
> +	}
> +
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +}
> +
>  static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 2c9d1f20ce84..08d0ef106e37 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,35 +25,6 @@
>  
>  #define VKMS_LUT_SIZE 256
>  
> -/**
> - * struct vkms_output - Internal representation of all output components in vkms
> - *
> - * @crtc: Base crtc in drm
> - * @encoder: DRM encoder used for this output
> - * @connector: DRM connector used for this output
> - * @wb_connecter: DRM writeback connector used for this output
> - * @vblank_hrtimer:
> - * @period_ns:
> - * @composer_workq: Ordered workqueue for composer_work
> - * @lock: Lock used to project concurrent acces to the composer
> - * @composer_enabled: Protected by @lock.
> - * @composer_state:
> - * @composer_lock: Lock used internally to protect @composer_state members
> - */
> -struct vkms_output {
> -	struct drm_crtc crtc;
> -	struct drm_writeback_connector wb_connector;
> -	struct hrtimer vblank_hrtimer;
> -	ktime_t period_ns;
> -	struct workqueue_struct *composer_workq;
> -	spinlock_t lock;
> -
> -	bool composer_enabled;
> -	struct vkms_crtc_state *composer_state;
> -
> -	spinlock_t composer_lock;
> -};
> -
>  /**
>   * struct vkms_config - General configuration for VKMS driver
>   *
> @@ -80,7 +51,6 @@ struct vkms_config {
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> -	struct vkms_output output;
>  	const struct vkms_config *config;
>  };
>  
> @@ -88,20 +58,7 @@ struct vkms_device {
>   * The following helpers are used to convert a member of a struct into its parent.
>   */
>  
> -#define drm_crtc_to_vkms_output(target) \
> -	container_of(target, struct vkms_output, crtc)
> -
>  #define drm_device_to_vkms_device(target) \
>  	container_of(target, struct vkms_device, drm)
>  
> -/**
> - * vkms_output_init() - Initialize all sub-components needed for a vkms device.
> - *
> - * @vkmsdev: vkms device to initialize
> - * @possible_crtc_index: Crtc which can be attached to the planes. The caller must ensure that
> - * possible_crtc_index is positive and less or equals to 31.
> - */
> -
> -int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
> -
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> deleted file mode 100644
> index cb8507917b5f..000000000000
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -
> -#include <drm/drm_atomic_helper.h>
> -#include <drm/drm_edid.h>
> -#include <drm/drm_probe_helper.h>
> -#include <drm/drm_managed.h>
> -
> -#include "vkms_writeback.h"
> -#include "vkms_plane.h"
> -#include "vkms_crtc.h"
> -
> -static const struct drm_connector_funcs vkms_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const struct drm_encoder_funcs vkms_encoder_funcs = {};
> -
> -static int vkms_conn_get_modes(struct drm_connector *connector)
> -{
> -	int count;
> -
> -	/* Use the default modes list from drm */
> -	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> -	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> -
> -	return count;
> -}
> -
> -static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> -	.get_modes    = vkms_conn_get_modes,
> -};
> -
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int possible_crtc_index,
> -				  struct drm_crtc *crtc)
> -{
> -	struct vkms_plane *overlay;
> -
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtc_index);
> -	if (IS_ERR(overlay))
> -		return PTR_ERR(overlay);
> -
> -	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> -
> -	return 0;
> -}
> -
> -int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
> -{
> -	struct vkms_output *output = &vkmsdev->output;
> -	struct drm_device *dev = &vkmsdev->drm;
> -	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
> -	struct drm_crtc *crtc = &output->crtc;
> -	struct vkms_plane *primary, *cursor = NULL;
> -	int ret;
> -	int writeback;
> -	unsigned int n;
> -
> -	/*
> -	 * Initialize used plane. One primary plane is required to perform the composition.
> -	 *
> -	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> -	 * composition.
> -	 */
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc_index);
> -	if (IS_ERR(primary))
> -		return PTR_ERR(primary);
> -
> -	if (vkmsdev->config->overlay) {
> -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, possible_crtc_index, crtc);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
> -	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, possible_crtc_index);
> -		if (IS_ERR(cursor))
> -			return PTR_ERR(cursor);
> -	}
> -
> -	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> -	if (ret)
> -		return ret;
> -
> -	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
> -	if (!connector)
> -		return -ENOMEM;
> -
> -	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> -				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init connector\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> -
> -	encoder = drmm_kzalloc(&vkmsdev->drm, sizeof(*encoder), GFP_KERNEL);
> -	if (!encoder)
> -		return -ENOMEM;
> -
> -	ret = drmm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -				DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init encoder\n");
> -		return ret;
> -	}
> -	/*
> -	 * This is an hardcoded value to select crtc for the encoder.
> -	 * 1 here designate the first registered CRTC, the one allocated in [1]
> -	 */
> -	encoder->possible_crtcs = 1;
> -
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret) {
> -		DRM_ERROR("Failed to attach connector to encoder\n");
> -		return ret;
> -	}
> -
> -	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev);
> -		if (writeback)
> -			DRM_ERROR("Failed to init writeback connector\n");
> -	}
> -
> -	drm_mode_config_reset(dev);
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 5e75880a5845..322e247979b2 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -110,7 +110,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
>  	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_crtc *vkms_crtc = container_of(connector, struct vkms_crtc, wb_connector);
>  
>  	if (!job->fb)
>  		return;
> @@ -119,8 +119,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  
>  	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
>  
> -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	vkms_set_composer(vkms_crtc, false);
>  	kfree(vkmsjob);
>  }
>  
> @@ -129,10 +128,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  {
>  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
>  											 conn);
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_crtc *output = drm_crtc_to_vkms_crtc(connector_state->crtc);
>  	struct drm_writeback_connector *wb_conn = &output->wb_connector;
> -	struct drm_connector_state *conn_state = wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state = output->composer_state;
>  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
>  	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
> @@ -141,12 +138,12 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	struct vkms_frame_info *wb_frame_info;
>  	u32 wb_format = fb->format->format;
>  
> -	if (!conn_state)
> +	if (!connector_state)
>  		return;
>  
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(output, true);
>  
> -	active_wb = conn_state->writeback_job->priv;
> +	active_wb = connector_state->writeback_job->priv;
>  	wb_frame_info = &active_wb->wb_frame_info;
>  
>  	spin_lock_irq(&output->composer_lock);
> @@ -167,9 +164,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>  	.atomic_check = vkms_wb_atomic_check,
>  };
>  
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_crtc *vkms_crtc)
>  {
> -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
>  
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.h b/drivers/gpu/drm/vkms/vkms_writeback.h
> index 44dff15faff6..39613a2408be 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.h
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.h
> @@ -16,6 +16,6 @@ struct vkms_writeback_job {
>  };
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_crtc *vkms_crtc);
>  
>  #endif //_VKMS_WRITEBACK_H
