Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFAB36DE2E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9526E10F;
	Wed, 28 Apr 2021 17:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3DF6E153;
 Wed, 28 Apr 2021 17:23:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C3C06143A;
 Wed, 28 Apr 2021 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619630638;
 bh=kYk8tSr7GIr6TlUOGk3attbXyhbPQUViB/mzOqZB+UQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EyJbEFLQ9OSeQbwlXPv2F80PPfv6zG/lT1t4bbW/jw0OhA7QLxBTrzpkOeyaNWLMq
 hiy6mymgU8HjSJugOWgI6FwwDRoPPuW3Gq3hhbC6MyvjAN314HQ+lmjQciWQayN4Vi
 azJ86Fhwq+EE7b/06ySeLATkTcqlloPB2GblpSe92wv65Ii7uAKEYO1yGp0R7dJAOs
 LkuV/lCWzEsAVh4HaZNL9lFTa7bM4DiQSy/rbtWi/2NmkcLYFVb0CUym2yQ4UdWH68
 VwqRgpTwHtTKhoBVYQjA83egIP64aP+2/XD9d5ZkjRuir/QBq1mU5bGxL6tdvoqNQq
 OG+0uOijWxx+g==
Date: Wed, 28 Apr 2021 12:23:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 09/27] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
Message-ID: <20210428172357.GA241173@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428151207.1212258-10-andrey.grodzovsky@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In subject,

s/dmr/drm/
s/Move some/Move/ ("some" consumes space without adding meaning)

Or maybe something like: 

  drm/amdgpu: Convert driver sysfs attributes to static attributes

On Wed, Apr 28, 2021 at 11:11:49AM -0400, Andrey Grodzovsky wrote:
> This allows to remove explicit creation and destruction
> of those attrs and by this avoids warnings on device
> finilizing post physical device extraction.

s/finilizing/finalizing/

> v5: Use newly added pci_driver.dev_groups directly

I don't know the DRM convention, but IMO, change notes like "v5: Use
..." can go after "---" so they don't go in the git log.  To me,
they're useful during review, but not after being merged.

I love the patch!  Much cleaner than creating/removing all these
attributes explicitly.

> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 13 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 25 ++++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 ++++-------
>  4 files changed, 37 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> index 86add0f4ea4d..0346e124ab8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> @@ -1953,6 +1953,15 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
>  static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
>  		   NULL);
>  
> +static struct attribute *amdgpu_vbios_version_attrs[] = {
> +	&dev_attr_vbios_version.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_vbios_version_attr_group = {
> +	.attrs = amdgpu_vbios_version_attrs
> +};
> +
>  /**
>   * amdgpu_atombios_fini - free the driver info and callbacks for atombios
>   *
> @@ -1972,7 +1981,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
>  	adev->mode_info.atom_context = NULL;
>  	kfree(adev->mode_info.atom_card_info);
>  	adev->mode_info.atom_card_info = NULL;
> -	device_remove_file(adev->dev, &dev_attr_vbios_version);
>  }
>  
>  /**
> @@ -1989,7 +1997,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
>  {
>  	struct card_info *atom_card_info =
>  	    kzalloc(sizeof(struct card_info), GFP_KERNEL);
> -	int ret;
>  
>  	if (!atom_card_info)
>  		return -ENOMEM;
> @@ -2027,12 +2034,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
>  		amdgpu_atombios_allocate_fb_scratch(adev);
>  	}
>  
> -	ret = device_create_file(adev->dev, &dev_attr_vbios_version);
> -	if (ret) {
> -		DRM_ERROR("Failed to create device file for VBIOS version\n");
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 54cb5ee2f563..f799c40d7e72 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1605,6 +1605,18 @@ static struct pci_error_handlers amdgpu_pci_err_handler = {
>  	.resume		= amdgpu_pci_resume,
>  };
>  
> +extern const struct attribute_group amdgpu_vram_mgr_attr_group;
> +extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> +extern const struct attribute_group amdgpu_vbios_version_attr_group;
> +
> +static const struct attribute_group *amdgpu_sysfs_groups[] = {
> +	&amdgpu_vram_mgr_attr_group,
> +	&amdgpu_gtt_mgr_attr_group,
> +	&amdgpu_vbios_version_attr_group,
> +	NULL,
> +};
> +
> +
>  static struct pci_driver amdgpu_kms_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -1613,6 +1625,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>  	.shutdown = amdgpu_pci_shutdown,
>  	.driver.pm = &amdgpu_pm_ops,
>  	.err_handler = &amdgpu_pci_err_handler,
> +	.dev_groups = amdgpu_sysfs_groups,
>  };
>  
>  static int __init amdgpu_init(void)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 8980329cded0..3b7150e1c5ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -77,6 +77,16 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
>  static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
>  	           amdgpu_mem_info_gtt_used_show, NULL);
>  
> +static struct attribute *amdgpu_gtt_mgr_attributes[] = {
> +	&dev_attr_mem_info_gtt_total.attr,
> +	&dev_attr_mem_info_gtt_used.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_gtt_mgr_attr_group = {
> +	.attrs = amdgpu_gtt_mgr_attributes
> +};
> +
>  static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
>  /**
>   * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
> @@ -91,7 +101,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
>  	uint64_t start, size;
> -	int ret;
>  
>  	man->use_tt = true;
>  	man->func = &amdgpu_gtt_mgr_func;
> @@ -104,17 +113,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  	spin_lock_init(&mgr->lock);
>  	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
>  
> -	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
> -	if (ret) {
> -		DRM_ERROR("Failed to create device file mem_info_gtt_total\n");
> -		return ret;
> -	}
> -	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_used);
> -	if (ret) {
> -		DRM_ERROR("Failed to create device file mem_info_gtt_used\n");
> -		return ret;
> -	}
> -
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
>  	ttm_resource_manager_set_used(man, true);
>  	return 0;
> @@ -144,9 +142,6 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
>  	drm_mm_takedown(&mgr->mm);
>  	spin_unlock(&mgr->lock);
>  
> -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
> -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
> -
>  	ttm_resource_manager_cleanup(man);
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index c89b66bb70e2..68369b38aebb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -154,7 +154,7 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
>  static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
>  		   amdgpu_mem_info_vram_vendor, NULL);
>  
> -static const struct attribute *amdgpu_vram_mgr_attributes[] = {
> +static struct attribute *amdgpu_vram_mgr_attributes[] = {
>  	&dev_attr_mem_info_vram_total.attr,
>  	&dev_attr_mem_info_vis_vram_total.attr,
>  	&dev_attr_mem_info_vram_used.attr,
> @@ -163,6 +163,10 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
>  	NULL
>  };
>  
> +const struct attribute_group amdgpu_vram_mgr_attr_group = {
> +	.attrs = amdgpu_vram_mgr_attributes
> +};
> +
>  static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
>  
>  /**
> @@ -176,7 +180,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  {
>  	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> -	int ret;
>  
>  	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
>  
> @@ -187,11 +190,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  	INIT_LIST_HEAD(&mgr->reservations_pending);
>  	INIT_LIST_HEAD(&mgr->reserved_pages);
>  
> -	/* Add the two VRAM-related sysfs files */
> -	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
> -	if (ret)
> -		DRM_ERROR("Failed to register sysfs\n");
> -
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
>  	ttm_resource_manager_set_used(man, true);
>  	return 0;
> @@ -229,8 +227,6 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>  	drm_mm_takedown(&mgr->mm);
>  	spin_unlock(&mgr->lock);
>  
> -	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
> -
>  	ttm_resource_manager_cleanup(man);
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
>  }
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
