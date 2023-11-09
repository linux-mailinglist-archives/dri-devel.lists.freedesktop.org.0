Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB087E6A61
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 13:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB82A10E202;
	Thu,  9 Nov 2023 12:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E83910E8B5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eaFndUrkhBAUm0ZPdBKTCd3mZRcFsxoLh+cRY84hWpk=; b=fqJ60DMB5UIO5M3/pzzmelhVXN
 wgMo9x0W6GlMlNiDGUaFv+kHij3g6yF1SOiaMLQ4CiZ/YakfFMJEEaNpWq4HJEPW09xAeEDhTEgb4
 asIBlpCtrZ7lgS3krMkuewbd5rihJ3Vuq6Hl27oZOMT6+Fkp37PC+cc6efBVFtDqCpRx0+xJoZExE
 GC3pLTxUR4MxNRaN4vds1K69YOaUq5F+uW9ljhRupHL/3M8rO02ZaE/71IgiRRf/93ehqSlVMgHw2
 xhDX7GZKnNHs1Fs2S5uIeNUqNDYVJClzzI49/JYZdy+0EZtmJ6z6WJ4ErG108tTd3Fg4UIl/tiJyI
 pXMfXhoA==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r13vg-001EEH-C7; Thu, 09 Nov 2023 13:14:36 +0100
Message-ID: <171f9c48-d080-944d-d24e-0f7cf341ea8e@igalia.com>
Date: Thu, 9 Nov 2023 09:14:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
In-Reply-To: <20231109074545.148149-2-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

Thanks for working on this feature!

On 11/9/23 04:45, Simon Ser wrote:
> User-space sometimes needs to allocate scanout-capable memory for
> GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> is achieved via DRM dumb buffers: the v3d user-space driver opens
> the primary vc4 node, allocates a DRM dumb buffer there, exports it
> as a DMA-BUF, imports it into the v3d render node, and renders to it.
> 
> However, DRM dumb buffers are only meant for CPU rendering, they are
> not intended to be used for GPU rendering. Primary nodes should only
> be used for mode-setting purposes, other programs should not attempt
> to open it. Moreover, opening the primary node is already broken on
> some setups: systemd grants permission to open primary nodes to
> physically logged in users, but this breaks when the user is not
> physically logged in (e.g. headless setup) and when the distribution
> is using a different init (e.g. Alpine Linux uses openrc).
> 
> We need an alternate way for v3d to allocate scanout-capable memory.

For me, it is a bit unclear how we import the vc4 DMA-BUF heap into v3d.
Should we create an IOCTL for it on v3d?

Also, if you need some help testing with the RPi 5, you can ping on IRC
and I can try to help by testing.

Best Regards,
- Maíra

> Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
> Preliminary testing has been done with wlroots [1].
> 
> This is still an RFC. Open questions:
> 
> - Does this approach make sense to y'all in general?
> - What would be a good name for the heap? "vc4" is maybe a bit naive and
>    not precise enough. Something with "cma"? Do we need to plan a naming
>    scheme to accomodate for multiple vc4 devices?
> - Right now root privileges are necessary to open the heap. Should we
>    allow everybody to open the heap by default (after all, user-space can
>    already allocate arbitrary amounts of GPU memory)? Should we leave it
>    up to user-space to solve this issue (via logind/seatd or a Wayland
>    protocol or something else)?
> 
> TODO:
> 
> - Need to add !vc5 support.
> - Need to the extend DMA heaps API to allow vc4 to unregister the heap
>    on unload.
> 
> [1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4414
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/vc4/Makefile       |  2 ++
>   drivers/gpu/drm/vc4/vc4_dma_heap.c | 51 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/vc4/vc4_drv.c      |  6 ++++
>   drivers/gpu/drm/vc4/vc4_drv.h      |  5 +++
>   4 files changed, 64 insertions(+)
>   create mode 100644 drivers/gpu/drm/vc4/vc4_dma_heap.c
> 
> diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
> index c41f89a15a55..e4048870cec7 100644
> --- a/drivers/gpu/drm/vc4/Makefile
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -34,4 +34,6 @@ vc4-$(CONFIG_DRM_VC4_KUNIT_TEST) += \
>   
>   vc4-$(CONFIG_DEBUG_FS) += vc4_debugfs.o
>   
> +vc4-$(CONFIG_DMABUF_HEAPS) += vc4_dma_heap.o
> +
>   obj-$(CONFIG_DRM_VC4)  += vc4.o
> diff --git a/drivers/gpu/drm/vc4/vc4_dma_heap.c b/drivers/gpu/drm/vc4/vc4_dma_heap.c
> new file mode 100644
> index 000000000000..010d0a88f3fa
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/vc4_dma_heap.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  Copyright © 2023 Simon Ser
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +
> +#include "vc4_drv.h"
> +
> +static struct dma_buf *vc4_dma_heap_allocate(struct dma_heap *heap,
> +					     unsigned long size,
> +					     unsigned long fd_flags,
> +					     unsigned long heap_flags)
> +{
> +	struct vc4_dev *vc4 = dma_heap_get_drvdata(heap);
> +	//DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct drm_gem_dma_object *dma_obj;
> +	struct dma_buf *dmabuf;
> +
> +	if (WARN_ON_ONCE(!vc4->is_vc5))
> +		return ERR_PTR(-ENODEV);
> +
> +	dma_obj = drm_gem_dma_create(&vc4->base, size);
> +	if (IS_ERR(dma_obj))
> +		return ERR_CAST(dma_obj);
> +
> +	dmabuf = drm_gem_prime_export(&dma_obj->base, fd_flags);
> +	drm_gem_object_put(&dma_obj->base);
> +	return dmabuf;
> +}
> +
> +static const struct dma_heap_ops vc4_dma_heap_ops = {
> +	.allocate = vc4_dma_heap_allocate,
> +};
> +
> +int vc4_dma_heap_create(struct vc4_dev *vc4)
> +{
> +	struct dma_heap_export_info exp_info;
> +	struct dma_heap *heap;
> +
> +	exp_info.name = "vc4"; /* TODO: allow multiple? */
> +	exp_info.ops = &vc4_dma_heap_ops;
> +	exp_info.priv = vc4; /* TODO: unregister when unloading */
> +
> +	heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(heap))
> +		return PTR_ERR(heap);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index c133e96b8aca..c7297dd7d9d5 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -391,6 +391,12 @@ static int vc4_drm_bind(struct device *dev)
>   
>   	drm_fbdev_dma_setup(drm, 16);
>   
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> +	ret = vc4_dma_heap_create(vc4);
> +	if (ret)
> +		goto err;
> +#endif
> +
>   	return 0;
>   
>   err:
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index ab61e96e7e14..d5c5dd18815c 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -1078,4 +1078,9 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>   int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv);
>   
> +/* vc4_dma_heap.c */
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> +int vc4_dma_heap_create(struct vc4_dev *vc4);
> +#endif
> +
>   #endif /* _VC4_DRV_H_ */
