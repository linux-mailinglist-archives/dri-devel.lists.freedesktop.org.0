Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7AD93D4E6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 16:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2D510E99F;
	Fri, 26 Jul 2024 14:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kUeF72Ni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E376F10E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 14:14:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-428098e2b3bso1378065e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722003267; x=1722608067; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pL3OAqhWRpXEpEpnoI7R0AKuCPA6YvJPuWDdHVzC3fg=;
 b=kUeF72NibDy3FpJSv1C1XlYB3Z8fLb3CuFKqBLdZi1exdF5esoh6BIhYsZhmheIvEd
 N75KXakOHGEjbFjceBj9Hkipv5zJp4kAPKB4U3ud82WvG70A4UCsZV9o57gqSgO87jLl
 vCxXHHBu+XamDacDL9rluNC/av+dw5O0BOTHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722003267; x=1722608067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pL3OAqhWRpXEpEpnoI7R0AKuCPA6YvJPuWDdHVzC3fg=;
 b=RpZVzlZo1znC5uHbnm9En9YVFp90SIw7RuYOHH1hfmGvSUWJpNYkAz+F3A6v0VrA7j
 vHs+VQki2OoNEtANeEX1flaE76Mjw3w+BB9b2fO2os2cFsN7XZEvBa1w2KUDgVelve/L
 Efy//vwpiQmjWeVM18BaugSYDQYGqs19bEQrNfgVNfK2XPiZ3/VqyIiDDUy0cP4CDR05
 uM/WtdVwK9GeNgMVCSH7qzCgJIzRDgKInALbiuge1bpLNDi+k++m0tCx522y/35nLq0v
 rtVsrzp4C7/tQC/pfs818NT1YCg6zrwslhRNzqcukgsMBaStjPli1/6DN3koDEQMQlSe
 TDNA==
X-Gm-Message-State: AOJu0YwyPBvV/xvZLmqoPLf1lsyddnfGB90k6oAzCJuI9YCGc6079mkG
 uP+k66xkmCZUKRZ6yMhxewd+Axm+/jtGuFo6mCNnAQTfcyxIrfhIDcSlOJG81Os=
X-Google-Smtp-Source: AGHT+IFM8co+ocHwbkjxdQmGdgjAX2vjUZY63xZXj5+FELN86d55F3MszZzIaN++DSNHsZx94EFzJQ==
X-Received: by 2002:a05:600c:3b87:b0:426:5f08:542b with SMTP id
 5b1f17b1804b1-428053c9c55mr25970015e9.0.1722003266822; 
 Fri, 26 Jul 2024 07:14:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428057b740bsm81244445e9.46.2024.07.26.07.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 07:14:26 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:14:24 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_vblank_on_config()
Message-ID: <ZqOvQN4c61UD82Bf@phenom.ffwll.local>
References: <20240725205109.209743-1-hamza.mahfooz@amd.com>
 <20240725205109.209743-2-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725205109.209743-2-hamza.mahfooz@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Thu, Jul 25, 2024 at 04:51:09PM -0400, Hamza Mahfooz wrote:
> Hook up drm_crtc_vblank_on_config() in amdgpu_dm. So, that we can enable
> PSR and other static screen optimizations more quickly, while avoiding
> stuttering issues that are accompanied by the following dmesg error:
> 
> [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting for DMUB idle: status=3
> 
> This also allows us to mimic how vblanking is handled by the windows
> amdgpu driver.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 49 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 07e373deb814..780e31a2d456 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7952,7 +7952,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
>  
>  static void manage_dm_interrupts(struct amdgpu_device *adev,
>  				 struct amdgpu_crtc *acrtc,
> -				 bool enable)
> +				 struct dm_crtc_state *acrtc_state)
>  {
>  	/*
>  	 * We have no guarantee that the frontend index maps to the same
> @@ -7964,9 +7964,47 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
>  		amdgpu_display_crtc_idx_to_irq_type(
>  			adev,
>  			acrtc->crtc_id);
> +	struct dc_crtc_timing *timing;
> +	int vsync_rate_hz;
> +	int offdelay = 30;
> +
> +	if (acrtc_state) {
> +		timing = &acrtc_state->stream->timing;
> +
> +		vsync_rate_hz = div64_u64(div64_u64((timing->pix_clk_100hz *
> +						     (uint64_t)100),
> +						    timing->v_total),
> +					  timing->h_total);
> +
> +		if (amdgpu_ip_version(adev, DCE_HWIP, 0) >=
> +		    IP_VERSION(3, 5, 0) && (adev->flags & AMD_IS_APU)) {
> +			if (vsync_rate_hz)
> +				/* at least 2 frames */
> +				offdelay = 2000 / vsync_rate_hz + 1;
> +
> +			if (acrtc_state->stream->link->psr_settings.psr_version <
> +			    DC_PSR_VERSION_UNSUPPORTED) {
> +				const struct drm_vblank_crtc_config config = {
> +					.offdelay_ms = offdelay,
> +					.disable_immediate = false
> +				};
> +
> +				drm_crtc_vblank_on_config(&acrtc->base,
> +							  &config);
> +			} else {
> +				const struct drm_vblank_crtc_config config = {
> +					.offdelay_ms = 0,
> +					.disable_immediate = true

Uh, I think it'd be better to use drm_crtc_vblank_on() here and then have
a 2nd patch which re-enables the immediate vblank disabling and references
the right revert for context.

Plus this feels like a demidlayer hack, but I don't understand enough DC
code to know a better place ...
-Sima

> +				};
> +
> +				drm_crtc_vblank_on_config(&acrtc->base,
> +							  &config);
> +			}
> +
> +		} else {
> +			drm_crtc_vblank_on(&acrtc->base);
> +		}
>  
> -	if (enable) {
> -		drm_crtc_vblank_on(&acrtc->base);
>  		amdgpu_irq_get(
>  			adev,
>  			&adev->pageflip_irq,
> @@ -8947,7 +8985,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
>  		if (old_crtc_state->active &&
>  		    (!new_crtc_state->active ||
>  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
> -			manage_dm_interrupts(adev, acrtc, false);
> +			manage_dm_interrupts(adev, acrtc, NULL);
>  			dc_stream_release(dm_old_crtc_state->stream);
>  		}
>  	}
> @@ -9465,7 +9503,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
>  			dc_stream_retain(dm_new_crtc_state->stream);
>  			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
> -			manage_dm_interrupts(adev, acrtc, true);
> +			manage_dm_interrupts(adev, acrtc,
> +					     to_dm_crtc_state(new_crtc_state));
>  		}
>  		/* Handle vrr on->off / off->on transitions */
>  		amdgpu_dm_handle_vrr_transition(dm_old_crtc_state, dm_new_crtc_state);
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
