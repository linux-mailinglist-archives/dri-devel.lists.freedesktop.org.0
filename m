Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CB98401F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41B610E1C1;
	Tue, 24 Sep 2024 08:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGFssdAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B042810E1C1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165885; x=1758701885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dj8TJ4pR8dp+dW2MNQuCf/e73Ublj+ftn/gCJC5ROs0=;
 b=CGFssdAs3syNReGpJjRIzFDNMsuIK26s4kMKSdfZ5aO/llk/gPMZAPqx
 51VJdeEK3X2TmKrQTOb+Pvpxoyr5UKeB93Kxo57l/4eFRcKxUULhiba/r
 AqRd66qeOTDuZ6bv0ctUpQ5zhjvNAEwqVj4G+fr9rgpoJPJe2dzzsF+JY
 0vNsfpU/Nu9rab7qpC/jcot7ADIvXEUpFahkIn320QjMON8P5wRvYcjDh
 T2qCrcAwZZOBFREpfzg1bDfKOY5BVwY4AXMTOrh5BDljIwJSYYcmNBBeK
 V36vebEFwAD/K2Uzv3rMAXnMPLanYJpEG8j4RadaFsnhl8it5GNMFTIlF g==;
X-CSE-ConnectionGUID: KjOVKcpYSbWU7OiJgpsT3g==
X-CSE-MsgGUID: CYOjk1FeT/O3ulMomIxC3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506870"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:05 -0700
X-CSE-ConnectionGUID: wWCAG+uQSom5VQa5U2bm7w==
X-CSE-MsgGUID: NO2+p2icQlyPdwXLPCqCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170545"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:02 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 00/29] accel/ivpu: Fixes for 6.12-rc1
Date: Tue, 24 Sep 2024 10:17:25 +0200
Message-ID: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Most notable changes are coredump and tracing support.
The rest are stability fixes, some refactoring and typos.

Andrzej Kacprowski (4):
  accel/ivpu: Update VPU FW API headers
  accel/ivpu: Allow reading dvfs_mode debugfs file
  accel/ivpu: Add test_mode bit to force turbo
  accel/ivpu: Fix reset_engine debugfs file logic

Jacek Lawrynowicz (9):
  accel/ivpu: Rename ivpu_log_level to fw_log_level
  accel/ivpu: Refactor FW log
  accel/ivpu: Stop using hardcoded DRIVER_DATE
  accel/ivpu: Add auto selection logic for job scheduler
  accel/ivpu: Remove invalid warnings
  accel/ivpu: Increase MS info buffer size
  accel/ivpu: Fix ivpu_jsm_dyndbg_control()
  accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
  accel/ivpu: Fix typos in ivpu_pm.c

Jakub Pawlak (1):
  accel/ivpu: Add tracing for IPC/PM/JOB

Karol Wachowski (10):
  accel/ivpu: Turn on autosuspend on Simics
  accel/ivpu: Add FW version debugfs entry
  accel/ivpu: Remove 1-tile power up Simics workaround
  accel/ivpu: Add one jiffy to bo_wait_ioctl timeout value
  accel/ivpu: Print JSM message result in case of error
  accel/ivpu: Remove skip of clock own resource ack on Simics
  accel/ivpu: Prevent recovery invocation during probe and resume
  accel/ivpu: Refactor failure diagnostics during boot
  accel/ivpu: Do not fail on cmdq if failed to allocate preemption
    buffers
  accel/ivpu: Use whole user and shave ranges for preemption buffers

Tomasz Rusinowicz (3):
  accel/ivpu: Reset fw log on cold boot
  accel/ivpu: Fix JSM state dump message warnings
  accel/ivpu: Make DB_ID and JOB_ID allocations incremental

Wachowski, Karol (2):
  accel/ivpu: Add coredump support
  accel/ivpu: Set 500 ns delay between power island TRICKLE and ENABLE

 drivers/accel/ivpu/Kconfig             |   1 +
 drivers/accel/ivpu/Makefile            |   6 +-
 drivers/accel/ivpu/ivpu_coredump.c     |  39 ++++
 drivers/accel/ivpu/ivpu_coredump.h     |  25 ++
 drivers/accel/ivpu/ivpu_debugfs.c      |  89 +++-----
 drivers/accel/ivpu/ivpu_drv.c          |  52 +++--
 drivers/accel/ivpu/ivpu_drv.h          |  13 +-
 drivers/accel/ivpu/ivpu_fw.c           |  22 +-
 drivers/accel/ivpu/ivpu_fw.h           |   7 +-
 drivers/accel/ivpu/ivpu_fw_log.c       | 114 +++++----
 drivers/accel/ivpu/ivpu_fw_log.h       |  17 +-
 drivers/accel/ivpu/ivpu_gem.c          |   3 +
 drivers/accel/ivpu/ivpu_hw.c           |   5 +-
 drivers/accel/ivpu/ivpu_hw.h           |   1 -
 drivers/accel/ivpu/ivpu_hw_btrs.c      |   9 -
 drivers/accel/ivpu/ivpu_hw_ip.c        |   8 +-
 drivers/accel/ivpu/ivpu_ipc.c          |  45 ++--
 drivers/accel/ivpu/ivpu_ipc.h          |   9 +-
 drivers/accel/ivpu/ivpu_job.c          | 102 ++++++---
 drivers/accel/ivpu/ivpu_jsm_msg.c      |  34 +--
 drivers/accel/ivpu/ivpu_jsm_msg.h      |   2 +
 drivers/accel/ivpu/ivpu_ms.c           |   2 +-
 drivers/accel/ivpu/ivpu_pm.c           |  24 +-
 drivers/accel/ivpu/ivpu_sysfs.c        |  14 ++
 drivers/accel/ivpu/ivpu_trace.h        |  73 ++++++
 drivers/accel/ivpu/ivpu_trace_points.c |   9 +
 drivers/accel/ivpu/vpu_boot_api.h      |  43 ++--
 drivers/accel/ivpu/vpu_jsm_api.h       | 305 +++++++++++++++++++++----
 include/uapi/drm/ivpu_accel.h          |   3 -
 29 files changed, 786 insertions(+), 290 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c

--
2.45.1
