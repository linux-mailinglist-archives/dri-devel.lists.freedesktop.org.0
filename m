Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0262313C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D34710E601;
	Wed,  9 Nov 2022 17:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14910E602
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668014294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnXgn16clICsmrV6UyAUvoxroMB/57yAi6UKnX9zn/8=;
 b=WndcJS31A/P1ODA6rTNvkj8ScMzPivQmeCG6ltyPMuPO1g1swQy+xgmfyc8m8Zz2ZYqiMY
 ZamY13c6wvzFLt/XVdu232RdK3iv4UdrxV8m2NXNjELaIAabZonkYufPMCv/CH1/k39iXz
 2JcrNuO1py88L9Pyi31Gxyu1TY8uSY0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-PtNERyibNuOZ3Ma9MLyrnA-1; Wed, 09 Nov 2022 12:18:13 -0500
X-MC-Unique: PtNERyibNuOZ3Ma9MLyrnA-1
Received: by mail-io1-f71.google.com with SMTP id
 i6-20020a5d88c6000000b006d088a0e518so11618242iol.19
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 09:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnXgn16clICsmrV6UyAUvoxroMB/57yAi6UKnX9zn/8=;
 b=0z1tTyexy/TcgN7pJCjY11OxxA5XJ156M8mtqnqfev8gd46N+6ACNoE3vpsTCDtZyg
 GzA0+XPlav93P8SU2M3onu6F3yGPHYOsHSLuMc7/+h2upRHcEWFgqOQvk8R6jNIVIdOG
 pqtK80fv607/st7OeU7+I2uqzu1lFPvL7wYBt3JQ98Q1kCpg2Tl8JsqrCRYCWkad+y4u
 B1Kpvstpt8ievyOIsKWCK7nEtK4JZjbldNin+g8OnbvBtj5Szo3fUBRc1P98N0Q5rAJS
 563lpJqRjWx7VtCP2Rl/MAH5bbybcWwiBum/5CF10aYCkDDjxFQ89Xxpp4PEXDg5jTVM
 zEkg==
X-Gm-Message-State: ACrzQf2KGiGA+9WTxczHnYi98hGTIEqbXCjWY+gqwpnyH1Dvr8EudVN3
 KBMCRTs786tgDLlSyLGrstX2Dc3UVuCtKRSjdL/L97WpsF2z3MVdARQVc+EfhoQBSofsujkrSAa
 jmaj4Un3pEb52oJ6+H1gSbudP5XMG
X-Received: by 2002:a6b:e208:0:b0:6d7:b1a7:c220 with SMTP id
 z8-20020a6be208000000b006d7b1a7c220mr1771076ioc.7.1668014292606; 
 Wed, 09 Nov 2022 09:18:12 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6F677E3Z9Fik/IZx4pkrsVOrB6N7Pz805qwA6pjiuY0YCpqNr/AQzfBn6PMq3gQd7YTPJ/wA==
X-Received: by 2002:a6b:e208:0:b0:6d7:b1a7:c220 with SMTP id
 z8-20020a6be208000000b006d7b1a7c220mr1771033ioc.7.1668014292281; 
 Wed, 09 Nov 2022 09:18:12 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i12-20020a056e02152c00b00300e6efca96sm5020565ilu.55.2022.11.09.09.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 09:18:11 -0800 (PST)
Date: Wed, 9 Nov 2022 10:18:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Message-ID: <20221109101809.2ff08303.alex.williamson@redhat.com>
In-Reply-To: <Y2r6YnhuR3SxslL6@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <20221108152831.1a2ed3df.alex.williamson@redhat.com>
 <Y2r6YnhuR3SxslL6@nvidia.com>
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 20:54:58 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Nov 08, 2022 at 03:28:31PM -0700, Alex Williamson wrote:
> 
> > Perhaps this should have been obvious, but I'm realizing that
> > vfio-noiommu mode is completely missing without VFIO_CONTAINER, which
> > seems a barrier to deprecating VFIO_CONTAINER and perhaps makes it a  
> 
> Yes, it is the same as the allow_unsafe_interrupts - it is something
> that currently goes missing if you turn off VFIO_CONTAINER.
> 
> This seems straightforward enough to resolve in a followup, we mostly
> just need someone with an existing no-iommu application to test
> compatability against. Keeping it working with the device cdev will
> also be a bit interesting. If you have or know about some application
> I can try to make a patch.

DPDK supports no-iommu mode.

> > question whether IOMMUFD should really be taking over /dev/vfio/vfio.
> > No-iommu mode has users.    
> 
> I view VFIO_CONTAINER=n as a process. An aspiration we can work
> toward.
> 
> At this point there are few places that might want to use it. Android
> perhaps, for example. It is also useful for testing. One of the main
> values is you can switch the options and feed the kernel into an
> existing test environment and see what happens. This is how we are
> able to quickly get s390 mdev testing, for instance.
> 
> We are not going to get to a widely useful VFIO_CONTAINER=n if we
> don't have a target that people can test against and evaluate what
> compatability gaps may exist.
> 
> So, everytime we find something like this - let's think about how can
> we make iommufd compatibility handle it and not jump straight to
> giving up :)
> 
> I'm kind of thinking v6.4 might be a reasonable kernel target when we
> might have closed off enough things.

I agree that it's very useful for testing, I'm certainly not suggesting
to give up, but I'm not sure where no-iommu lives when iommufd owns
/dev/vfio/vfio.  Given the unsafe interrupts discussion, it doesn't
seem like the type of thing that would be a priority for iommufd.

We're on a path where vfio accepts an iommufd as a container, and
ultimately iommufd becomes the container provider, supplanting the
IOMMU driver registration aspect of vfio.  I absolutely want type1 and
spapr backends to get replaced by iommufd, but reluctance to support
aspects of vfio "legacy" behavior doesn't give me warm fuzzies about a
wholesale hand-off of the container to a different subsystem, for
example vs an iommufd shim spoofing type1 support.

Unfortunately we no longer have a CONFIG_EXPERIMENTAL option to hide
behind for disabling VFIO_CONTAINER, so regardless of our intentions
that a transition is some time off, it may become an issue sooner than
we expect.  Thanks,

Alex

