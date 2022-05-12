Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B687952549A
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 20:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58F110E49F;
	Thu, 12 May 2022 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639CF10E49F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652379688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcoQlfgRlKTkG2QnFhtWwqPtuN/iCo7Oei+ZTVCbp8Q=;
 b=MYwJCpDFNPsCAE61hguOTrE/DJOw7FLgNzWrN10Y9W92d8kjqttp6MSDJNFXnuAtzh/MT2
 U5DehndC2zN2hPSEne16DDi5ZD9fCKbPu9Q0csWCpVvFQ7DMe0+VNcNqYz38fbhUtZNFEK
 fn6NwrNmTQFbZdy4Exh3THlq0va78n0=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-b4XhdNnkOFuszKnztPMOYA-1; Thu, 12 May 2022 14:21:27 -0400
X-MC-Unique: b4XhdNnkOFuszKnztPMOYA-1
Received: by mail-il1-f199.google.com with SMTP id
 g1-20020a92cda1000000b002cf30d49956so3735072ild.18
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=VcoQlfgRlKTkG2QnFhtWwqPtuN/iCo7Oei+ZTVCbp8Q=;
 b=WuqkYyY0/nL8o5yl+QvAA46BdyaZHd5JFYg2E6Ywqn6EbYiDS0Vjb7LJPo2LJjB/gL
 5lkU2krnQ47uQtJA+jYBgH3aXrHPln5Syv0FL9AriEtMG5dTdmbuTdkhCqQETIc9FKON
 Dozpb5smatpuUOnjxmprUMI8jj0yLePXhriFZWHWMv2VzIgoJV58TxYnypY/+Ee/B7Y/
 YSICD3Zc+oPosb4yOmRQHTlaxwbgmnLLnt2n6RxT9ZrFx9sz9M5I/3aTsONeQO3z1iPB
 pVeAbS1QDDbxikb9eP+SJNkbTxlgIz5NsddslewJTuKeOd08KnHbz4/+57143kaFMqwL
 A8Qg==
X-Gm-Message-State: AOAM530KKYmiBl5M29h6//F9IkQrXQQyiPQVPFN8JW9N2fH/UjO4rE+5
 zMlx7XH0oeLNPVvAVZoKqPfoOwQ07sqaTl/y4qBC8MJg9phLY+AKcY+OFpbM3q4UUqRipU7bo4Y
 zxg1lVCDAg+9t2BC042Ry9A0OSJn7
X-Received: by 2002:a05:6638:112c:b0:32a:e187:db1c with SMTP id
 f12-20020a056638112c00b0032ae187db1cmr674233jar.30.1652379686426; 
 Thu, 12 May 2022 11:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrRp6MP9ShOncs1HnxoZReB9N25AEJ1S9eav9CPEBe+VnbpmFQ2wHym+Hz1/03tFiw2rRYCw==
X-Received: by 2002:a05:6638:112c:b0:32a:e187:db1c with SMTP id
 f12-20020a056638112c00b0032ae187db1cmr674208jar.30.1652379686238; 
 Thu, 12 May 2022 11:21:26 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t188-20020a0254c5000000b0032b3a7817d6sm53215jaa.154.2022.05.12.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:21:25 -0700 (PDT)
Date: Thu, 12 May 2022 12:21:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 0/7] Make the rest of the VFIO driver interface use
 vfio_device
Message-ID: <20220512122124.45943a9e.alex.williamson@redhat.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
Organization: Red Hat
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
 David Airlie <airlied@linux.ie>, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  5 May 2022 21:08:38 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Prior series have transformed other parts of VFIO from working on struct
> device or struct vfio_group into working directly on struct
> vfio_device. Based on that work we now have vfio_device's readily
> available in all the drivers.
> 
> Update the rest of the driver facing API to use vfio_device as an input.
> 
> The following are switched from struct device to struct vfio_device:
>   vfio_register_notifier()
>   vfio_unregister_notifier()
>   vfio_pin_pages()
>   vfio_unpin_pages()
>   vfio_dma_rw()
> 
> The following group APIs are obsoleted and removed by just using struct
> vfio_device with the above:
>   vfio_group_pin_pages()
>   vfio_group_unpin_pages()
>   vfio_group_iommu_domain()
>   vfio_group_get_external_user_from_dev()
> 
> To retain the performance of the new device APIs relative to their group
> versions optimize how vfio_group_add_container_user() is used to avoid
> calling it when the driver must already guarantee the device is open and
> the container_users incrd.
> 
> The remaining exported VFIO group interfaces are only used by kvm, and are
> addressed by a parallel series.
> 
> This series is based on Christoph's gvt rework here:
> 
>  https://lore.kernel.org/all/5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com/
> 
> and so will need the PR merged first.
> 
> I have a followup series that needs this.
> 
> This is also part of the iommufd work - moving the driver facing interface
> to vfio_device provides a much cleaner path to integrate with iommufd.
> 
> v4:
>  - Use 'device' as the argument name for a struct vfio_device in vfio.c
> v3: https://lore.kernel.org/r/0-v3-e131a9b6b467+14b6-vfio_mdev_no_group_jgg@nvidia.com
>  - Based on VFIO's gvt/iommu merge
>  - Remove mention of mdev_legacy_get_vfio_device() from commit message
>  - Clarify commit message for vfio_dma_rw() conversion
>  - Talk about the open_count change in the commit message
>  - No code change
> v2: https://lore.kernel.org/r/0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com
>  - Based on Christoph's series so mdev_legacy_get_vfio_device() is removed
>  - Reflow indenting
>  - Use vfio_assert_device_open() and WARN_ON_ONCE instead of open coding
>    the assertion
> v1: https://lore.kernel.org/r/0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com
> 
> Jason Gunthorpe (7):
>   vfio: Make vfio_(un)register_notifier accept a vfio_device
>   vfio/ccw: Remove mdev from struct channel_program
>   vfio/mdev: Pass in a struct vfio_device * to vfio_pin/unpin_pages()
>   vfio/mdev: Pass in a struct vfio_device * to vfio_dma_rw()
>   drm/i915/gvt: Change from vfio_group_(un)pin_pages to
>     vfio_(un)pin_pages
>   vfio: Remove dead code
>   vfio: Remove calls to vfio_group_add_container_user()
> 
>  .../driver-api/vfio-mediated-device.rst       |   4 +-
>  drivers/gpu/drm/i915/gvt/gvt.h                |   5 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  51 ++-
>  drivers/s390/cio/vfio_ccw_cp.c                |  47 +--
>  drivers/s390/cio/vfio_ccw_cp.h                |   4 +-
>  drivers/s390/cio/vfio_ccw_fsm.c               |   3 +-
>  drivers/s390/cio/vfio_ccw_ops.c               |   7 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |  23 +-
>  drivers/vfio/vfio.c                           | 299 +++---------------
>  include/linux/vfio.h                          |  21 +-
>  10 files changed, 109 insertions(+), 355 deletions(-)

Applied to vfio next branch for v5.19.  Thanks,

Alex

