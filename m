Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05835FA54
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 20:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDE26E92B;
	Wed, 14 Apr 2021 18:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4627B6E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618424257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OYqddHlJXne+BFhqnkmv4/g/hMbPLBDi1f2Aw0G4WA=;
 b=UsDrzHNZcH7/kVnBjt4xw+jeywTLtI42LEgW9Zdr0GFIjGmA5wDi14/hAl9AOiDbHS67zd
 ajLMdx1jEx7ImBjv/+etD5xpw8wrQl18T5625+AcDPXJJTNARu5Xei715rGmXlQj6poIiE
 86ajmNI2c3uwwhYdGE+mAQp7vtAiy6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-eHNIH7HTPv-2GGaEQKhsNQ-1; Wed, 14 Apr 2021 14:17:35 -0400
X-MC-Unique: eHNIH7HTPv-2GGaEQKhsNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801148030A0;
 Wed, 14 Apr 2021 18:17:30 +0000 (UTC)
Received: from omen (ovpn-117-254.rdu2.redhat.com [10.10.117.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBA3A5D6D7;
 Wed, 14 Apr 2021 18:17:20 +0000 (UTC)
Date: Wed, 14 Apr 2021 12:17:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 00/18] Make vfio_mdev type safe
Message-ID: <20210414121719.7bdb6867@omen>
In-Reply-To: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
References: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Neo Jia <cjia@nvidia.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dong Jia Shi <bjsdjshi@linux.vnet.ibm.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jike Song <jike.song@intel.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  6 Apr 2021 16:40:23 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> vfio_mdev has a number of different objects: mdev_parent, mdev_type and
> mdev_device.
> 
> Unfortunately the types of these have been erased in various places
> throughout the API, and this makes it very hard to understand this code or
> maintain it by the time it reaches all of the drivers.
> 
> This series puts in all the types and aligns some of the design with the
> driver core standard for a driver core bus driver:
> 
>  - Replace 'struct device *' with 'struct mdev_device *
>  - Replace 'struct device *' with 'struct mdev_type *' and
>    mtype_get_parent_dev()
>  - Replace 'struct kobject *' with 'struct mdev_type *'
> 
> Now that types are clear it is easy to spot a few places that have
> duplicated information.
> 
> More significantly we can now understand how to directly fix the
> obfuscated 'kobj->name' matching by realizing the the kobj is a mdev_type,
> which is linked to the supported_types_list provided by the driver, and
> thus the core code can directly return the array indexes all the drivers
> actually want.
> 
> v2:
>  - Use a mdev_type local in mdev_create_sysfs_files
>  - Rename the goto unwind labels in mdev_device_free()
>  - Reorder patches, annotate reviewed-by's thanks all
> v1: https://lore.kernel.org/r/0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com
> 
> Jason Gunthorpe (18):
>   vfio/mdev: Fix missing static's on MDEV_TYPE_ATTR's
>   vfio/mdev: Do not allow a mdev_type to have a NULL parent pointer
>   vfio/mdev: Add missing typesafety around mdev_device
>   vfio/mdev: Simplify driver registration
>   vfio/mdev: Use struct mdev_type in struct mdev_device
>   vfio/mdev: Expose mdev_get/put_parent to mdev_private.h
>   vfio/mdev: Add missing reference counting to mdev_type
>   vfio/mdev: Reorganize mdev_device_create()
>   vfio/mdev: Add missing error handling to dev_set_name()
>   vfio/mdev: Remove duplicate storage of parent in mdev_device
>   vfio/mdev: Add mdev/mtype_get_type_group_id()
>   vfio/mtty: Use mdev_get_type_group_id()
>   vfio/mdpy: Use mdev_get_type_group_id()
>   vfio/mbochs: Use mdev_get_type_group_id()
>   vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV
>   vfio/gvt: Use mdev_get_type_group_id()
>   vfio/mdev: Remove kobj from mdev_parent_ops->create()
>   vfio/mdev: Correct the function signatures for the
>     mdev_type_attributes
> 
>  .../driver-api/vfio-mediated-device.rst       |   9 +-
>  drivers/gpu/drm/i915/Kconfig                  |   1 +
>  drivers/gpu/drm/i915/gvt/gvt.c                |  41 ++---
>  drivers/gpu/drm/i915/gvt/gvt.h                |   4 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |   7 +-
>  drivers/s390/cio/vfio_ccw_ops.c               |  17 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |  14 +-
>  drivers/vfio/mdev/mdev_core.c                 | 174 +++++++-----------
>  drivers/vfio/mdev/mdev_driver.c               |  19 +-
>  drivers/vfio/mdev/mdev_private.h              |  40 ++--
>  drivers/vfio/mdev/mdev_sysfs.c                |  59 +++---
>  drivers/vfio/mdev/vfio_mdev.c                 |  29 +--
>  drivers/vfio/vfio_iommu_type1.c               |  25 +--
>  include/linux/mdev.h                          |  80 +++++---
>  samples/vfio-mdev/mbochs.c                    |  55 +++---
>  samples/vfio-mdev/mdpy.c                      |  56 +++---
>  samples/vfio-mdev/mtty.c                      |  66 ++-----
>  17 files changed, 313 insertions(+), 383 deletions(-)

Applied to vfio next branch for v5.13.  Thanks!

Alex

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
