Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF561F770
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DBF10E3CE;
	Mon,  7 Nov 2022 15:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391810E3CE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667834346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPVWQ+YraXRChqzr4SQlG/qjPD1QpM0ZmFrgY+kvQEQ=;
 b=BE7w+fCO1pQ3U6AUs03Mr+a69JJL4mKoRd3i4RipqqLrv5nRFrFXB+fPjBcECDSh1aMlMT
 5IdUerR+RleLE/5xQEYHnJRhjGcZTZ5/SXN3TikGSkNOHlwYm607F99vXhcNZU3qjXaUmI
 eWOHKeE91tMWRPvhOWxDmD6pUEeiR/w=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-cUtimMAHP7u16q7xHWCqcg-1; Mon, 07 Nov 2022 10:18:57 -0500
X-MC-Unique: cUtimMAHP7u16q7xHWCqcg-1
Received: by mail-il1-f197.google.com with SMTP id
 g4-20020a92cda4000000b00301ff06da14so4979917ild.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 07:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPVWQ+YraXRChqzr4SQlG/qjPD1QpM0ZmFrgY+kvQEQ=;
 b=UFFxfms0l8ghKU8x3AXH+wPvCsptmrlJgMuVNQ9jd9MvT4l/u7k1j8P6YUnaRkVhSK
 TZ2rUH54tD5QF9BoU306h6rKE/0IzvY3+fRePboIjthoxdqjjByVU1Nrg8Igo/fgV7BL
 q7OZJAyv6rHxDVknfW0CqcUh7YLgnlL8qq2Sqa8glmboZsGJoTBwZfs+8icZJbqvLzRO
 FpoxO6Z6uG+aK8Hiys6KDuh7nf0GMwqWEsxeLA5cE+iYoptrout+ayib1jVpfdzE1Ny9
 lCQf+Nhe2VFOfY7EaefXnp5OPLC1u/PEkMPUFGeHU5YVNwlkzdwuj4qqcLl+m7daxFYx
 1jcg==
X-Gm-Message-State: ACrzQf1mjfjGb75XxxwJJFrjYxEtpwIQdCpxwkeGpTWZm52uIUu3EPzr
 wtsl/ULBUYkzdciC9QAWgybGG1U+cTfvMdbVGpKibdOsQUhIAm4fYPpj0rAhjLLuvJ4KeQn7i8c
 rTgIO9a8gv61TVlDZuLVLFqbyjOzS
X-Received: by 2002:a92:d74f:0:b0:300:ad95:35c5 with SMTP id
 e15-20020a92d74f000000b00300ad9535c5mr25950883ilq.137.1667834336874; 
 Mon, 07 Nov 2022 07:18:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4lWUzVNR72O39IQE6LeiepbZvM9WXMUgdmYx2bv2/TRXid0tlwA/a3n4EvaTSlM1yrwXs6uQ==
X-Received: by 2002:a92:d74f:0:b0:300:ad95:35c5 with SMTP id
 e15-20020a92d74f000000b00300ad9535c5mr25950861ilq.137.1667834336637; 
 Mon, 07 Nov 2022 07:18:56 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z101-20020a0293ee000000b0037556012c63sm2771396jah.132.2022.11.07.07.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 07:18:55 -0800 (PST)
Date: Mon, 7 Nov 2022 08:18:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221107081853.18727337.alex.williamson@redhat.com>
In-Reply-To: <Y2kF75zVD581UeR2@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Nov 2022 09:19:43 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Oct 31, 2022 at 04:45:26PM -0600, Alex Williamson wrote:
> 
> > > It is one idea, it depends how literal you want to be on "module
> > > parameters are ABI". IMHO it is a weak form of ABI and the need of
> > > this paramter in particular is not that common in modern times, AFAIK.
> > > 
> > > So perhaps we just also expose it through vfio.ko and expect people to
> > > migrate. That would give a window were both options are available.  
> > 
> > That might be best.  Ultimately this is an opt-out of a feature that
> > has security implications, so I'd rather error on the side of requiring
> > the user to re-assert that opt-out.  It seems the potential good in
> > eliminating stale or unnecessary options outweighs any weak claims of
> > preserving an ABI for a module that's no longer in service.  
> 
> Ok, lets do this
> 
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -55,6 +55,11 @@ static struct vfio {
>  bool vfio_allow_unsafe_interrupts;
>  EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
>  
> +module_param_named(allow_unsafe_interrupts,
> +                  vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(allow_unsafe_interrupts,
> +                "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
> +
>  static DEFINE_XARRAY(vfio_device_set_xa);
>  static const struct file_operations vfio_group_fops;
> 
> > However, I'd question whether vfio is the right place for that new
> > module option.  As proposed, vfio is only passing it through to
> > iommufd, where an error related to lack of the hardware feature is
> > masked behind an -EPERM by the time it gets back to vfio, making any
> > sort of advisory to the user about the module option convoluted.  It
> > seems like iommufd should own the option to opt-out universally, not
> > just through the vfio use case.  Thanks,  
> 
> My thinking is this option shouldn't exist at all in other iommufd
> users. eg I don't see value in VDPA supporting it.

I disagree, the IOMMU interface is responsible for isolating the
device, this option doesn't make any sense to live in vfio-main, which
is the reason it was always a type1 option.  If vdpa doesn't allow full
device access such that it can guarantee that a device cannot generate
a DMA that can spoof MSI, then it sounds like the flag we pass when
attaching a device to iommfd should to reflect this difference in usage.
The driver either requires full isolation, default, or can indicate a
form of restricted DMA programming that prevents interrupt spoofing.
The policy whether to permit unsafe configurations should exist in one
place, iommufd.  Thanks,

Alex

