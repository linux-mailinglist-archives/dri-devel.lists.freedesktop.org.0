Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72B9C0707
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 14:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0A10E0F5;
	Thu,  7 Nov 2024 13:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HwklnB3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C319310E0F5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730985300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bb4h44+wBKO0YUrX05KiJS//N+0dK6owl3hOvkwqoGU=;
 b=HwklnB3YSdJ2Z/4w7f5c6Gpoz2xLpCCqNOgX1VYweaHN+t4LeOY4TihT7C9zR4kJMz9QuW
 RHdfDonzBlTX+68kMR5EhHOblE9N0wYiSBaZMHMcswrIYVJ8tBu3FWir0ux3GtalMXaz21
 UY9PUOZsRX1x+Zj3ZzzDc3qq/IhUemA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-T2BiGynSOuSJ33hR1mJA9g-1; Thu, 07 Nov 2024 08:14:54 -0500
X-MC-Unique: T2BiGynSOuSJ33hR1mJA9g-1
X-Mimecast-MFC-AGG-ID: T2BiGynSOuSJ33hR1mJA9g
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4315b7b0c16so6604425e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 05:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730985293; x=1731590093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bb4h44+wBKO0YUrX05KiJS//N+0dK6owl3hOvkwqoGU=;
 b=QXlKHYedQ5+YJl5fzZKrmHlOVqYRmbvKyRQJPID6/OMAh45vPvHY0LXrVjrs6s7Fou
 6jGUwhbU6CM8cUKNgHS52F/CyqARHhZwkRcX23qzAzDFV09dCtoWcx0EDazneu8ZsuGR
 cY1luEYN+tQ1kXjHkVdxGXu0KOGDDTO0DKarPMrj3XBBFEnPsbS6MsXdknHZ7nCfRc0Q
 FFoaGg29XcMgydCiiorXeQF+FArzocgb4uwNeRHRUK2/6PG4skjZtcaSREaTjrCkE5fT
 t71pVva5wE3iz+NL6XOj12guXDuN7HA2QgVzQmNQdKW/7N6cDSiRhdljmGI7YGVQdRrq
 x57Q==
X-Gm-Message-State: AOJu0Yxq8fIrntPpt4wc21K+u8lr/YPF8ZMYfbCMMeVG45g8re77basc
 9rLctk5Aj6oQwkcdBxTr7ks8X/+lPEGWhz5BY+2PhMcR5hwaoLm97a8G3wftZ82eynXz3O+u2cf
 4VHjv4ocHbbkdZowozGDm4Dk+qXDKuf3c9kyOJA1hCvkjJcpdi6iP8B6YZuI/QA/NnA==
X-Received: by 2002:a05:6000:1f11:b0:37d:4389:e9de with SMTP id
 ffacd0b85a97d-380610f3011mr30283532f8f.1.1730985292695; 
 Thu, 07 Nov 2024 05:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCd1mviEpJq+US0joKmcpItb2PwDOzQNg88R7qU9AZJ3pRK3nOUmXvb+o5IWKlkTBraxws1A==
X-Received: by 2002:a05:6000:1f11:b0:37d:4389:e9de with SMTP id
 ffacd0b85a97d-380610f3011mr30283508f8f.1.1730985292205; 
 Thu, 07 Nov 2024 05:14:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5b96sm24252705e9.41.2024.11.07.05.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 05:14:51 -0800 (PST)
Message-ID: <d885913e-e81c-488e-8db8-e3f7fae13b2c@redhat.com>
Date: Thu, 7 Nov 2024 14:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241106114932.3101891-1-ryasuoka@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241106114932.3101891-1-ryasuoka@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W_DoLVLDSHDgQVipAFBxgLD7U17ou9kkQ74eNE5k3wk_1730985293
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 06/11/2024 12:49, Ryosuke Yasuoka wrote:
> From: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Virtio gpu supports the drm_panic module, which displays a message to
> the screen when a kernel panic occurs.

Thanks for the changes in v2.
I've one more comment below, otherwise it looks good to me.

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
> v2:
> - Remove unnecessary virtio_gpu_vbuffer_inline
> - Remove reclaim_list and just call drm_gem_object_put() if there is an
>    obj
> - Don't wait for an event in virtio_gpu_panic_queue_ctrl_sgs and just
>    return -ENOMEM. Also add error handlers for this error.
> - Use virtio_gpu_panic_queue_fenced_ctrl_buffer() in
> virtio_gpu_panic_cmd_resource_flush
> - Remove fence and objs arguments because these are always NULL in panic
>    handler.
> - Rename virtio_gpu_panic_queue_fenced_ctrl_buffer to
>    ..._queue_ctrl_buffer
> - Rename virtio_gpu_panic_alloc_cmd to ..._panic_init_cmd
> 
> v1:
> https://lore.kernel.org/lkml/20241031032101.2836264-1-ryasuoka@redhat.com/T/
> 
> 
>   drivers/gpu/drm/virtio/virtgpu_drv.h   |  18 +++
>   drivers/gpu/drm/virtio/virtgpu_plane.c | 168 +++++++++++++++++++++++++
>   drivers/gpu/drm/virtio/virtgpu_vq.c    | 148 +++++++++++++++++++++-
>   3 files changed, 328 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 64c236169db8..5387e3fd9dee 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -125,6 +125,12 @@ struct virtio_gpu_object_array {
>   	struct drm_gem_object *objs[] __counted_by(total);
>   };
>   
> +#define MAX_INLINE_CMD_SIZE   96
> +#define MAX_INLINE_RESP_SIZE  24
> +#define VBUFFER_SIZE	      (sizeof(struct virtio_gpu_vbuffer) \
> +			      + MAX_INLINE_CMD_SIZE		 \
> +			      + MAX_INLINE_RESP_SIZE)
> +
>   struct virtio_gpu_vbuffer;
>   struct virtio_gpu_device;
>   
> @@ -329,12 +335,23 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>   				    struct virtio_gpu_fence *fence);
>   void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
>   				   struct virtio_gpu_object *bo);
> +int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
> +					     uint64_t offset,
> +					     uint32_t width, uint32_t height,
> +					     uint32_t x, uint32_t y,
> +					     struct virtio_gpu_object_array *objs,
> +					     struct virtio_gpu_vbuffer *vbuf);
>   void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>   					uint64_t offset,
>   					uint32_t width, uint32_t height,
>   					uint32_t x, uint32_t y,
>   					struct virtio_gpu_object_array *objs,
>   					struct virtio_gpu_fence *fence);
> +int virtio_gpu_panic_cmd_resource_flush(struct virtio_gpu_device *vgdev,
> +					struct virtio_gpu_vbuffer *vbuf,
> +					uint32_t resource_id,
> +					uint32_t x, uint32_t y,
> +					uint32_t width, uint32_t height);
>   void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
>   				   uint32_t resource_id,
>   				   uint32_t x, uint32_t y,
> @@ -399,6 +416,7 @@ void virtio_gpu_ctrl_ack(struct virtqueue *vq);
>   void virtio_gpu_cursor_ack(struct virtqueue *vq);
>   void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
>   void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
> +void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev);
>   void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
>   
>   int
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a72a2dbda031..056d1e7877c1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -26,6 +26,8 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_panic.h>
>   
>   #include "virtgpu_drv.h"
>   
> @@ -108,6 +110,30 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>   	return ret;
>   }
>   
> +/* For drm panic */
> +static int virtio_gpu_panic_update_dumb_bo(struct virtio_gpu_device *vgdev,
> +					   struct drm_plane_state *state,
> +					   struct drm_rect *rect,
> +					   struct virtio_gpu_object_array *objs,
> +					   struct virtio_gpu_vbuffer *vbuf)
> +{
> +	int ret;
> +	struct virtio_gpu_object *bo =
> +		gem_to_virtio_gpu_obj(state->fb->obj[0]);
> +	uint32_t w = rect->x2 - rect->x1;
> +	uint32_t h = rect->y2 - rect->y1;
> +	uint32_t x = rect->x1;
> +	uint32_t y = rect->y1;
> +	uint32_t off = x * state->fb->format->cpp[0] +
> +		y * state->fb->pitches[0];
> +
> +	virtio_gpu_array_add_obj(objs, &bo->base.base);
> +
> +	ret = virtio_gpu_panic_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
> +						       objs, vbuf);
> +	return ret;
> +}
> +
>   static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
>   				      struct drm_plane_state *state,
>   				      struct drm_rect *rect)
> @@ -131,6 +157,26 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
>   					   objs, NULL);
>   }
>   
> +/* For drm_panic */
> +static int virtio_gpu_panic_resource_flush(struct drm_plane *plane,
> +					   struct virtio_gpu_vbuffer *vbuf,
> +					   uint32_t x, uint32_t y,
> +					   uint32_t width, uint32_t height)
> +{
> +	int ret;
> +	struct drm_device *dev = plane->dev;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_object *bo;
> +
> +	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
> +	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +
> +	ret = virtio_gpu_panic_cmd_resource_flush(vgdev, vbuf, bo->hw_res_handle, x, y,
> +						  width, height);
> +	return ret;
> +}
> +
>   static void virtio_gpu_resource_flush(struct drm_plane *plane,
>   				      uint32_t x, uint32_t y,
>   				      uint32_t width, uint32_t height)
> @@ -359,11 +405,126 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>   	virtio_gpu_cursor_ping(vgdev, output);
>   }
>   
> +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
> +					 struct drm_scanout_buffer *sb)
> +{
> +	struct virtio_gpu_object *bo;
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> +
> +	/* try to vmap it if possible */
> +	if (!bo->base.vaddr) {
> +		int ret;
> +
> +		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
> +		if (ret)
> +			return ret;
> +	} else {
> +		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> +	}
> +
> +	sb->format = plane->state->fb->format;
> +	sb->height = plane->state->fb->height;
> +	sb->width = plane->state->fb->width;
> +	sb->pitch[0] = plane->state->fb->pitches[0];
> +	return 0;
> +}
> +
> +struct virtio_gpu_panic_object_array {
> +	struct ww_acquire_ctx ticket;
> +	struct list_head next;
> +	u32 nents, total;
> +	struct drm_gem_object *objs;
> +};
> +
> +static void *virtio_panic_buffer;
> +
> +static void virtio_gpu_panic_put_vbuf(struct virtqueue *vq,
> +				      struct virtio_gpu_vbuffer *vbuf,
> +				      struct virtio_gpu_object_array *objs)
> +{
> +	unsigned int len;
> +
> +	/* waiting vbuf to be used */
> +	while (1) {

It may trigger an infinite loop, so you can add a finite timeout:

for (i = 0; i < 500; i++) {

> +		if (vbuf == virtqueue_get_buf(vq, &len)) {
> +			if (objs != NULL && vbuf->objs)
> +				drm_gem_object_put(objs->objs[0]);
> +			break;
> +		}
udelay(1);
> +	}
> +}
> +
> +static void virtio_panic_flush(struct drm_plane *plane)
> +{
> +	int ret;
> +	struct virtio_gpu_object *bo;
> +	struct drm_device *dev = plane->dev;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct drm_rect rect;
> +	struct virtio_gpu_vbuffer *vbuf_dumb_bo = virtio_panic_buffer;
> +	struct virtio_gpu_vbuffer *vbuf_resource_flush = virtio_panic_buffer + VBUFFER_SIZE;
> +
> +	rect.x1 = 0;
> +	rect.y1 = 0;
> +	rect.x2 = plane->state->fb->width;
> +	rect.y2 = plane->state->fb->height;
> +
> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> +
> +	struct drm_gem_object obj;
> +	struct virtio_gpu_panic_object_array objs = {
> +		.next = { NULL, NULL },
> +		.nents = 0,
> +		.total = 1,
> +		.objs = &obj
> +	};
> +
> +	if (bo->dumb) {
> +		ret = virtio_gpu_panic_update_dumb_bo(vgdev,
> +						      plane->state,
> +						      &rect,
> +						      (struct virtio_gpu_object_array *)&objs,
> +						      vbuf_dumb_bo);
> +		if (ret) {
> +			if (vbuf_dumb_bo->objs)
> +				drm_gem_object_put(&objs.objs[0]);
> +			return;
> +		}
> +	}
> +
> +	ret = virtio_gpu_panic_resource_flush(plane, vbuf_resource_flush,
> +					      plane->state->src_x >> 16,
> +					      plane->state->src_y >> 16,
> +					      plane->state->src_w >> 16,
> +					      plane->state->src_h >> 16);
> +	if (ret) {
> +		virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
> +					  vbuf_dumb_bo,
> +					  (struct virtio_gpu_object_array *)&objs);
> +		return;
> +	}
> +
> +	virtio_gpu_panic_notify(vgdev);
> +
> +	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
> +				  vbuf_dumb_bo,
> +				  (struct virtio_gpu_object_array *)&objs);
> +	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
> +				  vbuf_resource_flush,
> +				  NULL);
> +}
> +
>   static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
>   	.prepare_fb		= virtio_gpu_plane_prepare_fb,
>   	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
>   	.atomic_check		= virtio_gpu_plane_atomic_check,
>   	.atomic_update		= virtio_gpu_primary_plane_update,
> +	.get_scanout_buffer	= virtio_drm_get_scanout_buffer,
> +	.panic_flush		= virtio_panic_flush,
>   };
>   
>   static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
> @@ -383,6 +544,13 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
>   	const uint32_t *formats;
>   	int nformats;
>   
> +	/* allocate panic buffers */
> +	if (index == 0 && type == DRM_PLANE_TYPE_PRIMARY) {
> +		virtio_panic_buffer = drmm_kzalloc(dev, 2 * VBUFFER_SIZE, GFP_KERNEL);
> +		if (!virtio_panic_buffer)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
>   	if (type == DRM_PLANE_TYPE_CURSOR) {
>   		formats = virtio_gpu_cursor_formats;
>   		nformats = ARRAY_SIZE(virtio_gpu_cursor_formats);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 0d3d0d09f39b..f6e1655458dd 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -36,12 +36,6 @@
>   #include "virtgpu_drv.h"
>   #include "virtgpu_trace.h"
>   
> -#define MAX_INLINE_CMD_SIZE   96
> -#define MAX_INLINE_RESP_SIZE  24
> -#define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
> -			       + MAX_INLINE_CMD_SIZE		 \
> -			       + MAX_INLINE_RESP_SIZE)
> -
>   static void convert_to_hw_box(struct virtio_gpu_box *dst,
>   			      const struct drm_virtgpu_3d_box *src)
>   {
> @@ -311,6 +305,34 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
>   	return sgt;
>   }
>   
> +/* For drm_panic */
> +static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
> +					   struct virtio_gpu_vbuffer *vbuf,
> +					   int elemcnt,
> +					   struct scatterlist **sgs,
> +					   int outcnt,
> +					   int incnt)
> +{
> +	struct virtqueue *vq = vgdev->ctrlq.vq;
> +	int ret;
> +
> +	if (vgdev->has_indirect)
> +		elemcnt = 1;
> +
> +	if (vq->num_free < elemcnt)
> +		return -ENOMEM;
> +
> +	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
> +	WARN_ON(ret);
> +
> +	vbuf->seqno = ++vgdev->ctrlq.seqno;
> +	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
> +
> +	atomic_inc(&vgdev->pending_commands);
> +
> +	return 0;
> +}
> +
>   static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>   				     struct virtio_gpu_vbuffer *vbuf,
>   				     struct virtio_gpu_fence *fence,
> @@ -368,6 +390,33 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>   	return 0;
>   }
>   
> +/* For drm_panic */
> +static int virtio_gpu_panic_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
> +					      struct virtio_gpu_vbuffer *vbuf)
> +{
> +	struct scatterlist *sgs[3], vcmd, vresp;
> +	int elemcnt = 0, outcnt = 0, incnt = 0, ret;
> +
> +	/* set up vcmd */
> +	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
> +	elemcnt++;
> +	sgs[outcnt] = &vcmd;
> +	outcnt++;
> +
> +	/* set up vresp */
> +	if (vbuf->resp_size) {
> +		sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
> +		elemcnt++;
> +		sgs[outcnt + incnt] = &vresp;
> +		incnt++;
> +	}
> +
> +	ret = virtio_gpu_panic_queue_ctrl_sgs(vgdev, vbuf,
> +					      elemcnt, sgs,
> +					      outcnt, incnt);
> +	return ret;
> +}
> +
>   static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>   					       struct virtio_gpu_vbuffer *vbuf,
>   					       struct virtio_gpu_fence *fence)
> @@ -422,6 +471,21 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>   	return ret;
>   }
>   
> +/* For drm_panic */
> +void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev)
> +{
> +	bool notify;
> +
> +	if (!atomic_read(&vgdev->pending_commands))
> +		return;
> +
> +	atomic_set(&vgdev->pending_commands, 0);
> +	notify = virtqueue_kick_prepare(vgdev->ctrlq.vq);
> +
> +	if (notify)
> +		virtqueue_notify(vgdev->ctrlq.vq);
> +}
> +
>   void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
>   {
>   	bool notify;
> @@ -567,6 +631,44 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
>   	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>   }
>   
> +/* For drm_panic */
> +static void virtio_gpu_panic_init_cmd(struct virtio_gpu_device *vgdev,
> +				      struct virtio_gpu_vbuffer *vbuf,
> +				      int cmd_size)
> +{
> +	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
> +	vbuf->size = cmd_size;
> +	vbuf->resp_cb = NULL;
> +	vbuf->resp_size = sizeof(struct virtio_gpu_ctrl_hdr);
> +	vbuf->resp_buf = (void *)vbuf->buf + cmd_size;
> +}
> +
> +/* For drm_panic */
> +int virtio_gpu_panic_cmd_resource_flush(struct virtio_gpu_device *vgdev,
> +					struct virtio_gpu_vbuffer *vbuf,
> +					uint32_t resource_id,
> +					uint32_t x, uint32_t y,
> +					uint32_t width, uint32_t height)
> +{
> +	int ret;
> +	struct virtio_gpu_resource_flush *cmd_p;
> +
> +	virtio_gpu_panic_init_cmd(vgdev, vbuf,
> +				  sizeof(struct virtio_gpu_resource_flush));
> +	cmd_p = (void *)vbuf->buf;
> +	vbuf->objs = NULL;
> +
> +	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_FLUSH);
> +	cmd_p->resource_id = cpu_to_le32(resource_id);
> +	cmd_p->r.width = cpu_to_le32(width);
> +	cmd_p->r.height = cpu_to_le32(height);
> +	cmd_p->r.x = cpu_to_le32(x);
> +	cmd_p->r.y = cpu_to_le32(y);
> +
> +	ret = virtio_gpu_panic_queue_ctrl_buffer(vgdev, vbuf);
> +	return ret;
> +}
> +
>   void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
>   				   uint32_t resource_id,
>   				   uint32_t x, uint32_t y,
> @@ -591,6 +693,40 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
>   	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
>   }
>   
> +/* For drm_panic */
> +int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
> +					     uint64_t offset,
> +					     uint32_t width, uint32_t height,
> +					     uint32_t x, uint32_t y,
> +					     struct virtio_gpu_object_array *objs,
> +					     struct virtio_gpu_vbuffer *vbuf)
> +{
> +	int ret;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
> +	struct virtio_gpu_transfer_to_host_2d *cmd_p;
> +	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
> +
> +	if (virtio_gpu_is_shmem(bo) && use_dma_api)
> +		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
> +					    bo->base.sgt, DMA_TO_DEVICE);
> +
> +	virtio_gpu_panic_init_cmd(vgdev, vbuf,
> +				  sizeof(struct virtio_gpu_transfer_to_host_2d));
> +	cmd_p = (void *)vbuf->buf;
> +	vbuf->objs = objs;
> +
> +	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
> +	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +	cmd_p->offset = cpu_to_le64(offset);
> +	cmd_p->r.width = cpu_to_le32(width);
> +	cmd_p->r.height = cpu_to_le32(height);
> +	cmd_p->r.x = cpu_to_le32(x);
> +	cmd_p->r.y = cpu_to_le32(y);
> +
> +	ret = virtio_gpu_panic_queue_ctrl_buffer(vgdev, vbuf);
> +	return ret;
> +}
> +
>   void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>   					uint64_t offset,
>   					uint32_t width, uint32_t height,

