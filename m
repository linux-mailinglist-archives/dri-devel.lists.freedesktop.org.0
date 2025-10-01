Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB6FBAF0CE
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 05:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04DB10E2F3;
	Wed,  1 Oct 2025 03:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="hrveZ338";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A32A10E2F3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759287779; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IDPbSM18tn7bsPS0u0YxmJUU1OIxRye4oZPRNvED2E5KrJMOk6pP7oIqGDzUdD+9nda+XiaseZh/QoyEfCMj3bJD6b28JwK1TSzVweO86ORUh68ot0TCS9X0wYjC41uaC58ZYJFIViURvS8bhxm40GRzeojFd5TbW7Q0QBvIZDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759287779;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=JNsgWpeXNSLkTNoVBYcij5gHLmpFzq+sURropVXaZ6E=; 
 b=dxrr+FnFNfujBSeX7yuB4bOz/RB2CiDzhi7opIvx94gwO63Oyt1EP+sFWQFC/S7NdsuZm7Vo9ZhwNET0KwkFl9yVILIZqIcN0nUhs0co1bcj3GVmcfZLOwa1SeChylkKZ6vSL5ViNbBwG1dqwe2Fa4CHVqRpUQyojxOAYkpKBW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759287779; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=JNsgWpeXNSLkTNoVBYcij5gHLmpFzq+sURropVXaZ6E=;
 b=hrveZ338JVPgAOY6UMrPRnxa0mqMRNdvh/cyU7D3DFg8Wcf1jsHXtnHj5n2Hfh+J
 VNqrYhKRs9SUMNBvWM+zEqkVuNAK1hlxVA/HUHkczLI1Pm2GOjJd+AoSCListND/fyw
 Itw8qrKsLqIK5PNj/kFx8Hfo1FZy7d9C/3k4BkTU=
Received: by mx.zohomail.com with SMTPS id 1759287777927677.4075576874828;
 Tue, 30 Sep 2025 20:02:57 -0700 (PDT)
Message-ID: <69b85c4b-7a6c-4fa9-b91d-6acc3d8605a0@collabora.com>
Date: Wed, 1 Oct 2025 06:02:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924194755.1265531-3-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 9/24/25 22:47, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> When the host KVM/QEMU resumes from hibernation, it loses all graphics
> resources previously submitted by the guest OS, as the QEMU process is
> terminated during the suspend-resume cycle. This leads to invalid resource
> errors when the guest OS attempts to interact with the host using those
> resources after resumption.
> 
> To resolve this, the virtio-gpu driver now tracks all active virtio_gpu_objects
> and provides a mechanism to restore them by re-submitting the objects to QEMU
> when needed (e.g., during resume from hibernation).
> 
> v2: - Attach backing is done if bo->attached was set before
> 
> v3: - Restoration of virtio-gpu resources is no longer triggered via .restore;
>       instead, it is handled by a PM notifier only during hibernation.
> 
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 10 ++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c    |  1 +
>  drivers/gpu/drm/virtio/virtgpu_object.c | 71 +++++++++++++++++++++++++
>  3 files changed, 82 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 1279f998c8e0..55f836378237 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -126,6 +126,12 @@ struct virtio_gpu_object_array {
>  	struct drm_gem_object *objs[] __counted_by(total);
>  };
>  
> +struct virtio_gpu_object_restore {
> +	struct virtio_gpu_object *bo;
> +	struct virtio_gpu_object_params params;
> +	struct list_head node;
> +};
> +
>  struct virtio_gpu_vbuffer;
>  struct virtio_gpu_device;
>  
> @@ -265,6 +271,7 @@ struct virtio_gpu_device {
>  	struct work_struct obj_free_work;
>  	spinlock_t obj_free_lock;
>  	struct list_head obj_free_list;
> +	struct list_head obj_restore;
>  
>  	struct virtio_gpu_drv_capset *capsets;
>  	uint32_t num_capsets;
> @@ -479,6 +486,9 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
>  
>  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
>  			       uint32_t *resid);
> +
> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev);
> +
>  /* virtgpu_prime.c */
>  int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
>  				    struct virtio_gpu_object *bo);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index cbebe19c3fb3..08f8e71a7072 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -162,6 +162,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  	vgdev->fence_drv.context = dma_fence_context_alloc(1);
>  	spin_lock_init(&vgdev->fence_drv.lock);
>  	INIT_LIST_HEAD(&vgdev->fence_drv.fences);
> +	INIT_LIST_HEAD(&vgdev->obj_restore);
>  	INIT_LIST_HEAD(&vgdev->cap_cache);
>  	INIT_WORK(&vgdev->config_changed_work,
>  		  virtio_gpu_config_changed_work_func);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index e6363c887500..28fdfc70fa49 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -61,6 +61,38 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
>  		ida_free(&vgdev->resource_ida, id - 1);
>  }
>  
> +static void virtio_gpu_object_add_restore_list(struct virtio_gpu_device *vgdev,
> +					       struct virtio_gpu_object *bo,
> +					       struct virtio_gpu_object_params *params)
> +{
> +	struct virtio_gpu_object_restore *new;
> +
> +	new = kvmalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new) {
> +		DRM_ERROR("Fail to allocate virtio_gpu_object_restore");
> +		return;
> +	}
> +
> +	new->bo = bo;
> +	memcpy(&new->params, params, sizeof(*params));
> +
> +	list_add_tail(&new->node, &vgdev->obj_restore);
> +}
> +
> +static void virtio_gpu_object_del_restore_list(struct virtio_gpu_device *vgdev,
> +					       struct virtio_gpu_object *bo)
> +{
> +	struct virtio_gpu_object_restore *curr, *tmp;
> +
> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
> +		if (bo == curr->bo) {
> +			list_del(&curr->node);
> +			kvfree(curr);
> +			break;
> +		}
> +	}
> +}
> +
>  void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>  {
>  	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> @@ -84,6 +116,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>  		drm_gem_object_release(&bo->base.base);
>  		kfree(bo);
>  	}
> +	virtio_gpu_object_del_restore_list(vgdev, bo);
>  }
>  
>  static void virtio_gpu_free_object(struct drm_gem_object *obj)
> @@ -258,6 +291,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>  	}
>  
> +	/* add submitted object to restore list */
> +	virtio_gpu_object_add_restore_list(vgdev, bo, params);
>  	*bo_ptr = bo;
>  	return 0;
>  
> @@ -271,3 +306,39 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  	drm_gem_shmem_free(shmem_obj);
>  	return ret;
>  }
> +
> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
> +{
> +	struct virtio_gpu_object_restore *curr, *tmp;
> +	struct virtio_gpu_mem_entry *ents;
> +	unsigned int nents;
> +	int ret;
> +
> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
> +		ret = virtio_gpu_object_shmem_init(vgdev, curr->bo, &ents, &nents);
> +		if (ret)
> +			break;
> +
> +		if (curr->params.blob) {
> +			virtio_gpu_cmd_resource_create_blob(vgdev, curr->bo, &curr->params,
> +							    ents, nents);
> +		} else if (curr->params.virgl) {
> +			virtio_gpu_cmd_resource_create_3d(vgdev, curr->bo, &curr->params,
> +							  NULL, NULL);
> +
> +			if (curr->bo->attached) {
> +				curr->bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
> +			}
> +		} else {
> +			virtio_gpu_cmd_create_resource(vgdev, curr->bo, &curr->params,
> +						       NULL, NULL);
> +			if (curr->bo->attached) {
> +				curr->bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
