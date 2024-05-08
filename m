Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99248BFE91
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E105D1128E3;
	Wed,  8 May 2024 13:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SI9llDYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4411128E3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174472; x=1746710472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7wohta7KSqyn7268WhuhePpmBvQiC7tZ9aEmGPyqaYw=;
 b=SI9llDYQGqsTSCk+MNYmbtEkMjxCC+I+nLCaLGbMW4SwaCvtSRb6nDS8
 N48HMe1T5WYvpt5KIwku2EefQoMwC94yQc8hCNslvo7WkAyiiQ8lSC+3A
 3jMVI2bkXqzw+vQIdUbJUJMUxF2oTIBu+Co53DOhTUasSWNrLFKBsKiGD
 9mgokfE7jnhVk3NwJta4V5QadkGsuwMc4+T90qyxYsEruMJPLxfUVO6tN
 rm8Xs5o6iDTSaNFDyKw9mMFHmBiBqWTHJr+d4B0ECvNvSqO1ryeZOfWj/
 rdP73Pwx/f9aB9/N8x8k/tMh0rAN+YG27dRLoynEZNCZTOluPHFFMXXZv Q==;
X-CSE-ConnectionGUID: DdwRDsblQVKC0myeDGATow==
X-CSE-MsgGUID: 6lLJZkINQ2yZPZkkQrA35Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540018"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:11 -0700
X-CSE-ConnectionGUID: tRS/LX5FTgePSEaq01xHfw==
X-CSE-MsgGUID: 1BtVP6urToi8csybKjYERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289321"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:09 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 00/12] accel/ivpu: Changes for 6.10
Date: Wed,  8 May 2024 15:20:57 +0200
Message-ID: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

There are couple of major new features in this patchset:
  * Hardware scheduler support (disabled by default)
  * Profiling support
  * Expose NPU busy time in sysfs

Other then that, there are two small random fixes.

Jacek Lawrynowicz (2):
  accel/ivpu: Update VPU FW API headers
  accel/ivpu: Increase reset counter when warm boot fails

Tomasz Rusinowicz (3):
  accel/ivpu: Add NPU profiling support
  accel/ivpu: Configure fw logging using debugfs
  accel/ivpu: Share NPU busy time in sysfs

Wachowski, Karol (7):
  accel/ivpu: Add sched_mode module param
  accel/ivpu: Create priority based command queues
  accel/ivpu: Implement support for preemption buffers
  accel/ivpu: Add HWS JSM messages
  accel/ivpu: Implement support for hardware scheduler
  accel/ivpu: Add resume engine support
  accel/ivpu: Add force snoop module parameter

 drivers/accel/ivpu/Makefile       |   6 +-
 drivers/accel/ivpu/ivpu_debugfs.c |  50 +++++
 drivers/accel/ivpu/ivpu_drv.c     |  44 ++++-
 drivers/accel/ivpu/ivpu_drv.h     |  23 ++-
 drivers/accel/ivpu/ivpu_fw.c      |  12 ++
 drivers/accel/ivpu/ivpu_fw.h      |   2 +
 drivers/accel/ivpu/ivpu_gem.h     |  11 +-
 drivers/accel/ivpu/ivpu_hw.h      |   3 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c |   7 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c |   9 +-
 drivers/accel/ivpu/ivpu_job.c     | 295 ++++++++++++++++++++++------
 drivers/accel/ivpu/ivpu_job.h     |   2 +
 drivers/accel/ivpu/ivpu_jsm_msg.c | 259 ++++++++++++++++++++++++-
 drivers/accel/ivpu/ivpu_jsm_msg.h |  20 +-
 drivers/accel/ivpu/ivpu_mmu.c     |  12 +-
 drivers/accel/ivpu/ivpu_ms.c      | 309 ++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_ms.h      |  36 ++++
 drivers/accel/ivpu/ivpu_pm.c      |   5 +
 drivers/accel/ivpu/ivpu_sysfs.c   |  58 ++++++
 drivers/accel/ivpu/ivpu_sysfs.h   |  13 ++
 drivers/accel/ivpu/vpu_jsm_api.h  |  14 +-
 include/uapi/drm/ivpu_accel.h     |  69 ++++++-
 22 files changed, 1175 insertions(+), 84 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_ms.c
 create mode 100644 drivers/accel/ivpu/ivpu_ms.h
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.h

--
2.43.2
