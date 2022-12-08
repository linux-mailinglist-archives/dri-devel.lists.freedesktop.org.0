Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F71646E0B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 12:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1CB10E1BA;
	Thu,  8 Dec 2022 11:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7610E1BA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670497683; x=1702033683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+pKsa9OY0CYPWS0AeuV+jFDs+adKRs11cPDHTZzckac=;
 b=VsZlrtxcUntU4zrh9Nu7jglUr0I07dmToW4rF1sW2A80HBC39nHxhimy
 zyRZUiULzA9L2iH2ONXn1NO8QcolefyUWUN2T4A5X7u8r2PnGfRhdIMdD
 /GaNdZRK+1znJHWuvzcH6ra4NZfVKHWRtFaRLiF52tFlVEZ6GEjLyFqN/
 A4fPqNRF8hypcMb3XT5O5x4sPM3dSbqPQa6Vrn8l37P9rXfh+LhHT23ul
 4YiSEG3rlBrgmPpNCh/MY49dE9qyQ4GrLJN6wElSZ7r/lcDZeQ5TQ+fQi
 JmgRcTPIm/pA+DBghtQHnSR8s4B4+dsSGpeBAMxlAL9XrZ6o77vcWnOxN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="296835768"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="296835768"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 03:07:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="789258891"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="789258891"
Received: from jlawryno.igk.intel.com ([172.22.229.13])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 03:07:40 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, quic_jhugo@quicinc.com
Subject: [PATCH v4 0/7] New DRM accel driver for Intel VPU
Date: Thu,  8 Dec 2022 12:07:26 +0100
Message-Id: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
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

User mode driver stack consists of Level Zero API driver and OpenVINO plugin.
Both should be open-sourced in December.
The firmware for the VPU will be distributed as a closed source binary.

Most significant change in this version is a switch to the new accel framework.
Besides that there are a lot of changes from v3 review described in detail below.

Regards,
Jacek

Changelog

v4:
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
 drivers/accel/ivpu/TODO               |    7 +
 drivers/accel/ivpu/ivpu_drv.c         |  661 +++++++++++++++
 drivers/accel/ivpu/ivpu_drv.h         |  189 +++++
 drivers/accel/ivpu/ivpu_fw.c          |  423 ++++++++++
 drivers/accel/ivpu/ivpu_fw.h          |   38 +
 drivers/accel/ivpu/ivpu_gem.c         |  846 +++++++++++++++++++
 drivers/accel/ivpu/ivpu_gem.h         |  129 +++
 drivers/accel/ivpu/ivpu_hw.h          |  170 ++++
 drivers/accel/ivpu/ivpu_hw_mtl.c      | 1084 +++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h  |  280 +++++++
 drivers/accel/ivpu/ivpu_hw_reg_io.h   |  115 +++
 drivers/accel/ivpu/ivpu_ipc.c         |  511 ++++++++++++
 drivers/accel/ivpu/ivpu_ipc.h         |   93 +++
 drivers/accel/ivpu/ivpu_job.c         |  608 ++++++++++++++
 drivers/accel/ivpu/ivpu_job.h         |   67 ++
 drivers/accel/ivpu/ivpu_jsm_msg.c     |  170 ++++
 drivers/accel/ivpu/ivpu_jsm_msg.h     |   23 +
 drivers/accel/ivpu/ivpu_mmu.c         |  885 ++++++++++++++++++++
 drivers/accel/ivpu/ivpu_mmu.h         |   50 ++
 drivers/accel/ivpu/ivpu_mmu_context.c |  385 +++++++++
 drivers/accel/ivpu/ivpu_mmu_context.h |   49 ++
 drivers/accel/ivpu/ivpu_pm.c          |  329 ++++++++
 drivers/accel/ivpu/ivpu_pm.h          |   38 +
 drivers/accel/ivpu/vpu_boot_api.h     |  349 ++++++++
 drivers/accel/ivpu/vpu_jsm_api.h      |  999 +++++++++++++++++++++++
 include/uapi/drm/ivpu_drm.h           |  339 ++++++++
 32 files changed, 8883 insertions(+)
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
 create mode 100644 include/uapi/drm/ivpu_drm.h

--
2.34.1
