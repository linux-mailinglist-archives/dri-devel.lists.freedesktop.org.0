Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6AD36CDE2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 23:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0599F6E9CF;
	Tue, 27 Apr 2021 21:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71866E9CD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 21:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619559058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owSuX0IYYbKuOWpVt2C5gN4EPBjP7c56j/CsuTAmQZ4=;
 b=aLpJUCPpQ1Py8FiKkFMj6DPugHAhmo/Z5PxJix82mI7+DSxNQYt0/F16FBEvBAUmVgNyAa
 iklRh3fZEgcyVZwII+hHKNC38G3R2jP3plKrjfdVt4Iv8eeHiAZWlswoXDNTFQcFyixgE+
 0dwPxbazYZOt9Z8Ejy7GcZg+9kXPj2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-zx3zw6DRMkeCyWY8RxI5DA-1; Tue, 27 Apr 2021 17:30:49 -0400
X-MC-Unique: zx3zw6DRMkeCyWY8RxI5DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C41CC7400;
 Tue, 27 Apr 2021 21:30:45 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E6761042A90;
 Tue, 27 Apr 2021 21:30:43 +0000 (UTC)
Date: Tue, 27 Apr 2021 15:30:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 00/13] Remove vfio_mdev.c, mdev_parent_ops and more
Message-ID: <20210427153042.103e12ab@redhat.com>
In-Reply-To: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
References: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Apr 2021 17:00:02 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The mdev bus's core part for managing the lifecycle of devices is mostly
> as one would expect for a driver core bus subsystem.
> 
> However instead of having a normal 'struct device_driver' and binding the
> actual mdev drivers through the standard driver core mechanisms it open
> codes this with the struct mdev_parent_ops and provides a single driver
> that shims between the VFIO core and the actual device driver.
> 
> Make every one of the mdev drivers implement an actual struct mdev_driver
> and directly call vfio_register_group_dev() in the probe() function for
> the mdev.
> 
> Squash what is left of the mdev_parent_ops into the mdev_driver and remap
> create(), remove() and mdev_attr_groups to their driver core
> equivalents. Arrange to bind the created mdev_device to the mdev_driver
> that is provided by the end driver.
> 
> The actual execution flow doesn't change much, eg what was
> parent_ops->create is now device_driver->probe and it is called at almost
> the exact same time - except under the normal control of the driver core.
> 
> This allows deleting the entire mdev_drvdata, and tidying some of the
> sysfs. Many places in the drivers start using container_of()
> 
> This cleanly splits the mdev sysfs GUID lifecycle management stuff from
> the vfio_device implementation part, the only VFIO special part of mdev
> that remains is the mdev specific iommu intervention.
> 
> v2:
>  - Keep && m in samples kconfig
>  - Restore accidently squashed removeal of vfio_mdev.c
>  - Remove indirections to call bus_register()/bus_unregister()
>  - Reflow long doc lines
> v1: https://lore.kernel.org/r/0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com
> 
> Jason
> 
> Cc: Leon Romanovsky <leonro@nvidia.com>
> Cc: "Raj, Ashok" <ashok.raj@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Max Gurtovoy <mgurtovoy@nvidia.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Tarun Gupta <targupta@nvidia.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> 
> Jason Gunthorpe (13):
>   vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
>   vfio/mdev: Allow the mdev_parent_ops to specify the device driver to
>     bind
>   vfio/mtty: Convert to use vfio_register_group_dev()
>   vfio/mdpy: Convert to use vfio_register_group_dev()
>   vfio/mbochs: Convert to use vfio_register_group_dev()
>   vfio/ap_ops: Convert to use vfio_register_group_dev()
>   vfio/ccw: Convert to use vfio_register_group_dev()
>   vfio/gvt: Convert to use vfio_register_group_dev()
>   vfio/mdev: Remove vfio_mdev.c
>   vfio/mdev: Remove mdev_parent_ops dev_attr_groups
>   vfio/mdev: Remove mdev_parent_ops
>   vfio/mdev: Use the driver core to create the 'remove' file
>   vfio/mdev: Remove mdev drvdata

It'd be really helpful if you could consistently copy at least one
list, preferably one monitored by patchwork, for an entire series.  The
kvm list is missing patches 06 and 08.  I can find the latter hopping
over to the intel-gfx or dri-devel projects as I did for the last
series, but 06 only copied linux-s390, where I need to use lore and
can't find a patchwork.  Thanks,

Alex

> 
>  .../driver-api/vfio-mediated-device.rst       |  56 ++---
>  Documentation/s390/vfio-ap.rst                |   1 -
>  arch/s390/Kconfig                             |   2 +-
>  drivers/gpu/drm/i915/Kconfig                  |   2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              | 210 +++++++++--------
>  drivers/s390/cio/vfio_ccw_drv.c               |  21 +-
>  drivers/s390/cio/vfio_ccw_ops.c               | 136 ++++++-----
>  drivers/s390/cio/vfio_ccw_private.h           |   5 +
>  drivers/s390/crypto/vfio_ap_ops.c             | 138 ++++++-----
>  drivers/s390/crypto/vfio_ap_private.h         |   2 +
>  drivers/vfio/mdev/Kconfig                     |   7 -
>  drivers/vfio/mdev/Makefile                    |   1 -
>  drivers/vfio/mdev/mdev_core.c                 |  67 ++++--
>  drivers/vfio/mdev/mdev_driver.c               |  20 +-
>  drivers/vfio/mdev/mdev_private.h              |   4 +-
>  drivers/vfio/mdev/mdev_sysfs.c                |  37 ++-
>  drivers/vfio/mdev/vfio_mdev.c                 | 180 ---------------
>  drivers/vfio/vfio.c                           |   6 +-
>  include/linux/mdev.h                          |  86 +------
>  include/linux/vfio.h                          |   4 +
>  samples/Kconfig                               |   6 +-
>  samples/vfio-mdev/mbochs.c                    | 166 +++++++------
>  samples/vfio-mdev/mdpy.c                      | 162 +++++++------
>  samples/vfio-mdev/mtty.c                      | 218 +++++++-----------
>  24 files changed, 651 insertions(+), 886 deletions(-)
>  delete mode 100644 drivers/vfio/mdev/vfio_mdev.c
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
