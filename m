Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF8718B04E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 10:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3943E6E9C4;
	Thu, 19 Mar 2020 09:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDFF6E9C4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 09:32:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z12so1213087wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F0a2Vjun8UI6nLRs8p+xxqCEiZstqcBgeON2W1kPuNs=;
 b=dHOv+YMvU111h3p++fhd66zxGnpj8Un65y2tHm6XMMp9ghbSmH4Ur5TV7AkilWIJjM
 Bh/dmTKUSoD0nI0rdK8V9VXD5CuqKepTQkx+zm07/dWAny+kKzwt7psBhk3lS0OlUIfW
 80kizKGdi8bCceiwoaW3ho2vajn/emlgfQiIxvjnHBxC4Pm9DB6OoDAkIe6A3JvYlZGC
 iCo3mzLe1Wm3jGGOXFNeyn/opr4JqDpBgt95/uI9XLdlF5wLD051BA/h+6WQjIve38Yg
 4TFxWjPQMJQz/SV0tmpqecUlegWfguuoD3ACzdsvE6ULvcJ9hjIiZdo4KZOilxxErk/9
 eT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F0a2Vjun8UI6nLRs8p+xxqCEiZstqcBgeON2W1kPuNs=;
 b=fCmNNjwuC0A+OXOHtSHIIAvJQoRo9AI/jb4RHpMaL3q3q8/uQP4s1LgRce0xWeDwwQ
 wB+9CbHwgebYEniGQUS/Zu0fhpJxZoSVVxxopK9YA0Gk3jB6RaZosadOy+llglvxzM7Q
 NBWMrHFGGp5bP0a6r4nzanRN7QbQI0KqwgV6kJbuhMzepFV+bn/iKDnKeYL529pONYZV
 TTghCzWfPjYbbjeTmo64vdlLvRbRH+jZQvL0743mG4Lb209jodzOWJ70SCcS91stNxAZ
 ZPpNckcPCHJvSen6ZGkyyeMuCF1vrCqv/Tb8UJq8jwMYH5ey/fRZ6l0bBAdEbZ5yY2gn
 E69w==
X-Gm-Message-State: ANhLgQ1uY6N64pD9cf2mdaP7ENfigGaETYV/Al90U9XWtcmzas4siXWw
 bYiyacoeckVQIEsrcPckCWg=
X-Google-Smtp-Source: ADFU+vskN4WOFyy+2rlgpLh5B/HG/YtsESCP89PNnoBDV1G1iPjBbT15L4T7teCZwVxr4U/LRg5lDA==
X-Received: by 2002:a1c:68d5:: with SMTP id d204mr2587442wmc.15.1584610346812; 
 Thu, 19 Mar 2020 02:32:26 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id s1sm2618415wrp.41.2020.03.19.02.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 02:32:26 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] drm/virtio: factor out the sg_table from
 virtio_gpu_object
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20200305013212.130640-1-gurchetansingh@chromium.org>
From: Jiri Slaby <jirislaby@gmail.com>
Autocrypt: addr=jirislaby@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cc18ed7f-3264-0d38-b772-64d79244f52d@gmail.com>
Date: Thu, 19 Mar 2020 10:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305013212.130640-1-gurchetansingh@chromium.org>
Content-Language: en-US
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05. 03. 20, 2:32, Gurchetan Singh wrote:
> A resource will be a shmem based resource or a (planned)
> vram based resource, so it makes sense to factor out common fields
> (resource handle, dumb).
> 
> v2: move mapped field to shmem object

Hi,

I bisected the slab-out-of-bounds below to this patch. Is it known?

> [drm] pci: virtio-vga detected at 0000:00:0a.0
> virtio-pci 0000:00:0a.0: vgaarb: deactivate vga console
> [drm] features: -virgl +edid
> [drm] number of scanouts: 1
> [drm] number of cap sets: 0
> [drm] Initialized virtio_gpu 0.1.0 0 for virtio6 on minor 0
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in virtio_gpu_object_create+0x938/0xa10
> Write of size 8 at addr ffff8880c321b5c8 by task swapper/0/1
>
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #38
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.0.0 02/06/2015
> Call Trace:
> dump_stack (/dev/shm/jslaby/linux/lib/dump_stack.c:120) 
> print_address_description.constprop.0 (/dev/shm/jslaby/linux/mm/kasan/report.c:375) 
> __kasan_report.cold (/dev/shm/jslaby/linux/mm/kasan/report.c:507) 
> kasan_report (/dev/shm/jslaby/linux/./arch/x86/include/asm/smap.h:69 /dev/shm/jslaby/linux/mm/kasan/common.c:642) 
> virtio_gpu_object_create (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_object.c:145 /dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_object.c:224) 
> virtio_gpu_gem_create (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_gem.c:42) 
> virtio_gpu_mode_dumb_create (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_gem.c:84) 
> drm_client_framebuffer_create (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_client.c:268 /dev/shm/jslaby/linux/drivers/gpu/drm/drm_client.c:412) 
> drm_fb_helper_generic_probe (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2041) 
> __drm_fb_helper_initial_config_and_unlock (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:1588 /dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:1746) 
> drm_fbdev_client_hotplug (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2134) 
> drm_fbdev_generic_setup (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2212 /dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2185) 
> virtio_gpu_probe (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_drv.c:128) 
> virtio_dev_probe (/dev/shm/jslaby/linux/drivers/virtio/virtio.c:248) 
> really_probe (/dev/shm/jslaby/linux/drivers/base/dd.c:551) 
> driver_probe_device (/dev/shm/jslaby/linux/drivers/base/dd.c:724) 
> device_driver_attach (/dev/shm/jslaby/linux/drivers/base/dd.c:998) 
> __driver_attach (/dev/shm/jslaby/linux/drivers/base/dd.c:1077) 
> bus_for_each_dev (/dev/shm/jslaby/linux/drivers/base/bus.c:305) 
> bus_add_driver (/dev/shm/jslaby/linux/drivers/base/bus.c:623) 
> driver_register (/dev/shm/jslaby/linux/drivers/base/driver.c:171) 
> do_one_initcall (/dev/shm/jslaby/linux/init/main.c:1146) 
> kernel_init_freeable (/dev/shm/jslaby/linux/init/main.c:1218 /dev/shm/jslaby/linux/init/main.c:1235 /dev/shm/jslaby/linux/init/main.c:1255 /dev/shm/jslaby/linux/init/main.c:1439) 
> kernel_init (/dev/shm/jslaby/linux/init/main.c:1348) 
> ret_from_fork (/dev/shm/jslaby/linux/arch/x86/entry/entry_64.S:358) 
> 
> Allocated by task 1:
> save_stack (/dev/shm/jslaby/linux/mm/kasan/common.c:72) 
> __kasan_kmalloc.constprop.0 (/dev/shm/jslaby/linux/mm/kasan/common.c:80 /dev/shm/jslaby/linux/mm/kasan/common.c:515 /dev/shm/jslaby/linux/mm/kasan/common.c:488) 
> virtio_gpu_create_object (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_object.c:124) 
> drm_gem_shmem_create (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_gem_shmem_helper.c:58) 
> virtio_gpu_object_create (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_object.c:193) 
> virtio_gpu_gem_create (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_gem.c:42) 
> virtio_gpu_mode_dumb_create (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_gem.c:84) 
> drm_client_framebuffer_create (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_client.c:268 /dev/shm/jslaby/linux/drivers/gpu/drm/drm_client.c:412) 
> drm_fb_helper_generic_probe (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2041) 
> __drm_fb_helper_initial_config_and_unlock (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:1588 /dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:1746) 
> drm_fbdev_client_hotplug (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2134) 
> drm_fbdev_generic_setup (/dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2212 /dev/shm/jslaby/linux/drivers/gpu/drm/drm_fb_helper.c:2185) 
> virtio_gpu_probe (/dev/shm/jslaby/linux/drivers/gpu/drm/virtio/virtgpu_drv.c:128) 
> virtio_dev_probe (/dev/shm/jslaby/linux/drivers/virtio/virtio.c:248) 
> really_probe (/dev/shm/jslaby/linux/drivers/base/dd.c:551) 
> driver_probe_device (/dev/shm/jslaby/linux/drivers/base/dd.c:724) 
> device_driver_attach (/dev/shm/jslaby/linux/drivers/base/dd.c:998) 
> __driver_attach (/dev/shm/jslaby/linux/drivers/base/dd.c:1077) 
> bus_for_each_dev (/dev/shm/jslaby/linux/drivers/base/bus.c:305) 
> bus_add_driver (/dev/shm/jslaby/linux/drivers/base/bus.c:623) 
> driver_register (/dev/shm/jslaby/linux/drivers/base/driver.c:171) 
> do_one_initcall (/dev/shm/jslaby/linux/init/main.c:1146) 
> kernel_init_freeable (/dev/shm/jslaby/linux/init/main.c:1218 /dev/shm/jslaby/linux/init/main.c:1235 /dev/shm/jslaby/linux/init/main.c:1255 /dev/shm/jslaby/linux/init/main.c:1439) 
> kernel_init (/dev/shm/jslaby/linux/init/main.c:1348) 
> ret_from_fork (/dev/shm/jslaby/linux/arch/x86/entry/entry_64.S:358) 
> 
> Freed by task 1:
> save_stack (/dev/shm/jslaby/linux/mm/kasan/common.c:72) 
> __kasan_slab_free (/dev/shm/jslaby/linux/mm/kasan/common.c:478) 
> kfree (/dev/shm/jslaby/linux/mm/slub.c:1477 /dev/shm/jslaby/linux/mm/slub.c:3024 /dev/shm/jslaby/linux/mm/slub.c:3976) 
> consume_skb (/dev/shm/jslaby/linux/net/core/skbuff.c:681 /dev/shm/jslaby/linux/net/core/skbuff.c:839 /dev/shm/jslaby/linux/net/core/skbuff.c:833) 
> netlink_broadcast_filtered (/dev/shm/jslaby/linux/./include/asm-generic/atomic-instrumented.h:747 /dev/shm/jslaby/linux/net/netlink/af_netlink.c:465 /dev/shm/jslaby/linux/net/netlink/af_netlink.c:1514) 
> netlink_broadcast (/dev/shm/jslaby/linux/net/netlink/af_netlink.c:1534) 
> genl_ctrl_event (/dev/shm/jslaby/linux/net/netlink/genetlink.c:1042) 
> genl_register_family (/dev/shm/jslaby/linux/net/netlink/genetlink.c:380 /dev/shm/jslaby/linux/net/netlink/genetlink.c:322) 
> acpi_event_init (/dev/shm/jslaby/linux/drivers/acpi/event.c:178) 
> do_one_initcall (/dev/shm/jslaby/linux/init/main.c:1146) 
> kernel_init_freeable (/dev/shm/jslaby/linux/init/main.c:1218 /dev/shm/jslaby/linux/init/main.c:1235 /dev/shm/jslaby/linux/init/main.c:1255 /dev/shm/jslaby/linux/init/main.c:1439) 
> kernel_init (/dev/shm/jslaby/linux/init/main.c:1348) 
> ret_from_fork (/dev/shm/jslaby/linux/arch/x86/entry/entry_64.S:358) 













> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++++----
>  drivers/gpu/drm/virtio/virtgpu_object.c | 31 ++++++++++++++-----------
>  drivers/gpu/drm/virtio/virtgpu_vq.c     |  6 +++--
>  3 files changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index ce73895cf74b..8e2027da6cce 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -69,16 +69,21 @@ struct virtio_gpu_object_params {
>  struct virtio_gpu_object {
>  	struct drm_gem_shmem_object base;
>  	uint32_t hw_res_handle;
> -
> -	struct sg_table *pages;
> -	uint32_t mapped;
> -
>  	bool dumb;
>  	bool created;
>  };
>  #define gem_to_virtio_gpu_obj(gobj) \
>  	container_of((gobj), struct virtio_gpu_object, base.base)
>  
> +struct virtio_gpu_object_shmem {
> +	struct virtio_gpu_object base;
> +	struct sg_table *pages;
> +	uint32_t mapped;
> +};
> +
> +#define to_virtio_gpu_shmem(virtio_gpu_object) \
> +	container_of((virtio_gpu_object), struct virtio_gpu_object_shmem, base)
> +
>  struct virtio_gpu_object_array {
>  	struct ww_acquire_ctx ticket;
>  	struct list_head next;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index c5cad949eb8d..1f8b062bb9eb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -65,16 +65,17 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
>  void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>  {
>  	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> +	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  
> -	if (bo->pages) {
> -		if (bo->mapped) {
> +	if (shmem->pages) {
> +		if (shmem->mapped) {
>  			dma_unmap_sg(vgdev->vdev->dev.parent,
> -				     bo->pages->sgl, bo->mapped,
> +				     shmem->pages->sgl, shmem->mapped,
>  				     DMA_TO_DEVICE);
> -			bo->mapped = 0;
> +			shmem->mapped = 0;
>  		}
> -		sg_free_table(bo->pages);
> -		bo->pages = NULL;
> +		sg_free_table(shmem->pages);
> +		shmem->pages = NULL;
>  		drm_gem_shmem_unpin(&bo->base.base);
>  	}
>  	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
> @@ -133,6 +134,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  					unsigned int *nents)
>  {
>  	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
> +	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  	struct scatterlist *sg;
>  	int si, ret;
>  
> @@ -140,19 +142,20 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  	if (ret < 0)
>  		return -EINVAL;
>  
> -	bo->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
> -	if (!bo->pages) {
> +	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
> +	if (!shmem->pages) {
>  		drm_gem_shmem_unpin(&bo->base.base);
>  		return -EINVAL;
>  	}
>  
>  	if (use_dma_api) {
> -		bo->mapped = dma_map_sg(vgdev->vdev->dev.parent,
> -					bo->pages->sgl, bo->pages->nents,
> -					DMA_TO_DEVICE);
> -		*nents = bo->mapped;
> +		shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
> +					   shmem->pages->sgl,
> +					   shmem->pages->nents,
> +					   DMA_TO_DEVICE);
> +		*nents = shmem->mapped;
>  	} else {
> -		*nents = bo->pages->nents;
> +		*nents = shmem->pages->nents;
>  	}
>  
>  	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
> @@ -162,7 +165,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  		return -ENOMEM;
>  	}
>  
> -	for_each_sg(bo->pages->sgl, sg, *nents, si) {
> +	for_each_sg(shmem->pages->sgl, sg, *nents, si) {
>  		(*ents)[si].addr = cpu_to_le64(use_dma_api
>  					       ? sg_dma_address(sg)
>  					       : sg_phys(sg));
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 5e2375e0f7bb..73854915ec34 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -600,10 +600,11 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>  	struct virtio_gpu_transfer_to_host_2d *cmd_p;
>  	struct virtio_gpu_vbuffer *vbuf;
>  	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
> +	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  
>  	if (use_dma_api)
>  		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
> -				       bo->pages->sgl, bo->pages->nents,
> +				       shmem->pages->sgl, shmem->pages->nents,
>  				       DMA_TO_DEVICE);
>  
>  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> @@ -1015,10 +1016,11 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
>  	struct virtio_gpu_transfer_host_3d *cmd_p;
>  	struct virtio_gpu_vbuffer *vbuf;
>  	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
> +	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  
>  	if (use_dma_api)
>  		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
> -				       bo->pages->sgl, bo->pages->nents,
> +				       shmem->pages->sgl, shmem->pages->nents,
>  				       DMA_TO_DEVICE);
>  
>  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> 

thanks,
-- 
js
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
