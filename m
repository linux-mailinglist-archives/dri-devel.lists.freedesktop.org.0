Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE36AD3919
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918B710E560;
	Tue, 10 Jun 2025 13:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KHH3DEQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C810E560
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749562068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a98SalNilWIxeeM/fZ4wSnSdHaOcVtUnULnSY0Zr6KM=;
 b=KHH3DEQK1hGjAavRz8knZXH6Y0vi9Z2J/CaFFtbpZWosjp7qvQp1WF0TgItKffyW0lEC1c
 Foc63pBSRTt5YSzsVtABB0QdZYCJC/7caUUYj8DyIjProTy7ZaETVgHFMFehpJZ8S5LJ2e
 XL5NfRM5FL3cxm7BhpYN8yzhRoeMD98=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-N9gTFkd3PNOiUc3cpSDo_g-1; Tue, 10 Jun 2025 09:27:47 -0400
X-MC-Unique: N9gTFkd3PNOiUc3cpSDo_g-1
X-Mimecast-MFC-AGG-ID: N9gTFkd3PNOiUc3cpSDo_g_1749562066
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-acb8f9f58ebso422571466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749562066; x=1750166866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a98SalNilWIxeeM/fZ4wSnSdHaOcVtUnULnSY0Zr6KM=;
 b=vSZMGGZlBcH16s+gSX37qXZT5TuE+fLMqD2+LOgOCbobMboJ9eUAFtedV8u8ipjsLD
 wdSrt1kSqDUoHrQbD6jRYT62fN3Cz5NYnMlumZ0QgeyG4VzNUDPXtgca2dwVTmS3rrN+
 j6srqK53Yg5PKLuybzpGaziNC2RAkJo4Nz8UXCD/JlSEZq8Rw4RfX+lK5S8q+FT23FZ/
 llIm3s4jZsVAIozq15xm267Xdg5HLYp6pwpYhg+YRcdzncHwJQR9SdIL+KSljKgTrOn3
 rJ9W1WaS2lFmXdzOwAXj4r/MWFT0ioc5N9ZWYemp++9GLhzy/H+mygfDGV09y4EbH60f
 jBrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc9xZcBEjN47qiBsdY4QVAavsU9dyoe3ec6LqBjVL0J7Sb+6KgYygpWUw/JzkKEBUPs4nb+tUvsSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6PyIZW1UjAxt6xCOIzceJdxqwic+2s+/kOJ45h/4rTIeVRUDp
 uikoGeR3oy85ateYGDoV5HnD484lO3UeQNcSmJbRvrXrDwfWOGGaqly4F6DKapYKlGD2E2NfFAK
 PjsWCZTYrCDkl50wzVedsfmmuPCaIYTiOqyqKt/RI0OSaH4UZU2IynEpdvu49MOjv0f3pEA==
X-Gm-Gg: ASbGncsI0CMstDCG4zppr5UjjLhzDW4AUS5V+tzdaye3MsWifxlzRgzN9bzHiq+nlm2
 tbtwzEOOClzK3EXpHZ0ZlHTehYmJiSYaRDkrXibw1qzeUN/F+3vrmUyuo6WGv7tjF+V6vVDSVuj
 zxR/1wpjU4NbDfKnI35QvBDR5rZ4S566dzopVHrkkFBwMtsy1tosjajpxPfNZGIR1LI6LDsp095
 WEAKAwDt0UJGNqDQbEvc3NIzWs7gGHj/IGmqPuahjql/cUvVSZFp7GruvL0PdBTbg5CnoPufKXy
 UkbCYTcVKYb8aSPrLsZDQRBNb/Mq
X-Received: by 2002:a17:907:c27:b0:ade:8a6:b877 with SMTP id
 a640c23a62f3a-ade1a916cd9mr1553964366b.5.1749562065647; 
 Tue, 10 Jun 2025 06:27:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUZ5fBdxluMBIKqkxMMe9UtlMIt25hhBbzEVdxF9qyCpFHVzAZOg0P/JKL7itgBPV4J+eGJA==
X-Received: by 2002:a17:907:c27:b0:ade:8a6:b877 with SMTP id
 a640c23a62f3a-ade1a916cd9mr1553960366b.5.1749562065066; 
 Tue, 10 Jun 2025 06:27:45 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc1c68csm732058066b.99.2025.06.10.06.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:27:44 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:27:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] virtgpu: add virtio_gpu_queue_cleanup()
Message-ID: <6x2iqra6gpna5gdd4m73gkgo46bp6w2e3gm7raibelbn3gmnkg@2g6oeskj73yv>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
 <20250505-virtgpu-queue-cleanup-v1-v1-1-810923da2b1e@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-1-810923da2b1e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mAWKifxPfDM3iRthDDaTad2giYMZ0gTVE_sjBg0WFYc_1749562066
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

On Mon, May 05, 2025 at 11:59:14AM +0300, Manos Pitsidianakis wrote:
>When virtio_gpu_remove() is called, the queues are flushed and used
>buffers from the virtqueues are freed. However, the VIRTIO device might
>have left unused buffers in the avail rings, resulting in memory leaks.
>KASAN, slab debug and drm_mm_takedown all report the errors:
>
> BUG virtio-gpu-vbufs: Objects remaining in virtio-gpu-vbufs on
> __kmem_cache_shutdown()
> <- Snipped backtrace ->
> Object 0xffffff801b07c008 @offset=8
> Allocated in virtio_gpu_get_vbuf.isra.0+0x38/0xb0 age=4314 cpu=3
> pid=540
>  kmem_cache_alloc+0x330/0x3a8
>  virtio_gpu_get_vbuf.isra.0+0x38/0xb0
>  virtio_gpu_cmd_resource_create_3d+0x60/0x1f0
>  virtio_gpu_object_create+0x388/0x468
>  virtio_gpu_resource_create_ioctl+0x1f0/0x420
>  drm_ioctl_kernel+0x170/0x248
>  drm_ioctl+0x33c/0x680
>  __arm64_sys_ioctl+0xdc/0x128
>  invoke_syscall+0x84/0x1c8
>  el0_svc_common.constprop.0+0x11c/0x150
>  do_el0_svc+0x38/0x50
>  el0_svc+0x38/0x70
>  el0t_64_sync_handler+0x120/0x130
>  el0t_64_sync+0x190/0x198
>
> ------------[ cut here ]------------
> kmem_cache_destroy virtio-gpu-vbufs: Slab cache still has objects when
> called from virtio_gpu_free_vbufs+0x48/0x70
> WARNING: CPU: 0 PID: 483 at mm/slab_common.c:498
> kmem_cache_destroy+0x114/0x178
> <- Snipped info ->
>
> ------------[ cut here ]------------
> Memory manager not clean during takedown.
> <- Snipped info ->
> ---[ end trace 0000000000000000 ]---
> [drm:drm_mm_takedown] *ERROR* node [001000eb + 00000080]: inserted at
>  drm_mm_insert_node_in_range+0x48c/0x6a8
>  drm_vma_offset_add+0x84/0xb0
>  drm_gem_create_mmap_offset+0x50/0x70
>  __drm_gem_shmem_create+0x94/0x1d8
>  drm_gem_shmem_create+0x1c/0x30
>  virtio_gpu_object_create+0x68/0x468
>  virtio_gpu_resource_create_ioctl+0x1f0/0x420
>  drm_ioctl_kernel+0x170/0x248
>  drm_ioctl+0x33c/0x680
>  __arm64_sys_ioctl+0xdc/0x128
>  invoke_syscall+0x84/0x1c8
>  el0_svc_common.constprop.0+0x11c/0x150
>  do_el0_svc+0x38/0x50
>  el0_svc+0x38/0x70
>  el0t_64_sync_handler+0x120/0x130
>  el0t_64_sync+0x190/0x198
> [drm:drm_mm_takedown] *ERROR* node [0010016b + 000000eb]: inserted at
> <- Snipped info ->
>
>The leaked objects are also reported in /sys/kernel/debug/kmemleak.
>
>This commit adds a cleanup function that is called from
>virtio_gpu_deinit().
>
>The function cleans up any unused buffers from the virtqueues and calls
>the appropriate freeing functions. This is safe to do so because
>virtio_gpu_deinit() calls virtio_reset_device() before calling the
>cleanup function, ensuring no one is going to read from the virtqueues.
>
>The cleanup function checks for used buffers on the queues, and
>additionally calls virtqueue_detach_unused_buf on each queue to get any
>buffers that did not have time to be processed by the VIRTIO backend.
>
>Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>---
> drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
> drivers/gpu/drm/virtio/virtgpu_kms.c |  1 +
> drivers/gpu/drm/virtio/virtgpu_vq.c  | 55 ++++++++++++++++++++++++++++++++++++
> 3 files changed, 57 insertions(+)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index f17660a71a3e7a22b5d4fefa6b754c227a294037..b3d367be6f204dbc98bf1c6e5c43a37ac8c0d8b3 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -419,6 +419,7 @@ void virtio_gpu_cursor_ack(struct virtqueue *vq);
> void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
> void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
> void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev);
>+void virtio_gpu_queue_cleanup(struct virtio_gpu_device *vgdev);
> void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
>
> int
>diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>index 7dfb2006c561ca13b15d979ddb8bf2d753e35dad..da70d9248072b64786a5d48b71bccaa80b8aae8f 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>@@ -286,6 +286,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
> 	flush_work(&vgdev->cursorq.dequeue_work);
> 	flush_work(&vgdev->config_changed_work);
> 	virtio_reset_device(vgdev->vdev);
>+	virtio_gpu_queue_cleanup(vgdev);
> 	vgdev->vdev->config->del_vqs(vgdev->vdev);
> }
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
>index 
>55a15e247dd1ad53a2b43b19fca8879b956f0e1a..fd150827e413cedcec4d82b0da8d792cb67e243f 
>100644
>--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
>@@ -299,6 +299,61 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
> 	wake_up(&vgdev->cursorq.ack_queue);
> }
>
>+/* deallocate all in-flight virtqueue elements */
>+void virtio_gpu_queue_cleanup(struct virtio_gpu_device *vgdev)
>+{
>+	struct list_head reclaim_list;
>+	struct virtio_gpu_vbuffer *entry, *tmp;
>+
>+	INIT_LIST_HEAD(&reclaim_list);
>+	spin_lock(&vgdev->ctrlq.qlock);
>+	do {
>+		virtqueue_disable_cb(vgdev->ctrlq.vq);
>+		reclaim_vbufs(vgdev->ctrlq.vq, &reclaim_list);
>+	} while (!virtqueue_enable_cb(vgdev->ctrlq.vq));

IIUC this function (virtio_gpu_queue_cleanup) is called after device is 
reset, so do we really need this cycle to disable notification and 
double check if the device queued new stuff?

I mean, maybe we can just call reclaim_vbufs(), since the device may not 
queue new elements anymore.

>+	/* detach unused buffers */
>+	while ((entry = virtqueue_detach_unused_buf(vgdev->ctrlq.vq)) != NULL) {

What about implementing a new reclaim_unused_vbufs(), similar to 
reclaim_vbufs() but calling virtqueue_detach_unused_buf() and queuing on 
reclaim_list, so we can do a single loop to clean all buffer in the same 
way?

>+		if (entry->resp_cb)
>+			entry->resp_cb(vgdev, entry);

Is it fine to call `entry->resp_cb` on an "unused" buffer?

>+		if (entry->objs)
>+			virtio_gpu_array_put_free(entry->objs);
>+		free_vbuf(vgdev, entry);
>+	}
>+	spin_unlock(&vgdev->ctrlq.qlock);
>+
>+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
>+		if (entry->resp_cb)
>+			entry->resp_cb(vgdev, entry);
>+		if (entry->objs)
>+			virtio_gpu_array_put_free(entry->objs);
>+		list_del(&entry->list);
>+		free_vbuf(vgdev, entry);
>+	}
>+

Similar comments also on the next section.
They looks very similar, so not sure if we can avoid code duplication 
adding a new function (e.g. renaming this function in 
`virtio_gpu_queues_cleanup()` and add a new `virtio_gpu_queue_cleanup()` 
to be called on the 2 virtqueues). Just an idea, not a strong opinion.

Thanks,
Stefano

>+	spin_lock(&vgdev->cursorq.qlock);
>+	do {
>+		virtqueue_disable_cb(vgdev->cursorq.vq);
>+		reclaim_vbufs(vgdev->cursorq.vq, &reclaim_list);
>+	} while (!virtqueue_enable_cb(vgdev->cursorq.vq));
>+	spin_unlock(&vgdev->cursorq.qlock);
>+	while ((entry = virtqueue_detach_unused_buf(vgdev->cursorq.vq)) != NULL) {
>+		if (entry->resp_cb)
>+			entry->resp_cb(vgdev, entry);
>+		if (entry->objs)
>+			virtio_gpu_array_put_free(entry->objs);
>+		free_vbuf(vgdev, entry);
>+	}
>+
>+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
>+		if (entry->resp_cb)
>+			entry->resp_cb(vgdev, entry);
>+		if (entry->objs)
>+			virtio_gpu_array_put_free(entry->objs);
>+		list_del(&entry->list);
>+		free_vbuf(vgdev, entry);
>+	}
>+}
>+
> /* Create sg_table from a vmalloc'd buffer. */
> static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
> {
>
>-- 
>2.47.2
>
>

