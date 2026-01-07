Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F9CFD505
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 12:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011E310E58E;
	Wed,  7 Jan 2026 11:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lNx4C+h6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD4810E58E;
 Wed,  7 Jan 2026 11:03:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E80DA1A26DD;
 Wed,  7 Jan 2026 11:03:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA5EA606F8;
 Wed,  7 Jan 2026 11:03:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 55E84103C86EC; Wed,  7 Jan 2026 12:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767783810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+i6jlMelvRxjO0pYFfuPPHQHln/TM3B0kSSKLuGvWNs=;
 b=lNx4C+h6GNtEY43W/Pvarzw4DIFwmP8vhDGBW5RwZh9lZHHTP2Tg/GqIeDhbzjgYc5sDqB
 R0TaC3O62Kwq2LNQ1ai9eIUBd6hbyQz5EIs/zxfapmiTfXcpsQD6HGwjsvCf40Pb7MmGxY
 15lLZ0treehtFrQDQsmccsUMaQ4OSrI2w3pnXOTtlEzcgCUH0WQw5Zi8Reot+7x8GHw7Tc
 WaqfGIA2Pwknj70PbjWRofMMycfZdfGW+3GKcXQ5Elj3pNVHDDS3vCsXfDvAX86ZT6yMKB
 GwhvoGmKgwWp08rORevMVgZzhMSfBtAJxi+1njUxz4aed+WX0tFPliDvPwgpsg==
Message-ID: <52a1c55b-43fe-46b6-9846-21de0f263542@bootlin.com>
Date: Wed, 7 Jan 2026 12:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
 harry.wentland@amd.com, uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-3-d51d9a351684@intel.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20260106-atomic-v7-3-d51d9a351684@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 1/6/26 05:37, Arun R Murthy wrote:
> Move atomic_state allocation to the beginning of the atomic_ioctl
> to accommodate drm_mode_atomic_err_code usage for returning error
> code on failures.
> As atomic state is required for drm_mode_atomic_err_code to store the
> error codes.
> 
> v7: Reframe commit message (Suraj)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 7320db4b8489f10e24ed772094c77e2172951633..02029b5d7832eeaf4a225096a94947344083fc0b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1553,13 +1553,21 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	struct drm_modeset_acquire_ctx ctx;
>   	struct drm_out_fence_state *fence_state;
>   	int ret = 0;
> -	unsigned int i, j, num_fences;
> +	unsigned int i, j, num_fences = 0;
>   	bool async_flip = false;
>   
>   	/* disallow for drivers not supporting atomic: */
>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>   		return -EOPNOTSUPP;
>   
> +	state = drm_atomic_state_alloc(dev);
> +	if (!state)
> +		return -ENOMEM;

It seems strange to add num_fences = 0 at the top and then don't use it 
before the num_fences = 0. Did you forgot to replace return -ENOMEM by 
goto out?

> +
> +	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> +	state->acquire_ctx = &ctx;
> +	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
> +
>   	/* disallow for userspace that has not enabled atomic cap (even
>   	 * though this may be a bit overkill, since legacy userspace
>   	 * wouldn't know how to call this ioctl)
> @@ -1598,13 +1606,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   		return -EINVAL;
>   	}
>   
> -	state = drm_atomic_state_alloc(dev);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> -	state->acquire_ctx = &ctx;
> -	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>   	state->plane_color_pipeline = file_priv->plane_color_pipeline;
>   
>   retry:
> @@ -1703,7 +1704,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	}
>   
>   out:
> -	complete_signaling(dev, state, fence_state, num_fences, !ret);
> +	if (num_fences)
> +		complete_signaling(dev, state, fence_state, num_fences, !ret);

Hello Arun,

I am not familiar with this part of DRM, but this num_fences change 
seems strange and unrelated to this patch.

If this is intentional, I think this change the previous behavior:

	num_fences = 0;
	for (...) {
		if (ret)
			goto out;
	}
	ret = prepare_signaling(dev, state, arg, file_priv,
				fence_state, &num_fences);
	out:
	complete_signaling(dev, state, fence_state, num_fences, !ret);

Without your change:

=> no error -> prepare_signaling/complete_signaling are called with 
num_fences=0
=> error in prepare_signaling -> complete_signaling is called in all cases
=> error in loop = complete_signaling without prepare_signaling (very 
strange, is it your fix?)

With your change:

=> no error -> same
=> error in prepare_signaling -> depends on prepare_signaling, only if 
num_fences!=0 (a bit strange, but maybe expected)
=> error in loop -> don't call complete_signaling

I don't know if the previous behavior is broken, but if this change is 
needed, maybe you can extract it in a different patch?

Thanks,
Louis Chauvet


>   	if (ret == -EDEADLK) {
>   		drm_atomic_state_clear(state);
> 

