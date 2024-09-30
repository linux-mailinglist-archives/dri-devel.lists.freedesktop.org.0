Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4898AD5E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6610E2F9;
	Mon, 30 Sep 2024 19:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EU0Jhwxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4AC10E2F9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726006; x=1759262006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iRA+I4jbLIrYdPeXQ4zWPc5NkEsH5cZwSOILKDgrUKQ=;
 b=EU0Jhwxr2DE1wS+SjoAIPZw0YEfwZD1TymffwF87IbrhkmyIrGoYneVM
 +gbQo3TFHIiiKvB6wSJO16Qoc9A0OVEg2RnhvXV00Bn6jvOn1NWB+C03S
 /vqQ3eCEudBwvdO7Z/DAjSnjGLK2SUfVkNTSCAWLRf3qfvWmk+T8B9gFN
 b1XU1slOidKw7Mh4QymxQLdyQcxnr2csaxjcgaElidO1+/NZnEwOHAjwF
 V9bivx/4lldp4OOyvMEP/F+xDdDc6d/Ikd0NILYipwDzD+zkcDoq5yoUO
 OF/afdGXD3KQ3zg0V7EctJAzAnN+G3sMOntx1x6gdKKaluKn0b4Kfx/Qo Q==;
X-CSE-ConnectionGUID: MzSp7QdZRrmddJUAgbsJ6w==
X-CSE-MsgGUID: 6I5d/xDUR/+68QMiW2ibCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962277"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962277"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:26 -0700
X-CSE-ConnectionGUID: HtfE6KOhS8+qY+mfvZropA==
X-CSE-MsgGUID: nWPkftLIR7qCMZWcmRaatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73369975"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:24 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 00/31] accel/ivpu: Fixes for 6.12-rc1
Date: Mon, 30 Sep 2024 21:52:51 +0200
Message-ID: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

Changes in v2:
- Fix typos in FW API headers
- Split fw refactor commit into 2 commits and improved commit messages
- Fixed commit messages for state dump and power island commits
- Added limit and NULL termination for FW version string
- Documented sched_mode sysfs file


Andrzej Kacprowski (4):
  accel/ivpu: Update VPU FW API headers
  accel/ivpu: Allow reading dvfs_mode debugfs file
  accel/ivpu: Add test_mode bit to force turbo
  accel/ivpu: Fix reset_engine debugfs file logic

Jacek Lawrynowicz (11):
  accel/ivpu: Rename ivpu_log_level to fw_log_level
  accel/ivpu: Refactor functions in ivpu_fw_log.c
  accel/ivpu: Fix fw log printing
  accel/ivpu: Limit FW version string length
  accel/ivpu: Stop using hardcoded DRIVER_DATE
  accel/ivpu: Add auto selection logic for job scheduler
  accel/ivpu: Remove invalid warnings
  accel/ivpu: Increase MS info buffer size
  accel/ivpu: Fix ivpu_jsm_dyndbg_control()
  accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
  accel/ivpu: Fix typos in ivpu_pm.c

Jakub Pawlak (1):
  accel/ivpu: Add tracing for IPC/PM/JOB

Karol Wachowski (12):
  accel/ivpu: Add coredump support
  accel/ivpu: Set 500 ns delay between power island TRICKLE and ENABLE
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
  accel/ivpu: Add FW state dump on TDR
  accel/ivpu: Make DB_ID and JOB_ID allocations incremental

 drivers/accel/ivpu/Kconfig             |   1 +
 drivers/accel/ivpu/Makefile            |   6 +-
 drivers/accel/ivpu/ivpu_coredump.c     |  39 ++++
 drivers/accel/ivpu/ivpu_coredump.h     |  25 ++
 drivers/accel/ivpu/ivpu_debugfs.c      |  86 +++----
 drivers/accel/ivpu/ivpu_drv.c          |  52 +++--
 drivers/accel/ivpu/ivpu_drv.h          |  13 +-
 drivers/accel/ivpu/ivpu_fw.c           |  26 ++-
 drivers/accel/ivpu/ivpu_fw.h           |   9 +-
 drivers/accel/ivpu/ivpu_fw_log.c       | 113 +++++----
 drivers/accel/ivpu/ivpu_fw_log.h       |  17 +-
 drivers/accel/ivpu/ivpu_gem.c          |   3 +
 drivers/accel/ivpu/ivpu_hw.c           |   5 +-
 drivers/accel/ivpu/ivpu_hw.h           |   1 -
 drivers/accel/ivpu/ivpu_hw_btrs.c      |   9 -
 drivers/accel/ivpu/ivpu_hw_ip.c        |   8 +-
 drivers/accel/ivpu/ivpu_ipc.c          |  45 ++--
 drivers/accel/ivpu/ivpu_ipc.h          |   9 +-
 drivers/accel/ivpu/ivpu_job.c          | 102 +++++----
 drivers/accel/ivpu/ivpu_jsm_msg.c      |  34 +--
 drivers/accel/ivpu/ivpu_jsm_msg.h      |   2 +
 drivers/accel/ivpu/ivpu_ms.c           |   2 +-
 drivers/accel/ivpu/ivpu_pm.c           |  24 +-
 drivers/accel/ivpu/ivpu_sysfs.c        |  24 ++
 drivers/accel/ivpu/ivpu_trace.h        |  73 ++++++
 drivers/accel/ivpu/ivpu_trace_points.c |   9 +
 drivers/accel/ivpu/vpu_boot_api.h      |  45 ++--
 drivers/accel/ivpu/vpu_jsm_api.h       | 303 +++++++++++++++++++++----
 include/uapi/drm/ivpu_accel.h          |   3 -
 29 files changed, 797 insertions(+), 291 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c

--
2.45.1
