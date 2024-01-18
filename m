Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD2831B1D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 15:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA2010E7F9;
	Thu, 18 Jan 2024 14:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708E910E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 14:11:29 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-55760f84177so2640803a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705587028; x=1706191828; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3NFEQEBBilbOrcT3SFqvGDczpXnomZiPCgLX8doR8I=;
 b=JSg48SxdAW5TuoSmi+tiNFaI1dFE60Uj9h3gcPj+F/QpA6GEHTn0SLdXu8iWiQm+SR
 G/fAE4K2BQu0m1M7bQtkeXxypZNrpcIt6vTSprwq3iXqmLw3EHoFsq2DTGgVIOtNDjh6
 GZzWr2yU5+nyWsmTzkArhf2moUsqCpDWOw68s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705587028; x=1706191828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3NFEQEBBilbOrcT3SFqvGDczpXnomZiPCgLX8doR8I=;
 b=PHh2ogOwsJI/v56SxeVb89DJIEk3Ya6qB0hEPMpRX8FEFdVT1orFPCvnyOaxdIcVsK
 I4yl7PN3oeRwZWa+cUWGgtEl2vr7dUiRz0J1UPS6BDjAvn68JBF3fOcNEXzJnSMtyH+I
 yqbFTb13cBQyd1DXk786wg51lrW+SFpt9Er5zwj0ff92UbFj8ZNk7wiC2uAOgpPHb0bl
 Ni+ozvy0EqPwbh48mOrX9OuhpXvFgnwKaWXOViGosOS69qkYBAYgBpm68NVS0eKT2Ccq
 cop6ZP2dsHQ7T/6o9x89ek68CRk1t07IiuCiKBgYOzUQUHsD9AoggsR6F5IP6DxbCuXj
 /K/w==
X-Gm-Message-State: AOJu0YztDCPjc8keV4kt7COjpZfM4DW0hOy0tjBemUxQxIpM622Hfkrd
 sZC078sOpjXgvrMEw1vrT9hUOOtdw3Dvg4E6K7W2aTJOrVinJA7wK/fz2fUURMg=
X-Google-Smtp-Source: AGHT+IE0Cbq7skuNTxZIGKr1uY2XqUF8exVVtgtDyXeZeUc7M2k1xhybFY6U8EjnB8nPJaWAig6q/A==
X-Received: by 2002:aa7:c1c5:0:b0:559:b9be:d822 with SMTP id
 d5-20020aa7c1c5000000b00559b9bed822mr1336476edp.0.1705587027947; 
 Thu, 18 Jan 2024 06:10:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c40-20020a509fab000000b00559e3693226sm2041622edf.36.2024.01.18.06.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 06:10:27 -0800 (PST)
Date: Thu, 18 Jan 2024 15:10:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: Re: [PATCH] drm/syncobj: call drm_syncobj_fence_add_wait when,
 WAIT_AVAILABLE flag is set
Message-ID: <ZakxUZWAD_OMKTEG@phenom.ffwll.local>
References: <1e3fc8e3-f1bb-44f4-a205-a56684459b3b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e3fc8e3-f1bb-44f4-a205-a56684459b3b@nvidia.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Kyle Brenneman <kbrenneman@nvidia.com>, david1.zhou@amd.com,
 Austin Shafer <ashafer@nvidia.com>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 02:19:00PM -0800, Erik Kurzinger wrote:
> When waiting for a syncobj timeline point whose fence has not yet been
> submitted with the WAIT_FOR_SUBMIT flag, a callback is registered using
> drm_syncobj_fence_add_wait and the thread is put to sleep until the
> timeout expires. If the fence is submitted before then,
> drm_syncobj_add_point will wake up the sleeping thread immediately which
> will proceed to wait for the fence to be signaled.
> 
> However, if the WAIT_AVAILABLE flag is used instead,
> drm_syncobj_fence_add_wait won't get called, meaning the waiting thread
> will always sleep for the full timeout duration, even if the fence gets
> submitted earlier. If it turns out that the fence *has* been submitted
> by the time it eventually wakes up, it will still indicate to userspace
> that the wait completed successfully (it won't return -ETIME), but it
> will have taken much longer than it should have.
> 
> To fix this, we must call drm_syncobj_fence_add_wait if *either* the
> WAIT_FOR_SUBMIT flag or the WAIT_AVAILABLE flag is set. The only
> difference being that with WAIT_FOR_SUBMIT we will also wait for the
> fence to be signaled after it has been submitted while with
> WAIT_AVAILABLE we will return immediately.
> 
> IGT test patch: https://lists.freedesktop.org/archives/igt-dev/2024-January/067282.html
> 
> Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index a8e6b61a188c..a1443c673f30 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1121,7 +1121,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>  	 * fallthough and try a 0 timeout wait!
>  	 */
>  
> -	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
> +	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |

You also need to adjust the condition earlier in the function that guards
the lockdep_assert_none call.

I also noticed that unliked drm_syncobj_find_fence() we don't have the
might_sleep check in there, would be good to add that (in an additional
patch).

Also I think it'd be good to reject the
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag in drm_syncobj_find_fence()
since that's a clear misuses of that. Found that since I checked whether
there's more conditions that should be patched.

Cheers, Sima
> +		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
>  		for (i = 0; i < count; ++i)
>  			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
>  	}
> -- 
> 2.43.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
