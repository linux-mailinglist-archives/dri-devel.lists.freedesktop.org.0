Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617955B2C65
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 05:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EA810EA21;
	Fri,  9 Sep 2022 03:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F7010E244;
 Fri,  9 Sep 2022 03:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662692683; x=1694228683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+CRhjjxG8elyohg8uAXljHfLC1jEqw8D5rpZVMXHkg=;
 b=dp5iT650VwF6McLjxIlDe0MMHO0ertK/E9HfaTcmDqRk4MqsqkkD5fuW
 1xZ7day8/Quo5OIZJO0JDDyiG5gVn4gk213z2MMGP46SrKgIJH9LiwCaX
 qHAnp3S2lcNsSeirZoKAfQY/bsFs8gx7MlGWIL1CQRkNq9laflzOVlJoI
 Kgi4LdpbWhBp55CQLRhEAOS8qokPVZOXL3Yh4bOk3xELBn6lnWYgWiRb2
 /IwqHldccPuqyCo4/6NnUHcbPBqMLy84RRarC85HK+SY4mGfdj7D5lS3r
 7bKeP9UhAPeM5nURWDgGXoDXwolmY0CBY1XKKv+C+FZS0Rum63y6QJSyq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361340765"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="361340765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740908460"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 20:03:27 -0700
From: Kevin Tian <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org
Subject: [PATCH v3 00/15] Tidy up vfio_device life cycle
Date: Fri,  9 Sep 2022 18:22:32 +0800
Message-Id: <20220909102247.67324-1-kevin.tian@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The idea is to let vfio core manage the vfio_device life cycle instead
of duplicating the logic cross drivers. Besides cleaner code in driver
side this also allows adding struct device to vfio_device as the first
step toward adding cdev uAPI in the future. Another benefit is that
user can now look at sysfs to decide whether a device is bound to
vfio [1], e.g.:

	/sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0

Though most drivers can fit the new model naturally:

 - vfio_alloc_device() to allocate and initialize vfio_device
 - vfio_put_device() to release vfio_device
 - dev_ops->init() for driver private initialization
 - dev_ops->release() for driver private cleanup

vfio-ccw is the only exception due to a life cycle mess that its private
structure mixes both parent and mdev info hence must be alloc/freed
outside of the life cycle of vfio device.

Per prior discussions this won't be fixed in short term by IBM folks [2].

Instead of waiting this series introduces a few tricks to move forward:

 - vfio_init_device() to initialize a pre-allocated device structure;

 - require *EVERY* driver to implement @release and free vfio_device
   inside. Then vfio-ccw can use a completion mechanism to delay the
   free to css driver;

The second trick is not a real burden to other drivers because they
all require a @release for private cleanup anyay. Later once the ccw
mess is fixed a simple cleanup can be done by moving free from @release
to vfio core.

Thanks
Kevin

[1] https://listman.redhat.com/archives/libvir-list/2022-August/233482.html
[2] https://lore.kernel.org/all/0ee29bd6583f17f0ee4ec0769fa50e8ea6703623.camel@linux.ibm.com/

v3:
 - rebase to vfio-next after resolving conflicts with Yishai's series
 - add missing fixes for two checkpatch errors
 - fix grammar issues (Eric Auger)
 - add more r-b's

v2:
 - https://lore.kernel.org/lkml/20220901143747.32858-1-kevin.tian@intel.com/
 - rebase to 6.0-rc3
 - fix build warnings (lkp)
 - patch1: remove unnecessary forward reference (Jason)
 - patch10: leave device_set released by vfio core (Jason)
 - patch13: add Suggested-by
 - patch15: add ABI file sysfs-devices-vfio-dev (Alex)
 - patch15: rename 'vfio' to 'vfio_group' in procfs (Jason)

v1: https://lore.kernel.org/lkml/20220827171037.30297-1-kevin.tian@intel.com/

Kevin Tian (6):
  vfio: Add helpers for unifying vfio_device life cycle
  drm/i915/gvt: Use the new device life cycle helpers
  vfio/platform: Use the new device life cycle helpers
  vfio/amba: Use the new device life cycle helpers
  vfio/ccw: Use the new device life cycle helpers
  vfio: Rename vfio_device_put() and vfio_device_try_get()

Yi Liu (9):
  vfio/pci: Use the new device life cycle helpers
  vfio/mlx5: Use the new device life cycle helpers
  vfio/hisi_acc: Use the new device life cycle helpers
  vfio/mdpy: Use the new device life cycle helpers
  vfio/mtty: Use the new device life cycle helpers
  vfio/mbochs: Use the new device life cycle helpers
  vfio/ap: Use the new device life cycle helpers
  vfio/fsl-mc: Use the new device life cycle helpers
  vfio: Add struct device to vfio_device

 .../ABI/testing/sysfs-devices-vfio-dev        |   8 +
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/i915/gvt/gvt.h                |   5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  52 ++++--
 drivers/gpu/drm/i915/gvt/vgpu.c               |  33 ++--
 drivers/s390/cio/vfio_ccw_ops.c               |  52 +++++-
 drivers/s390/cio/vfio_ccw_private.h           |   3 +
 drivers/s390/crypto/vfio_ap_ops.c             |  50 +++---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  85 +++++----
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  80 ++++-----
 drivers/vfio/pci/mlx5/main.c                  |  50 ++++--
 drivers/vfio/pci/vfio_pci.c                   |  20 +--
 drivers/vfio/pci/vfio_pci_core.c              |  23 ++-
 drivers/vfio/platform/vfio_amba.c             |  72 ++++++--
 drivers/vfio/platform/vfio_platform.c         |  66 +++++--
 drivers/vfio/platform/vfio_platform_common.c  |  71 +++-----
 drivers/vfio/platform/vfio_platform_private.h |  18 +-
 drivers/vfio/vfio_main.c                      | 167 +++++++++++++++---
 include/linux/vfio.h                          |  28 ++-
 include/linux/vfio_pci_core.h                 |   6 +-
 samples/vfio-mdev/mbochs.c                    |  73 +++++---
 samples/vfio-mdev/mdpy.c                      |  81 +++++----
 samples/vfio-mdev/mtty.c                      |  67 ++++---
 23 files changed, 730 insertions(+), 381 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-vfio-dev


base-commit: f39856aacb078c1c93acef011a37121b17d54fe0
-- 
2.21.3

