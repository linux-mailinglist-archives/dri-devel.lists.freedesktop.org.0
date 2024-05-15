Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86008C65BD
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33D510E7AE;
	Wed, 15 May 2024 11:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChVxRSxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71210E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715772610; x=1747308610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aunZHhcNRWHGpuIghupidGgbT7o5shaH0CbRs5VTuI0=;
 b=ChVxRSxDQsTvzc2r3IOEmRrfLT48weiXsnElbXxh/TGPH9VtE4zqiNLk
 OwLEJFmpO8ynN7oLtAFq8f0jX8SP9dL20rpzt16lNSRn2Sc5SGXfSV91u
 49uxbNCL+VMK0US4kYksj10GxZKxo3zFfwlkR/CBRXOZzyaHYBhozHxC+
 Z1AWj1tw58enIGWJaxt3TC7+EvsJq7qF6fWKeMWyz5dvGhJCSdzqcNV36
 E7xK4qIeqUF02VLovjP3sJfLNc/2LtatcA/W1sTVt/dTWsBj6k4CiAAS2
 dOcBPPAZmP647DhmQnEtcJg4EJWsiEBkg1q9NMpk1OEfLW4qkv5cQKz5R A==;
X-CSE-ConnectionGUID: AA/A0r4OTpecIwF6wXkRWA==
X-CSE-MsgGUID: b+ZtRdSSS4adTRN9UJzTEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22417634"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22417634"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:30:10 -0700
X-CSE-ConnectionGUID: UD81+afXQj2hFksn9kksDQ==
X-CSE-MsgGUID: x96DvzscSqKYd17pKU7bVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35570423"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:30:08 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/3] HW layer refactor
Date: Wed, 15 May 2024 13:30:03 +0200
Message-ID: <20240515113006.457472-1-jacek.lawrynowicz@linux.intel.com>
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

The NPU device consists of two parts: NPU buttress and NPU IP.
Buttress is a platform specific part that integrates the NPU IP with
the CPU.
NPU IP is the platform agnostic part that does the inference.

This refactor enables support for multiple platforms using
a single NPU IP, so for example NPU IP 37XX could be integrated into
MTL and LNL platforms.

Jacek Lawrynowicz (1):
  accel/ivpu: Replace wake_thread with kfifo

Wachowski, Karol (2):
  accel/ivpu: Split IP and buttress headers
  accel/ivpu: Split IP and buttress code

 drivers/accel/ivpu/Makefile               |    5 +-
 drivers/accel/ivpu/ivpu_debugfs.c         |    2 +-
 drivers/accel/ivpu/ivpu_drv.c             |   32 +-
 drivers/accel/ivpu/ivpu_drv.h             |   33 +-
 drivers/accel/ivpu/ivpu_fw.c              |   20 +-
 drivers/accel/ivpu/ivpu_hw.c              |  313 +++++
 drivers/accel/ivpu/ivpu_hw.h              |  196 ++--
 drivers/accel/ivpu/ivpu_hw_37xx.c         | 1070 ------------------
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h     |   72 --
 drivers/accel/ivpu/ivpu_hw_40xx.c         | 1255 ---------------------
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h     |   94 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c         |  881 +++++++++++++++
 drivers/accel/ivpu/ivpu_hw_btrs.h         |   46 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  108 ++
 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h |   83 ++
 drivers/accel/ivpu/ivpu_hw_ip.c           | 1174 +++++++++++++++++++
 drivers/accel/ivpu/ivpu_hw_ip.h           |   36 +
 drivers/accel/ivpu/ivpu_ipc.c             |   17 +-
 drivers/accel/ivpu/ivpu_ipc.h             |    4 +-
 drivers/accel/ivpu/ivpu_job.c             |    2 +-
 20 files changed, 2799 insertions(+), 2644 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_hw.c
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_37xx.c
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.h

--
2.43.2
