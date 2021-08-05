Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF03E1A71
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 19:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDB46EB1F;
	Thu,  5 Aug 2021 17:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69F16EB21
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628184798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDWzWOKY9gRGQIrv08IMtQtjh7HeqqaHb9oXpUOEXe8=;
 b=eC3FS9Aw7QQBMNMjzjJEZ8LsCwvKj5t6UR14iFeTUMhTJyUAPlTBQRDE7hJphgDA6WGUjO
 MTzqJpgHefL8fVjeab+XapV7jTJKskROSKfXSJGT7S3j8PfZ1bUTlpbEfV4NLHkgTieviP
 oVjxgWu6eAElLnMjl964QKT4qvxVRW0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-4YYKQOnMP2OGzu14qm59dg-1; Thu, 05 Aug 2021 13:33:15 -0400
X-MC-Unique: 4YYKQOnMP2OGzu14qm59dg-1
Received: by mail-oi1-f198.google.com with SMTP id
 z13-20020a056808064db029025cce343487so3060103oih.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 10:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=fDWzWOKY9gRGQIrv08IMtQtjh7HeqqaHb9oXpUOEXe8=;
 b=Say53MAt+F8tg8I/USrm+dxguJuTy0DbC4JAMVDt9ZWC3L6Rx+ZHdvzvHdEyfhUYkr
 KZM3Oyr9508K1kCh1NhIaH0fBxWSPNcaarrBKaEX+YuQAfCANXQuZV4RE2QTjfuHKUxi
 NF6iG6RhWWeRblOKLtGTL4R2TeoPLXnTgKpGMaetlOqTllln3Tp8Qo4MGZs0fXVWB2Qb
 erCLL05wulUhaoaEmMgTL07CSnVxX2ze3jbRZo50wbkSakhgYmRO0ZuVFcV/6pL6fYUU
 t3Lk9tWHs9pTumM0BOmzjp0DtUnQ53Ash+QGDYIyP+9JKXcCnRVFc7nvV7c+s2tO6/vP
 YXeg==
X-Gm-Message-State: AOAM530Ho79Gcs7vjP0mmq/98e4M8zD2Ezj/OmDNHY6FIY7gDEUqto78
 M/G48Ev5Si86KSMBBV9dX/o47BZN3Q5WCNqv6BcaQz99giGekWc98Try+JvkWvjhik50cc8mhih
 oDfK8E1HIbxA3XmWGs3sWxlmqAtgb
X-Received: by 2002:a9d:4e16:: with SMTP id p22mr4456211otf.173.1628184794761; 
 Thu, 05 Aug 2021 10:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgne5vH4F/tdkjcY9nwVFcfF47fNX2nFmDPhfapXicykX6MF2W8wxSNajz6keH3dZKwbyTaw==
X-Received: by 2002:a9d:4e16:: with SMTP id p22mr4456177otf.173.1628184794507; 
 Thu, 05 Aug 2021 10:33:14 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 50sm1021773oti.31.2021.08.05.10.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:33:14 -0700 (PDT)
Date: Thu, 5 Aug 2021 11:33:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>, Eric
 Farman <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>, "Raj, Ashok"
 <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>, Leon Romanovsky
 <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas
 <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210805113311.65a16bba.alex.williamson@redhat.com>
In-Reply-To: <20210805114701.GC1672295@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <20210803103406.5e1be269.alex.williamson@redhat.com>
 <20210803164152.GC1721383@nvidia.com>
 <20210803105225.2ee7dac2.alex.williamson@redhat.com>
 <20210805114701.GC1672295@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Aug 2021 08:47:01 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Aug 03, 2021 at 10:52:25AM -0600, Alex Williamson wrote:
> > On Tue, 3 Aug 2021 13:41:52 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:  
> > > On Tue, Aug 03, 2021 at 10:34:06AM -0600, Alex Williamson wrote:  
> > > > I think the vfio_pci_find_reset_target() function needs to be re-worked
> > > > to just tell us true/false that it's ok to reset the provided device,
> > > > not to anoint an arbitrary target device.  Thanks,    
> > > 
> > > Yes, though this logic is confusing, why do we need to check if any
> > > device needs a reset at this point? If we are being asked to reset
> > > vdev shouldn't vdev needs_reset?
> > > 
> > > Or is the function more of a 'synchronize pending reset' kind of
> > > thing?  
> > 
> > Yes, the latter.  For instance think about a multi-function PCI device
> > such as a GPU.  The functions have dramatically different capabilities,
> > some might have function level reset abilities and others not.  We want
> > to be able to trigger a bus reset as the last device of the set is
> > released, no matter the order they're released and no matter the
> > capabilities of the device we're currently processing.  Thanks,  
> 
> I worked on this for awhile, I think this is much clearer about what
> this algorithm is trying to do:
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index 5d6db93d6c680f..e418bcbb68facc 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -223,7 +223,7 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_device *vdev)
>  	}
>  }
>  
> -static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev);
> +static bool vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
>  static void vfio_pci_disable(struct vfio_pci_device *vdev);
>  static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data);
>  
> @@ -404,6 +404,9 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
>  	struct vfio_pci_ioeventfd *ioeventfd, *ioeventfd_tmp;
>  	int i, bar;
>  
> +	/* For needs_reset */
> +	lockdep_assert_held(&vdev->vdev.dev_set->lock);
> +
>  	/* Stop the device from further DMA */
>  	pci_clear_master(pdev);
>  
> @@ -487,9 +490,7 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
>  out:
>  	pci_disable_device(pdev);
>  
> -	vfio_pci_try_bus_reset(vdev);
> -
> -	if (!disable_idle_d3)
> +	if (!vfio_pci_dev_set_try_reset(vdev->vdev.dev_set) && !disable_idle_d3)
>  		vfio_pci_set_power_state(vdev, PCI_D3hot);
>  }
>  
> @@ -2145,36 +2146,6 @@ static struct pci_driver vfio_pci_driver = {
>  	.err_handler		= &vfio_err_handlers,
>  };
>  
> -static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
> -{
> -	struct vfio_devices *devs = data;
> -	struct vfio_device *device;
> -	struct vfio_pci_device *vdev;
> -
> -	if (devs->cur_index == devs->max_index)
> -		return -ENOSPC;
> -
> -	device = vfio_device_get_from_dev(&pdev->dev);
> -	if (!device)
> -		return -EINVAL;
> -
> -	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
> -		vfio_device_put(device);
> -		return -EBUSY;
> -	}
> -
> -	vdev = container_of(device, struct vfio_pci_device, vdev);
> -
> -	/* Fault if the device is not unused */
> -	if (device->open_count) {
> -		vfio_device_put(device);
> -		return -EBUSY;
> -	}
> -
> -	devs->devices[devs->cur_index++] = vdev;
> -	return 0;
> -}
> -
>  static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
>  {
>  	struct vfio_devices *devs = data;
> @@ -2208,79 +2179,86 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
>  	return 0;
>  }
>  
> +static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
> +{
> +	struct vfio_device_set *dev_set = data;
> +	struct vfio_device *cur;
> +
> +	lockdep_assert_held(&dev_set->lock);
> +
> +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> +		if (cur->dev == &pdev->dev)
> +			return 0;
> +	return -EBUSY;
> +}
> +
> +static bool vfio_pci_dev_set_needs_reset(struct vfio_device_set *dev_set)

Slight nit on the name here since we're essentially combining
needs_reset along with the notion of the device being unused.  I'm not
sure, maybe "should_reset"?  Otherwise it looks ok.  Thanks,

Alex

> +{
> +	struct vfio_pci_device *cur;
> +	bool needs_reset = false;
> +
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		/* No VFIO device in the set can have an open device FD */
> +		if (cur->vdev.open_count)
> +			return false;
> +		needs_reset |= cur->needs_reset;
> +	}
> +	return needs_reset;
> +}
> +
>  /*
> - * If a bus or slot reset is available for the provided device and:
> + * If a bus or slot reset is available for the provided dev_set and:
>   *  - All of the devices affected by that bus or slot reset are unused
> - *    (!refcnt)
>   *  - At least one of the affected devices is marked dirty via
>   *    needs_reset (such as by lack of FLR support)
> - * Then attempt to perform that bus or slot reset.  Callers are required
> - * to hold vdev->dev_set->lock, protecting the bus/slot reset group from
> - * concurrent opens.  A vfio_device reference is acquired for each device
> - * to prevent unbinds during the reset operation.
> - *
> - * NB: vfio-core considers a group to be viable even if some devices are
> - * bound to drivers like pci-stub or pcieport.  Here we require all devices
> - * to be bound to vfio_pci since that's the only way we can be sure they
> - * stay put.
> + * Then attempt to perform that bus or slot reset.
> + * Returns true if the dev_set was reset.
>   */
> -static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
> +static bool vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set)
>  {
> -	struct vfio_devices devs = { .cur_index = 0 };
> -	int i = 0, ret = -EINVAL;
> -	bool slot = false;
> -	struct vfio_pci_device *tmp;
> +	struct vfio_pci_device *cur;
> +	struct pci_dev *pdev;
> +	int ret;
>  
> -	if (!pci_probe_reset_slot(vdev->pdev->slot))
> -		slot = true;
> -	else if (pci_probe_reset_bus(vdev->pdev->bus))
> -		return;
> +	lockdep_assert_held(&dev_set->lock);
>  
> -	if (vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
> -					  &i, slot) || !i)
> -		return;
> +	/*
> +	 * By definition all PCI devices in the dev_set share the same PCI
> +	 * reset, so any pci_dev will have the same outcomes for
> +	 * pci_probe_reset_*() and pci_reset_bus().
> +	 */
> +	pdev = list_first_entry(&dev_set->device_list, struct vfio_pci_device,
> +				vdev.dev_set_list)->pdev;
>  
> -	devs.max_index = i;
> -	devs.devices = kcalloc(i, sizeof(struct vfio_device *), GFP_KERNEL);
> -	if (!devs.devices)
> -		return;
> +	/* Reset of the dev_set is possible */
> +	if (pci_probe_reset_slot(pdev->slot) && pci_probe_reset_bus(pdev->bus))
> +		return false;
>  
> -	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
> -					  vfio_pci_get_unused_devs,
> -					  &devs, slot))
> -		goto put_devs;
> +	if (!vfio_pci_dev_set_needs_reset(dev_set))
> +		return false;
>  
> -	/* Does at least one need a reset? */
> -	for (i = 0; i < devs.cur_index; i++) {
> -		tmp = devs.devices[i];
> -		if (tmp->needs_reset) {
> -			ret = pci_reset_bus(vdev->pdev);
> -			break;
> -		}
> +	/*
> +	 * vfio-core considers a group to be viable and will create a
> +	 * vfio_device even if some devices are bound to drivers like pci-stub
> +	 * or pcieport. Here we require all PCI devices to be inside our dev_set
> +	 * since that ensures they stay put and that every driver controlling
> +	 * the device can co-ordinate with the device reset.
> +	 */
> +	if (vfio_pci_for_each_slot_or_bus(pdev, vfio_pci_is_device_in_set,
> +					  dev_set,
> +					  !pci_probe_reset_slot(pdev->slot)))
> +		return false;
> +
> +	ret = pci_reset_bus(pdev);
> +	if (ret)
> +		return false;
> +
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		cur->needs_reset = false;
> +		if (!disable_idle_d3)
> +			vfio_pci_set_power_state(cur, PCI_D3hot);
>  	}
> -
> -put_devs:
> -	for (i = 0; i < devs.cur_index; i++) {
> -		tmp = devs.devices[i];
> -
> -		/*
> -		 * If reset was successful, affected devices no longer need
> -		 * a reset and we should return all the collateral devices
> -		 * to low power.  If not successful, we either didn't reset
> -		 * the bus or timed out waiting for it, so let's not touch
> -		 * the power state.
> -		 */
> -		if (!ret) {
> -			tmp->needs_reset = false;
> -
> -			if (tmp != vdev && !disable_idle_d3)
> -				vfio_pci_set_power_state(tmp, PCI_D3hot);
> -		}
> -
> -		vfio_device_put(&tmp->vdev);
> -	}
> -
> -	kfree(devs.devices);
> +	return true;
>  }
>  
>  static void __exit vfio_pci_cleanup(void)
> 

