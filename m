Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6A3CAF1D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E656E334;
	Thu, 15 Jul 2021 22:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121C06E452
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626388071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLA8eO2Mn4hxr+cJbgc910e8VN/wkTHNL7BaNmCYSD0=;
 b=CZseuO4VjGJ+qQf/Rw1LhVWGrKLWUBZQ8kZuBJ1P/GQJTWgaixX4F/8gGi1HJHnn2gdIxo
 d4jQG+N4/eUR+upugTRhyL+A3gKyJUDs/30Ml3E6FiqMZXr9UrCUAPpMMKzAZpgToVTynk
 xH6yvu5Uym90YwjBaJB4rFHFNXssnLM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-EYCck7e_PJ6t2gB9JVFv_A-1; Thu, 15 Jul 2021 18:27:50 -0400
X-MC-Unique: EYCck7e_PJ6t2gB9JVFv_A-1
Received: by mail-ot1-f71.google.com with SMTP id
 e28-20020a9d491c0000b02903daf90867beso5661211otf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLA8eO2Mn4hxr+cJbgc910e8VN/wkTHNL7BaNmCYSD0=;
 b=Rg7+49e8+XRfrv9swbjAUtw/spLDDAZKDfqVYcNjRtEljNCTPtub2X0JbCCZkaeBbO
 QO1IlPnBLrvfy7z5J2r0BsY3Br5SofuVbN+wvE5lS6hWfHuWMVs4b6bg1dsnobfCNxED
 uZDpT+148KH9HlXFbEnHswDfBzsU+T6pMvZHqhLe2i0vAnyHWZxtC/n8I/8nOY4Kic9T
 PpK/o4NvZAhF3CUfiqOREpjmVQl+Ch/tw0fmku15lNOCL/3QEgpE3Dv6Vs/HIBNuO1Ga
 QkSPJAkmQw05516OSHJS7NzPR8qIQKicMcrLgKz+H/HgrFZ5Z8sPIuvMBC3C803z4c+z
 HcPg==
X-Gm-Message-State: AOAM531rGy7MPX4/qV/Kw3OleM8+qlewFWtVhcmHozFz/zpK0BzlgbsT
 III/dncxDSvD7yj0rbUU7YHBNoF99Rmv2DIPCzpctQgPa2/mvcVo2ho5mEXiFQiao0Nl6Wed7IQ
 /hf6VgKPqHb2CxnjjL5J5jB0qWlZs
X-Received: by 2002:a9d:5e15:: with SMTP id d21mr5845712oti.280.1626388069902; 
 Thu, 15 Jul 2021 15:27:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp8ZblGgPS0JAdEwOCHdvHkA3HueEV2SZpBhta6Fuh8EOKxxl4birTsJK3gicGUmZGOxesYw==
X-Received: by 2002:a9d:5e15:: with SMTP id d21mr5845703oti.280.1626388069722; 
 Thu, 15 Jul 2021 15:27:49 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id v203sm1565993oib.37.2021.07.15.15.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:27:49 -0700 (PDT)
Date: Thu, 15 Jul 2021 16:27:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 09/13] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to
 use the device set
Message-ID: <20210715162747.4186b482.alex.williamson@redhat.com>
In-Reply-To: <20210715221149.GJ543781@nvidia.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <9-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <20210715150055.474f535f.alex.williamson@redhat.com>
 <20210715221149.GJ543781@nvidia.com>
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

On Thu, 15 Jul 2021 19:11:49 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Jul 15, 2021 at 03:00:55PM -0600, Alex Williamson wrote:
> > On Wed, 14 Jul 2021 21:20:38 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:  
> > > +/*
> > > + * We need to get memory_lock for each device, but devices can share mmap_lock,
> > > + * therefore we need to zap and hold the vma_lock for each device, and only then
> > > + * get each memory_lock.
> > > + */
> > > +static int vfio_hot_reset_device_set(struct vfio_pci_device *vdev,
> > > +				     struct vfio_pci_group_info *groups)
> > > +{
> > > +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> > > +	struct vfio_pci_device *cur_mem =
> > > +		list_first_entry(&dev_set->device_list, struct vfio_pci_device,
> > > +				 vdev.dev_set_list);  
> > 
> > We shouldn't be looking at the list outside of the lock, if the first
> > entry got removed we'd break our unwind code.
> >   
> > > +	struct vfio_pci_device *cur_vma;
> > > +	struct vfio_pci_device *cur;
> > > +	bool is_mem = true;
> > > +	int ret;
> > >  
> > > -	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
> > > -		vfio_device_put(device);
> > > -		return -EBUSY;
> > > +	mutex_lock(&dev_set->lock);  
> >         ^^^^^^^^^^^^^^^^^^^^^^^^^^^  
> 
> Oh, righto, this is an oopsie!
> 
> > > +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> > > +		up_write(&cur->memory_lock);
> > > +	mutex_unlock(&dev_set->lock);
> > > +
> > > +	return ret;  
> > 
> > 
> > Isn't the above section actually redundant to below, ie. we could just
> > fall through after the pci_reset_bus()?  Thanks,  
> 
> It could, but I thought it was less confusing this way due to how
> oddball the below is:
> 
> > > +err_undo:
> > > +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> > > +		if (cur == cur_mem)
> > > +			is_mem = false;
> > > +		if (cur == cur_vma)
> > > +			break;
> > > +		if (is_mem)
> > > +			up_write(&cur->memory_lock);
> > > +		else
> > > +			mutex_unlock(&cur->vma_lock);
> > > +	}  
> 
> But either works, do want it switch in v2?

Yeah, I think the simpler version just adds to the confusion of what
this oddball logic does.  It already handles all cases, up to and
including success, so let's give it more exercise by always using it.
Thanks,

Alex

