Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8538B43E
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEE26F4A3;
	Thu, 20 May 2021 16:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527D46F4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 16:29:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q5so18305845wrs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gQAHjRkLz/zMdR9mZ20XGXZokHUiVVILLkWbVKY8vk=;
 b=cfxPfL5fE4np3aef6bq9mbEbsf+V7xoFH7lEgZwO4Pdk/oIevk19Q3UyCSV9vCBR57
 oqDSJZrYGS54dgw1cyxBLzrZ9nUvG4J7evXugn3/Hrkt2MbKDwd4terqRk3pzf997Vak
 U6KAj9L1Il+SoamKwZJ4AlfDNCbUAwVjuKR+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=7gQAHjRkLz/zMdR9mZ20XGXZokHUiVVILLkWbVKY8vk=;
 b=LHNifLopRj0nal/yaO2J93L4u5gNdz/KbvbH0OoQkTMZDXFzKV9Pwro/N+Ociy63Fi
 wpQYMnBIq0e4xIEmm/HsDYypyCUqmDvw65+waT98hGY/fQwHZYkyiGbHxzfFGZR/Svly
 jF0AZbo17yLTgS2wW+/bmVQ3bNiYLNWliZnTjbl5KLNmmf6WuwFwgK5UoRsBix5FEXh4
 5CF2H+RQI26cpMG37z8frZUKwYGqT5WDagiIwmGUAMcsOWtLVje9F2kv40yr8OI+MTZ3
 7P9l8BKxQ74VFpXPz4OQFGDz11u7DsrLTGB3HrlwJhp7j6V3+Q0v8CmmgGjHrwO0WUOm
 2yQg==
X-Gm-Message-State: AOAM53024zNJXCUxdIbO5S8qZ4g+PeHXCksZbL8d0+JZ5sVonVc4idOl
 OCVqmow4U+lRd0qHHfkVNygoLg==
X-Google-Smtp-Source: ABdhPJx7W+fNXWLlfVnpy0Ca20BF42f6arhZCvq55cuTsYgbnk9UslMHeFLkM6bUwg6sp/BGFgOCqQ==
X-Received: by 2002:a5d:6683:: with SMTP id l3mr5097252wru.398.1621528165809; 
 Thu, 20 May 2021 09:29:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g4sm3156003wmk.45.2021.05.20.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 09:29:25 -0700 (PDT)
Date: Thu, 20 May 2021 18:29:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC 2/3] drm/atomic: Call dma_fence_boost() when we've missed a
 vblank
Message-ID: <YKaOY3AWgHh5kplS@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519183855.1523927-3-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 560aaecba31b..fe10fc2e7f86 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  	int i, ret;
>  
>  	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> +		u64 vblank_count;
> +
>  		if (!new_plane_state->fence)
>  			continue;
>  
>  		WARN_ON(!new_plane_state->fb);
>  
> +		vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> +
>  		/*
>  		 * If waiting for fences pre-swap (ie: nonblock), userspace can
>  		 * still interrupt the operation. Instead of blocking until the
> @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  		if (ret)
>  			return ret;
>  
> +		/*
> +		 * Check if we've missed a vblank while waiting, and if we have
> +		 * signal the fence that it's signaler should be boosted
> +		 */
> +		if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> +			dma_fence_boost(new_plane_state->fence);

I think we should do a lot better here:
- maybe only bother doing this for single-crtc updates, and only if
  modeset isn't set. No one else cares about latency.

- We should boost _right_ when we've missed the frame, so I think we
  should have a _timeout wait here that guesstimates when the vblank is
  over (might need to throw in a vblank wait if we missed) and then boost
  immediately. Not wait a bunch of frames (worst case) until we finally
  decide to boost.

Otherwise I really like this, I think it's about the only real reason i915
isn't using atomic helpers.

Also adding Matt B for this topic.
-Daniel

> +
>  		dma_fence_put(new_plane_state->fence);
>  		new_plane_state->fence = NULL;
>  	}
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
