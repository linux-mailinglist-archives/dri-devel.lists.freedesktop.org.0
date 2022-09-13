Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1945B6CD0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 14:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ED710E6B3;
	Tue, 13 Sep 2022 12:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0343010E6B3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663071012; x=1694607012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pULdLP1758I/E1QWOjEor66RMObqXX1+HZIOqj74zyg=;
 b=n1cUkGZiF/w3TU7HIbppTDVr2XsL+GApfEyTCFSgSp5t7+1U+E7D6soF
 HabRfjMrQlNfHnacp64dLh5bB0CwowY7Y5oTNFlv849ji96H27PGe1mX0
 EsOgYt9yX+Q+C/TP1lO7N7Luli8cQ3cWdgFRvswpd9V+Nw7AUWnxW4yt4
 8Sus2tbSKArs+2cLeDbVQyqlEHnNk8/TAi42TFJBxlmN6/xIkXV6g84Lh
 J3PJA3MDPHgoNQXYJ2vCMhDl4UVWE8gjiW2mp5/qfA9CnzUuFOfz6rFsx
 GirhbSGex7gcavnXqG+PPVRWv3hDi9roxUrGwcLxLwO7K3cagO3rW3QB2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="278511706"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="278511706"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 05:10:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="649633565"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 05:10:09 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 0/7] New DRM driver for Intel VPU
Date: Tue, 13 Sep 2022 14:10:10 +0200
Message-Id: <20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com>
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

v2:
- Rename the driver from "drm/vpu" to "drm/ivpu"
- Add a TODO file
- Add support for WC buffers

v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com/

Regards,
Jacek

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
