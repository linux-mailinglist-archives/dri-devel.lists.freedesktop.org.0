Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76091D1B22
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 18:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EA76E258;
	Wed, 13 May 2020 16:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74816E258
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589387702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9XHzfeBd6Ycnq2E1cOGJb06yk0FxduAZPIKhSGyVhGI=;
 b=Nr8vlGiJ4XQqVQyCNyWv7nzNAibaGEhS/vlEqm+21Kjtq54KN3fIA+/ON4ZAlGTLpYzQcp
 3z4l3MpVZLHZ6h2+Sr07ha/5aD9NKE5E7WO7wUOVuVfA49PFGNLzrsIoFFbeaf67bNHErX
 UF40i6tj/lZCTfgW/NjWBscM8BvUYwE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-YvdGm_Z9Onq_DL6QNezhHg-1; Wed, 13 May 2020 12:34:58 -0400
X-MC-Unique: YvdGm_Z9Onq_DL6QNezhHg-1
Received: by mail-wr1-f71.google.com with SMTP id g10so8918748wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9XHzfeBd6Ycnq2E1cOGJb06yk0FxduAZPIKhSGyVhGI=;
 b=Y4f+8QHv/ML3UC/7XMMOpSwaEo0cKJF1RUBpO6GN06qun3UOjA8qYSdQT5YUNCpUI5
 LTIhtLZgXjJGl+NiBZOJih82H6SXC0ykV10kXtyaI9ksq93L2d/hHgmU9Ij9xNqy0428
 feMZooTwOWU4yjbKVKxJZndEUJGEcihA75cmis8eXGR1UikODH1H4WvSVDiz6TkRVyEk
 vXgw0urbqkgITrcE774rwlkHklv/ZALXyazYYGmsdVysYEPYVL1l+9jeeBXbRK8zSFz7
 jQn1+5pQ4hRAfMtCnUAbtf8i4f2iR29uhPSti2dwGuROdZEjQ/9jLfVI1bFIG//7B71R
 cpFg==
X-Gm-Message-State: AGi0PubyvRFmhyJ39ifYOV/ZbVQoSdW8xcQ67G1qJ+4tq/tuUAi+sEDZ
 Og4g453jb54U2tytPF6YZ9R+uY6yBIvf+hbigqlCZOeD3fSy4eE4nRVr//qzbGtbTX5DhaHOuMR
 NzkQi8JaJW/H/qFZQ+DgmnVvENnbL
X-Received: by 2002:a1c:b604:: with SMTP id g4mr20433238wmf.103.1589387696780; 
 Wed, 13 May 2020 09:34:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqiA2Xp0IN2p/gFQzld2/j/z7a01JqN+qAtpCQqjHgAHlWfHiJwq/aECdtAfuX0kd+FULJRA==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr20433202wmf.103.1589387696440; 
 Wed, 13 May 2020 09:34:56 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
 by smtp.gmail.com with ESMTPSA id z1sm36576406wmf.15.2020.05.13.09.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 09:34:55 -0700 (PDT)
Date: Wed, 13 May 2020 12:34:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200513123326-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200311112004.47138-5-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 08:20:04PM +0900, David Stevens wrote:
> Add support for UUID-based resource sharing mechanism to virtgpu. This
> implements the new virtgpu commands and hooks them up to dma-buf's
> get_uuid callback.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 18 +++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 41 +++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++
>  5 files changed, 118 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index ab4bed78e656..776e6667042e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -165,6 +165,7 @@ static unsigned int features[] = {
>  	VIRTIO_GPU_F_VIRGL,
>  #endif
>  	VIRTIO_GPU_F_EDID,
> +	VIRTIO_GPU_F_RESOURCE_UUID,
>  };
>  static struct virtio_driver virtio_gpu_driver = {
>  	.feature_table = features,
> @@ -202,7 +203,9 @@ static struct drm_driver driver = {
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_mmap = drm_gem_prime_mmap,
> +	.gem_prime_export = virtgpu_gem_prime_export,
>  	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
> +	.gem_prime_get_uuid = virtgpu_gem_prime_get_uuid,
>  
>  	.gem_create_object = virtio_gpu_create_object,
>  	.fops = &virtio_gpu_driver_fops,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index af9403e1cf78..fab65f0f5a4d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -49,6 +49,10 @@
>  #define DRIVER_MINOR 1
>  #define DRIVER_PATCHLEVEL 0
>  
> +#define UUID_INITIALIZING 0
> +#define UUID_INITIALIZED 1
> +#define UUID_INITIALIZATION_FAILED 2
> +
>  struct virtio_gpu_object_params {
>  	uint32_t format;
>  	uint32_t width;
> @@ -75,6 +79,9 @@ struct virtio_gpu_object {
>  
>  	bool dumb;
>  	bool created;
> +
> +	int uuid_state;
> +	uuid_t uuid;
>  };
>  #define gem_to_virtio_gpu_obj(gobj) \
>  	container_of((gobj), struct virtio_gpu_object, base.base)
> @@ -196,6 +203,7 @@ struct virtio_gpu_device {
>  	bool has_virgl_3d;
>  	bool has_edid;
>  	bool has_indirect;
> +	bool has_resource_assign_uuid;
>  
>  	struct work_struct config_changed_work;
>  
> @@ -206,6 +214,8 @@ struct virtio_gpu_device {
>  	struct virtio_gpu_drv_capset *capsets;
>  	uint32_t num_capsets;
>  	struct list_head cap_cache;
> +
> +	spinlock_t resource_export_lock;
>  };
>  
>  struct virtio_gpu_fpriv {
> @@ -338,6 +348,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
>  void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
>  
> +int
> +virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
> +				    struct virtio_gpu_object_array *objs);
> +
>  /* virtio_gpu_display.c */
>  void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> @@ -366,6 +380,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  			     struct virtio_gpu_object **bo_ptr,
>  			     struct virtio_gpu_fence *fence);
>  /* virtgpu_prime.c */
> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +					 int flags);
> +int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> +			       uuid_t *uuid);
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  	struct drm_device *dev, struct dma_buf_attachment *attach,
>  	struct sg_table *sgt);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 4009c2f97d08..5a2aeb6d2f35 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -134,6 +134,7 @@ int virtio_gpu_init(struct drm_device *dev)
>  	vgdev->dev = dev->dev;
>  
>  	spin_lock_init(&vgdev->display_info_lock);
> +	spin_lock_init(&vgdev->resource_export_lock);
>  	ida_init(&vgdev->ctx_id_ida);
>  	ida_init(&vgdev->resource_ida);
>  	init_waitqueue_head(&vgdev->resp_wq);
> @@ -162,6 +163,9 @@ int virtio_gpu_init(struct drm_device *dev)
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
>  		vgdev->has_indirect = true;
>  	}
> +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> +		vgdev->has_resource_assign_uuid = true;
> +	}


Just a question: this relies on DMA bufs so I assume it is
not really assumed to work when DMA API is bypassed, right?
Rather than worry what does it mean, how about just
disabling  this feature without PLATFORM_DMA for now?

>  
>  	DRM_INFO("features: %cvirgl %cedid\n",
>  		 vgdev->has_virgl_3d ? '+' : '-',
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 050d24c39a8f..7c6357f59877 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -26,9 +26,44 @@
>  
>  #include "virtgpu_drv.h"
>  
> -/* Empty Implementations as there should not be any other driver for a virtual
> - * device that might share buffers with virtgpu
> - */
> +int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> +			       uuid_t *uuid)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +
> +	wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
> +	if (bo->uuid_state != UUID_INITIALIZED)
> +		return -ENODEV;
> +
> +	uuid_copy(uuid, &bo->uuid);
> +
> +	return 0;
> +}
> +
> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +					 int flags)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct virtio_gpu_object_array *objs;
> +	int ret = 0;
> +
> +	if (vgdev->has_resource_assign_uuid) {
> +		objs = virtio_gpu_array_alloc(1);
> +		if (!objs)
> +			return ERR_PTR(-ENOMEM);
> +		virtio_gpu_array_add_obj(objs, &bo->base.base);
> +
> +		ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		bo->uuid_state = UUID_INITIALIZATION_FAILED;
> +  }
> +
> +	return drm_gem_prime_export(obj, flags);
> +}
>  
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  	struct drm_device *dev, struct dma_buf_attachment *attach,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index cfe9c54f87a3..b968eaa46bb0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1111,3 +1111,58 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
>  	memcpy(cur_p, &output->cursor, sizeof(output->cursor));
>  	virtio_gpu_queue_cursor(vgdev, vbuf);
>  }
> +
> +static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
> +					    struct virtio_gpu_vbuffer *vbuf)
> +{
> +	struct virtio_gpu_object *obj =
> +		gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
> +	struct virtio_gpu_resp_resource_uuid *resp =
> +		(struct virtio_gpu_resp_resource_uuid *)vbuf->resp_buf;
> +	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
> +
> +	spin_lock(&vgdev->resource_export_lock);
> +	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
> +
> +	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
> +			obj->uuid_state == UUID_INITIALIZING) {
> +		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
> +		obj->uuid_state = UUID_INITIALIZED;
> +	} else {
> +		obj->uuid_state = UUID_INITIALIZATION_FAILED;
> +	}
> +	spin_unlock(&vgdev->resource_export_lock);
> +
> +	wake_up_all(&vgdev->resp_wq);
> +}
> +
> +int
> +virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
> +				    struct virtio_gpu_object_array *objs)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
> +	struct virtio_gpu_resource_assign_uuid *cmd_p;
> +	struct virtio_gpu_vbuffer *vbuf;
> +	struct virtio_gpu_resp_resource_uuid *resp_buf;
> +
> +	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
> +	if (!resp_buf) {
> +		spin_lock(&vgdev->resource_export_lock);
> +		bo->uuid_state = UUID_INITIALIZATION_FAILED;
> +		spin_unlock(&vgdev->resource_export_lock);
> +		virtio_gpu_array_put_free(objs);
> +		return -ENOMEM;
> +	}
> +
> +	cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
> +		virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),
> +		sizeof(struct virtio_gpu_resp_resource_uuid), resp_buf);
> +	memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);
> +	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +
> +	vbuf->objs = objs;
> +	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +	return 0;
> +}
> -- 
> 2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
