Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1238A741D8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 01:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823E10E192;
	Fri, 28 Mar 2025 00:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DtxW+hk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BA810E19F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 00:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743122927; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IzZR/6eV3eRANWwtaDsVX/tXgsystpLRs4MCOJQyyFvwjM8t4p1XelmrqOJEbuc0Bt+fbmHaeE3tOre1KtzUOsEK8itnIDNuh7g8IEjms5/nuJvB4KUs1kpy/T1IIq7EDjNE3xdz9OpmRQtJY1IWZHkLeE61bOOS8rpmem4wK0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743122927;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y4jDLIxxgTPU6S6kjP6W2qy0YbeeCk7wPRc5Aobjd8M=; 
 b=Nmte/jjj7G01iR2nwqUhdLMHRg+n7VG7CdERbuYd7ANJ9k0UZEu4UQkeGyagX3eRqZDAuHz68CaoyCklRKpot31/s0RfCAz4clsFJOnwQ55xaloi4vk0p7DNxGx2JUcQ6F/D07INAwgkhQT48mM6ybk4+1Hc5vaDvgIeR5kx4so=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743122927; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=y4jDLIxxgTPU6S6kjP6W2qy0YbeeCk7wPRc5Aobjd8M=;
 b=DtxW+hk0x+nE/5ZN/O4jFoR06MHA4xywBRKT++cphAAK0IL8yZXUakntasdEI4Jg
 JGZc3Kw+3j2ng4V1AyKeeJSive2GpXY7ZY4yVMilLaiC9n+hbUfg15rtQRkEh86Zi9a
 s1HNnPjN84Gn0FKEvYHhPlH9wwFBrEXOIjtSKZB0=
Received: by mx.zohomail.com with SMTPS id 174312292550316.712910908575054;
 Thu, 27 Mar 2025 17:48:45 -0700 (PDT)
Message-ID: <f438c1ae-add1-4ff1-b9f3-6996fc441cd9@collabora.com>
Date: Fri, 28 Mar 2025 03:48:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline
 syncobjs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250327213632.7903-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250327213632.7903-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 3/28/25 00:36, Rob Clark wrote:
...
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
> -					      int fd, int handle)
> +					      int fd, int handle, u64 point)
>  {
>  	struct dma_fence *fence = sync_file_get_fence(fd);
>  	struct drm_syncobj *syncobj;
> @@ -755,14 +755,18 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>  		return -ENOENT;
>  	}
>  
> -	drm_syncobj_replace_fence(syncobj, fence);
> +	if (point) {
> +		drm_syncobj_add_point(syncobj, dma_fence_chain_alloc(), fence, point);

Nit: check dma_fence_chain_alloc() for ENOMEM

> +	} else {
> +		drm_syncobj_replace_fence(syncobj, fence);
> +	}

Nit: checkpath should complain about the unnecessary braces

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
> @@ -772,7 +776,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>  	if (fd < 0)
>  		return fd;
>  
> -	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
> +	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>  	if (ret)
>  		goto err_put_fd;
>  
> @@ -869,6 +873,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  				   struct drm_file *file_private)
>  {
>  	struct drm_syncobj_handle *args = data;
> +	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
> +			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
> +	u64 point = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>  		return -EOPNOTSUPP;
> @@ -876,13 +883,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
> +	if (args->flags != 0 && (args->flags & ~valid_flags))
>  		return -EINVAL;

Nit: args->flags!=0 not needed as (0 & ~valid_flags) is always false,
same for import

...


-- 
Best regards,
Dmitry
