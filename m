Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74969BCA0E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59F010E3FF;
	Tue,  5 Nov 2024 10:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UxcGYJ85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C78C10E3FF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:09:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77DAAFF80A;
 Tue,  5 Nov 2024 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730801339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVn/cMh8Wl18NRROTmyst1TqgNv8+GFVY44Ew2mfRTg=;
 b=UxcGYJ85V/2iYxN9EQi3a6vZsZfVF1VeMfDdq2UwnBlckOSHFMBaXZwoxfH0XADxeJI8Is
 IJ/tG43teVSZAe9WuD35yNsVg28FGOFf7MIZmq6I4ltVdMc+MjfKGrMPD6T/1uEDDq47z5
 08/eMHt3D0/8KZoR3GkLZbSBpu+LF2WutbCfpbbgd0hbPRhsKv9bNYmk6Kd3mHVUCRub5o
 u9XgXMnZXgNqSZ/Zw0qMOWCTpn4xnoeXUsJkse6ZUNbswbPfc3XjRRZ9Df3SShUmR0IUY4
 GJzKcsYpiHAKn5s5YXCYBY0FNE5hsGNcllq6ajUgwPedkpls7OwZB1GPBOeY6A==
Date: Tue, 5 Nov 2024 11:08:57 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Remove usage of legacy drm_crtc members
Message-ID: <ZynuubVyb7rOwy-r@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241003-remove-legacy-v1-1-0b7db1f1a1a6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-remove-legacy-v1-1-0b7db1f1a1a6@bootlin.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 03/10/24 - 17:41, Louis Chauvet wrote:
> Some members of the drm_crtc structure have been deprecated in favor of
> equivalent members in the drm_crtc_state structure. As reported by Ville
> Syrjala [1], the VKMS driver was still using these deprecated fields. This
> commit updates the VKMS driver to use the new drm_crtc_state fields
> instead.
> 
> Additionally, this commit removes the call to
> `drm_calc_timestamping_constants` in `vkms_enable_vblank` as it is
> redundant. This calculation is already performed in
> `vkms_atomic_commit_tail` by calling
> `drm_atomic_helper_commit_modeset_disables`.
> 
> [1]:https://lore.kernel.org/all/20241002182200.15363-1-ville.syrjala@linux.intel.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Applied on drm-misc-next:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aafc45d5f88843a4645e1a53328a0601601d0c12

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  | 4 ++--
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 2 --
>  drivers/gpu/drm/vkms/vkms_writeback.c | 4 ++--
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 57a5769fc994..3f0977d746be 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -187,7 +187,7 @@ static void blend(struct vkms_writeback_job *wb,
>  
>  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
>  
> -	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> +	size_t crtc_y_limit = crtc_state->base.mode.vdisplay;
>  
>  	/*
>  	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> @@ -270,7 +270,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
>  	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>  		return -EINVAL;
>  
> -	line_width = crtc_state->base.crtc->mode.hdisplay;
> +	line_width = crtc_state->base.mode.hdisplay;
>  	stage_buffer.n_pixels = line_width;
>  	output_buffer.n_pixels = line_width;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index a40295c18b48..bbf080d32d2c 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -64,8 +64,6 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>  
> -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> -
>  	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	out->vblank_hrtimer.function = &vkms_vblank_simulate;
>  	out->period_ns = ktime_set(0, vblank->framedur_ns);
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index bc724cbd5e3a..999d5c01ea81 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -131,8 +131,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	struct drm_connector_state *conn_state = wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state = output->composer_state;
>  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
> -	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
> -	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
> +	u16 crtc_height = crtc_state->base.mode.vdisplay;
> +	u16 crtc_width = crtc_state->base.mode.hdisplay;
>  	struct vkms_writeback_job *active_wb;
>  	struct vkms_frame_info *wb_frame_info;
>  	u32 wb_format = fb->format->format;
> 
> ---
> base-commit: cbc1e8696fbea0010a73bf93534c712f9ad177db
> change-id: 20241003-remove-legacy-a2683a7bbcd5
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
