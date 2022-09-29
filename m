Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425CA5EFB66
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A991A10EB3B;
	Thu, 29 Sep 2022 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E4D10EB3B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664470525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQjiwvr6S5lV8usREpdzXKjDN4TlUL9iWSrNpQhtESA=;
 b=WSeZy1evygcHoX9xf+sjuKBxOC+xAUNfIogeLvs5lDzeMMFpZH4E4DxREjht2Jt9rMRXV+
 kILffwgM1LbPTJwRwjUAZEG1XHBSHZEZ7gaB9t6Prx1dRp5ttwr5ovbw+u+wjwbvHiseMe
 6l8RF3qgKLLtkAN1rX3jqFkcQ/RI++g=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-D1070r50NYeuf-jJ_xGsUg-1; Thu, 29 Sep 2022 12:55:24 -0400
X-MC-Unique: D1070r50NYeuf-jJ_xGsUg-1
Received: by mail-il1-f197.google.com with SMTP id
 z4-20020a921a44000000b002f8da436b83so1506498ill.19
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=RQjiwvr6S5lV8usREpdzXKjDN4TlUL9iWSrNpQhtESA=;
 b=CplV8wH34jeK2sHJyAmZ76tqm9NKnXp/h2IFGXG1mzUOwYptfLlivvSVg4oj4POu6U
 7sHHwjyHLyMrlvx9E31soZwNC9A9jy6R8s9UuYSrBLOnzkBQh4Gku3othEGhl/V12Ibc
 J9i5lRH/vOmaZ7xOHrhRtGITAbu/ByIBdQ+7kIyhovQKaZUBanNjLs+7z2EZPwCdJH3H
 NrXt9jW4+rN4tMO4nMhyW6Q/hevsm8hmvOS2++0UJ+P0LTDGC3PSuFtIvTGYuE5eBtSW
 jCT5xKdNJ6KRQ+taITCMo+ea80xVuRCRiMuNT7wzqlkBn3CLjCgAu4C7PgAs3J3YKFBF
 VBog==
X-Gm-Message-State: ACrzQf2ZWwOn3EWo6huXc3nTZwgmmnBuKGiXMatoe6m4hkFmrtOKFwf8
 ixWwZEuBKR/00wUed7iS6aENHpZgyvKCPdmuF1xIb3CIBYPdXLhgZ9SqNLDSX6VLGdNSzwkzwWh
 fNqvqmYQlSlErfYXIPy3HvXIMQalf
X-Received: by 2002:a05:6638:1315:b0:35a:7c96:9737 with SMTP id
 r21-20020a056638131500b0035a7c969737mr2295887jad.302.1664470523507; 
 Thu, 29 Sep 2022 09:55:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mkt2EWia9wOjOYtm7HS/78Deb0xTalFmW+HBr2mznlyx7ZjLzWBXZ2b3KtC8/dcDQ+raHsg==
X-Received: by 2002:a05:6638:1315:b0:35a:7c96:9737 with SMTP id
 r21-20020a056638131500b0035a7c969737mr2295839jad.302.1664470523148; 
 Thu, 29 Sep 2022 09:55:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e3-20020a0566380cc300b0034c164e05c4sm3107915jak.177.2022.09.29.09.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:55:22 -0700 (PDT)
Date: Thu, 29 Sep 2022 10:55:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220929105519.5c9ae1d8.alex.williamson@redhat.com>
In-Reply-To: <20220921104401.38898-16-kevin.tian@intel.com>
References: <20220921104401.38898-1-kevin.tian@intel.com>
 <20220921104401.38898-16-kevin.tian@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

This introduced the regression discovered here:

https://lore.kernel.org/all/20220928125650.0a2ea297.alex.williamson@redhat.com/

Seems we're not releasing the resources when removing an mdev.  This is
a regression, so it needs to be fixed or reverted before the merge
window.  Thanks,

Alex

On Wed, 21 Sep 2022 18:44:01 +0800
Kevin Tian <kevin.tian@intel.com> wrote:

> From: Yi Liu <yi.l.liu@intel.com>
> 
> and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> sysfs path of the parent, indicating the device is bound to a vfio
> driver, e.g.:
> 
> /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> 
> It is also a preparatory step toward adding cdev for supporting future
> device-oriented uAPI.
> 
> Add Documentation/ABI/testing/sysfs-devices-vfio-dev.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../ABI/testing/sysfs-devices-vfio-dev        |  8 +++
>  MAINTAINERS                                   |  1 +
>  drivers/vfio/vfio_main.c                      | 64 +++++++++++++++----
>  include/linux/vfio.h                          |  6 +-
>  4 files changed, 65 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-vfio-dev
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> new file mode 100644
> index 000000000000..e21424fd9666
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> @@ -0,0 +1,8 @@
> +What:		 /sys/.../<device>/vfio-dev/vfioX/
> +Date:		 September 2022
> +Contact:	 Yi Liu <yi.l.liu@intel.com>
> +Description:
> +		 This directory is created when the device is bound to a
> +		 vfio driver. The layout under this directory matches what
> +		 exists for a standard 'struct device'. 'X' is a unique
> +		 index marking this device in vfio.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d30f26e07cd3..02c8f11b1c17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21312,6 +21312,7 @@ R:	Cornelia Huck <cohuck@redhat.com>
>  L:	kvm@vger.kernel.org
>  S:	Maintained
>  T:	git git://github.com/awilliam/linux-vfio.git
> +F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
>  F:	Documentation/driver-api/vfio.rst
>  F:	drivers/vfio/
>  F:	include/linux/vfio.h
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index c27449613a1d..f9d10dbcf3e6 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -49,6 +49,8 @@ static struct vfio {
>  	struct mutex			group_lock; /* locks group_list */
>  	struct ida			group_ida;
>  	dev_t				group_devt;
> +	struct class			*device_class;
> +	struct ida			device_ida;
>  } vfio;
>  
>  struct vfio_iommu_driver {
> @@ -485,12 +487,13 @@ static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
>   * VFIO driver API
>   */
>  /* Release helper called by vfio_put_device() */
> -void vfio_device_release(struct kref *kref)
> +static void vfio_device_release(struct device *dev)
>  {
>  	struct vfio_device *device =
> -			container_of(kref, struct vfio_device, kref);
> +			container_of(dev, struct vfio_device, device);
>  
>  	vfio_release_device_set(device);
> +	ida_free(&vfio.device_ida, device->index);
>  
>  	/*
>  	 * kvfree() cannot be done here due to a life cycle mess in
> @@ -500,7 +503,6 @@ void vfio_device_release(struct kref *kref)
>  	 */
>  	device->ops->release(device);
>  }
> -EXPORT_SYMBOL_GPL(vfio_device_release);
>  
>  /*
>   * Allocate and initialize vfio_device so it can be registered to vfio
> @@ -548,6 +550,13 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
>  {
>  	int ret;
>  
> +	ret = ida_alloc_max(&vfio.device_ida, MINORMASK, GFP_KERNEL);
> +	if (ret < 0) {
> +		dev_dbg(dev, "Error to alloc index\n");
> +		return ret;
> +	}
> +
> +	device->index = ret;
>  	init_completion(&device->comp);
>  	device->dev = dev;
>  	device->ops = ops;
> @@ -558,11 +567,15 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
>  			goto out_uninit;
>  	}
>  
> -	kref_init(&device->kref);
> +	device_initialize(&device->device);
> +	device->device.release = vfio_device_release;
> +	device->device.class = vfio.device_class;
> +	device->device.parent = device->dev;
>  	return 0;
>  
>  out_uninit:
>  	vfio_release_device_set(device);
> +	ida_free(&vfio.device_ida, device->index);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vfio_init_device);
> @@ -659,6 +672,7 @@ static int __vfio_register_dev(struct vfio_device *device,
>  		struct vfio_group *group)
>  {
>  	struct vfio_device *existing_device;
> +	int ret;
>  
>  	if (IS_ERR(group))
>  		return PTR_ERR(group);
> @@ -675,16 +689,21 @@ static int __vfio_register_dev(struct vfio_device *device,
>  		dev_WARN(device->dev, "Device already exists on group %d\n",
>  			 iommu_group_id(group->iommu_group));
>  		vfio_device_put_registration(existing_device);
> -		if (group->type == VFIO_NO_IOMMU ||
> -		    group->type == VFIO_EMULATED_IOMMU)
> -			iommu_group_remove_device(device->dev);
> -		vfio_group_put(group);
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto err_out;
>  	}
>  
>  	/* Our reference on group is moved to the device */
>  	device->group = group;
>  
> +	ret = dev_set_name(&device->device, "vfio%d", device->index);
> +	if (ret)
> +		goto err_out;
> +
> +	ret = device_add(&device->device);
> +	if (ret)
> +		goto err_out;
> +
>  	/* Refcounting can't start until the driver calls register */
>  	refcount_set(&device->refcount, 1);
>  
> @@ -693,6 +712,12 @@ static int __vfio_register_dev(struct vfio_device *device,
>  	mutex_unlock(&group->device_lock);
>  
>  	return 0;
> +err_out:
> +	if (group->type == VFIO_NO_IOMMU ||
> +	    group->type == VFIO_EMULATED_IOMMU)
> +		iommu_group_remove_device(device->dev);
> +	vfio_group_put(group);
> +	return ret;
>  }
>  
>  int vfio_register_group_dev(struct vfio_device *device)
> @@ -779,6 +804,9 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  	list_del(&device->group_next);
>  	mutex_unlock(&group->device_lock);
>  
> +	/* Balances device_add in register path */
> +	device_del(&device->device);
> +
>  	if (group->type == VFIO_NO_IOMMU || group->type == VFIO_EMULATED_IOMMU)
>  		iommu_group_remove_device(device->dev);
>  
> @@ -2362,6 +2390,7 @@ static int __init vfio_init(void)
>  	int ret;
>  
>  	ida_init(&vfio.group_ida);
> +	ida_init(&vfio.device_ida);
>  	mutex_init(&vfio.group_lock);
>  	mutex_init(&vfio.iommu_drivers_lock);
>  	INIT_LIST_HEAD(&vfio.group_list);
> @@ -2377,11 +2406,18 @@ static int __init vfio_init(void)
>  	vfio.class = class_create(THIS_MODULE, "vfio");
>  	if (IS_ERR(vfio.class)) {
>  		ret = PTR_ERR(vfio.class);
> -		goto err_class;
> +		goto err_group_class;
>  	}
>  
>  	vfio.class->devnode = vfio_devnode;
>  
> +	/* /sys/class/vfio-dev/vfioX */
> +	vfio.device_class = class_create(THIS_MODULE, "vfio-dev");
> +	if (IS_ERR(vfio.device_class)) {
> +		ret = PTR_ERR(vfio.device_class);
> +		goto err_dev_class;
> +	}
> +
>  	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1, "vfio");
>  	if (ret)
>  		goto err_alloc_chrdev;
> @@ -2398,9 +2434,12 @@ static int __init vfio_init(void)
>  err_driver_register:
>  	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
>  err_alloc_chrdev:
> +	class_destroy(vfio.device_class);
> +	vfio.device_class = NULL;
> +err_dev_class:
>  	class_destroy(vfio.class);
>  	vfio.class = NULL;
> -err_class:
> +err_group_class:
>  	misc_deregister(&vfio_dev);
>  	return ret;
>  }
> @@ -2412,8 +2451,11 @@ static void __exit vfio_cleanup(void)
>  #ifdef CONFIG_VFIO_NOIOMMU
>  	vfio_unregister_iommu_driver(&vfio_noiommu_ops);
>  #endif
> +	ida_destroy(&vfio.device_ida);
>  	ida_destroy(&vfio.group_ida);
>  	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
> +	class_destroy(vfio.device_class);
> +	vfio.device_class = NULL;
>  	class_destroy(vfio.class);
>  	vfio.class = NULL;
>  	misc_deregister(&vfio_dev);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 3cf857b1eec7..ee399a768070 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -47,7 +47,8 @@ struct vfio_device {
>  	struct kvm *kvm;
>  
>  	/* Members below here are private, not for driver use */
> -	struct kref kref;	/* object life cycle */
> +	unsigned int index;
> +	struct device device;	/* device.kref covers object life circle */
>  	refcount_t refcount;	/* user count on registered device*/
>  	unsigned int open_count;
>  	struct completion comp;
> @@ -178,10 +179,9 @@ struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
>  int vfio_init_device(struct vfio_device *device, struct device *dev,
>  		     const struct vfio_device_ops *ops);
>  void vfio_free_device(struct vfio_device *device);
> -void vfio_device_release(struct kref *kref);
>  static inline void vfio_put_device(struct vfio_device *device)
>  {
> -	kref_put(&device->kref, vfio_device_release);
> +	put_device(&device->device);
>  }
>  
>  int vfio_register_group_dev(struct vfio_device *device);

