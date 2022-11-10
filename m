Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D89624B88
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 21:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35510E861;
	Thu, 10 Nov 2022 20:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC2E10E85E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668111415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVnV2DDw0Jhdp1QeqoFk0F1Z/gE4Ln1RaOhIXeyW3wU=;
 b=H4tPwNpV/d0gRm4no8ZSaaGmLIyST80Or//DBrig3sUgk7gtyb34o02B1ees6eqIEI0nVt
 bxAcLrsITJIWWkmqAKqFAICJG1MHtU1XZc07WiGwX9tKd7iv2SZukrYO/KR8i2xsIt12vS
 dYmCtY9BAHtpb9lrzrrP6QDG4kV1jkI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-sJB6jksBMfatjW6K2b7jPQ-1; Thu, 10 Nov 2022 15:16:51 -0500
X-MC-Unique: sJB6jksBMfatjW6K2b7jPQ-1
Received: by mail-io1-f71.google.com with SMTP id
 c23-20020a6b4e17000000b006db1063fc9aso1786007iob.14
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 12:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVnV2DDw0Jhdp1QeqoFk0F1Z/gE4Ln1RaOhIXeyW3wU=;
 b=hFR9hS9df5731GIm+G5ruMUE8iuncBLN+L/ZZ7sgjmJC/1WB7duwOhA4adUSapzNX3
 Bv+aBNm8Lu0bmFe7qJmJOhorS5O8X5x+wu2Y+9pXnxGRESxHD/Ijqn3QLRg7L/jCKanN
 l5nH9NPk6ydo1u5Smbp72uBTAVcHMUfvYixmEUN1FqxdZAdRD0vjWPRAfC+LGf68owTJ
 +ltKnmki++IPh5KJKNfMYtI+EKekWJDT6NmRN43D1z9EWNkKg4iKSyESQwP0neU7shKc
 JraULu+BRRgMITe6lYzqKKs6riMiKFTMS/VDQMXLmDdcpryWvaGETnzodcHJ3t/NWCaN
 oLtA==
X-Gm-Message-State: ACrzQf1thm8R2+GVmBPlU+1gbYBGmPjjX8ih9rK+9RmRnmKDORfK6LNS
 VYfvr9KumBmIimA+V35L9P2pI5G85taTdW4z/j40qcU3AHjR7eU/Rrl2FgO89WQkgX94Vn32obg
 PonYykTMDJ4wUMJCHy3eOC34Z10bI
X-Received: by 2002:a92:d70b:0:b0:2f9:516b:25f3 with SMTP id
 m11-20020a92d70b000000b002f9516b25f3mr3482770iln.156.1668111410912; 
 Thu, 10 Nov 2022 12:16:50 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7kmGLkxawxZSF0r3BGM7XEMkdaMXz0cdBNGYH99+jL5O4ssCKnWMKVWwzHqb43uql1tb9xRA==
X-Received: by 2002:a92:d70b:0:b0:2f9:516b:25f3 with SMTP id
 m11-20020a92d70b000000b002f9516b25f3mr3482749iln.156.1668111410617; 
 Thu, 10 Nov 2022 12:16:50 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i7-20020a0566022c8700b006bbea9f45cesm25981iow.38.2022.11.10.12.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 12:16:49 -0800 (PST)
Date: Thu, 10 Nov 2022 13:16:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v3 0/7] vfio-ccw parent rework
Message-ID: <20221110131632.4e00f87d.alex.williamson@redhat.com>
In-Reply-To: <20221104142007.1314999-1-farman@linux.ibm.com>
References: <20221104142007.1314999-1-farman@linux.ibm.com>
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

On Fri,  4 Nov 2022 15:20:00 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Hi Alex,
> 
> Here's the (last?) update to the vfio-ccw lifecycle changes that I've sent
> recently, and were previously discussed at various points [1][2].
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
> 
> I believe this covers everything in this space; let me know if not!
> 
> Thanks,
> Eric
> 
> [1] https://lore.kernel.org/kvm/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
> [2] https://lore.kernel.org/kvm/20220602171948.2790690-1-farman@linux.ibm.com/
> 
> v2->v3:
>  - [MR] Added r-b to remaining patches (Thank you!)
>  - Patch 1:
>    [gfx checkpatch] Whitespace
>    [EF] Remove put_device(&parent->dev)
>    [MR] Fix error exit when alloc of parent fails
>    [MR] Check for !private on sch_probe error path
>  - Patch 3:
>    [EF] Fix error exit when alloc of private fails
>  - Patch 6:
>    [AW] Added ack (Thank you!)
>  - Patch 7:
>    [CH, AK] Added r-b (Thank you!)
>    [AW] Added ack (Thank you!)
> v2: https://lore.kernel.org/kvm/20221102150152.2521475-1-farman@linux.ibm.com/
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
>  drivers/s390/cio/vfio_ccw_drv.c       | 173 +++++++++++---------------
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
>  16 files changed, 196 insertions(+), 202 deletions(-)
> 

Applied to vfio next branch for v6.2.  Thanks,

Alex

