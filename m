Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27620824116
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DDA10E420;
	Thu,  4 Jan 2024 11:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCDE10E420
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369443; x=1735905443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUqN7GFjnzsTKSygbNDJRrYquR1J/VnvyvTio/OkImY=;
 b=nyvKCZP5TUNqogfZ5OiCYgGN4/AgpeLcR01J8j501YsJG9QsJ8xVGR0Z
 smm9T+s0kiuOTDZC66uCKUbnvyKBQPb9ndYgcjfulPlyYlCuTOMUQwExM
 QRnUs7U5HUFYeV22T62cVNl++wZXKRiahOT13YnUERMXQAwIOupZKnje1
 58WQis7I7i9jczUEcNFd9U7ThakK/XK5i3+WURjuaDnQnAHlbHxVNYtOA
 tN6ZlhqMp5z444BuJ1HtwcBXnfydoTe/5mGPldbiqy61NrYmeC2K0Sxqm
 wUd1ThMadgW4vh0peZ3PH7IvusloeDW4mCihIwVyJzrEYR5Wuiq9pkZfb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584120"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584120"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275698"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275698"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:21 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/16] accel/ivpu: Update for -next 2024-01-04
Date: Thu,  4 Jan 2024 12:56:57 +0100
Message-ID: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various driver updates:
 - Fixes for driver crashes caused by unbind
 - Fixes for driver crashes during reset/recovery
 - Deprecated DRM_IVPU_PARAM_CONTEXT_PRIORITY
 - Improved support for 40xx
 - Improved diagnostic messages
 - ivpu_job.c refactor

Grzegorz Trzebiatowski (1):
  accel/ivpu: New job status for jobs aborted by the driver

Jacek Lawrynowicz (8):
  accel/ivpu: Fix potential infinite loops in IRQ handlers
  accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
  accel/ivpu: Free buffer sgt on unbind
  accel/ivpu: Disable buffer sharing among VPU contexts
  accel/ivpu: Improve buffer object debug logs
  accel/ivpu: Fix dev open/close races with unbind
  accel/ivpu: Refactor ivpu_submit_ioctl()
  accel/ivpu: Improve recovery and reset support

Krystian Pradzynski (2):
  accel/ivpu/40xx: Enable D0i3 message feature
  accel/ivpu/40xx: Stop passing SKU boot parameters to FW

Wachowski, Karol (5):
  accel/ivpu: Dump MMU events in case of VPU boot timeout
  accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
  accel/ivpu: Add debug prints for MMU map/unmap operations
  accel/ivpu: Remove deprecated DRM_IVPU_PARAM_CONTEXT_PRIORITY
  accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend

 drivers/accel/ivpu/ivpu_debugfs.c     |  20 +++-
 drivers/accel/ivpu/ivpu_drv.c         | 127 +++++++++++---------
 drivers/accel/ivpu/ivpu_drv.h         |   5 +-
 drivers/accel/ivpu/ivpu_fw.c          |   1 -
 drivers/accel/ivpu/ivpu_gem.c         | 142 +++++++++-------------
 drivers/accel/ivpu/ivpu_gem.h         |   3 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  14 +--
 drivers/accel/ivpu/ivpu_hw_40xx.c     |  13 +--
 drivers/accel/ivpu/ivpu_ipc.c         |  12 +-
 drivers/accel/ivpu/ivpu_job.c         | 162 ++++++++++++--------------
 drivers/accel/ivpu/ivpu_job.h         |   3 +-
 drivers/accel/ivpu/ivpu_mmu.c         |  29 +++--
 drivers/accel/ivpu/ivpu_mmu.h         |   1 +
 drivers/accel/ivpu/ivpu_mmu_context.c |   9 ++
 drivers/accel/ivpu/ivpu_pm.c          |  52 ++++++---
 drivers/accel/ivpu/ivpu_pm.h          |   6 +-
 include/uapi/drm/ivpu_accel.h         |  22 +++-
 17 files changed, 327 insertions(+), 294 deletions(-)

--
2.43.0
