Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92C3DF29C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 18:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22C56E892;
	Tue,  3 Aug 2021 16:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2B26E891
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628008451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZC6fz0wH6LOZCoKtHBlL+gFtJ2XidB4lNAk1d1Zfen0=;
 b=a9ZYgOtjKrdFbjzBEbY7/aTlsTofEj3MnIYL1+KlUM36VqIMYZy5jQcaJsU5Uo3QbuRZH5
 FdU/4vq72qaDwQlcp61VqsELO08bPrkJAKTNxM7y3qgJ3Pup55ILqwSqc8EWDM92S+NFaP
 L4RJ0QnY8H6aXS0RcnH+y//3/r2MIh8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-Q5Ew_o1UOZShWqt5wnJmeQ-1; Tue, 03 Aug 2021 12:34:10 -0400
X-MC-Unique: Q5Ew_o1UOZShWqt5wnJmeQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 m20-20020a0568080f14b029025a3cb2429bso8850876oiw.20
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 09:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZC6fz0wH6LOZCoKtHBlL+gFtJ2XidB4lNAk1d1Zfen0=;
 b=atKntml/B0jZt4eiGJiRFe7w7NKwAAWX8A2DRAQZbzfAO6R/O0/oET9HrIKGjeJC/d
 rs65km8vv6e0InX9Izu5+VL4uMSo0QJ7YlqpSKJZX6sjS8SJ5RufXlHGVbinXr8hBbBE
 BbMUc6Qq4lIPxatB3FMWAExa7CEVrSQuMXSt07c1Ozm9KjGeBeNJdSqscjlFl+GM2kev
 pe8YdMSS735rR6+qfTvp2ghXIKeM+gh5hwHAKYDrdWnhwGF9NLeTHHAj41Gf3+gk7ibK
 TeEQKvBn1WcswkOdG0RWH220r76skQG3gcd0XhZ4ingt1VvH1l4CAkyuY1QlD0GBtqTN
 SJrw==
X-Gm-Message-State: AOAM530Ft0vOaIOeuGoiffJeiwzSQU/7ElEnuCjPWzSAzHUnMraW+ECv
 7xCTwI1uh3yqxC9HGSxRoz8rjLjL0bsG6RSi8+vRhW/aJIf7h6Qyq/Rh8XU2Dv4Fu6RjdlOhODN
 U9liYGKxDzTGoIwlUZRLqg6BvTw/E
X-Received: by 2002:a54:478e:: with SMTP id o14mr3753016oic.173.1628008449604; 
 Tue, 03 Aug 2021 09:34:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFwuESI0HnE76c1/AUZG8mHAVE7uoxUNQvCdQAFpY43ILy5oWRZNuayH573kYg7XpB5z/ECQ==
X-Received: by 2002:a54:478e:: with SMTP id o14mr3752987oic.173.1628008449364; 
 Tue, 03 Aug 2021 09:34:09 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id h1sm2607585otj.48.2021.08.03.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:34:09 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:34:06 -0600
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
Message-ID: <20210803103406.5e1be269.alex.williamson@redhat.com>
In-Reply-To: <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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

On Wed, 28 Jul 2021 21:49:18 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Keep track of all the vfio_devices that have been added to the device set
> and use this list in vfio_pci_try_bus_reset() instead of trying to work
> backwards from the pci_device.
> 
> The dev_set->lock directly prevents devices from joining/leaving the set,
> which further implies the pci_device cannot change drivers or that the
> vfio_device be freed, eliminating the need for get/put's.
> 
> Completeness of the device set can be directly measured by checking if
> every PCI device in the reset group is also in the device set - which
> proves that VFIO drivers are attached to everything.
> 
> This restructuring corrects a call to pci_dev_driver() without holding the
> device_lock() and removes a hard wiring to &vfio_pci_driver.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci.c | 148 +++++++++++++++---------------------
>  1 file changed, 62 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index 5d6db93d6c680f..a1ae9a83a38621 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
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
> @@ -2145,7 +2148,7 @@ static struct pci_driver vfio_pci_driver = {
>  	.err_handler		= &vfio_err_handlers,
>  };
>  
> -static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
> +static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
>  {
>  	struct vfio_devices *devs = data;
>  	struct vfio_device *device;
> @@ -2165,8 +2168,11 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
>  
>  	vdev = container_of(device, struct vfio_pci_device, vdev);
>  
> -	/* Fault if the device is not unused */
> -	if (device->open_count) {
> +	/*
> +	 * Locking multiple devices is prone to deadlock, runaway and
> +	 * unwind if we hit contention.
> +	 */
> +	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
>  		vfio_device_put(device);
>  		return -EBUSY;
>  	}
> @@ -2175,112 +2181,82 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
>  	return 0;
>  }
>  
> -static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
> +static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
>  {
> -	struct vfio_devices *devs = data;
> -	struct vfio_device *device;
> -	struct vfio_pci_device *vdev;
> +	struct vfio_device_set *dev_set = data;
> +	struct vfio_device *cur;
>  
> -	if (devs->cur_index == devs->max_index)
> -		return -ENOSPC;
> +	lockdep_assert_held(&dev_set->lock);
>  
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
> +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> +		if (cur->dev == &pdev->dev)
> +			return 0;
> +	return -EBUSY;
> +}
>  
> -	/*
> -	 * Locking multiple devices is prone to deadlock, runaway and
> -	 * unwind if we hit contention.
> -	 */
> -	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
> -		vfio_device_put(device);
> -		return -EBUSY;
> +/*
> + * vfio-core considers a group to be viable and will create a vfio_device even
> + * if some devices are bound to drivers like pci-stub or pcieport.  Here we
> + * require all PCI devices to be inside our dev_set since that ensures they stay
> + * put and that every driver controlling the device can co-ordinate with the
> + * device reset.
> + */
> +static struct pci_dev *vfio_pci_find_reset_target(struct vfio_pci_device *vdev)
> +{
> +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> +	struct vfio_pci_device *cur;
> +	bool needs_reset = false;
> +
> +	/* No VFIO device has an open device FD */
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		if (cur->vdev.open_count)
> +			return NULL;
> +		needs_reset |= cur->needs_reset;
>  	}
> +	if (!needs_reset)
> +		return NULL;
>  
> -	devs->devices[devs->cur_index++] = vdev;
> -	return 0;
> +	/* All PCI devices in the group to be reset need to be in our dev_set */
> +	if (vfio_pci_for_each_slot_or_bus(
> +		    vdev->pdev, vfio_pci_is_device_in_set, dev_set,
> +		    !pci_probe_reset_slot(vdev->pdev->slot)))
> +		return NULL;
> +	return cur->pdev;


I don't understand the "reset target" aspect of this, cur->pdev is
simply the last entry in the dev_set->devices_list...

>  }
>  
>  /*
>   * If a bus or slot reset is available for the provided device and:
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
>   */
>  static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
>  {
> -	struct vfio_devices devs = { .cur_index = 0 };
> -	int i = 0, ret = -EINVAL;
> -	bool slot = false;
> -	struct vfio_pci_device *tmp;
> -
> -	if (!pci_probe_reset_slot(vdev->pdev->slot))
> -		slot = true;
> -	else if (pci_probe_reset_bus(vdev->pdev->bus))
> -		return;
> +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> +	struct pci_dev *to_reset;
> +	struct vfio_pci_device *cur;
> +	int ret;
>  
> -	if (vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
> -					  &i, slot) || !i)
> -		return;
> +	lockdep_assert_held(&vdev->vdev.dev_set->lock);
>  
> -	devs.max_index = i;
> -	devs.devices = kcalloc(i, sizeof(struct vfio_device *), GFP_KERNEL);
> -	if (!devs.devices)
> +	if (pci_probe_reset_slot(vdev->pdev->slot) &&
> +	    pci_probe_reset_bus(vdev->pdev->bus))
>  		return;
>  
> -	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
> -					  vfio_pci_get_unused_devs,
> -					  &devs, slot))
> -		goto put_devs;
> -
> -	/* Does at least one need a reset? */
> -	for (i = 0; i < devs.cur_index; i++) {
> -		tmp = devs.devices[i];
> -		if (tmp->needs_reset) {
> -			ret = pci_reset_bus(vdev->pdev);
> -			break;
> -		}
> -	}
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
> +	to_reset = vfio_pci_find_reset_target(vdev);
> +	if (!to_reset)
> +		return;
>  
> -			if (tmp != vdev && !disable_idle_d3)
> -				vfio_pci_set_power_state(tmp, PCI_D3hot);
> -		}
> +	ret = pci_reset_bus(to_reset);
> +	if (ret)
> +		return;
>  
> -		vfio_device_put(&tmp->vdev);
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		cur->needs_reset = false;
> +		if (cur->pdev != to_reset && !disable_idle_d3)
> +			vfio_pci_set_power_state(cur, PCI_D3hot);
>  	}

...which means that here, I think we're putting all but whichever
random device was last in the list into D3.  The intention was that all
the devices except for the one we're operating on should already be in
D3, the bus reset will put them back in D0, so we want to force them
back to D3.

I think the vfio_pci_find_reset_target() function needs to be re-worked
to just tell us true/false that it's ok to reset the provided device,
not to anoint an arbitrary target device.  Thanks,

Alex

> -
> -	kfree(devs.devices);
>  }
>  
>  static void __exit vfio_pci_cleanup(void)

