Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38D618AE7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 22:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3210E647;
	Thu,  3 Nov 2022 21:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B3510E645
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667512576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+gPBLcj3yfcNxg3iZDolr/DLSZRZsYZJ+BZEPDd0k8=;
 b=DpyiiCjoutuz5IZr2y51EINmY9i02n84pK3ZdkXXhu5UoJX5VLMSze9+aSzfQFTwbFzkr1
 0nrAsIj/xWzAzYkxjUllbNsCKobuWkS20gosbB+4bY59cNNGwe3gu6fIanQEWIDUN6yYiL
 et36X0d2KlFNK7wLzG+Df0ZhqM1p+8c=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-C6zXqbaUO02IUxcU8sqqTw-1; Thu, 03 Nov 2022 17:56:15 -0400
X-MC-Unique: C6zXqbaUO02IUxcU8sqqTw-1
Received: by mail-il1-f200.google.com with SMTP id
 w13-20020a056e021c8d00b00300ad5b16a0so2520464ill.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 14:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+gPBLcj3yfcNxg3iZDolr/DLSZRZsYZJ+BZEPDd0k8=;
 b=UpHXHPM0oUzGsc9qrjvAcbpPT5cRqgZq5x4F/jd4AMW3aZWAZjR6mClaT2BBdjJQSP
 lwuz4NFMLy08YM7IUr18C+seSNtWWBXL+ddevCisg0W26zv8Y3WzH1AqVFR2QUM0wf3n
 o7VbH30PxD3cGRbzCiuAHK0ZEOS9wIz+immjMalPdr10EWbpp5dstM179j+fLUgiCpTF
 uDMf605X7kFaetLpTfLviD1/JJdgAytGc2jaPmEVrzjxV+LHrWduUGnhDyqj2L/pvPdy
 HQNW+471PJ5Ilsuaf61tmzY/6lTfOgbkGT2dqmrPXFQiCnMI2I6qDYIeJhid+xTBL85M
 gb7A==
X-Gm-Message-State: ACrzQf2Vf2uxi4Jw8pnCwDIkAWRfJDpj9LFSgr5UohQkoFhQca00afJr
 Hfckzbj8mqdl4eDKDb4ZetEs+54nDhev72JvfNhczkyVYTAv3MiVCcJmQKCX+hWBRRu6D+KFWmG
 u+9W7c7OvjRVGYcvnwGREool2DtTR
X-Received: by 2002:a05:6602:2c09:b0:694:51c4:8282 with SMTP id
 w9-20020a0566022c0900b0069451c48282mr20182370iov.203.1667512574949; 
 Thu, 03 Nov 2022 14:56:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XXTGY/jAs7DgmNTFtcqCXPtF5Oitv5ZjT7vsZBKLSnzosYzEC5JgzfurqOGyquHSILSbftA==
X-Received: by 2002:a05:6602:2c09:b0:694:51c4:8282 with SMTP id
 w9-20020a0566022c0900b0069451c48282mr20182338iov.203.1667512574697; 
 Thu, 03 Nov 2022 14:56:14 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z27-20020a05663822bb00b00371caa7ef7csm598363jas.2.2022.11.03.14.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:56:14 -0700 (PDT)
Date: Thu, 3 Nov 2022 15:56:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2 0/7] vfio-ccw parent rework
Message-ID: <20221103155611.0008075f.alex.williamson@redhat.com>
In-Reply-To: <20221102150152.2521475-1-farman@linux.ibm.com>
References: <20221102150152.2521475-1-farman@linux.ibm.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  2 Nov 2022 16:01:45 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Hi all,
> 
> Here is an update to the vfio-ccw lifecycle changes that have been discussed
> in various forms over the past year [1][2] or so, and which I dusted off
> recently.
> 
> Patches 1-5 rework the behavior of the vfio-ccw driver's private struct.
> In summary, the mdev pieces are split out of vfio_ccw_private and into a
> new vfio_ccw_parent struct that will continue to follow today's lifecycle.
> The remainder (bulk) of the private struct moves to follow the mdev
> probe/remove pair. There's opportunity for further separation of the
> things in the private struct, which would simplify some of the vfio-ccw
> code, but it got too hairy as I started that. Once vfio-ccw is no longer
> considered unique, those cleanups can happen at our leisure. 
> 
> Patch 6 removes the trickery where vfio-ccw uses vfio_init_device instead of
> vfio_alloc_device, and thus removes vfio_init_device from the outside world.
> 
> Patch 7 removes vfio_free_device from vfio-ccw and the other drivers (hello,
> CC list!), letting it be handled by vfio_device_release directly.

Looks like another spin is pending, but the vfio core and collateral
changes in 6 and 7 look good to me.  Would this go in through the vfio
or s390 tree?  I'd be happy to merge or provide a branch, depending on
the route.

For 6 & 7:
Acked-by: Alex Williamson <alex.williamson@redhat.com>

Thanks,
Alex


> Looking forward to the feedback.
> 
> Thanks,
> Eric
> 
> [1] https://lore.kernel.org/kvm/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
> [2] https://lore.kernel.org/kvm/20220602171948.2790690-1-farman@linux.ibm.com/
> 
> v1->v2:
>  - Rebase to 6.1-rc3
>  - Patch 1:
>    [EF] s/device_initialize/device_register/ and associated adjustments
>    [MR] Add WARN_ON(!private) in vfio_ccw_sch_quiesce()
>    [MR] Move struct vfio_ccw_parent to _private.h, instead of standalone file
>  - Patch 2:
>    [MR] Added r-b (Thank you!)
>  - Patch 3:
>    [MR] Update commit message to point to introduction of private->release_comp
>    [MR] Replace the remnants of vfio_ccw_alloc_private with a straight kzalloc
>    [MR] Added r-b (Thank you!)
>  - Patch 5:
>    [KT] Added r-b (Thank you!)
>  - Patch 6:
>    [JG] Make vfio_init_device static
>    [KT] Added r-b (Thank you!)
>  - Patch 7:
>    [JG, KT] Added r-b (Thank you!)
> v1: https://lore.kernel.org/kvm/20221019162135.798901-1-farman@linux.ibm.com/
> 
> Eric Farman (7):
>   vfio/ccw: create a parent struct
>   vfio/ccw: remove private->sch
>   vfio/ccw: move private initialization to callback
>   vfio/ccw: move private to mdev lifecycle
>   vfio/ccw: remove release completion
>   vfio/ccw: replace vfio_init_device with _alloc_
>   vfio: Remove vfio_free_device
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |   1 -
>  drivers/s390/cio/vfio_ccw_chp.c       |   5 +-
>  drivers/s390/cio/vfio_ccw_drv.c       | 174 +++++++++++---------------
>  drivers/s390/cio/vfio_ccw_fsm.c       |  27 ++--
>  drivers/s390/cio/vfio_ccw_ops.c       | 107 +++++++++++-----
>  drivers/s390/cio/vfio_ccw_private.h   |  37 ++++--
>  drivers/s390/crypto/vfio_ap_ops.c     |   6 -
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c     |   1 -
>  drivers/vfio/pci/vfio_pci_core.c      |   1 -
>  drivers/vfio/platform/vfio_amba.c     |   1 -
>  drivers/vfio/platform/vfio_platform.c |   1 -
>  drivers/vfio/vfio_main.c              |  32 ++---
>  include/linux/vfio.h                  |   3 -
>  samples/vfio-mdev/mbochs.c            |   1 -
>  samples/vfio-mdev/mdpy.c              |   1 -
>  samples/vfio-mdev/mtty.c              |   1 -
>  16 files changed, 197 insertions(+), 202 deletions(-)
> 

