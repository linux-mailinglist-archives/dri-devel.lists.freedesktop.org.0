Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4D66D9D2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 10:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936A910E174;
	Tue, 17 Jan 2023 09:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73BC10E174
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673947648; x=1705483648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4C8SPkg+GljPUR0wg6nqK73elHqiizHm+cD4JZmOBZc=;
 b=IysBfwfYtSfwjEjgwIYN9iqY+dpbsloYW8bn1Ni8xTs7cAmv41D5ehL8
 SkOWG29QKp2nsgKZmU3fOH7xh3pnHnWRf4TkPmsVMD5FaT00PJJfYzxg+
 hK1oXXoocfDroCBMb85V0tyRnYrOGKw+11nSnJ5gUD1aXHi2A5MZA1vth
 tM2iGGfLzMdY7LFQtiye/kZr20dNXciFvhAo2t2X8OYUT8AAG0gNW8Yke
 YPOOtuGR5hGQuUwNoNrHfugztJPGIbHC+wQ2TQaxDT4/dFYiVg6z/J/Tg
 7Tph45iSMLqa2X8q2S8V2QTvd4A4VD3Bcot+kConJVsaG6XywSQ+wgg5T A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387000255"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="387000255"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 01:27:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="636801363"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="636801363"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 01:27:25 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, quic_jhugo@quicinc.com
Subject: [PATCH v6 0/7] New DRM accel driver for Intel VPU
Date: Tue, 17 Jan 2023 10:27:16 +0100
Message-Id: <20230117092723.60441-1-jacek.lawrynowicz@linux.intel.com>
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

The whole driver is licensed under GPL-2.0-only except for two headers imported
from the firmware that are MIT licensed.

User space stack is open source and available at:
  - UMD driver: https://github.com/intel/linux-vpu-driver
  - Compiler and OpenVINO plugin: https://github.com/openvinotoolkit/vpux-plugin

The firmware for the VPU will be distributed as a closed source binary in
the UMD driver repo.

This is hopefully the last revision of the patchset with minor changes outlined
below.

Regards,
Jacek

Changelog

v6:
- Remove userptr ioctl as it will be probably replaced with dma-buf heaps
- Added dependency on !UML
- Simplify struct file_operations ivpu_fops definition
- Fixed compilation issues in patch 4 and 6
- Updated TODO

v5: https://lore.kernel.org/all/20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com/
- Rename ivpu_drm.h to ivpu_accel.h
- Cleanup ivpu_mmu_config_check()
- Optimize locking in ivpu_mmu_cd_add()
- Invalidate user context if it has MMU faults
- Move ivpu_ipc_match_consumer() outside ivpu_ipc_dispatch()

v4: https://lore.kernel.org/all/20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com/
- Switch to the accel framework (DRIVER_COMPUTE_ACCEL)
- Move the driver from drivers/gpu/drm to drivers/accel
- Rename kconfig DRM_IVPU option to DRM_ACCEL_IVPU and update dependencies
- Create context on open() instead of lazy allocating it
- Remove status_offset from submit ioctl, as status is now reported in bo_wait ioctl
- Use managed resources in ivpu_drv.c
- Optimize locking in ivpu_ipc.c - add new rx_msg_lock for consumer msg list
- Refactor vpu_hw_mtl_reg.h to use BIT_MASK() and GENMASK() macros
- Use module_pci_driver() for mudule init
- Remove mutex from "struct ivpu_pm_info"
- Add explicit "vdev" arg to ivpu_dbg()
- Use drm_WARN_ON() instead of WARN_ON() where possible
- Add comments for boot related functions
- Update firmware API headers

v3: https://lore.kernel.org/all/20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com/
- Fixed alignment warning in ivpu_ipc.c when building with W=1

v2: https://lore.kernel.org/all/20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com/
- Rename the driver from "drm/vpu" to "drm/ivpu"
- Add a TODO file
- Add support for WC buffers

v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com/

Jacek Lawrynowicz (7):
  accel/ivpu: Introduce a new DRM driver for Intel VPU
  accel/ivpu: Add Intel VPU MMU support
  accel/ivpu: Add GEM buffer object management
  accel/ivpu: Add IPC driver and JSM messages
  accel/ivpu: Implement firmware parsing and booting
  accel/ivpu: Add command buffer submission logic
  accel/ivpu: Add PM support

 MAINTAINERS                           |    9 +
 drivers/Makefile                      |    1 +
 drivers/accel/Kconfig                 |    2 +
 drivers/accel/Makefile                |    3 +
 drivers/accel/ivpu/Kconfig            |   15 +
 drivers/accel/ivpu/Makefile           |   16 +
 drivers/accel/ivpu/TODO               |   11 +
 drivers/accel/ivpu/ivpu_drv.c         |  654 +++++++++++++++
 drivers/accel/ivpu/ivpu_drv.h         |  190 +++++
 drivers/accel/ivpu/ivpu_fw.c          |  423 ++++++++++
 drivers/accel/ivpu/ivpu_fw.h          |   38 +
 drivers/accel/ivpu/ivpu_gem.c         |  753 +++++++++++++++++
 drivers/accel/ivpu/ivpu_gem.h         |  127 +++
 drivers/accel/ivpu/ivpu_hw.h          |  170 ++++
 drivers/accel/ivpu/ivpu_hw_mtl.c      | 1084 +++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h  |  280 +++++++
 drivers/accel/ivpu/ivpu_hw_reg_io.h   |  115 +++
 drivers/accel/ivpu/ivpu_ipc.c         |  510 ++++++++++++
 drivers/accel/ivpu/ivpu_ipc.h         |   93 +++
 drivers/accel/ivpu/ivpu_job.c         |  614 ++++++++++++++
 drivers/accel/ivpu/ivpu_job.h         |   67 ++
 drivers/accel/ivpu/ivpu_jsm_msg.c     |  169 ++++
 drivers/accel/ivpu/ivpu_jsm_msg.h     |   23 +
 drivers/accel/ivpu/ivpu_mmu.c         |  883 ++++++++++++++++++++
 drivers/accel/ivpu/ivpu_mmu.h         |   50 ++
 drivers/accel/ivpu/ivpu_mmu_context.c |  398 +++++++++
 drivers/accel/ivpu/ivpu_mmu_context.h |   50 ++
 drivers/accel/ivpu/ivpu_pm.c          |  329 ++++++++
 drivers/accel/ivpu/ivpu_pm.h          |   38 +
 drivers/accel/ivpu/vpu_boot_api.h     |  349 ++++++++
 drivers/accel/ivpu/vpu_jsm_api.h      |  999 +++++++++++++++++++++++
 include/uapi/drm/ivpu_accel.h         |  306 +++++++
 32 files changed, 8769 insertions(+)
 create mode 100644 drivers/accel/Makefile
 create mode 100644 drivers/accel/ivpu/Kconfig
 create mode 100644 drivers/accel/ivpu/Makefile
 create mode 100644 drivers/accel/ivpu/TODO
 create mode 100644 drivers/accel/ivpu/ivpu_drv.c
 create mode 100644 drivers/accel/ivpu/ivpu_drv.h
 create mode 100644 drivers/accel/ivpu/ivpu_fw.c
 create mode 100644 drivers/accel/ivpu/ivpu_fw.h
 create mode 100644 drivers/accel/ivpu/ivpu_gem.c
 create mode 100644 drivers/accel/ivpu/ivpu_gem.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_reg_io.h
 create mode 100644 drivers/accel/ivpu/ivpu_ipc.c
 create mode 100644 drivers/accel/ivpu/ivpu_ipc.h
 create mode 100644 drivers/accel/ivpu/ivpu_job.c
 create mode 100644 drivers/accel/ivpu/ivpu_job.h
 create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.c
 create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.h
 create mode 100644 drivers/accel/ivpu/ivpu_mmu.c
 create mode 100644 drivers/accel/ivpu/ivpu_mmu.h
 create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.c
 create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.h
 create mode 100644 drivers/accel/ivpu/ivpu_pm.c
 create mode 100644 drivers/accel/ivpu/ivpu_pm.h
 create mode 100644 drivers/accel/ivpu/vpu_boot_api.h
 create mode 100644 drivers/accel/ivpu/vpu_jsm_api.h
 create mode 100644 include/uapi/drm/ivpu_accel.h

--
2.34.1
