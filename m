Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1656BBAF0CB
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 05:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AD510E2EE;
	Wed,  1 Oct 2025 03:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WUJrVSzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86B010E2EE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759287777; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EgVZfYwxb3fifqc4AKUSn3daktcogXMSb0i56thhbTJ1WncbEKm7Nv/n5P+1rHqbREmg58kmJCsAjtOzPT+dfuKTYXS5tpWipAUbb9Jj1xsry8GKfD+pag2/K8m12sXMVzpGuXtpwESiNLjY45VfhSsE80zxCd2OM1SgQdjnAlc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759287777;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=q5KkJ/GT81WtuIS93xgn3rqneAy2pH2I7bk91WX29Ww=; 
 b=nFZV8ZrERBRZq6+BDecE2k1q2eXSs/c8hbAPg51amTvpFwbIQlWYCgfvhJOfhVcr0N5bVJqgft0flLPYb7zpVr80B5LETDoZa1Z3QvRGIynzDW7NcuRBK99jj3eBBDtTitR9hs+bklANChDobcmTr+zRuKxRKCU9kurYYGL+pAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759287777; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=q5KkJ/GT81WtuIS93xgn3rqneAy2pH2I7bk91WX29Ww=;
 b=WUJrVSzHoE3I+2+0z/LuqivMTyBVN4oIxdJ58LzgRSU2ZyG2EGhgr9abzyAAnAJZ
 7yYltdOPf4oSHXJkgTrLoVxHf9u3jZkXdd8sXNdtyq9Y97ElNURoRYxMnrW3M+UZ6ti
 peYNUbi9xlxw1EBSiINGDtLTBzY4qWMl6zCIfd1g=
Received: by mx.zohomail.com with SMTPS id 1759287776070842.3691735322553;
 Tue, 30 Sep 2025 20:02:56 -0700 (PDT)
Message-ID: <ac7854f3-ca14-401d-b801-3ceda9f8d5e3@collabora.com>
Date: Wed, 1 Oct 2025 06:02:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation
 resume via PM notifier
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-4-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924194755.1265531-4-dongwon.kim@intel.com>
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
> Register a PM notifier in virtio-gpu to handle suspend/hibernate
> events. On PM_POST_HIBERNATION, it resubmits all GPU objects
> so that resources can properly recovered in QEMU after resume.
> 
> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 55f836378237..88a94e974088 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -278,6 +278,8 @@ struct virtio_gpu_device {
>  	uint64_t capset_id_mask;
>  	struct list_head cap_cache;
>  
> +	struct notifier_block pm_nb;
> +
>  	/* protects uuid state when exporting */
>  	spinlock_t resource_export_lock;
>  	/* protects map state and host_visible_mm */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 08f8e71a7072..e1b2cee30fa3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -26,9 +26,12 @@
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ring.h>
> +#include <linux/suspend.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <drm/drm_file.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_atomic_helper.h>
>  
>  #include "virtgpu_drv.h"
>  
> @@ -133,6 +136,21 @@ int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
>  	return 0;
>  }
>  
> +static int virtio_gpu_pm_notifier(struct notifier_block *nb, unsigned long mode,
> +				  void *data)
> +{
> +	struct virtio_gpu_device *vgdev = container_of(nb, struct virtio_gpu_device, pm_nb);
> +	int ret;
> +
> +	if (mode == PM_POST_HIBERNATION) {
> +		ret = virtio_gpu_object_restore_all(vgdev);
> +		if (ret)
> +			DRM_ERROR("Failed to resubmit virtio-gpu objects\n");
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  {
>  	struct virtio_gpu_device *vgdev;
> @@ -268,6 +286,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  		wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
>  				   5 * HZ);
>  	}
> +
> +	vgdev->pm_nb.notifier_call = virtio_gpu_pm_notifier;
> +	ret = register_pm_notifier(&vgdev->pm_nb);
> +	if (ret)
> +		goto err_scanouts;
> +
>  	return 0;
>  
>  err_scanouts:
> @@ -299,6 +323,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
>  	flush_work(&vgdev->config_changed_work);
>  	virtio_reset_device(vgdev->vdev);
>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
> +	unregister_pm_notifier(&vgdev->pm_nb);
>  }
>  
>  void virtio_gpu_release(struct drm_device *dev)

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
