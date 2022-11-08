Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D0621F95
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 23:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1910E531;
	Tue,  8 Nov 2022 22:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4C810E531
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667948125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xn5djSvharmtEQx57zviUCQbtnk4lTlyXhCimRZ02/A=;
 b=QELcHzStoSs5OnQEqVkUj4ukidFVFJWjLn80MflGNX9VPrh8sV1S/+564be0zPsKEh1+od
 sigHArURQjml41hjlgvAtNLtKZiK3oeUm/OaWVwjvMCmwvVTrYSCJEcZhGkwEe4VzIzg66
 HGaG4AJnlt9EQ7JnPUqVvE2kdRYbO7Q=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-q94WTrOqMQegITJShmYxbA-1; Tue, 08 Nov 2022 17:55:24 -0500
X-MC-Unique: q94WTrOqMQegITJShmYxbA-1
Received: by mail-il1-f199.google.com with SMTP id
 z19-20020a056e02089300b002fffe186ac4so12113885ils.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 14:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xn5djSvharmtEQx57zviUCQbtnk4lTlyXhCimRZ02/A=;
 b=ZxcEWrJFnYyrgGKPYcE1dqzc75FNztosDyGHSID5Dy4rRKW4Me+W7KrsTTECa084IS
 aQf7rS3vF9OVkCkHA6wyk19+W2EeJFKw+CgrB90QjA4PkM2UG+shER+FCdqJEv57dEKh
 yZtrvjQ8/qeprXrXyz8Zc2D6gTjbP/ay+x5rxry9JGC1RxrNgN18Zu+V1KcrZBlpM9zi
 AKjLmuuCaOYmT0UVxQ8C6dvthwxxFTwDUlE9c8svikij9cfShcv6xRi9pcQOeVlvo0tU
 p5EQ+i39m0UBgPE4Lh9uQ3cdMH/l1jjv66tkm2Cp4bKMRJMk4nlZnrQALb5YbtuCvjA1
 30MQ==
X-Gm-Message-State: ACrzQf09PA468rMrNUEnsKI5dd+OzHTZLFIHxOjCIhzJrUPBq+U0Hj2l
 ubl3/CemLBFYUWDOmnYy/Usx7kcBFV5q4pavqfDToxMpne48YEmeOGoDjNMlF2HS5Ah7x8zO0+K
 KQHS13aWKdVmE9Im9kx5vuN+rCnxV
X-Received: by 2002:a92:c90b:0:b0:300:9b70:1954 with SMTP id
 t11-20020a92c90b000000b003009b701954mr1157715ilp.52.1667948123557; 
 Tue, 08 Nov 2022 14:55:23 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7inYgp9d81Al2F/3Q/QRh1DvH49c8xJ7dAOPW8yrTtfbiNXukEmtMY97bMKALlOwtV8gl6cQ==
X-Received: by 2002:a92:c90b:0:b0:300:9b70:1954 with SMTP id
 t11-20020a92c90b000000b003009b701954mr1157706ilp.52.1667948123238; 
 Tue, 08 Nov 2022 14:55:23 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o15-20020a02a1cf000000b00374fa5b600csm4208110jah.0.2022.11.08.14.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 14:55:22 -0800 (PST)
Date: Tue, 8 Nov 2022 15:55:20 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221108155520.4429c2e5.alex.williamson@redhat.com>
In-Reply-To: <Y2lSZwNT8f/RMoZf@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
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

On Mon, 7 Nov 2022 14:45:59 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Nov 07, 2022 at 11:05:08AM -0700, Alex Williamson wrote:
> 
> > After further consideration... I don't think the option on vfio-main
> > makes sense, basically for the same reason that the original option
> > existed on the IOMMU backend rather than vfio-core.  The option
> > describes a means to relax a specific aspect of IOMMU isolation, which
> > makes more sense to expose via the IOMMU provider, imo.  For example,
> > vfio-main cannot generate an equivalent error message as provided in
> > type1 today, it's too far removed from the IOMMU feature support.  
> 
> vfio-main can do it, we just have to be strict that the EPERM code is
> always going to be this case.

This doesn't seem very practical.

> > > > If vdpa doesn't allow full device access such that it can guarantee
> > > > that a device cannot generate a DMA that can spoof MSI, then it
> > > > sounds like the flag we pass when attaching a device to iommfd
> > > > should to reflect this difference in usage.    
> > > 
> > > VDPA allows arbitary DMA just like VFIO. At most VDPA limits the MMIO
> > > touches.  
> >
> > So why exactly isn't this an issue for VDPA?  Are we just burying our
> > head in the sand that such platforms exists and can still be useful
> > given the appropriate risk vs reward trade-off?  
> 
> Simply that nobody has asked for it, and might never ask for it. This
> is all support for old platforms, and there just doesn't seem to be a
> "real" use case for very new (and actually rare) NIC hardware stuck
> into ancient platforms with this security problem.

vIOMMU support for interrupt remapping is relatively new, the nesting
case is important as well.

> So I'd rather leave this in the past than carry forward a security
> exception as some ongoing 1st class thing.
> 
> > > and IMHO we don't actually want to enable this more
> > > widely. So I don't want to see a global kernel wide flag at this point
> > > until we get reason to make more than just VFIO insecure.  
> > 
> > But this brings into question the entire existence of the opt-in.  Do
> > we agree that there are valid use cases for such an option?  
> 
> I think it is something VFIO has historically allowed and I think we
> can continue to allow it, but I don't think we should encourage its
> use or encourage it to propogate to wider areas given that the
> legitimate use cases are focused on fairly old hardware at this point.
> 
> So, I'd rather wait for someone to ask for it, and explain why they
> need to use a combination of stuff where we need to have a true global
> option.
> 
> > Unlike things like ACS overrides, lack of interrupt isolation really
> > requires a malicious actor.  We're not going to inadvertently overlap
> > DMA to interrupt addresses like we might to a non-isolated MMIO ranges.
> > Therefore an admin can make a reasonable determination relative to the
> > extent to which the userspace is trusted.  This is not unlike opt-outs
> > to CPU vulnerability mitigation imo, there are use cases where the
> > performance or functionality is more important than the isolation.
> > Hand waving this away as a vfio-unique insecurity is a bad precedent
> > for iommufd.  
> 
> I agree with this, which is why I think it should come from the actual
> user facing subsystem not be a system wide flag. The "is userspace
> trusted" for VFIO may be quite different than from VDPA or whatever
> else comes next.
> 
> I'd be much more comfortable with this as a system wide iommufd flag
> if we also tied it to do some demonstration of privilege - eg a
> requirement to open iommufd with CAP_SYS_RAWIO for instance.

Which is not compatible to existing use cases, which is also why we
can't invent some way to allow some applications to run without CPU
mitigations, while requiring it for others as a baseline.

> That is the usual protocol for these kinds of insecurities..

Hmm, is it?

> I think right now we can leave this as-is and we can wait for some
> more information to decide how best to proceed.

It's certainly not acceptable in the latest proposal, iommufd consumes
an option set by another module and when that module goes away, so does
any claim of compatibility.  The code becomes dead and the feature not
present.  The option doesn't belong on the vfio module.  Do we need a
vfio-iommufd module to host it?  Thanks,

Alex

