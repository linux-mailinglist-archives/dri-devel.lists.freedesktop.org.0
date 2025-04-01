Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0FA77969
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 13:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB64C10E2C7;
	Tue,  1 Apr 2025 11:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fcp9aIKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EB210E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 11:18:33 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39c14016868so2090548f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743506312; x=1744111112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MHjLXZJ1cnpvspCUUy5TO+Zanl0UIrIyQt6fEAo5S/E=;
 b=fcp9aIKhR44yVMEXElNw4ciI8+u0J91Ykq3nzlwzduedd73x5yBp4X0QSaG1cweyCo
 h4iVyet21KqucrWww+y2egt/OFGqnsnhdH1XvoZsIKavt9nIbarJnITph6acg40o0MRs
 fFn0698axGXKjOT5So8C8CPXGX9RPnQdybFZ7RBvnLbk12uZTV9yT+9vNKkdAv27/xwt
 AV1AIe5LqWN1pHbkEPoC1xFDqgAuBpbE5YUFsvMhWgl60twaosqFqvzzKX9t8eV5RMli
 MZoapydHhUwe1Pf9ETNa2jDTFZhn9Q7cVzIX+s8JHQAeM5w82bLy2agMtxymHml+nvi6
 7S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743506312; x=1744111112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MHjLXZJ1cnpvspCUUy5TO+Zanl0UIrIyQt6fEAo5S/E=;
 b=C0zqs0haI6V9cjB8B6LeGDp1oKr/5dlnXt/nHhC5skmNYKKh4HqSG7rMUiVG/q1HV7
 kyfc1010yB4Xrz963xfSQnR6VAihuQK+18b//8u9AVbN9pcIQjlEswc7xTzEcXqhY/Zu
 d3wwLN+ywukfOOyGbyxp/lSn/sSUzZ6tDmDjdvUDi+aGhLsAwdIT8s7DNpWpszVSjMZ3
 pZEQr3WqY4TZCXeCK0R6IOpRrdLX4AxMdkjJTboOEZ5RHYbjrC9dKK9fkkPTQopZuOOM
 xMilSAaktqvlCqkTiQmpzzN7HgMK0q+5rJ5E4bEFM7qNBXzZUvDfqi/oY6FKeqLoPkwq
 8zBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKYNfAlIIew/9EXLs0h4Jg6hyQKpteKn7ihrz23KaoDelwc2OU8/kIDneqTwljQJJrbZyslbZLwDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr1P94JnVJM9C0W14GJPAtRTFNXW5ifA+FJfhWfxTEeTYGZDkX
 kQO5ZS5UpuZwvCxSeqshg3a6+Fu05ucGvt4mIvQN9q59oxjTAvrf
X-Gm-Gg: ASbGncuRbyII5HhIEznLAqGN/c/Rryc7zlA64+lLzDPwFnr0q/bB0aWTvsjVtnMGRYH
 HyZb76XOsrpQxm+Xj4adR0BxAa9JBAMe3V9r7S66/kkaEvPgIWpA4ZBx6H2uI+D/6Hsax7PRbsY
 szNlziQhzIOz1k4sUipIYPeGlEH81BZC8MDwQGXwzC+WhFPyYtrFMS//EdDwPNkSnQprrqZZYaN
 R4/3djoIpbE48NHtqRIzTJ0kH4f1Z61yMiwBERgqfhBwj1j2CrKK9NGKWaekpQQZETBPpxaHC2V
 Ejckzi2p9t0kd+D/qXghbfeGC3EVO14ZtUMuXmjHBUK9cvyIwug4Rh2F6MwYPIxJr1GPRqlA3A=
 =
X-Google-Smtp-Source: AGHT+IHL7hdDkklKqbVxncDc8exnu0HuxmsEO5AkQ0x0L0l35X0qyjhrepIfjwYO28fP7NDX2ub+LQ==
X-Received: by 2002:a5d:6daf:0:b0:391:4914:3c6a with SMTP id
 ffacd0b85a97d-39c120e34b1mr7985118f8f.29.1743506311481; 
 Tue, 01 Apr 2025 04:18:31 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b663470sm13778422f8f.27.2025.04.01.04.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 04:18:31 -0700 (PDT)
Message-ID: <593b5915-7148-446a-a240-7f7939025a5f@gmail.com>
Date: Tue, 1 Apr 2025 13:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE
 for timeline syncobjs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linaro-mm-sig@lists.linaro.org>
References: <20250331212333.16029-1-robdclark@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250331212333.16029-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Am 31.03.25 um 23:23 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add support for exporting a dma_fence fd for a specific point on a
> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> syncobj support, as it needs a way to turn a point on a timeline back
> into a dma_fence fd.  It also closes an odd omission from the syncobj
> UAPI.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805
>
> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> v3: Add unstaged uabi header hunk
> v4: Also handle IMPORT_SYNC_FILE case
> v5: Address comments from Dmitry
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
>  include/uapi/drm/drm.h        |  4 ++++
>  2 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 4f2ab8a7b50f..b0a4c58fe726 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>  }
>  
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
> -					      int fd, int handle)
> +					      int fd, int handle, u64 point)
>  {
>  	struct dma_fence *fence = sync_file_get_fence(fd);
>  	struct drm_syncobj *syncobj;
> @@ -755,14 +755,22 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>  		return -ENOENT;
>  	}
>  
> -	drm_syncobj_replace_fence(syncobj, fence);
> +	if (point) {
> +		struct dma_fence_chain *chain = dma_fence_chain_alloc();
> +		if (!chain)
> +			return -ENOMEM;
> +		drm_syncobj_add_point(syncobj, chain, fence, point);

Just a nit pick but checkpatch.pl will complain about it: Empty line between declaration and code please.

Maybe double check if checpatch.pl is otherwise happy with the patch.

With that done feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

Let me know if I should push it to drm-misc-next.

Regards,
Christian.

> +	} else {
> +		drm_syncobj_replace_fence(syncobj, fence);
> +	}
> +
>  	dma_fence_put(fence);
>  	drm_syncobj_put(syncobj);
>  	return 0;
>  }
>  
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -					int handle, int *p_fd)
> +					int handle, u64 point, int *p_fd)
>  {
>  	int ret;
>  	struct dma_fence *fence;
> @@ -772,7 +780,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>  	if (fd < 0)
>  		return fd;
>  
> -	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
> +	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>  	if (ret)
>  		goto err_put_fd;
>  
> @@ -869,6 +877,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  				   struct drm_file *file_private)
>  {
>  	struct drm_syncobj_handle *args = data;
> +	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
> +			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
> +	u64 point = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>  		return -EOPNOTSUPP;
> @@ -876,13 +887,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
> +	if (args->flags & ~valid_flags)
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> +		point = args->point;
> +
>  	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>  		return drm_syncobj_export_sync_file(file_private, args->handle,
> -						    &args->fd);
> +						    point, &args->fd);
> +
> +	if (args->point)
> +		return -EINVAL;
>  
>  	return drm_syncobj_handle_to_fd(file_private, args->handle,
>  					&args->fd);
> @@ -893,6 +909,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  				   struct drm_file *file_private)
>  {
>  	struct drm_syncobj_handle *args = data;
> +	unsigned valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
> +			       DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
> +	u64 point = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>  		return -EOPNOTSUPP;
> @@ -900,14 +919,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
> +	if (args->flags & ~valid_flags)
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> +		point = args->point;
> +
>  	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
>  		return drm_syncobj_import_sync_file_fence(file_private,
>  							  args->fd,
> -							  args->handle);
> +							  args->handle,
> +							  point);
> +
> +	if (args->point)
> +		return -EINVAL;
>  
>  	return drm_syncobj_fd_to_handle(file_private, args->fd,
>  					&args->handle);
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..e63a71d3c607 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
>  };
>  
>  #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
>  #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
>  struct drm_syncobj_handle {
>  	__u32 handle;
>  	__u32 flags;
>  
>  	__s32 fd;
>  	__u32 pad;
> +
> +	__u64 point;
>  };
>  
>  struct drm_syncobj_transfer {

