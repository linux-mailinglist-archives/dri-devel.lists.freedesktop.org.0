Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E23CAE4E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 23:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79F16E8B9;
	Thu, 15 Jul 2021 21:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DE06E8BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 21:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626382860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6cMvV3xGXdKHq4WzPyleEVhevpPRqkhvlCWSt+Y12E=;
 b=T2kelAA/xoHxMmwcmKKBG8FuwlTmEqC6BYH4/86kTRyY68A83AN7jCNPPMv93FGQtmUMKs
 2qxGkJS+JnVUuWAbDf1hpb0PlumrZ/RHx148ymwPEwRV2GDXumg6Z5w20j1YNYyM9vXesX
 7wMzn1mXnIoKgdjWwb/pLT0VKqWFPiw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-68Io36_OP8i4P767RMxbWQ-1; Thu, 15 Jul 2021 17:00:58 -0400
X-MC-Unique: 68Io36_OP8i4P767RMxbWQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 b9-20020a0568303109b02904b8eff931f1so5575069ots.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 14:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=w6cMvV3xGXdKHq4WzPyleEVhevpPRqkhvlCWSt+Y12E=;
 b=beT2wd3AwYMT8pOzWvFDDrHvwh4LAtqM9QgUFZ+DMGvAcrQzMOLIuIi+APZoT+KvAQ
 yILGcpSulBNCDj2TBWBGotO7XUS/8c2SI4vM7WbB/K2Bryb2M83SQZbpHMfkqI0Ikikd
 qe5TsjzrjpcDpNmNAONiFg8A5N0rWTyiX/pJyBU7PngwG5/YlpHIPL/qAO+i+irBy6Lc
 +h9FU8SIL+L2zfeqS9Kv+6yuRC12ANQoEJLaaken5c2RrmPTOLQRLldrQGyoqWibB3YR
 F4wxjHjILyvIJK0bjGBN27u0XLgc4JSOIPaiyjfBYeZLZCl61KrUP08L7NAQhPMjM20b
 6Pyg==
X-Gm-Message-State: AOAM532kSM+XfbchV7LLPiOA4sD5hM9xySvBDHOCza6AUvUgz305DCEm
 imrVlJS0joBU7xib8iybfAjix+HpdzdaHaB5M6/XUcLtakfU+an0o1WrmT3iKzFZxDSlitejXaj
 XZT8D4HAuzsIT2GdymfEYHBKF8jPu
X-Received: by 2002:aca:2112:: with SMTP id 18mr9993646oiz.48.1626382857939;
 Thu, 15 Jul 2021 14:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhGopnxXSOUkiyj2IazWlzUmam8q3Wm1mG8M1diFnOhbK2stM6MvqH6+i/pmWQg4ZlT4QnEQ==
X-Received: by 2002:aca:2112:: with SMTP id 18mr9993610oiz.48.1626382857721;
 Thu, 15 Jul 2021 14:00:57 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id n9sm1367932otn.54.2021.07.15.14.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 14:00:57 -0700 (PDT)
Date: Thu, 15 Jul 2021 15:00:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 09/13] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to
 use the device set
Message-ID: <20210715150055.474f535f.alex.williamson@redhat.com>
In-Reply-To: <9-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <9-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jul 2021 21:20:38 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> +/*
> + * We need to get memory_lock for each device, but devices can share mmap_lock,
> + * therefore we need to zap and hold the vma_lock for each device, and only then
> + * get each memory_lock.
> + */
> +static int vfio_hot_reset_device_set(struct vfio_pci_device *vdev,
> +				     struct vfio_pci_group_info *groups)
> +{
> +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> +	struct vfio_pci_device *cur_mem =
> +		list_first_entry(&dev_set->device_list, struct vfio_pci_device,
> +				 vdev.dev_set_list);

We shouldn't be looking at the list outside of the lock, if the first
entry got removed we'd break our unwind code.

> +	struct vfio_pci_device *cur_vma;
> +	struct vfio_pci_device *cur;
> +	bool is_mem = true;
> +	int ret;
>  
> -	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
> -		vfio_device_put(device);
> -		return -EBUSY;
> +	mutex_lock(&dev_set->lock);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^

> +
> +	/* All devices in the group to be reset need VFIO devices */
> +	if (vfio_pci_for_each_slot_or_bus(
> +		    vdev->pdev, vfio_pci_check_all_devices_bound, dev_set,
> +		    !pci_probe_reset_slot(vdev->pdev->slot))) {
> +		ret = -EINVAL;
> +		goto err_unlock;
>  	}
>  
> -	vdev = container_of(device, struct vfio_pci_device, vdev);
> +	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
> +		/*
> +		 * Test whether all the affected devices are contained by the
> +		 * set of groups provided by the user.
> +		 */
> +		if (!vfio_dev_in_groups(cur_vma, groups)) {
> +			ret = -EINVAL;
> +			goto err_undo;
> +		}
>  
> -	/*
> -	 * Locking multiple devices is prone to deadlock, runaway and
> -	 * unwind if we hit contention.
> -	 */
> -	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
> -		vfio_device_put(device);
> -		return -EBUSY;
> +		/*
> +		 * Locking multiple devices is prone to deadlock, runaway and
> +		 * unwind if we hit contention.
> +		 */
> +		if (!vfio_pci_zap_and_vma_lock(cur_vma, true)) {
> +			ret = -EBUSY;
> +			goto err_undo;
> +		}
>  	}
>  
> -	devs->devices[devs->cur_index++] = vdev;
> -	return 0;
> +	list_for_each_entry(cur_mem, &dev_set->device_list, vdev.dev_set_list) {
> +		if (!down_write_trylock(&cur_mem->memory_lock)) {
> +			ret = -EBUSY;
> +			goto err_undo;
> +		}
> +		mutex_unlock(&cur_mem->vma_lock);
> +	}
> +
> +	ret = pci_reset_bus(vdev->pdev);
> +


> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +		up_write(&cur->memory_lock);
> +	mutex_unlock(&dev_set->lock);
> +
> +	return ret;


Isn't the above section actually redundant to below, ie. we could just
fall through after the pci_reset_bus()?  Thanks,

Alex

> +
> +err_undo:
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		if (cur == cur_mem)
> +			is_mem = false;
> +		if (cur == cur_vma)
> +			break;
> +		if (is_mem)
> +			up_write(&cur->memory_lock);
> +		else
> +			mutex_unlock(&cur->vma_lock);
> +	}
> +err_unlock:
> +	mutex_unlock(&dev_set->lock);
> +	return ret;
>  }
>  
>  /*

