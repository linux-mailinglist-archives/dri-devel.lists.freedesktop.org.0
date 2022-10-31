Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C1B6140E7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 23:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D916110E206;
	Mon, 31 Oct 2022 22:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2127810E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667256798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHpC1zf1qV1jmlc1wntYS1OKLTiiLa4Edpg3f0kbUyY=;
 b=Udrgb+4anK2Waf5x646xCIt+siPX86RcZjnUkEfDrP9uMHRvvnQVtEaWG8Mx3lnpfAhfYQ
 DpKYglVHmONERP/Y+0h8O3n0XguJ8wox+gCIQhol0GJt1X9fXDeNMWPRUrgmBo6IwmYXmj
 KWHBlbOWnuW4SB/U0nohDT+CGxa1+pI=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-rPMKUk0GN8mXSXYHPvYYbw-1; Mon, 31 Oct 2022 18:53:14 -0400
X-MC-Unique: rPMKUk0GN8mXSXYHPvYYbw-1
Received: by mail-il1-f198.google.com with SMTP id
 z19-20020a056e02089300b002fffe186ac4so11407411ils.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHpC1zf1qV1jmlc1wntYS1OKLTiiLa4Edpg3f0kbUyY=;
 b=Yywi4quHJfoh0NoJfEQs9YWDcSAYzDkaLgn+f0KvJYBC1zCv8QvJTNdE0h2k4gU3Ny
 m9/ftfplu5MRsBMMtunDHbGNK4s454+FZszZH8Nwy52gvP4OL540l+JQ4hlxgoRY90pe
 tJoUvuADrBPUqmRKwq4x1898qSJzrikUuHxUcnJV2DE5dnPp6H9Ln1tZMm/d7Ncc7Owx
 AT0Rf0t5lB7XHJRU/5emYaAL1cpXbInIp2/Yx1AdtAoHLnDt2cqUbs3zwGI+/8to5YVm
 MVxnlFbGsKyKc+WgbkplmuHu+eOrtEgm+blng0e3eAp06WLCdZL7g/eu1fFVYAPkCsBu
 8oVg==
X-Gm-Message-State: ACrzQf17tTLdZ/PNf9J9aSTeQKrPNp/bdeDwrePQeg3Kw9JdHaRiGfjA
 0Dv851sLYEmyUzzbPf8BSFRhEjJrSQOGRbsy3AdFEX1j1MfE0KmSLhDX0pQ3HH+i/d0g/1ppo9l
 qG/p5yK++XPtQpMegddoQhjeln+Gk
X-Received: by 2002:a05:6e02:180c:b0:2fc:4018:9440 with SMTP id
 a12-20020a056e02180c00b002fc40189440mr7991821ilv.225.1667256793699; 
 Mon, 31 Oct 2022 15:53:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7liCEme2wsc4XzJa+HajVmv1KVpsxVcMQII15KI4qdQbhYdKRKQskOMruD/YfHk1W7Cq0evQ==
X-Received: by 2002:a05:6e02:180c:b0:2fc:4018:9440 with SMTP id
 a12-20020a056e02180c00b002fc40189440mr7991769ilv.225.1667256793463; 
 Mon, 31 Oct 2022 15:53:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g15-20020a02850f000000b00372bbd04b75sm3200984jai.87.2022.10.31.15.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:53:12 -0700 (PDT)
Date: Mon, 31 Oct 2022 16:53:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 10/10] iommufd: Allow iommufd to supply /dev/vfio/vfio
Message-ID: <20221031165311.0698e1ea.alex.williamson@redhat.com>
In-Reply-To: <Y1wjFNxwPRm7S6yZ@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <10-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026153133.44dc05c8.alex.williamson@redhat.com>
 <Y1wjFNxwPRm7S6yZ@nvidia.com>
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
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

On Fri, 28 Oct 2022 15:44:36 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Oct 26, 2022 at 03:31:33PM -0600, Alex Williamson wrote:
> > On Tue, 25 Oct 2022 15:50:45 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > If the VFIO container is compiled out, give a kconfig option for iommufd
> > > to provide the miscdev node with the same name and permissions as vfio
> > > uses.
> > > 
> > > The compatibility node supports the same ioctls as VFIO and automatically
> > > enables the VFIO compatible pinned page accounting mode.  
> > 
> > I think I'd like to see some sort of breadcrumb when /dev/vfio/vfio is
> > provided by something other than the vfio container code.  If we intend
> > to include this before P2P is resolved, that breadcrumb   
> 
> I don't belive I can get P2P done soon enough. I plan to do it after
> this is merged. Right now these two series are taking all my time.
> 
> > (dmesg I'm guessing) might also list any known limitations of the
> > compatibility to save time with debugging.  Thanks,  
> 
> Yes, that makes sense.
> 
> Do you want a dmesg at module load time, on every open, or a sysfs
> something? What seems like it would make it into a bug report?

I think dmesg at module load time should probably be ok, every open
seems like harassment and sysfs would require updated support in
various bug reporting tools.  Users are often terrible about reporting
full dmesg in bugs, but they do often filter it for "IOMMU" or "VFIO",
so keep that in mind when crafting the log message.  Thanks,

Alex

