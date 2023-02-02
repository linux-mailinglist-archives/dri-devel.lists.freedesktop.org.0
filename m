Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65F687353
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 03:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED56010E2D0;
	Thu,  2 Feb 2023 02:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5027610E2D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 02:25:02 +0000 (UTC)
Received: from [192.168.2.198] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 177C76602EDA;
 Thu,  2 Feb 2023 02:25:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675304701;
 bh=oTyILudNkiAPMkgb1Pm09advI5woCz1l2SmEwaMEO4A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WFG3vDMC2J7SqYCRgoSohRBkQpNrmBTfsL86EAgtfMSqMSD5njimmBBd6suozlfWk
 H7W5DaRuIi8lkwkGjCawD1IftrlFLh2e2/aAQN8O3p/BF6UIW5yHWahO/GzjYKqnx6
 NuwszdsieIDxsBPALFhedTzMNJEJnwX6Hbe5b/UKpe/1Yc8ZBvl0bnrd9VmaX2RAaz
 IEkXtmVC0gELnmOEIyGPi0t2qQ23HOfDgNqnTXYosK1w567XbIqYPx+cY2f2WRY3P8
 MbpZ+OGkQUuqTvxhLJMhIKFpCC1KM6xIe5g+q1yzUAf0DgtmhaHjiGeuHbLiSqRreq
 Thp3pCeP4x/UA==
Message-ID: <39be7689-a8fa-d985-efeb-29b5f91a4b50@collabora.com>
Date: Thu, 2 Feb 2023 05:24:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
Content-Language: en-US
To: Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20230126225815.1518839-1-ryanneph@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230126225815.1518839-1-ryanneph@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Yiwei Zhang <zzyiwei@chromium.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/27/23 01:58, Ryan Neph wrote:
> An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
> to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
> retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
> making the retry attempt fail at sync_file_get_fence().
> 
> The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
> passed value for exbuf->fence_fd when returning ERESTARTSYS or EINTR.
> 
> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
> Signed-off-by: Ryan Neph <ryanneph@chromium.org>
> ---
> 
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 ++++++---
>  include/uapi/drm/virtgpu_drm.h         | 3 +++
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 9f4a90493aea..ffce4e2a409a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -132,6 +132,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  	uint64_t fence_ctx;
>  	uint32_t ring_idx;
>  
> +	exbuf->fence_fd = -1;
> +
>  	fence_ctx = vgdev->fence_drv.context;
>  	ring_idx = 0;
>  
> @@ -152,8 +154,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  		ring_idx = exbuf->ring_idx;
>  	}
>  
> -	exbuf->fence_fd = -1;
> -
>  	virtio_gpu_create_context(dev, file);
>  	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
>  		struct dma_fence *in_fence;
> @@ -173,7 +173,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  
>  		dma_fence_put(in_fence);
>  		if (ret)
> -			return ret;
> +			goto out_err;
>  	}
>  
>  	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
> @@ -259,6 +259,9 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  
>  	if (out_fence_fd >= 0)
>  		put_unused_fd(out_fence_fd);
> +out_err:
> +	if (ret == -EINTR || ret == -ERESTARTSYS)
> +		exbuf->fence_fd = in_fence_fd;
>  
>  	return ret;
>  }
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index 0512fde5e697..ac8d1eed12ab 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -64,6 +64,9 @@ struct drm_virtgpu_map {
>  	__u32 pad;
>  };
>  
> +/* For ioctl() returning ERESTARTSYS or EINTR, fence_fd is unmodified.
> + * For all other errors it is set to -1.
> + */
>  struct drm_virtgpu_execbuffer {
>  	__u32 flags;
>  	__u32 size;

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

