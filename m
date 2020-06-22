Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79D203589
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 13:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7476B6E3F7;
	Mon, 22 Jun 2020 11:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3496E40C;
 Mon, 22 Jun 2020 11:21:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 112FD206F1;
 Mon, 22 Jun 2020 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592824906;
 bh=lFek1BEUqA6xCz+il7aUmb2eH/+1UATeCOvsWK+H6Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JX0NSCWXK5vztXsp5GGe2fbAc1t/ZUVWI6c05FU9ujSFIGU31/YteobJ+JOSdqHtv
 gsiHPCMkQbfwWHn8/U7MJsp1NAbbnkiaYmMhz2AlIFA4to6T+vrJKUyjDz/T8AqY/4
 9R0g+L9fI6VvRSWlkQxhk0sPTJIGCGtgsBObKMIA=
Date: Mon, 22 Jun 2020 13:21:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
Message-ID: <20200622112139.GA3421602@kroah.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622095124.GE20149@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 11:51:24AM +0200, Daniel Vetter wrote:
> On Sun, Jun 21, 2020 at 02:03:05AM -0400, Andrey Grodzovsky wrote:
> > Track sysfs files in a list so they all can be removed during pci remove
> > since otherwise their removal after that causes crash because parent
> > folder was already removed during pci remove.

Huh?  That should not happen, do you have a backtrace of that crash?

> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> 
> Uh I thought sysfs just gets yanked completely. Please check with Greg KH
> whether hand-rolling all this really is the right solution here ... Feels
> very wrong. I thought this was all supposed to work by adding attributes
> before publishing the sysfs node, and then letting sysfs clean up
> everything. Not by cleaning up manually yourself.

Yes, that is supposed to be the correct thing to do.

> 
> Adding Greg for an authoritative answer.
> -Daniel
> 
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 13 +++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  7 +++++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 35 ++++++++++++++++++++++++----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 12 ++++++----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      |  8 ++++++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++++++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     | 13 ++++++++++-
> >  drivers/gpu/drm/amd/amdgpu/df_v3_6.c         | 10 +++++---
> >  8 files changed, 99 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 604a681..ba3775f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -726,6 +726,15 @@ struct amd_powerplay {
> >  
> >  #define AMDGPU_RESET_MAGIC_NUM 64
> >  #define AMDGPU_MAX_DF_PERFMONS 4
> > +
> > +struct amdgpu_sysfs_list_node {
> > +	struct list_head head;
> > +	struct device_attribute *attr;
> > +};

You know we have lists of attributes already, called attribute groups,
if you really wanted to do something like this.  But, I don't think so.

Either way, don't hand-roll your own stuff that the driver core has
provided for you for a decade or more, that's just foolish :)

> > +
> > +#define AMDGPU_DEVICE_ATTR_LIST_NODE(_attr) \
> > +	struct amdgpu_sysfs_list_node dev_attr_handle_##_attr = {.attr = &dev_attr_##_attr}
> > +
> >  struct amdgpu_device {
> >  	struct device			*dev;
> >  	struct drm_device		*ddev;
> > @@ -992,6 +1001,10 @@ struct amdgpu_device {
> >  	char				product_number[16];
> >  	char				product_name[32];
> >  	char				serial[16];
> > +
> > +	struct list_head sysfs_files_list;
> > +	struct mutex	 sysfs_files_list_lock;
> > +
> >  };
> >  
> >  static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> > index fdd52d8..c1549ee 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> > @@ -1950,8 +1950,10 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
> >  	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
> >  }
> >  
> > +
> >  static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
> >  		   NULL);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(vbios_version);
> >  
> >  /**
> >   * amdgpu_atombios_fini - free the driver info and callbacks for atombios
> > @@ -1972,7 +1974,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
> >  	adev->mode_info.atom_context = NULL;
> >  	kfree(adev->mode_info.atom_card_info);
> >  	adev->mode_info.atom_card_info = NULL;
> > -	device_remove_file(adev->dev, &dev_attr_vbios_version);
> >  }
> >  
> >  /**
> > @@ -2038,6 +2039,10 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
> >  		return ret;
> >  	}
> >  
> > +	mutex_lock(&adev->sysfs_files_list_lock);
> > +	list_add_tail(&dev_attr_handle_vbios_version.head, &adev->sysfs_files_list);
> > +	mutex_unlock(&adev->sysfs_files_list_lock);
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index e7b9065..3173046 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2928,6 +2928,12 @@ static const struct attribute *amdgpu_dev_attributes[] = {
> >  	NULL
> >  };
> >  
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(product_name);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(product_number);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(serial_number);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(pcie_replay_count);
> > +
> > +
> >  /**
> >   * amdgpu_device_init - initialize the driver
> >   *
> > @@ -3029,6 +3035,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >  	INIT_LIST_HEAD(&adev->shadow_list);
> >  	mutex_init(&adev->shadow_list_lock);
> >  
> > +	INIT_LIST_HEAD(&adev->sysfs_files_list);
> > +	mutex_init(&adev->sysfs_files_list_lock);
> > +
> >  	INIT_DELAYED_WORK(&adev->delayed_init_work,
> >  			  amdgpu_device_delayed_init_work_handler);
> >  	INIT_DELAYED_WORK(&adev->gfx.gfx_off_delay_work,
> > @@ -3281,6 +3290,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >  	if (r) {
> >  		dev_err(adev->dev, "Could not create amdgpu device attr\n");
> >  		return r;
> > +	} else {
> > +		mutex_lock(&adev->sysfs_files_list_lock);
> > +		list_add_tail(&dev_attr_handle_product_name.head, &adev->sysfs_files_list);
> > +		list_add_tail(&dev_attr_handle_product_number.head, &adev->sysfs_files_list);
> > +		list_add_tail(&dev_attr_handle_serial_number.head, &adev->sysfs_files_list);
> > +		list_add_tail(&dev_attr_handle_pcie_replay_count.head, &adev->sysfs_files_list);
> > +		mutex_unlock(&adev->sysfs_files_list_lock);
> >  	}
> >  
> >  	if (IS_ENABLED(CONFIG_PERF_EVENTS))
> > @@ -3298,6 +3314,16 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >  	return r;
> >  }
> >  
> > +static void amdgpu_sysfs_remove_files(struct amdgpu_device *adev)
> > +{
> > +	struct amdgpu_sysfs_list_node *node;
> > +
> > +	mutex_lock(&adev->sysfs_files_list_lock);
> > +	list_for_each_entry(node, &adev->sysfs_files_list, head)
> > +		device_remove_file(adev->dev, node->attr);
> > +	mutex_unlock(&adev->sysfs_files_list_lock);
> > +}
> > +
> >  /**
> >   * amdgpu_device_fini - tear down the driver
> >   *
> > @@ -3332,6 +3358,11 @@ void amdgpu_device_fini_early(struct amdgpu_device *adev)
> >  	amdgpu_fbdev_fini(adev);
> >  
> >  	amdgpu_irq_fini_early(adev);
> > +
> > +	amdgpu_sysfs_remove_files(adev);
> > +
> > +	if (adev->ucode_sysfs_en)
> > +		amdgpu_ucode_sysfs_fini(adev);
> >  }
> >  
> >  void amdgpu_device_fini_late(struct amdgpu_device *adev)
> > @@ -3366,10 +3397,6 @@ void amdgpu_device_fini_late(struct amdgpu_device *adev)
> >  	adev->rmmio = NULL;
> >  	amdgpu_device_doorbell_fini(adev);
> >  
> > -	if (adev->ucode_sysfs_en)
> > -		amdgpu_ucode_sysfs_fini(adev);
> > -
> > -	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
> >  	if (IS_ENABLED(CONFIG_PERF_EVENTS))
> >  		amdgpu_pmu_fini(adev);
> >  	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > index 6271044..e7b6c4a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > @@ -76,6 +76,9 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
> >  static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
> >  	           amdgpu_mem_info_gtt_used_show, NULL);
> >  
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_total);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_used);
> > +
> >  /**
> >   * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
> >   *
> > @@ -114,6 +117,11 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
> >  		return ret;
> >  	}
> >  
> > +	mutex_lock(&adev->sysfs_files_list_lock);
> > +	list_add_tail(&dev_attr_handle_mem_info_gtt_total.head, &adev->sysfs_files_list);
> > +	list_add_tail(&dev_attr_handle_mem_info_gtt_used.head, &adev->sysfs_files_list);
> > +	mutex_unlock(&adev->sysfs_files_list_lock);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -127,7 +135,6 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
> >   */
> >  static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
> >  {
> > -	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
> >  	struct amdgpu_gtt_mgr *mgr = man->priv;
> >  	spin_lock(&mgr->lock);
> >  	drm_mm_takedown(&mgr->mm);
> > @@ -135,9 +142,6 @@ static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
> >  	kfree(mgr);
> >  	man->priv = NULL;
> >  
> > -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
> > -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
> > -
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > index ddb4af0c..554fec0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > @@ -2216,6 +2216,8 @@ static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
> >  		   psp_usbc_pd_fw_sysfs_read,
> >  		   psp_usbc_pd_fw_sysfs_write);
> >  
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(usbc_pd_fw);
> > +
> >  
> >  
> >  const struct amd_ip_funcs psp_ip_funcs = {
> > @@ -2242,13 +2244,17 @@ static int psp_sysfs_init(struct amdgpu_device *adev)
> >  
> >  	if (ret)
> >  		DRM_ERROR("Failed to create USBC PD FW control file!");
> > +	else {
> > +		mutex_lock(&adev->sysfs_files_list_lock);
> > +		list_add_tail(&dev_attr_handle_usbc_pd_fw.head, &adev->sysfs_files_list);
> > +		mutex_unlock(&adev->sysfs_files_list_lock);
> > +	}
> >  
> >  	return ret;
> >  }
> >  
> >  static void psp_sysfs_fini(struct amdgpu_device *adev)
> >  {
> > -	device_remove_file(adev->dev, &dev_attr_usbc_pd_fw);
> >  }
> >  
> >  const struct amdgpu_ip_block_version psp_v3_1_ip_block =
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > index 7723937..39c400c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > @@ -148,6 +148,12 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
> >  static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
> >  		   amdgpu_mem_info_vram_vendor, NULL);
> >  
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_total);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_total);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_used);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_used);
> > +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_vendor);

Converting all of these individual attributes to an attribute group
would be a nice thing to do anyway.  Makes your logic much simpler and
less error-prone.

But again, the driver core should do all of the device file removal
stuff automatically for you when your PCI device is removed from the
system _UNLESS_ you are doing crazy things like creating child devices
or messing with raw kobjects or other horrible things that I haven't
read the code to see if you are, but hopefully not :)

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
