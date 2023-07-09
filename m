Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A34574C7EB
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 21:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C310E156;
	Sun,  9 Jul 2023 19:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978A10E130
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 19:52:08 +0000 (UTC)
Received: from [192.168.2.68] (109-252-154-2.dynamic.spd-mgts.ru
 [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D8F86606F26;
 Sun,  9 Jul 2023 20:52:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688932326;
 bh=x8/MyDpd7eTcDfQL4aJHM87C+0E/jhOnVG51c+yLXQI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=kIRYC3qIDCS1RLgHKy5b62eYB3jwGNHzioerPf+n39xbKrEWLFSjdkN66vAVL4ESm
 XZtvy2JLfKN5nb7RI5h9C09jh4jwiDC5LA6RXKTazvUZw2G2ztE66o7s8elyEofr0i
 sqiBFj8wNbqClT6J8BJiJ09fz25J9mpOQBsGI9QxE0Sja6kv7PtadgaREoAzeb9o1x
 Iy9bdh8o9yGiKniAQJjzqZlLhKMQEhwenKkLNZebxFYcuLhuu+mD85PgWIStL0aZi/
 XNQYSKZUlNM8u4D5t3ni4tiYE3UhU098mjEj9Wa79jg7L4kT8TQ7RNGAAmeM4vTzFh
 fXMp8OEd1Sa7Q==
Message-ID: <1f6b3dd8-b12b-ab36-69a9-4eac75c6e081@collabora.com>
Date: Sun, 9 Jul 2023 22:52:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v4] drm/virtio: conditionally allocate virtio_gpu_fence
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <2cc27163-c8d2-45bc-abd7-26ea567c4aea@collabora.com>
 <20230707213124.494-1-gurchetansingh@chromium.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230707213124.494-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/8/23 00:31, Gurchetan Singh wrote:
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
> In addition, VIRTGPU_EXECBUF_RING_IDX is checked when creating a
> DRM event object.  VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is
> already defined in terms of per-context rings.  It was theoretically
> possible to create a DRM event on the global timeline (ring_idx == 0),
> if the context enabled DRM event polling.  However, that wouldn't
> work and userspace (Sommelier).  Explicitly disallow it for
> clarity.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  v2: Fix indent (Dmitry)
>  v3: Refactor drm fence event checks to avoid possible NULL deref (Dmitry)
>  v4: More detailed commit message about addition drm fence event checks (Dmitry)
> 
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 28 +++++++++++++------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
> index cf3c04b16a7a..004364cf86d7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -64,13 +64,9 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>  					 struct virtio_gpu_fence *fence,
>  					 u32 ring_idx)
>  {
> -	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>  	struct virtio_gpu_fence_event *e = NULL;
>  	int ret;
>  
> -	if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
> -		return 0;
> -
>  	e = kzalloc(sizeof(*e), GFP_KERNEL);
>  	if (!e)
>  		return -ENOMEM;
> @@ -161,21 +157,27 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>  				  struct drm_file *file,
>  				  u64 fence_ctx, u32 ring_idx)
>  {
> +	int err;
> +	struct virtio_gpu_fence *out_fence;
>  	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
> -	struct virtio_gpu_fence *out_fence;
> -	int err;
> +	bool drm_fence_event = (exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
> +			       (vfpriv->ring_idx_mask & BIT_ULL(ring_idx));

The common coding style for variables definition in kernel is a "reverse
xmas tree". It makes code easier to read.

*********
******
***

I'll change the style while applying to:

	if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
	    (vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
		drm_fence_event = true;
	else
		drm_fence_event = false;

>  	memset(submit, 0, sizeof(*submit));
>  
> -	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> -	if (!out_fence)
> -		return -ENOMEM;
> +	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) || drm_fence_event ||
> +	     exbuf->num_bo_handles)
> +		out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> +	else
> +		out_fence = NULL;
>  
> -	err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> -	if (err) {
> -		dma_fence_put(&out_fence->f);
> -		return err;
> +	if (drm_fence_event) {
> +		err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> +		if (err) {
> +			dma_fence_put(&out_fence->f);
> +			return err;
> +		}
>  	}
>  
>  	submit->out_fence = out_fence;

Another small note for the future is that you should always start a new
email thread for every new version of the patch, i.e. don't reply with
new version to the old thread. This is not a problem here since it's
just a single patch, nevertheless please take it into account later on.
It eases patch tracking for reviewers.

I tested v4, including the applied CL4605854 to Sommilier. Everything
works well as before. Thank you for addressing all the issues.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

