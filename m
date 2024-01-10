Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E568D8297E5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2310E73F;
	Wed, 10 Jan 2024 10:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F56610E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:48:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-557678c50feso818864a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704883680; x=1705488480; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C+qZeuaWTWVR2GNELf3bh21gU+G+3ouJJGGegnUo4u8=;
 b=g3ehZxQgBzDRz1lX9SzVB8anAQ792tP2ktNF6Bn2/vrOQbRjl/ZQiiK0yShJrHaPLz
 3VqhrIRqlgnjQbyfNfAqZ4SAj5o/3ZHqogt6rgFiWi9RIZguNgBDAs0M9u57i2lTi88z
 eYTC9PZZqYCII4H0Gk1FRqHnpR8WYPhvJa3VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704883680; x=1705488480;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C+qZeuaWTWVR2GNELf3bh21gU+G+3ouJJGGegnUo4u8=;
 b=ALMzpEVbUOMk9Bq07B+7b2NgO52H5E/6UXo77+fArENXBGdAVgnw+BGIQsdHxCW56j
 HyfHpMcjxRhT6V/0ByWpWqF9nfO7fqdpCG9lMF6shnuRxoZkXm3IOLI2ptfAtH6GD2qp
 hH4ajJt8gjW0FlDCyt86RGRTWJ7GFgfUzNLGvCDiw0pSdFHu5kiEnz7QIm0wAZFq1a7T
 MUwg6dZWPaSxZJu+6mRw/GzAztreg0Cld/uvf9ypw+ndvZMf4qAnjNF7pzpfXjQTv3vS
 kIxIHSFw55Fg3+yHIcu/PAJKqhO0OSHrD4HTQrNeGpIn06itc6HM8ysZWuhOpxhnFAAw
 0fcQ==
X-Gm-Message-State: AOJu0YwJI5rrV53nf0cyUV4oLayXnUW/Ot9g4g5xKVr2HI8KRQCpG5Gg
 AvDtrnZhm3CFYN62WfJARRoXHjwNQbN06g==
X-Google-Smtp-Source: AGHT+IFDoMaM95651axDNn2Xefy+pLPUZ6pL+i//Un1SRlqb8vlxbpTLkrNSFBNOJKJOoWtzzSZwDg==
X-Received: by 2002:a17:907:2597:b0:a27:4531:719f with SMTP id
 ad23-20020a170907259700b00a274531719fmr873908ejc.2.1704883679938; 
 Wed, 10 Jan 2024 02:47:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v27-20020a170906181b00b00a2ae0aa9002sm1963891eje.40.2024.01.10.02.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:47:59 -0800 (PST)
Date: Wed, 10 Jan 2024 11:47:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Zhang <julia.zhang@amd.com>
Subject: Re: [PATCH 1/1] drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl
Message-ID: <ZZ513SSvYSElj1D2@phenom.ffwll.local>
Mail-Followup-To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Stone <daniels@collabora.com>
References: <20231221100016.4022353-1-julia.zhang@amd.com>
 <20231221100016.4022353-2-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221100016.4022353-2-julia.zhang@amd.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
 amd-gfx@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 06:00:16PM +0800, Julia Zhang wrote:
> From: Daniel Stone <daniels@collabora.com>
> 
> Add a new ioctl to allow the guest VM to discover how the guest
> actually allocated the underlying buffer, which allows buffers to
> be used for GL<->Vulkan interop and through standard window systems.
> It's also a step towards properly supporting modifiers in the guest.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Co-developed-by: Julia Zhang <julia.zhang@amd.com> # support query
> stride before it's created
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 22 ++++++++-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 66 ++++++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  8 +++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 63 ++++++++++++++++++++++++
>  include/uapi/drm/virtgpu_drm.h         | 21 ++++++++
>  include/uapi/linux/virtio_gpu.h        | 30 ++++++++++++
>  7 files changed, 208 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 4334c7608408..98061b714b98 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -148,6 +148,7 @@ static unsigned int features[] = {
>  	VIRTIO_GPU_F_RESOURCE_UUID,
>  	VIRTIO_GPU_F_RESOURCE_BLOB,
>  	VIRTIO_GPU_F_CONTEXT_INIT,
> +	VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT,
>  };
>  static struct virtio_driver virtio_gpu_driver = {
>  	.feature_table = features,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 96365a772f77..bb5edcfeda54 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -214,6 +214,16 @@ struct virtio_gpu_drv_cap_cache {
>  	atomic_t is_valid;
>  };
>  
> +struct virtio_gpu_query_info {
> +	uint32_t num_planes;
> +	uint64_t modifier;
> +	struct {
> +		uint64_t offset;
> +		uint32_t stride;
> +	} planes[VIRTIO_GPU_MAX_RESOURCE_PLANES];
> +	atomic_t is_valid;
> +};
> +
>  struct virtio_gpu_device {
>  	struct drm_device *ddev;
>  
> @@ -246,6 +256,7 @@ struct virtio_gpu_device {
>  	bool has_resource_blob;
>  	bool has_host_visible;
>  	bool has_context_init;
> +	bool has_resource_query_layout;
>  	struct virtio_shm_region host_visible_region;
>  	struct drm_mm host_visible_mm;
>  
> @@ -277,7 +288,7 @@ struct virtio_gpu_fpriv {
>  };
>  
>  /* virtgpu_ioctl.c */
> -#define DRM_VIRTIO_NUM_IOCTLS 12
> +#define DRM_VIRTIO_NUM_IOCTLS 13
>  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
>  void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
>  
> @@ -420,6 +431,15 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
>  				uint32_t width, uint32_t height,
>  				uint32_t x, uint32_t y);
>  
> +int
> +virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
> +				   struct virtio_gpu_query_info *bo_info,
> +				   uint32_t width,
> +				   uint32_t height,
> +				   uint32_t format,
> +				   uint32_t bind,
> +				   uint32_t hw_res_handle);
> +
>  /* virtgpu_display.c */
>  int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index b24b11f25197..216c04314177 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -107,6 +107,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
>  	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
>  		value = vgdev->capset_id_mask;
>  		break;
> +	case VIRTGPU_PARAM_RESOURCE_QUERY_LAYOUT:
> +		value = vgdev->has_resource_query_layout ? 1 : 0;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -668,6 +671,65 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>  	return ret;
>  }
>  
> +static int virtio_gpu_resource_query_layout_ioctl(struct drm_device *dev,
> +						  void *data,
> +						  struct drm_file *file)
> +{
> +	struct drm_virtgpu_resource_query_layout *args = data;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct drm_gem_object *obj = NULL;
> +	struct virtio_gpu_object *bo = NULL;
> +	struct virtio_gpu_query_info bo_info = {0};
> +	int ret = 0;
> +	int i;
> +
> +	if (!vgdev->has_resource_query_layout) {
> +		DRM_ERROR("failing: no RQL on host\n");
> +		return -EINVAL;
> +	}
> +
> +	if (args->handle > 0) {
> +		obj = drm_gem_object_lookup(file, args->handle);
> +		if (obj == NULL) {
> +			DRM_ERROR("invalid handle 0x%x\n", args->handle);
> +			return -ENOENT;
> +		}
> +		bo = gem_to_virtio_gpu_obj(obj);
> +	}
> +
> +	ret = virtio_gpu_cmd_get_resource_layout(vgdev, &bo_info, args->width,
> +						 args->height, args->format,
> +						 args->bind, bo ? bo->hw_res_handle : 0);
> +	if (ret)
> +		goto out;
> +
> +	ret = wait_event_timeout(vgdev->resp_wq,
> +				 atomic_read(&bo_info.is_valid),
> +				 5 * HZ);
> +	if (!ret)
> +		goto out;
> +
> +valid:
> +	smp_rmb();

Please, please no hand-rolling of coherency/synchronization primitives
without writing an entire paper about why this is correct.

I've done a full-length talk about this:

https://blog.ffwll.ch/2023/07/eoss-prague-locking-engineering.html

See the "Level 3: Lockless Tricks" section here:

https://blog.ffwll.ch/2022/08/locking-hierarchy.html

To fix this please just use a struct completion, which is practically what
you hand-roll here.

Since I looked, on the patch itself: It would be good to add a lot more
context to this, like the userspace work and why exactly the kernel has to
be in the business of knowing all this stuff. Because generally it really
should not, ever: Userspace allocates buffers, userspace better knows how
it allocated its buffers and should share that through userspace protocol
(like wayland linux-dmabuf or x11 dri2/3). Why virtio breaks this needs a
big explainer imo.

Thanks, Sima

> +	WARN_ON(atomic_read(&bo_info.is_valid));
> +	args->num_planes = bo_info.num_planes;
> +	args->modifier = bo_info.modifier;
> +	for (i = 0; i < args->num_planes; i++) {
> +		args->planes[i].offset = bo_info.planes[i].offset;
> +		args->planes[i].stride = bo_info.planes[i].stride;
> +	}
> +	for (; i < VIRTIO_GPU_MAX_RESOURCE_PLANES; i++) {
> +		args->planes[i].offset = 0;
> +		args->planes[i].stride = 0;
> +	}
> +	ret = 0;
> +
> +out:
> +	if (obj)
> +		drm_gem_object_put(obj);
> +	return ret;
> +}
> +
>  struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
>  	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
>  			  DRM_RENDER_ALLOW),
> @@ -707,4 +769,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
>  
>  	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
>  			  DRM_RENDER_ALLOW),
> +
> +	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_QUERY_LAYOUT,
> +			  virtio_gpu_resource_query_layout_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 5a3b5aaed1f3..4f34f4145910 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -175,6 +175,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
>  		vgdev->has_resource_blob = true;
>  	}
> +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT)) {
> +		vgdev->has_resource_query_layout = true;
> +	}
>  	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
>  				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
>  		if (!devm_request_mem_region(&vgdev->vdev->dev,
> @@ -204,8 +207,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  		 vgdev->has_resource_blob ? '+' : '-',
>  		 vgdev->has_host_visible ? '+' : '-');
>  
> -	DRM_INFO("features: %ccontext_init\n",
> -		 vgdev->has_context_init ? '+' : '-');
> +	DRM_INFO("features: %ccontext_init %cresource_query_layout\n",
> +		 vgdev->has_context_init ? '+' : '-',
> +		 vgdev->has_resource_query_layout ? '+' : '-');
>  
>  	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index b1a00c0c25a7..26998a3ac4c2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1302,3 +1302,66 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
>  
>  	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>  }
> +
> +static void virtio_gpu_cmd_get_resource_layout_cb(struct virtio_gpu_device *vgdev,
> +						  struct virtio_gpu_vbuffer *vbuf)
> +{
> +	struct virtio_gpu_resp_resource_layout *resp =
> +		(struct virtio_gpu_resp_resource_layout *)vbuf->resp_buf;
> +	struct virtio_gpu_query_info *bo_info = vbuf->resp_cb_data;
> +	int i;
> +
> +	vbuf->resp_cb_data = NULL;
> +
> +	if (resp->hdr.type != VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT) {
> +		atomic_set(&bo_info->is_valid, 0);
> +		goto out;
> +	}
> +
> +	bo_info->modifier = le64_to_cpu(resp->modifier);
> +	bo_info->num_planes = le32_to_cpu(resp->num_planes);
> +	for (i = 0; i < bo_info->num_planes; i++) {
> +		bo_info->planes[i].stride = le32_to_cpu(resp->planes[i].stride);
> +		bo_info->planes[i].offset = le32_to_cpu(resp->planes[i].offset);
> +	}
> +	smp_wmb();
> +	atomic_set(&bo_info->is_valid, 1);
> +
> +out:
> +	wake_up_all(&vgdev->resp_wq);
> +}
> +
> +int virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
> +				       struct virtio_gpu_query_info *bo_info,
> +				       uint32_t width,
> +				       uint32_t height,
> +				       uint32_t format,
> +				       uint32_t bind,
> +				       uint32_t hw_res_handle)
> +{
> +	struct virtio_gpu_resource_query_layout *cmd_p;
> +	struct virtio_gpu_vbuffer *vbuf;
> +	void *resp_buf;
> +
> +	resp_buf = kzalloc(sizeof(struct virtio_gpu_resp_resource_layout),
> +			   GFP_KERNEL);
> +	if (!resp_buf)
> +		return -ENOMEM;
> +
> +	cmd_p = virtio_gpu_alloc_cmd_resp
> +		(vgdev, &virtio_gpu_cmd_get_resource_layout_cb, &vbuf,
> +		 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_resource_layout),
> +		 resp_buf);
> +	memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT);
> +	cmd_p->resource_id = cpu_to_le32(hw_res_handle);
> +	cmd_p->width = cpu_to_le32(width);
> +	cmd_p->height = cpu_to_le32(height);
> +	cmd_p->format = cpu_to_le32(format);
> +	cmd_p->bind = cpu_to_le32(bind);
> +	vbuf->resp_cb_data = bo_info;
> +
> +	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +	return 0;
> +}
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index b1d0e56565bc..66f7c0fa1d4d 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -48,6 +48,7 @@ extern "C" {
>  #define DRM_VIRTGPU_GET_CAPS  0x09
>  #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
>  #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
> +#define DRM_VIRTGPU_RESOURCE_QUERY_LAYOUT 0x0c
>  
>  #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
>  #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
> @@ -97,6 +98,7 @@ struct drm_virtgpu_execbuffer {
>  #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
>  #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
>  #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
> +#define VIRTGPU_PARAM_RESOURCE_QUERY_LAYOUT 8 /* DRM_VIRTGPU_RESOURCE_QUERY_LAYOUT (also needs cap) */
>  
>  struct drm_virtgpu_getparam {
>  	__u64 param;
> @@ -211,6 +213,21 @@ struct drm_virtgpu_context_init {
>  	__u64 ctx_set_params;
>  };
>  
> +#define VIRTIO_GPU_MAX_RESOURCE_PLANES 4
> +struct drm_virtgpu_resource_query_layout {
> +	__u32 handle;
> +	__u32 width;
> +	__u32 height;
> +	__u32 format;
> +	__u32 bind;
> +	__u32 num_planes;
> +	__u64 modifier;
> +	struct {
> +		__u64 offset;
> +		__u32 stride;
> +	} planes[VIRTIO_GPU_MAX_RESOURCE_PLANES];
> +};
> +
>  /*
>   * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is in
>   * effect.  The event size is sizeof(drm_event), since there is no additional
> @@ -261,6 +278,10 @@ struct drm_virtgpu_context_init {
>  	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,		\
>  		struct drm_virtgpu_context_init)
>  
> +#define DRM_IOCTL_VIRTGPU_RESOURCE_QUERY_LAYOUT				\
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_QUERY_LAYOUT,	\
> +		struct drm_virtgpu_resource_query_layout)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index f556fde07b76..547575232376 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -65,6 +65,11 @@
>   */
>  #define VIRTIO_GPU_F_CONTEXT_INIT        4
>  
> +/*
> + * VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT
> + */
> +#define VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT 5
> +
>  enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_UNDEFINED = 0,
>  
> @@ -95,6 +100,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_CMD_SUBMIT_3D,
>  	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
>  	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> +	VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT,
>  
>  	/* cursor commands */
>  	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
> @@ -108,6 +114,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_RESP_OK_EDID,
>  	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
>  	VIRTIO_GPU_RESP_OK_MAP_INFO,
> +	VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT,
>  
>  	/* error responses */
>  	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
> @@ -453,4 +460,27 @@ struct virtio_gpu_resource_unmap_blob {
>  	__le32 padding;
>  };
>  
> +/* VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT */
> +struct virtio_gpu_resource_query_layout {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__le32 resource_id;
> +	__le32 width;
> +	__le32 height;
> +	__le32 format;
> +	__le32 bind;
> +};
> +
> +
> +/* VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT */
> +#define VIRTIO_GPU_RES_MAX_PLANES 4
> +struct virtio_gpu_resp_resource_layout {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__le64 modifier;
> +	__le32 num_planes;
> +	struct virtio_gpu_resource_plane {
> +		__le64 offset;
> +		__le32 stride;
> +	} planes[VIRTIO_GPU_RES_MAX_PLANES];
> +};
> +
>  #endif
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
