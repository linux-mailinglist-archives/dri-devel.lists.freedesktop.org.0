Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EAA0421C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854110E363;
	Tue,  7 Jan 2025 14:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhUFTb9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7A410E363
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259748; x=1767795748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DptSTe/RnhYfNyTghK+IJ3o2Tk957yUCUgh0OaOACLI=;
 b=HhUFTb9+fOOzClkRQj+NMf94+bNP3pXjgSDcc6L9cmWsAnrsanb7dUHg
 tYoY6x9aBWMm6dE9sGb5SJOuANtLaZ+fnIAK+2uv+oj6V/9nFXMWRBpAl
 8QCqGnSCxODlbzlykcK2jGR5OIZg1kT7FE7lA9av8EBHj1osonzi35p5e
 jQLHXQc7nlIGILEHzLMX+XwGsfDI1vHv1uE3Ut3SUSEKBHlCTle1kiJym
 QBGX+2aYRX4Dh3/Xf40RzKptmKKbcT/1FM37toALzmCbo/cZSJBPw0tyT
 SHQgS1F87Swdu3XjBauWJpfBT8O4t0VrfU3yEswQPoHqc5q5xx4W10Dwy g==;
X-CSE-ConnectionGUID: Q2GqktuCRSuruMTa9NB+5A==
X-CSE-MsgGUID: SOpalDKdS5WA3lKTdUrkWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324416"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324416"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:28 -0800
X-CSE-ConnectionGUID: JuqKQVa8Tr6j/ZNoa6nMEw==
X-CSE-MsgGUID: 4qFmXFh0ScqE0KrhRT8oOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635380"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:27 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 00/14] accel/ivpu: Changes for 6.14
Date: Tue,  7 Jan 2025 18:32:23 +0100
Message-ID: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset contains latest changes for Intel NPU driver
including enabling HWS by default, adding memory utilization,
MMU optimizations, and others.

Jacek Lawrynowicz (1):
  accel/ivpu: Enable HWS by default on all platforms

Karol Wachowski (11):
  accel/ivpu: Separate DB ID and CMDQ ID allocations from CMDQ
    allocation
  accel/ivpu: Add API for command queue create/destroy/submit
  accel/ivpu: Abort all jobs after command queue unregister
  accel/ivpu: Dump only first MMU fault from single context
  accel/ivpu: Move parts of MMU event IRQ handling to thread handler
  accel/ivpu: Fix missing MMU events from reserved SSID
  accel/ivpu: Set command queue management capability based on HWS
  accel/ivpu: Fix locking order in ivpu_cmdq_destroy_ioctl
  accel/ivpu: Fix locking order in ivpu_job_submit
  accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
  accel/ivpu: Add platform detection for presilicon

Maciej Falkowski (2):
  accel/ivpu: Expose NPU memory utilization info in sysfs
  accel/ivpu: Use workqueue for IRQ handling

 drivers/accel/ivpu/ivpu_drv.c             |  88 ++--
 drivers/accel/ivpu/ivpu_drv.h             |  10 +-
 drivers/accel/ivpu/ivpu_fw.c              |  13 +-
 drivers/accel/ivpu/ivpu_hw.c              |  46 +-
 drivers/accel/ivpu/ivpu_hw.h              |   9 -
 drivers/accel/ivpu/ivpu_hw_btrs.c         |  10 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h         |   1 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |   1 +
 drivers/accel/ivpu/ivpu_ipc.c             |   7 +-
 drivers/accel/ivpu/ivpu_ipc.h             |   2 +-
 drivers/accel/ivpu/ivpu_job.c             | 508 ++++++++++++++++------
 drivers/accel/ivpu/ivpu_job.h             |   8 +-
 drivers/accel/ivpu/ivpu_mmu.c             | 112 ++++-
 drivers/accel/ivpu/ivpu_mmu.h             |   2 +
 drivers/accel/ivpu/ivpu_mmu_context.c     |  13 -
 drivers/accel/ivpu/ivpu_mmu_context.h     |   2 -
 drivers/accel/ivpu/ivpu_pm.c              |   3 +-
 drivers/accel/ivpu/ivpu_pm.h              |   2 +-
 drivers/accel/ivpu/ivpu_sysfs.c           |  35 +-
 include/uapi/drm/ivpu_accel.h             |  84 ++++
 20 files changed, 661 insertions(+), 295 deletions(-)

-- 
2.43.0

