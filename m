Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB86D0CB5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 19:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8C10EF3A;
	Thu, 30 Mar 2023 17:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355C10EF3A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:24:55 +0000 (UTC)
Received: from arch-x395 (unknown [IPv6:2a00:5f00:102:0:38b0:2479:c2d8:9a86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: evelikov)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BA6496602F6A;
 Thu, 30 Mar 2023 18:24:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680197093;
 bh=V8BWybAwlz2UVgTWThMD8IWctSismFf3F23v7AiQ7Ao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q107qfRF1on+Eipk/3DuvirmZThiwpH+3IVOEAft8sbtOHUjYuANiNHY+0+5Hj+Mt
 Uejj3YHHXEWDvPML9DSMi4RqIK4+nur0Z4QGKoKbulXVPbIXqt657u3WQ2jMf7zV5S
 WrXclYSM1ed1NdoGz+BAQ1ytIh9YiyWfPAbV1YwJiaO5TcNn90xHqKYyaEvZ4x73Jw
 MROUO/U6k307BeIToBQ1n7+/Rg3JkBm6mTq7+xYbsdFOFHB3HIJwi68QHeVPInch8U
 RQA3F+kWHBvUOjx08iX6akyTQ8qG2DGe7JtmLFY0yzAoNdh+j27JSQZ0FGNrdXCRBd
 +PRQ7feG6QPmA==
Date: Thu, 30 Mar 2023 18:24:50 +0100
From: Emil Velikov <emil.velikov@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 2/2] drm/virtio: Support sync objects
Message-ID: <ZCXF4q81wPcczkqx@arch-x395>
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
 <20230323230755.1094832-3-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323230755.1094832-3-dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Have you considered creating a few DRM helpers for this functionality?

AFAICT this is the third driver which supports syncobj timelines and
looking at one of the implementations ... it is not great. Note that
this suggestion is _not_ a blocker.

On 2023/03/24, Dmitry Osipenko wrote:
> Add sync object DRM UAPI support to VirtIO-GPU driver. It's required
> for enabling a full-featured Vulkan fencing by Venus and native context
> VirtIO-GPU Mesa drivers.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

> +static int
> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
> +{
> +	struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
> +	struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
> +	size_t syncobj_stride = exbuf->syncobj_stride;
> +	struct drm_syncobj **syncobjs;
> +	int ret = 0, i;
> +
> +	if (!submit->num_in_syncobjs)
> +		return 0;
> +
> +	syncobjs = kvcalloc(submit->num_in_syncobjs, sizeof(*syncobjs),
> +			    GFP_KERNEL);

Please add an inline note about the decision behind the allocators used,
both here and in the parse_post_deps below. IIRC there was some nice
discussion between you and Rob in earlier revisions.


> +	if (!syncobjs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < submit->num_in_syncobjs; i++) {
> +		uint64_t address = exbuf->in_syncobjs + i * syncobj_stride;
> +		struct dma_fence *fence;
> +
> +		if (copy_from_user(&syncobj_desc,
> +				   u64_to_user_ptr(address),
> +				   min(syncobj_stride, sizeof(syncobj_desc)))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		if (syncobj_desc.flags & ~VIRTGPU_EXECBUF_SYNCOBJ_FLAGS) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		ret = drm_syncobj_find_fence(submit->file, syncobj_desc.handle,
> +					     syncobj_desc.point, 0, &fence);
> +		if (ret)
> +			break;
> +

> +		ret = virtio_gpu_dma_fence_wait(submit, fence);
> +
> +		dma_fence_put(fence);
> +		if (ret)
> +			break;

If going the DRM helpers route:

The above two are effectively the only variance across vendors - a
simple function point as arg should suffice. Might want to use internal
flags, but that's also trivial.

> +	submit->in_syncobjs = syncobjs;
> +
> +	return ret;
> +}
> +
> +static void virtio_gpu_reset_syncobjs(struct drm_syncobj **syncobjs,
> +				      uint32_t nr_syncobjs)
> +{
> +	uint32_t i;
> +
> +	for (i = 0; i < nr_syncobjs; i++) {
> +		if (syncobjs[i])
> +			drm_syncobj_replace_fence(syncobjs[i], NULL);

Side note: the drm_syncobj_put() called immediately after also calls
replace/reset fence internally. Although reading from the docs, I'm not
sure if relying on that is a wise move.

Just thought I'd point it out.


>  
> +	ret = virtio_gpu_parse_deps(&submit);
> +	if (ret)
> +		goto cleanup;
> +
> +	ret = virtio_gpu_parse_post_deps(&submit);
> +	if (ret)
> +		goto cleanup;
> +

I think we should zero num_(in|out)_syncobjs when the respective parse
fails. Otherwise we get one "cleanup" within the parse function itself
and a second during the cleanup_submit. Haven't looked at it too closely
but I suspect that will trigger an UAF or two.

>  	ret = virtio_gpu_install_out_fence_fd(&submit);
>  	if (ret)
>  		goto cleanup;
> @@ -294,6 +512,7 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  		goto cleanup;
>  
>  	virtio_gpu_submit(&submit);
> +	virtio_gpu_process_post_deps(&submit);

Any particular reason why the virtio_gpu_reset_syncobjs is deferred to
virtio_gpu_cleanup_submit(). Having it just above the process_post_deps
(similar to msm) allows the reader to get closure about the in syncobjs.

This is just personal preference, so don't read too much into it.

HTH
Emil
