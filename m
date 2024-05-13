Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD808C405E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EFA10E700;
	Mon, 13 May 2024 12:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKbsZG24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825D710E700
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601875; x=1747137875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=alEvtqL7T41z7XcO8ds2459A9JgZ6cG6OHZI3bUfjPE=;
 b=BKbsZG245dAAPKc8jWupmxHgc0XRyWr5HUQJCUKJe6U8mvnsKH+kX5v7
 PkXURYgOOSCo9tKNFl8RUxU1QV7nDdXPuY7YVSwukGIkkd54/pdihq5jZ
 9rByNN4nkeAEyr1/cX9c+eP6XFREfS6/rAcuERuxE4j+zdFROIgu3tapp
 /YOTA6pUauaIvWVKxS6PDaaP1XbbTRKsm5FKLixIm6LOHiRmH+xMaQr+a
 53DPZ1NTRpNZ8EvJLvv8IaoPFQOmpTYJp/YOre5pEGlJE1H1rdEPfZRnR
 V8PQhvdjATLr3iOKpTNE+EXPjs/p81l7ouC6no35lOBej/6I3EHZ9dsn1 A==;
X-CSE-ConnectionGUID: KkuoPk6tRzicSQBAczDMfg==
X-CSE-MsgGUID: sl73YDMYTDKRVcrfSGjCbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131717"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:35 -0700
X-CSE-ConnectionGUID: PTH63PryQtOfcKKsnTA8Lw==
X-CSE-MsgGUID: 3R7CN114Te2Dfb+5fk+mrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341008"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:34 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 00/12] accel/ivpu: Changes for 6.10
Date: Mon, 13 May 2024 14:04:19 +0200
Message-ID: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

v2: Included Jeffrey's v1 comments

v1: https://lore.kernel.org/dri-devel/20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com

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
 drivers/accel/ivpu/ivpu_fw.c      |  10 +
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
 22 files changed, 1173 insertions(+), 84 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_ms.c
 create mode 100644 drivers/accel/ivpu/ivpu_ms.h
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.h

--
2.43.2
