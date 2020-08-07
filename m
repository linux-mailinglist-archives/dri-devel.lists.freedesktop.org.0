Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAEB23E8EB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5683B6E959;
	Fri,  7 Aug 2020 08:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683746E073
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:30:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p14so989532wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VvwI/VlqEyFoPx7gkROTwN80J/W2Xb8ciD1QsTw1Sas=;
 b=L6HBwv8MxF+PEaA6Adu2i+WZ+lfjn7Tx2SM6GoiJKimARAjgIoTcnVxdL4Luwu5hLv
 knZHFHIs/jPWx1u/efQxvnhEU5421qGi4IT8x3079AnShtud1q9ATY87Y8y53ZdkwA1T
 OKFR/Qao+uPvYhAcNPB463EBD1ufx6qPQs3Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VvwI/VlqEyFoPx7gkROTwN80J/W2Xb8ciD1QsTw1Sas=;
 b=Aay7LJHBjRu+jO4/KARzjDSkL6ClpATqOogjssXGpxLpsSj/hwHWOvBK2mEKY5PLLS
 4IQmHS/UvI/9VpupcAaJY6Q8NC1Pp9PiHsgiazoL98uYoXocUUE4oqd433RzK0BgMvOY
 m1+UcXo02f6rkRclO5i6noLTT32U3vABW1Z9Cu7dxeGgg9VVXv9xDkR4j+9kPQCo1QCe
 oLhS63K4X3buGps+Osp54MADQBHvg81uPUB4sWzvZnPogzWoGatlqlQ841lJtFgeQXd3
 ORRNZq6u7FzsK3QOKsPc6iWGPy3goGpg1+aOaBGAnBShxK+Muz+xz/H4+yWKLnuCMnw/
 NIzw==
X-Gm-Message-State: AOAM531KBWt4nQRLZNR+DCNBPgmBTR8NOheWwt8tYPTxPTgzUbUDZOUF
 Pyzk+iM9UapqPRHkms8eaaejCg==
X-Google-Smtp-Source: ABdhPJzAeTtCNHCfdgR0fg3Rp7PoOnX84VNciugGQVlgQpKVhZBD0Iyogq2Q1sNdP7AtUWsHkoiNiA==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr11559730wmc.30.1596789043953; 
 Fri, 07 Aug 2020 01:30:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c24sm9603339wrb.11.2020.08.07.01.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:30:43 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:30:41 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated
 tiling_flags and tmz_surface in prepare_planes
Message-ID: <20200807083041.GL6419@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas wrote:
> [Why]
> We're racing with userspace as the flags could potentially change
> from when we acquired and validated them in commit_check.

Uh ... I didn't know these could change. I think my comments on Bas'
series are even more relevant now. I think long term would be best to bake
these flags in at addfb time when modifiers aren't set. And otherwise
always use the modifiers flag, and completely ignore the legacy flags
here.
-Daniel

> 
> [How]
> We unfortunately can't drop this function in its entirety from
> prepare_planes since we don't know the afb->address at commit_check
> time yet.
> 
> So instead of querying new tiling_flags and tmz_surface use the ones
> from the plane_state directly.
> 
> While we're at it, also update the force_disable_dcc option based
> on the state from atomic check.
> 
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++---------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bf1881bd492c..f78c09c9585e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  	struct list_head list;
>  	struct ttm_validate_buffer tv;
>  	struct ww_acquire_ctx ticket;
> -	uint64_t tiling_flags;
>  	uint32_t domain;
>  	int r;
> -	bool tmz_surface = false;
> -	bool force_disable_dcc = false;
> -
> -	dm_plane_state_old = to_dm_plane_state(plane->state);
> -	dm_plane_state_new = to_dm_plane_state(new_state);
>  
>  	if (!new_state->fb) {
>  		DRM_DEBUG_DRIVER("No FB bound\n");
> @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
> -
> -	tmz_surface = amdgpu_bo_encrypted(rbo);
> -
>  	ttm_eu_backoff_reservation(&ticket, &list);
>  
>  	afb->address = amdgpu_bo_gpu_offset(rbo);
>  
>  	amdgpu_bo_ref(rbo);
>  
> +	/**
> +	 * We don't do surface updates on planes that have been newly created,
> +	 * but we also don't have the afb->address during atomic check.
> +	 *
> +	 * Fill in buffer attributes depending on the address here, but only on
> +	 * newly created planes since they're not being used by DC yet and this
> +	 * won't modify global state.
> +	 */
> +	dm_plane_state_old = to_dm_plane_state(plane->state);
> +	dm_plane_state_new = to_dm_plane_state(new_state);
> +
>  	if (dm_plane_state_new->dc_state &&
> -			dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
> -		struct dc_plane_state *plane_state = dm_plane_state_new->dc_state;
> +	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
> +		struct dc_plane_state *plane_state =
> +			dm_plane_state_new->dc_state;
> +		bool force_disable_dcc = !plane_state->dcc.enable;
>  
> -		force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
>  		fill_plane_buffer_attributes(
>  			adev, afb, plane_state->format, plane_state->rotation,
> -			tiling_flags, &plane_state->tiling_info,
> -			&plane_state->plane_size, &plane_state->dcc,
> -			&plane_state->address, tmz_surface,
> -			force_disable_dcc);
> +			dm_plane_state_new->tiling_flags,
> +			&plane_state->tiling_info, &plane_state->plane_size,
> +			&plane_state->dcc, &plane_state->address,
> +			dm_plane_state_new->tmz_surface, force_disable_dcc);
>  	}
>  
>  	return 0;
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
