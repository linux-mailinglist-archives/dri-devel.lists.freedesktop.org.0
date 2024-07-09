Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C792B3E0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 11:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3541210E4D3;
	Tue,  9 Jul 2024 09:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ISUKwmQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228210E4D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 09:32:16 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ee9bca8652so2811481fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720517534; x=1721122334; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ewc70fROqt3rzaJz07StrqQmqSZrtwDP5kdVthlFK8I=;
 b=ISUKwmQU0ES0+c5z3MZg6iUeY7O0uzsJnEcbZ4DYe1J1j9ZUK116y9eDtuqOJgQdEQ
 VUZvMK2Q060KH+DGWMnlijbZF8owtJA8p5ZnQPmTJMOHnB1/9+pJGGcu5+U653Zwg2v9
 UuOVDT6zZ0L/O6NXk+Ng1dPyRjm6vu/xzT8Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720517534; x=1721122334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewc70fROqt3rzaJz07StrqQmqSZrtwDP5kdVthlFK8I=;
 b=lR8IAb0t8eNHBWztPAHm31V0rHHjsVCbhJo2l9H60oy2XpoRAYJaX6EnmbSlz5yFYj
 4W9ssjexVwpD0Z9iif+2om0+WFwM99T1ZwQINo4RmDaiqXJDfWTtdRVIsvu8uH395W+J
 EZwLgHwTU2pdV/TK487XwO970p3q+57yceVtbrpZRjGaM8TbpRpom8syivIR6jtf2dt+
 6xcrsevzWZnOeMhVW4mNjgSevcgb8iTFzXE0z8AfO2IPe6Xflud/N3dsgIgh2hFvHJi7
 8A5bk7KBWFvjKQhBk1xQ0BdSJ3EI3CEqutQzLcml4GGkSWTckFRea49s0lItdq2y2XzA
 Ijlw==
X-Gm-Message-State: AOJu0Yxe+AZWVHC0YIIAAap1ZgcUwZBTljq1jKgyYVfOP68Btb/xFCq9
 WEdZx59i3/ouSWTPGHVwvHW5vB1OjRpWCap92kpPU0HMWRLjQ5xBQU1SUM3Yv3A=
X-Google-Smtp-Source: AGHT+IGVWWUiNssA64xmT9WON6S1dOldSZUUjeYQLAGxDZ+nsaLA2Q0ky3uiXmODRee/PMIV+ZKiUA==
X-Received: by 2002:a05:651c:509:b0:2ee:7e6c:34d7 with SMTP id
 38308e7fff4ca-2eeb30b86b4mr15046411fa.1.1720517534339; 
 Tue, 09 Jul 2024 02:32:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fca8bsm199553335e9.47.2024.07.09.02.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 02:32:13 -0700 (PDT)
Date: Tue, 9 Jul 2024 11:32:11 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
Message-ID: <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local>
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
 <20240708202907.383917-2-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708202907.383917-2-hamza.mahfooz@amd.com>
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

On Mon, Jul 08, 2024 at 04:29:07PM -0400, Hamza Mahfooz wrote:
> Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
> enable PSR more quickly for displays that support it.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index fdbc9b57a23d..ee6c31e9d3c4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
>  
>  static void manage_dm_interrupts(struct amdgpu_device *adev,
>  				 struct amdgpu_crtc *acrtc,
> -				 bool enable)
> +				 struct dm_crtc_state *acrtc_state)
>  {
>  	/*
>  	 * We have no guarantee that the frontend index maps to the same
> @@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
>  	 *
>  	 * TODO: Use a different interrupt or check DC itself for the mapping.
>  	 */
> -	int irq_type =
> -		amdgpu_display_crtc_idx_to_irq_type(
> -			adev,
> -			acrtc->crtc_id);
> +	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
> +							   acrtc->crtc_id);
> +	struct dc_crtc_timing *timing;
> +	int offdelay;
> +
> +	if (acrtc_state) {
> +		timing = &acrtc_state->stream->timing;
> +
> +		/* at least 2 frames */
> +		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
> +						       (uint64_t)100),
> +						      timing->v_total),
> +					    timing->h_total) + 1;

Yeah, _especially_ when you have a this short timeout your really have to
instead fix the vblank driver code properly so you can enable
vblank_disable_immediate. This is just cheating :-)
-Sima

> +
> +		if (acrtc_state->stream->link->psr_settings.psr_version <
> +		    DC_PSR_VERSION_UNSUPPORTED &&
> +		    amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(3, 5, 0))
> +			drm_crtc_set_vblank_offdelay(&acrtc->base, offdelay);
>  
> -	if (enable) {
>  		drm_crtc_vblank_on(&acrtc->base);
>  		amdgpu_irq_get(
>  			adev,
> @@ -9319,7 +9332,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
>  		if (old_crtc_state->active &&
>  		    (!new_crtc_state->active ||
>  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
> -			manage_dm_interrupts(adev, acrtc, false);
> +			manage_dm_interrupts(adev, acrtc, NULL);
>  			dc_stream_release(dm_old_crtc_state->stream);
>  		}
>  	}
> @@ -9834,7 +9847,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
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
> 2.45.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
