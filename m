Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169CD776597
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD4110E469;
	Wed,  9 Aug 2023 16:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8A10E469
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:35 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 759FA6607206;
 Wed,  9 Aug 2023 17:53:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600013;
 bh=g0Dm9iLV4L3XPjgPLA4hga6fyZkKhpcloqAGNg1901Y=;
 h=From:To:Cc:Subject:Date:From;
 b=GspZ3eoJZ5ZhAtnW5gEfXPq1sCe4LDTByEq0cScm91bsF8CdTDJzuaUK8Dd6f5kUF
 CZ8pvh+2F7QPuXD+etC9TWvAndFAFS3fHcDBZfVD8aU0CY6YZycwFLArDvYGcn9Gun
 CeIkFe4lhHNKSXU1NJwjxWg5OT6g+qnuhV07ew26nAekfc5NZj5dwW/bZi7gmbVTzE
 qV8jWFfHu7xYwFc8LNOFPmA89upXUGlCbYq7kBO59tABFgsurDpPByOAx4SO5HROuG
 w0fr1c1BxHhRwD6IBGIV82N5eQwPyDleTPAmqgPIwX47nhfaZ+jFlnphCO+MGj+aR0
 RK9Bi9ooCdeAg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/15] drm: Add a driver for FW-based Mali GPUs
Date: Wed,  9 Aug 2023 18:53:13 +0200
Message-ID: <20230809165330.2451699-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is the second version of the kernel driver meant to support new Mali
GPUs which are delegating the scheduling to a firmware.

The RFC has been dropped as the major blocking points have been addressed
(request to use drm_sched, request to implement a VM_BIND-like ioctl,
request to use drm_gpuva_mgr for the VM logic, lack of PM/devfreq support).

This series is based on drm-misc-next and depends on some drm_sched [1]
and iommu [2] changes.

A branch containing all those dependencies is available here[3], and
here [4] is another one containing all the patches needed to have
a working GPU on rk3588 on top. The CSF firmware binary can be found
here[5].

The mesa branch used to test this new driver is available here [6].
It's still under development and it's just a gallium driver right now,
but we are working on that ;-).

Here is a non-exaustive changelog, check each commit for a detailed
changelog.

v2:
- Rename the driver (pancsf -> panthor)
- Split the commit adding the driver to ease review
- Use drm_sched for dependency tracking/job submission
- Add a VM_BIND ioctl
- Add the concept of exclusive VM for BOs that are only ever mapped to a
  single VM
- Document the code and uAPI
- Add a DT binding doc

I tried to Cc anyone that was involved in any development of the code
I picked from panfrost, so they can acknowledge the GPL2 -> MIT+GPL2
change. If I missed someone, please let me know.

Best Regards,

Boris

[1]https://lore.kernel.org/dri-devel/20230801205103.627779-1-matthew.brost@intel.com/T/#t
[2]https://lore.kernel.org/linux-iommu/20230809121744.2341454-1-boris.brezillon@collabora.com/T/#t
[3]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor
[4]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor+rk3588-evb1
[5]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmware/g610/mali_csffw.bin
[6]https://gitlab.freedesktop.org/panfrost/mesa/-/tree/v10+panthor

Boris Brezillon (14):
  drm/shmem-helper: Make pages_use_count an atomic_t
  drm/panthor: Add uAPI
  drm/panthor: Add GPU register definitions
  drm/panthor: Add the device logical block
  drm/panthor: Add the GPU logical block
  drm/panthor: Add GEM logical block
  drm/panthor: Add the devfreq logical block
  drm/panthor: Add the MMU/VM logical block
  drm/panthor: Add the FW logical block
  drm/panthor: Add the heap logical block
  drm/panthor: Add the scheduler logical block
  drm/panthor: Add the driver frontend block
  drm/panthor: Allow driver compilation
  drm/panthor: Add an entry to MAINTAINERS

Liviu Dudau (1):
  dt-bindings: gpu: mali-valhall-csf: Add initial bindings for panthor
    driver

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  148 +
 Documentation/gpu/driver-uapi.rst             |    5 +
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   28 +-
 drivers/gpu/drm/lima/lima_gem.c               |    2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |    2 +-
 drivers/gpu/drm/panthor/Kconfig               |   16 +
 drivers/gpu/drm/panthor/Makefile              |   15 +
 drivers/gpu/drm/panthor/panthor_devfreq.c     |  281 ++
 drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
 drivers/gpu/drm/panthor/panthor_device.c      |  479 +++
 drivers/gpu/drm/panthor/panthor_device.h      |  354 ++
 drivers/gpu/drm/panthor/panthor_drv.c         | 1540 ++++++++
 drivers/gpu/drm/panthor/panthor_fw.c          | 1417 +++++++
 drivers/gpu/drm/panthor/panthor_fw.h          |  505 +++
 drivers/gpu/drm/panthor/panthor_gem.c         |  229 ++
 drivers/gpu/drm/panthor/panthor_gem.h         |   96 +
 drivers/gpu/drm/panthor/panthor_gpu.c         |  463 +++
 drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
 drivers/gpu/drm/panthor/panthor_heap.c        |  550 +++
 drivers/gpu/drm/panthor/panthor_heap.h        |   36 +
 drivers/gpu/drm/panthor/panthor_mmu.c         | 2611 +++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h         |   81 +
 drivers/gpu/drm/panthor/panthor_regs.h        |  229 ++
 drivers/gpu/drm/panthor/panthor_sched.c       | 3272 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h       |   50 +
 include/drm/drm_gem_shmem_helper.h            |    2 +-
 include/uapi/drm/panthor_drm.h                |  862 +++++
 30 files changed, 13345 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 create mode 100644 drivers/gpu/drm/panthor/Kconfig
 create mode 100644 drivers/gpu/drm/panthor/Makefile
 create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
 create mode 100644 include/uapi/drm/panthor_drm.h

-- 
2.41.0

