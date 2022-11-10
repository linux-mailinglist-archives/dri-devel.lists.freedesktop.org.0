Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67346247FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 18:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA28E10E175;
	Thu, 10 Nov 2022 17:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141E110E175
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668100228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XBNZVfwHOyxrKzEqgSDBaV/kDGeCsLaREPRXxkN8EM=;
 b=bSmu2RAUiPP+uyo1YY4ieRzl9cShG71GbLpnBxH2iT03EesUvtjp48uwtHrt5Mtdb/GbJx
 3Bmk3RSSqk5MkKvhFrJaxVIH+zm8UugH4OueDyc3RVnqPvVn6Vday7YjCE1XwOVbwCt/Nc
 337UpDRnVVttpGEttl8herIPp31QH1Y=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-hJv-SN6EOmu-44yTMIkksA-1; Thu, 10 Nov 2022 12:10:27 -0500
X-MC-Unique: hJv-SN6EOmu-44yTMIkksA-1
Received: by mail-il1-f198.google.com with SMTP id
 s4-20020a056e02216400b003021b648144so1987529ilv.19
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 09:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XBNZVfwHOyxrKzEqgSDBaV/kDGeCsLaREPRXxkN8EM=;
 b=WBL4ETyUYS+8j95/VjH9WzfQiCFQ9OkNGHC3OIjC/1crLWIPPkOcus+yZMG+R+mYzX
 bZBUv2tE+dJ53iW7/ZnBs1cy6lU82FQg2VyBPmeRTDQQG2xQXhWd7M7VVmk/PQeqBaxo
 vDwDlDGvarmqGyKkAjSvgceJIiYxrTiFHqFsuP2061bN6k5KiyvzFNX1mEL66krdifpY
 YWctVZn/3XQxH7RZcmIUAoSSECqvAd3epfGhnbRwvMpIMSwHZvuzX2nmtqG6ZPpAaHN0
 dT7mSZJEFZMLH6I0raqtPRT1cr5r7D4pYsEs6xREF2ufQTqXGmv15n8A/P8MUv4aR/yY
 3deA==
X-Gm-Message-State: ACrzQf2soThy9q6plOjnjdP1Be9t1zByLGsGPMRsK9Vg/kL8weZipMas
 Bs9K5gZsCfqB33lBrSNHjeiwW2Qvr5CAarZrNH0eK3JbwWWfymwA5xibXSj82PjHqMXUUII2KIA
 RG+33Ymhnv6QuHWIU9qH4eJOn0uS1
X-Received: by 2002:a05:6638:4413:b0:374:fbbe:2da6 with SMTP id
 bp19-20020a056638441300b00374fbbe2da6mr3149425jab.163.1668100226566; 
 Thu, 10 Nov 2022 09:10:26 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5st2ROvi8y5IPXYSHhk18Mv2oS6m3aLQCRNeAm9L0KyqI2dN1lMnwqPxWnGmIZODwHu3sF6g==
X-Received: by 2002:a05:6638:4413:b0:374:fbbe:2da6 with SMTP id
 bp19-20020a056638441300b00374fbbe2da6mr3149377jab.163.1668100226283; 
 Thu, 10 Nov 2022 09:10:26 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m1-20020a924a01000000b002f9652849f6sm30029ilf.67.2022.11.10.09.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 09:10:25 -0800 (PST)
Date: Thu, 10 Nov 2022 10:10:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Message-ID: <20221110101023.28e7a790.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276494548F01A42694E366A8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <20221108152831.1a2ed3df.alex.williamson@redhat.com>
 <Y2r6YnhuR3SxslL6@nvidia.com>
 <20221109101809.2ff08303.alex.williamson@redhat.com>
 <Y2wFFy0cxIIlCeTu@nvidia.com>
 <BN9PR11MB5276494548F01A42694E366A8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Eric
 Auger <eric.auger@redhat.com>, Harald
 Freudenberger <freude@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Nov 2022 06:57:57 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Thursday, November 10, 2022 3:53 AM
> > 
> > On Wed, Nov 09, 2022 at 10:18:09AM -0700, Alex Williamson wrote:
> >   
> > > DPDK supports no-iommu mode.  
> > 
> > Er? Huh? How? I thought no-iommu was for applications that didn't do
> > DMA? How is DPDK getting packets in/out without DMA? I guess it snoops
> > in /proc/ or something to learn PFNs of mlock'd memory? <shudder>  
> 
> iirc dpdk started with UIO plus various tricks (root privilege, hugepage, etc.)
> to lock and learn PFN's from pagemap. Then when migrating it to vfio the
> no-iommu option was introduced to provide UIO compatibility.

IIRC, we essentially introduced no-iommu mode vfio because DPDK started
pushing for extending interrupt support in uio-pci-generic.  The UIO
driver is also only meant for devices that don't do DMA, but obviously
DPDK didn't care about that.  Rather than extend UIO, we offered this
no-iommu mode in vfio since we already had more extensive MSI support,
were better able to impose restrictions on access to the device, and
using the same device access makes the transition to proper IOMMU
backed configurations more seamless.  Thanks,

Alex

