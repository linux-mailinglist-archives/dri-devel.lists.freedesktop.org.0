Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0695E5F3A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 12:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305F910EA8D;
	Thu, 22 Sep 2022 10:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8610EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 10:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663840977; x=1695376977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C1E5v2WQG9K7hfiPUO8m+bQ2EJzIe+B+DuMB8u5eQfw=;
 b=HlgdYRaEkNuumsh9DGNf0hQhLud5xp2YeoQAeyUac5ZLWPWLqQTmwZPO
 u1M609zLlUGX3ummTEKu8lge9eNeauIF4a6GVjg3hypFleSQDtKmO0sVo
 SW2ar0uvvzm65zOF0wk3SliLpkkROsMcayHY0e3v/675a77l46qb5OkoX
 YeueobuqLKqotyZlKhWttYXyT5U5Lq9bCQFSfpUdK1/YjkmKaAY+aX8LO
 03ttTuICXyXg1l52MpSmc7vHYvyOJGD8NR8bWt7cHC3RvE5xJc0MM+Bsy
 +w50n0n++udCB4Ui1cHDCcJuVtgiAXLedBeSkLY8r47Bq1kGxPiL9TbkB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301102948"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301102948"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:02:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="745324527"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:02:54 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v3 0/7] New DRM driver for Intel VPU
Date: Thu, 22 Sep 2022 12:02:45 +0200
Message-Id: <20220922100252.84264-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset contains a new Linux* Kernel Driver for Intel® VPUs.

VPU stands for Versatile Processing Unit and it is an AI inference accelerator
integrated with Intel non-server CPUs starting from 14th generation.
VPU enables efficient execution of Deep Learning applications
like object detection, classification etc.

Driver is part of gpu/drm subsystem because VPU is similar in operation to
an integrated GPU. Reusing drm driver init, ioctl handling, gem and prime
helpers and drm_mm allows to minimize code duplication in the kernel.

The whole driver is licensed under GPL-2.0-only except for two headers imported
from the firmware that are MIT licensed.

User mode driver stack consists of Level Zero API driver and OpenVINO plugin.
Both should be open-sourced by the end of Q4.
The firmware for the VPU will be distributed as a closed source binary.

Regards,
Jacek

v3:
- Fixed alignment warning in ivpu_ipc.c when building with W=1

v2: https://lore.kernel.org/all/20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com/
- Rename the driver from "drm/vpu" to "drm/ivpu"
- Add a TODO file
- Add support for WC buffers

v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com/

Jacek Lawrynowicz (7):
  drm/ivpu: Introduce a new DRM driver for Intel VPU
  drm/ivpu: Add Intel VPU MMU support
  drm/ivpu: Add GEM buffer object management
  drm/ivpu: Add IPC driver and JSM messages
  drm/ivpu: Implement firmware parsing and booting
  drm/ivpu: Add command buffer submission logic
  drm/ivpu: Add PM support

 MAINTAINERS                             |    8 +
 drivers/gpu/drm/Kconfig                 |    2 +
 drivers/gpu/drm/Makefile                |    1 +
 drivers/gpu/drm/ivpu/Kconfig            |   12 +
 drivers/gpu/drm/ivpu/Makefile           |   16 +
 drivers/gpu/drm/ivpu/TODO               |    7 +
 drivers/gpu/drm/ivpu/ivpu_drv.c         |  643 ++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_drv.h         |  178 ++++
 drivers/gpu/drm/ivpu/ivpu_fw.c          |  426 +++++++++
 drivers/gpu/drm/ivpu/ivpu_fw.h          |   38 +
 drivers/gpu/drm/ivpu/ivpu_gem.c         |  836 ++++++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_gem.h         |  128 +++
 drivers/gpu/drm/ivpu/ivpu_hw.h          |  169 ++++
 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c      | 1060 +++++++++++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h  |  468 ++++++++++
 drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h   |  115 +++
 drivers/gpu/drm/ivpu/ivpu_ipc.c         |  508 +++++++++++
 drivers/gpu/drm/ivpu/ivpu_ipc.h         |   90 ++
 drivers/gpu/drm/ivpu/ivpu_job.c         |  629 ++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_job.h         |   73 ++
 drivers/gpu/drm/ivpu/ivpu_jsm_msg.c     |  220 +++++
 drivers/gpu/drm/ivpu/ivpu_jsm_msg.h     |   25 +
 drivers/gpu/drm/ivpu/ivpu_mmu.c         |  888 +++++++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_mmu.h         |   53 ++
 drivers/gpu/drm/ivpu/ivpu_mmu_context.c |  419 +++++++++
 drivers/gpu/drm/ivpu/ivpu_mmu_context.h |   49 ++
 drivers/gpu/drm/ivpu/ivpu_pm.c          |  352 ++++++++
 drivers/gpu/drm/ivpu/ivpu_pm.h          |   38 +
 drivers/gpu/drm/ivpu/vpu_boot_api.h     |  241 ++++++
 drivers/gpu/drm/ivpu/vpu_jsm_api.h      |  616 +++++++++++++
 include/uapi/drm/ivpu_drm.h             |  343 ++++++++
 31 files changed, 8651 insertions(+)
 create mode 100644 drivers/gpu/drm/ivpu/Kconfig
 create mode 100644 drivers/gpu/drm/ivpu/Makefile
 create mode 100644 drivers/gpu/drm/ivpu/TODO
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_drv.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_drv.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_fw.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_fw.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_gem.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_gem.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_ipc.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_ipc.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_job.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_job.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_jsm_msg.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_jsm_msg.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_pm.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_pm.h
 create mode 100644 drivers/gpu/drm/ivpu/vpu_boot_api.h
 create mode 100644 drivers/gpu/drm/ivpu/vpu_jsm_api.h
 create mode 100644 include/uapi/drm/ivpu_drm.h

--
2.34.1
