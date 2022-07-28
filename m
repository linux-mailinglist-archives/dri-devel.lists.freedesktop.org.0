Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8B583FC5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A839A657;
	Thu, 28 Jul 2022 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648DC11AF40
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014250; x=1690550250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wx6QpoZmRRdSj1+VjjpF0t7CLJhHrmXLPW3Wahrv9lM=;
 b=HSOREL4jr51iC/uaiAd4+usfDE/uMS/0C5uVePd2tIFX+iFqQmiWOmk7
 0QbIstWJ2yjhv+zXQrmEGrJ0JUirkP+jrdLQ9dE6EgB2kQdmM9BPbSYkW
 V1Il51v/fI8zW1QqQdeJnni9j3AFVhbPdw3qJzTc2kxhDhZc0nmF3HeTs
 2zXVYh54za3vpuWASdB9gdjR5jcu0IwNf7s5IBvpzQTISPB4MvMS1yamI
 EcZs+QfZj4G9bBmp+MR0mNunjBmluT9Csw83x+K6pSv2G/81w0IB1we2x
 8Th1k7507CPqGC5krxpQFLPnJQSmwrkL2e7OroKQz/kO4bIfAPvvYuT4R Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520341"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520341"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722639"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:27 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 0/7] New DRM driver for Intel VPU
Date: Thu, 28 Jul 2022 15:17:02 +0200
Message-Id: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
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
Both should be open-sourced by the end of Q3.
The firmware for the VPU will be distributed as a closed source binary.

Regards,
Jacek

Jacek Lawrynowicz (7):
  drm/vpu: Introduce a new DRM driver for Intel VPU
  drm/vpu: Add Intel VPU MMU support
  drm/vpu: Add GEM buffer object management
  drm/vpu: Add IPC driver and JSM messages
  drm/vpu: Implement firmware parsing and booting
  drm/vpu: Add command buffer submission logic
  drm/vpu: Add PM support

 MAINTAINERS                           |    8 +
 drivers/gpu/drm/Kconfig               |    2 +
 drivers/gpu/drm/Makefile              |    1 +
 drivers/gpu/drm/vpu/Kconfig           |   12 +
 drivers/gpu/drm/vpu/Makefile          |   16 +
 drivers/gpu/drm/vpu/vpu_boot_api.h    |  222 ++++++
 drivers/gpu/drm/vpu/vpu_drv.c         |  642 +++++++++++++++
 drivers/gpu/drm/vpu/vpu_drv.h         |  178 +++++
 drivers/gpu/drm/vpu/vpu_fw.c          |  417 ++++++++++
 drivers/gpu/drm/vpu/vpu_fw.h          |   38 +
 drivers/gpu/drm/vpu/vpu_gem.c         |  846 ++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_gem.h         |  113 +++
 drivers/gpu/drm/vpu/vpu_hw.h          |  163 ++++
 drivers/gpu/drm/vpu/vpu_hw_mtl.c      | 1040 +++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h  |  468 +++++++++++
 drivers/gpu/drm/vpu/vpu_hw_reg_io.h   |  114 +++
 drivers/gpu/drm/vpu/vpu_ipc.c         |  480 ++++++++++++
 drivers/gpu/drm/vpu/vpu_ipc.h         |   91 +++
 drivers/gpu/drm/vpu/vpu_job.c         |  624 +++++++++++++++
 drivers/gpu/drm/vpu/vpu_job.h         |   73 ++
 drivers/gpu/drm/vpu/vpu_jsm_api.h     |  529 +++++++++++++
 drivers/gpu/drm/vpu/vpu_jsm_msg.c     |  220 ++++++
 drivers/gpu/drm/vpu/vpu_jsm_msg.h     |   25 +
 drivers/gpu/drm/vpu/vpu_mmu.c         |  944 ++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_mmu.h         |   53 ++
 drivers/gpu/drm/vpu/vpu_mmu_context.c |  418 ++++++++++
 drivers/gpu/drm/vpu/vpu_mmu_context.h |   49 ++
 drivers/gpu/drm/vpu/vpu_pm.c          |  353 +++++++++
 drivers/gpu/drm/vpu/vpu_pm.h          |   38 +
 include/uapi/drm/vpu_drm.h            |  330 ++++++++
 30 files changed, 8507 insertions(+)
 create mode 100644 drivers/gpu/drm/vpu/Kconfig
 create mode 100644 drivers/gpu/drm/vpu/Makefile
 create mode 100644 drivers/gpu/drm/vpu/vpu_boot_api.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_drv.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_drv.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_fw.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_fw.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_gem.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_gem.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw_mtl.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw_reg_io.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_ipc.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_ipc.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_job.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_job.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_jsm_api.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_jsm_msg.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_jsm_msg.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu_context.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu_context.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_pm.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_pm.h
 create mode 100644 include/uapi/drm/vpu_drm.h

--
2.34.1
