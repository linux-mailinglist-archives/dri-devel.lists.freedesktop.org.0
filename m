Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A461FCB4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 19:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3AD10E513;
	Mon,  7 Nov 2022 18:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E46310E513
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667844314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfWNmfGx0Se3BNvqmrQIw4qequKgdbo0qhO8fe0yzVg=;
 b=GY5FShJGsyQv43dHyv0hTQG9xYIug13RoST4QwEzPXeolVFm1Qjwio5MZ74yzBP/d6d4EE
 5EiZhszmFf0Uf6GakOEU+5guFQpRJFVZlxK7bfv/PpTMNY9ZnjHvviYD1WjuBcbhcgpaRs
 IozQSLkwEpYcN+GD3aB6uWcMuUlCAfY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-ROcBuXSZM9uEQekKJKotkQ-1; Mon, 07 Nov 2022 13:05:13 -0500
X-MC-Unique: ROcBuXSZM9uEQekKJKotkQ-1
Received: by mail-il1-f200.google.com with SMTP id
 d19-20020a056e020c1300b00300b5a12c44so9269027ile.15
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 10:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bfWNmfGx0Se3BNvqmrQIw4qequKgdbo0qhO8fe0yzVg=;
 b=ZQuy6B9cu/poy/kJOYMaLRw1G7bUSKxh6NnCVUVjaib91Hx8X+CuG00OCgufIywUA8
 oJhUnhn2QeUoLu5Ld2GoH1h031K3iLmELnoW82R7IZ1SgJxr6XnESU6KHuEZ/Whm9fiC
 fq4bsWHlHfKJti/7fa0p2E9GDF736ko0qi3nL7gwvbGXKMyrV66A64aTQTYOXjf+DYwY
 KJAgm8w0XJIfSakWVILswVW1mwsGM+Up0WO4IF6GNvJZY3n4nAuGx1KHFIpADT1j+m7+
 HZzB0PdcpMRmEnq+lyKU3rFtcJqPU7AjbdZ2oiJq+ZqT8wlzGPQA+3K/pFG+r4KgCbYP
 nZiw==
X-Gm-Message-State: ANoB5pmdSw1SaWJUdsGhHnpKa7otBZii2tAMueWbo18U2A1Aw2Zj+XVR
 4uRfIP/TYJ+xZp9lfrmPj9tu9qvhBjoftzxamRaDaRc+w3dBfdZjKnP6kEVxDtoH7H3q6UTR+Uo
 9NqYII8BMrK998U/uqK7OHji/jiGL
X-Received: by 2002:a05:6638:3590:b0:375:c920:16c2 with SMTP id
 v16-20020a056638359000b00375c92016c2mr2016485jal.72.1667844311339; 
 Mon, 07 Nov 2022 10:05:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6UQp/k2xL9xkcSh0+31rabNkEHgXJoe54k/D6xhd/Fo7jMB2KvouVPSBE3IOX+71t7NIX5PA==
X-Received: by 2002:a05:6638:3590:b0:375:c920:16c2 with SMTP id
 v16-20020a056638359000b00375c92016c2mr2016445jal.72.1667844311051; 
 Mon, 07 Nov 2022 10:05:11 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g5-20020a05663810e500b00374d6db7566sm2912129jae.117.2022.11.07.10.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 10:05:10 -0800 (PST)
Date: Mon, 7 Nov 2022 11:05:08 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221107110508.7f02abf4.alex.williamson@redhat.com>
In-Reply-To: <Y2klGAUEUwpjWHw6@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
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

On Mon, 7 Nov 2022 11:32:40 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Nov 07, 2022 at 08:18:53AM -0700, Alex Williamson wrote:
> > On Mon, 7 Nov 2022 09:19:43 -0400
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Mon, Oct 31, 2022 at 04:45:26PM -0600, Alex Williamson wrote:
> > >   
> > > > > It is one idea, it depends how literal you want to be on "module
> > > > > parameters are ABI". IMHO it is a weak form of ABI and the need of
> > > > > this paramter in particular is not that common in modern times, AFAIK.
> > > > > 
> > > > > So perhaps we just also expose it through vfio.ko and expect people to
> > > > > migrate. That would give a window were both options are available.    
> > > > 
> > > > That might be best.  Ultimately this is an opt-out of a feature that
> > > > has security implications, so I'd rather error on the side of requiring
> > > > the user to re-assert that opt-out.  It seems the potential good in
> > > > eliminating stale or unnecessary options outweighs any weak claims of
> > > > preserving an ABI for a module that's no longer in service.    
> > > 
> > > Ok, lets do this
> > > 
> > > --- a/drivers/vfio/vfio_main.c
> > > +++ b/drivers/vfio/vfio_main.c
> > > @@ -55,6 +55,11 @@ static struct vfio {
> > >  bool vfio_allow_unsafe_interrupts;
> > >  EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
> > >  
> > > +module_param_named(allow_unsafe_interrupts,
> > > +                  vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
> > > +MODULE_PARM_DESC(allow_unsafe_interrupts,
> > > +                "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
> > > +
> > >  static DEFINE_XARRAY(vfio_device_set_xa);
> > >  static const struct file_operations vfio_group_fops;
> > >   
> > > > However, I'd question whether vfio is the right place for that new
> > > > module option.  As proposed, vfio is only passing it through to
> > > > iommufd, where an error related to lack of the hardware feature is
> > > > masked behind an -EPERM by the time it gets back to vfio, making any
> > > > sort of advisory to the user about the module option convoluted.  It
> > > > seems like iommufd should own the option to opt-out universally, not
> > > > just through the vfio use case.  Thanks,    
> > > 
> > > My thinking is this option shouldn't exist at all in other iommufd
> > > users. eg I don't see value in VDPA supporting it.  
> > 
> > I disagree, the IOMMU interface is responsible for isolating the
> > device, this option doesn't make any sense to live in vfio-main, which
> > is the reason it was always a type1 option.    
> 
> You just agreed to this above?

After further consideration... I don't think the option on vfio-main
makes sense, basically for the same reason that the original option
existed on the IOMMU backend rather than vfio-core.  The option
describes a means to relax a specific aspect of IOMMU isolation, which
makes more sense to expose via the IOMMU provider, imo.  For example,
vfio-main cannot generate an equivalent error message as provided in
type1 today, it's too far removed from the IOMMU feature support.

> > If vdpa doesn't allow full device access such that it can guarantee
> > that a device cannot generate a DMA that can spoof MSI, then it
> > sounds like the flag we pass when attaching a device to iommfd
> > should to reflect this difference in usage.  
> 
> VDPA allows arbitary DMA just like VFIO. At most VDPA limits the MMIO
> touches.

So why exactly isn't this an issue for VDPA?  Are we just burying our
head in the sand that such platforms exists and can still be useful
given the appropriate risk vs reward trade-off?

> > The driver either requires full isolation, default, or can indicate a
> > form of restricted DMA programming that prevents interrupt spoofing.
> > The policy whether to permit unsafe configurations should exist in one
> > place, iommufd.  
> 
> iommufd doesn't know the level of unsafely the external driver is
> creating,

Thus the proposed flag.  But maybe we don't need it if VDPA has no
inherent protection against MSI spoofing itself.

> and IMHO we don't actually want to enable this more
> widely. So I don't want to see a global kernel wide flag at this point
> until we get reason to make more than just VFIO insecure.

But this brings into question the entire existence of the opt-in.  Do
we agree that there are valid use cases for such an option?

Unlike things like ACS overrides, lack of interrupt isolation really
requires a malicious actor.  We're not going to inadvertently overlap
DMA to interrupt addresses like we might to a non-isolated MMIO ranges.
Therefore an admin can make a reasonable determination relative to the
extent to which the userspace is trusted.  This is not unlike opt-outs
to CPU vulnerability mitigation imo, there are use cases where the
performance or functionality is more important than the isolation.
Hand waving this away as a vfio-unique insecurity is a bad precedent
for iommufd.  Thanks,

Alex

