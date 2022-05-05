Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D191451BEDF
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7901510FD4F;
	Thu,  5 May 2022 12:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E52F10FD4F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:09:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b24so4939623edu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wVtNnr1ud8loUAJ1BZGITzyPKyQLouAndli6SkTPI7k=;
 b=Th4xsHcWutsS/c1cTn0J/43hTIJZ/HWclFUIN5nCMuP4xE71e9oyu3hUmrElZ+UMSC
 GJ2BlDNTin3sVxJBho77VHEtKeWCzEJzdZGCNIWu1opI0+02a4ez2i3mBYIU6/3khKJ7
 ZV4OgqMx2leo3z8pYMUth4rqWNp7fh7Zw3A/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wVtNnr1ud8loUAJ1BZGITzyPKyQLouAndli6SkTPI7k=;
 b=bsXoEaPT8WY634MryOJFTGtrphkUR6TaDDfV3nYqTbz8YcUj/zUQmJUmWex3SdAeUg
 fzKxW7pUC30QIeLRp68ZH0fv55KFNeLsWfL17D6Tp9uhIl8fmdKaOw5txPs4Y0n+FbNN
 2jAcgf1yOcAS7zHIHm6knpFAFC9r3FPdPVDL/Bdw1Xa9cfHirldauJXAxxpZEbQCVG7F
 nLvm8V2ehTHgB9yXrGyCuqOqv4SEqhSEalb3dFFUNAxq4gonPSstiGxMj2Mwvs6yJyUU
 dzsX2kVMjCtAfnqrJYRU/QLu47dN56DUJkD4Q/vR6rJ4xL/4ZyjeDoWGXI5X6psDNbDl
 OpHg==
X-Gm-Message-State: AOAM530f+GiLG4rtPtsGW4jqq4w83gkC2ltwgGHcfzT8ek+nOeAjHIWb
 C4dCS3z+W6wgEUAi7jKARjSctQ==
X-Google-Smtp-Source: ABdhPJyVy9iK99kMvefjH9JZU7+YH+WaPghG7cLLxq0UD9IdR+Jm/zw08awNK6FU6j50ATaPIvz8Bw==
X-Received: by 2002:a05:6402:5188:b0:428:e77:b55b with SMTP id
 q8-20020a056402518800b004280e77b55bmr9952507edd.82.1651752573923; 
 Thu, 05 May 2022 05:09:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 og47-20020a1709071def00b006f3ef214e61sm658338ejc.199.2022.05.05.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:09:33 -0700 (PDT)
Date: Thu, 5 May 2022 14:09:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] drm/amdgpu: switch DM to atomic fence helpers
Message-ID: <YnO+e8IRzAn1zIp0@phenom.ffwll.local>
References: <20220429134230.24334-1-christian.koenig@amd.com>
 <20220429134230.24334-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429134230.24334-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Jude Shih <shenshih@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 03:42:28PM +0200, Christian König wrote:
> This gives us the standard atomic implicit and explicit fencing rules.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Roman Li <Roman.Li@amd.com>
> Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
> Cc: Jude Shih <shenshih@amd.com>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2ade82cfb1ac..c5b2417adcc6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -83,6 +83,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_audio_component.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>  #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
> @@ -7627,6 +7628,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  		goto error_unpin;
>  	}
>  
> +	r = drm_gem_plane_helper_prepare_fb(plane, new_state);
> +	if (unlikely(r != 0))
> +		goto error_unpin;
> +
>  	amdgpu_bo_unreserve(rbo);
>  
>  	afb->address = amdgpu_bo_gpu_offset(rbo);
> @@ -9160,7 +9165,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  	struct dm_crtc_state *dm_old_crtc_state =
>  			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
>  	int planes_count = 0, vpos, hpos;
> -	long r;
>  	unsigned long flags;
>  	struct amdgpu_bo *abo;
>  	uint32_t target_vblank, last_flip_vblank;
> @@ -9173,6 +9177,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
>  		struct dc_stream_update stream_update;
>  	} *bundle;
> +	int r;
>  
>  	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
>  
> @@ -9181,6 +9186,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		goto cleanup;
>  	}
>  
> +	r = drm_atomic_helper_wait_for_fences(dev, state, false);

This already waits for all fences over all planes, I think the call
should be put somewhere in amdgpu_dm_atomic_commit_tail() instead. In
helpers it's at the top before we start doing anything, but I guess you
can also put it right before the plane commit loop.

While reviewing I also noticed that the legacy kms path's various
mode_set_base implementations don't wait for fences after calling
amdgpu_bo_pin(), e.g. in dce_v10_0_crtc_do_set_base(). The page flip path
is already updated, but might be good to fix this one here too. That stuff
is a bit copypasta gallore (atomic is a lot nicer) but not too tricky to
fix. Maybe separate patch.

With the wait_for_fences call moved:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-Daniel


> +	if (unlikely(r))
> +		DRM_ERROR("Waiting for fences timed out!");
> +
>  	/*
>  	 * Disable the cursor first if we're disabling all the planes.
>  	 * It'll remain on the screen after the planes are re-enabled
> @@ -9235,18 +9244,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		}
>  
>  		abo = gem_to_amdgpu_bo(fb->obj[0]);
> -
> -		/*
> -		 * Wait for all fences on this FB. Do limited wait to avoid
> -		 * deadlock during GPU reset when this fence will not signal
> -		 * but we hold reservation lock for the BO.
> -		 */
> -		r = dma_resv_wait_timeout(abo->tbo.base.resv,
> -					  DMA_RESV_USAGE_WRITE, false,
> -					  msecs_to_jiffies(5000));
> -		if (unlikely(r <= 0))
> -			DRM_ERROR("Waiting for fences timed out!");
> -
>  		fill_dc_plane_info_and_addr(
>  			dm->adev, new_plane_state,
>  			afb->tiling_flags,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
