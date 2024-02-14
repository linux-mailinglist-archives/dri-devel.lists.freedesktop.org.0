Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D090F8543D5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896410E1DA;
	Wed, 14 Feb 2024 08:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjywpiyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F31B10E1DA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898389; x=1739434389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I+QPxZSSNblDGUf4p7UvnK3D5wuUKIuWRXAbYr6mEqo=;
 b=PjywpiyGhJPuLII7ue60dixnhGUIvE99hdLh8RTkBAjz0VKfyQmW5+W0
 0M+7oVNvMicH69Dy7O1DUIWiSORp+/gTcYwfk09uy+acZv6UGGrDV8l8d
 1EkPWWU3VRsHImbxiCpUpLD84xZIIilQ/V566SUPu5EwkzE0L3AZrtT9E
 WCxvpU7/JS0vhLexopAXj6iFz4pH3sBSwMDRTUNLShj7Z8HEbGemmQAXq
 wlxBcIABKTbR9uOpMWvRMBWWGSDpjoliKwNVvZdP7xtvdSZFhcf8WRxGp
 nh51ziTsAf5nrS4pHfTNstomw3zBktTo66Y5ay3k08NnWzcDBFFv9Kg2R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651643"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651643"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407355"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:07 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/8] accel/ivpu changes for 6.9
Date: Wed, 14 Feb 2024 09:12:57 +0100
Message-ID: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

Mostly code refactoring and cleanup.

Please note that FW API headers are maintained by a separate team
and I would prefer not to modify them.

Jacek Lawrynowicz (5):
  accel/ivpu: Rename TILE_SKU_BOTH_MTL to TILE_SKU_BOTH
  accel/ivpu: Remove legacy firmware name
  accel/ivpu: Update FW API headers
  accel/ivpu: Fix ivpu_reset_engine_fn merge issue
  accel/ivpu: Rename VPU to NPU in message strings

Krystian Pradzynski (1):
  accel/ivpu: Add support for FW boot param system_time_us

Wachowski, Karol (2):
  accel/ivpu: Use lazy allocation for doorbell IDs
  accel/ivpu: Refactor BO creation functions

 drivers/accel/ivpu/ivpu_debugfs.c | 32 +++++++-------
 drivers/accel/ivpu/ivpu_drv.c     | 12 ++++--
 drivers/accel/ivpu/ivpu_drv.h     |  7 +++-
 drivers/accel/ivpu/ivpu_fw.c      | 49 +++++++++++++---------
 drivers/accel/ivpu/ivpu_fw_log.c  |  6 +--
 drivers/accel/ivpu/ivpu_gem.c     | 70 ++++++++++++++++---------------
 drivers/accel/ivpu/ivpu_gem.h     |  6 ++-
 drivers/accel/ivpu/ivpu_hw_37xx.c | 10 ++---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 10 ++---
 drivers/accel/ivpu/ivpu_ipc.c     | 12 +++---
 drivers/accel/ivpu/ivpu_job.c     | 20 ++++++---
 drivers/accel/ivpu/ivpu_pm.c      | 10 ++---
 drivers/accel/ivpu/vpu_boot_api.h | 46 ++++++++++++++------
 drivers/accel/ivpu/vpu_jsm_api.h  | 32 +++++++++-----
 14 files changed, 194 insertions(+), 128 deletions(-)

--
2.43.0
