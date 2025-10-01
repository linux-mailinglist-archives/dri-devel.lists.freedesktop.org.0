Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14782BAF0D1
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 05:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B810E648;
	Wed,  1 Oct 2025 03:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="LU0WZVOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9506F10E641
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759287785; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=K6q+iGYuXF9jJthYYkky6q5+tcSQvr83aiyJsaMzPSExRJUZm2/hkbic5RJqUu+yLhiy/qnMcZCzXoUQI7lwa2GoLoYw6iqyTkd7R6Xer8mnjo16NpWpelUwAzlXQARflcoi5tcRO2p9LjELW6+agab8HC/BlfTkBDe8EJRHaCM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759287785;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=vB0GL2ldoU1OV9ZrxJKKmaEulNfS6uSAL+Igv8G8k8c=; 
 b=ZajLhIaZP76y0xkH3EJPV/j81XIzb9M6gLNABTWpMyGq/RaDRRkNpzmkM9UTJd3BgQRU0/UgQBpWPgNkZXYvKdbHmHbnnGDp0bVI8kT88fWf+7Q/S5TnhJXPoVx05VXbGmlYaGJcTr0eLemkO9gKa9F86cPcvIy4u3V97UcDWlw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759287785; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=vB0GL2ldoU1OV9ZrxJKKmaEulNfS6uSAL+Igv8G8k8c=;
 b=LU0WZVOacJyu42/4phH7Ze143PYryGHMouMIp/Whm7F5VOOoy3OkgCcDVbvduDq3
 FWrLj+J8NTd+sTMQC6bkXDaeCwIdUzdMLn5DkRoIlJIeOygGDV0sOeeaFeKhNLj9zxZ
 Agn9KkWu9m5tEspRLIAYQO5bDn441bX4lpSS63NE=
Received: by mx.zohomail.com with SMTPS id 1759287784057400.5600852721834;
 Tue, 30 Sep 2025 20:03:04 -0700 (PDT)
Message-ID: <b096ffe8-2ca4-4230-ba59-a4fff2541a7b@collabora.com>
Date: Wed, 1 Oct 2025 06:03:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/virtio: Freeze and restore hooks to support
 S3/S4
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-2-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924194755.1265531-2-dongwon.kim@intel.com>
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
> Implementing functions for .freeze and .restore hooks for virtio-gpu driver
> Just like other virtio-devices, all virtio gueues are removed then recreated
> during suspend/hiberation and resume cycle.
> 
> v2: 10ms sleep was added in virtgpu_freeze to avoid the situation
>     the driver is locked up during resumption.
> 
> v3: Plain 10ms delay was replaced with wait calls which wait until
>     the virtio queue is empty.
>     (Dmitry Osipenko)
> 
> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 60 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 23 ++++++++---
>  3 files changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 71c6ccad4b99..676893e90a9f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -163,6 +163,60 @@ static unsigned int features[] = {
>  	VIRTIO_GPU_F_RESOURCE_BLOB,
>  	VIRTIO_GPU_F_CONTEXT_INIT,
>  };
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int virtgpu_freeze(struct virtio_device *vdev)
> +{
> +	struct drm_device *dev = vdev->priv;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	int error;
> +
> +	error = drm_mode_config_helper_suspend(dev);
> +	if (error) {
> +		DRM_ERROR("suspend error %d\n", error);
> +		return error;
> +	}
> +
> +	flush_work(&vgdev->obj_free_work);
> +	flush_work(&vgdev->ctrlq.dequeue_work);
> +	flush_work(&vgdev->cursorq.dequeue_work);
> +	flush_work(&vgdev->config_changed_work);
> +
> +	wait_event(vgdev->ctrlq.ack_queue,
> +		   vgdev->ctrlq.vq->num_free == vgdev->ctrlq.vq->num_max);
> +
> +	wait_event(vgdev->cursorq.ack_queue,
> +		   vgdev->cursorq.vq->num_free == vgdev->cursorq.vq->num_max);
> +
> +	vdev->config->del_vqs(vdev);
> +
> +	return 0;
> +}
> +
> +static int virtgpu_restore(struct virtio_device *vdev)
> +{
> +	struct drm_device *dev = vdev->priv;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	int error;
> +
> +	error = virtio_gpu_find_vqs(vgdev);
> +	if (error) {
> +		DRM_ERROR("failed to find virt queues\n");
> +		return error;
> +	}
> +
> +	virtio_device_ready(vdev);
> +
> +	error = drm_mode_config_helper_resume(dev);
> +	if (error) {
> +		DRM_ERROR("resume error %d\n", error);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  static struct virtio_driver virtio_gpu_driver = {
>  	.feature_table = features,
>  	.feature_table_size = ARRAY_SIZE(features),
> @@ -171,7 +225,11 @@ static struct virtio_driver virtio_gpu_driver = {
>  	.probe = virtio_gpu_probe,
>  	.remove = virtio_gpu_remove,
>  	.shutdown = virtio_gpu_shutdown,
> -	.config_changed = virtio_gpu_config_changed
> +	.config_changed = virtio_gpu_config_changed,
> +#ifdef CONFIG_PM_SLEEP
> +	.freeze = virtgpu_freeze,
> +	.restore = virtgpu_restore,
> +#endif
>  };
>  
>  static int __init virtio_gpu_driver_init(void)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index f17660a71a3e..1279f998c8e0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -300,6 +300,7 @@ void virtio_gpu_deinit(struct drm_device *dev);
>  void virtio_gpu_release(struct drm_device *dev);
>  int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
>  void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
> +int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev);
>  
>  /* virtgpu_gem.c */
>  int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 1c15cbf326b7..cbebe19c3fb3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -114,15 +114,28 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
>  	vgdev->num_capsets = num_capsets;
>  }
>  
> -int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
> +int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
>  {
>  	struct virtqueue_info vqs_info[] = {
>  		{ "control", virtio_gpu_ctrl_ack },
>  		{ "cursor", virtio_gpu_cursor_ack },
>  	};
> -	struct virtio_gpu_device *vgdev;
> -	/* this will expand later */
>  	struct virtqueue *vqs[2];
> +	int ret;
> +
> +	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
> +	if (ret)
> +		return ret;
> +
> +	vgdev->ctrlq.vq = vqs[0];
> +	vgdev->cursorq.vq = vqs[1];
> +
> +	return 0;
> +}
> +
> +int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
> +{
> +	struct virtio_gpu_device *vgdev;
>  	u32 num_scanouts, num_capsets;
>  	int ret = 0;
>  
> @@ -206,13 +219,11 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  	DRM_INFO("features: %ccontext_init\n",
>  		 vgdev->has_context_init ? '+' : '-');
>  
> -	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
> +	ret = virtio_gpu_find_vqs(vgdev);
>  	if (ret) {
>  		DRM_ERROR("failed to find virt queues\n");
>  		goto err_vqs;
>  	}
> -	vgdev->ctrlq.vq = vqs[0];
> -	vgdev->cursorq.vq = vqs[1];
>  	ret = virtio_gpu_alloc_vbufs(vgdev);
>  	if (ret) {
>  		DRM_ERROR("failed to alloc vbufs\n");

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
