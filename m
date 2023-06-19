Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD9735FBB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 00:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3004A10E14A;
	Mon, 19 Jun 2023 22:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AAF10E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 22:02:16 +0000 (UTC)
Received: from [192.168.2.27] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B14FD6606F13;
 Mon, 19 Jun 2023 23:02:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687212134;
 bh=VqgwC2/HHb7TpiQzPWPBdbgB21OghZlAD854YZEpGnQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OZS3+I9URPwQhBYUDS7YqM+kavx6qyTIifgsv8FdARbXN9IqGPrW2h+SWRtpkTqOi
 geNdONOtCHw7lnfjWpTZ1Y5LrA0Bii6bSCjYD302OXIM2qidrRdw3qTPdZqmKcGA0G
 7udz+5iXK2uh8oXjv6zSF8xrQ2hMc8lLQFO3AeZs70jf5EsehuWnLVf0yeSA4p8Mfk
 HZMQAz5W+5BI+PhPINKYIV3FObnxeZW1ocuWXNwY/JvWXCPOrxP+vTG02NAVkX7m+u
 Tp1LpDrJ9TDxKOzH9GkmZ0+Oyr14vAIm2F1dFxp7M5ymmTdeJxP+ey1J+vPUAIpUHn
 a/0357HTR5/mg==
Message-ID: <e4c1ad5b-bee0-cdd7-a85a-2229a8e32eb4@collabora.com>
Date: Tue, 20 Jun 2023 01:02:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH] drm/virtio: conditionally allocate virtio_gpu_fence
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20230613174306.1208-1-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230613174306.1208-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, acourbot@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/23 20:43, Gurchetan Singh wrote:
> We don't want to create a fence for every command submission.  It's
> only necessary when userspace provides a waitable token for submission.
> This could be:
> 
> 1) bo_handles, to be used with VIRTGPU_WAIT
> 2) out_fence_fd, to be used with dma_fence apis
> 3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
>    + DRM event API
> 4) syncobjs in the future
> 
> The use case for just submitting a command to the host, and expecting
> no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
> just wakes up the host side worker threads.  There's also
> CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.
> 
> This prevents the need to signal the automatically created
> virtio_gpu_fence.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
> index cf3c04b16a7a..add106c06ab2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>  
>  	memset(submit, 0, sizeof(*submit));
>  
> -	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> -	if (!out_fence)
> -		return -ENOMEM;
> +	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
> +		((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
> +		(vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
> +		exbuf->num_bo_handles)
> +		out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> +	else
> +		out_fence = NULL;
>  
>  	err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
>  	if (err) {

Looks okay, code indentation may be improved a tad to make it more eye-friendly:

+	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
+	   ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) && (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
+	     exbuf->num_bo_handles)
+		out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
+	else
+		out_fence = NULL;

Checkpatch will complain about this variant, but the complaint can be ignored in this case.

-- 
Best regards,
Dmitry

