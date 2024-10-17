Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28589A25BB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F4410E84D;
	Thu, 17 Oct 2024 14:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQyz0GG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3005F10E348
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177101; x=1760713101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gCTFqiO4gEP5qD5NSl5Q1QVJpn+PZoq8+q/3xaOEB6s=;
 b=KQyz0GG0Fzc+8S2vDj8p85M+S2u71eIaCJIjYG0wWftoJLQsgHBOYaom
 2O/emlXi9DJoAZf0YtvXOGU4mjhyb/O0inevwFMI8vXQkVnDhOZJpvA7z
 T1ZErY89CJCEM/5HWw7540fm6u44+8dmmEzp4fDnIBUYMNOvhanqGzUl7
 Mxw35JDEbITscJLveFPRfI8EMmknnLdLj9Or7B1bTNgNJGoQXkXHjUB1j
 cV6oBbPKingjwD6ZWduVWxl4HCMsbQ+kenc2nIwPPbbhT+qd/kyzFXT/Q
 3icL/VWa5bZDZNSvHRsHwrJTtbfNL5+hPsONmBfLr3257tiXUwlos0Scq Q==;
X-CSE-ConnectionGUID: QESZpKLLTyKj7Ga9zsm3Og==
X-CSE-MsgGUID: 4hlecogqRfi/Lp55NcndlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790308"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:21 -0700
X-CSE-ConnectionGUID: yUuUuzXZRxuWWhrclyKmZA==
X-CSE-MsgGUID: AR7QHtTvRS+Ou11vew8E7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374479"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:20 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 00/11] accel/ivpu: Changes for 6.13-rc5
Date: Thu, 17 Oct 2024 16:58:06 +0200
Message-ID: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

 - Remove support for deprecated and unused copy engine
 - Improved open() performance by lazy allocating MMU page tables
 - Error handling fixes in MMU code
 - Extend VPU address ranges to allow bigger workloads

Andrzej Kacprowski (1):
  accel/ivpu: Remove copy engine support

Karol Wachowski (9):
  accel/ivpu: Do not fail when more than 1 tile is fused
  accel/ivpu: Defer MMU root page table allocation
  accel/ivpu: Clear CDTAB entry in case of failure
  accel/ivpu: Unmap partially mapped BOs in case of errors
  accel/ivpu: Use xa_alloc_cyclic() instead of custom function
  accel/ivpu: Make command queue ID allocated on XArray
  accel/ivpu: Don't allocate preemption buffers when MIP is disabled
  accel/ivpu: Increase DMA address range
  accel/ivpu: Move secondary preemption buffer allocation to DMA range

Maciej Falkowski (1):
  accel/ivpu: Add debug Kconfig option

 drivers/accel/ivpu/Kconfig            |  10 ++
 drivers/accel/ivpu/Makefile           |   2 +
 drivers/accel/ivpu/ivpu_drv.c         |  31 +++--
 drivers/accel/ivpu/ivpu_drv.h         |  16 +--
 drivers/accel/ivpu/ivpu_fw.c          |   8 +-
 drivers/accel/ivpu/ivpu_hw.c          |  10 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c     |  12 +-
 drivers/accel/ivpu/ivpu_job.c         | 148 ++++++++++--------------
 drivers/accel/ivpu/ivpu_job.h         |   2 +
 drivers/accel/ivpu/ivpu_jsm_msg.c     |   8 +-
 drivers/accel/ivpu/ivpu_mmu.c         | 101 ++++++----------
 drivers/accel/ivpu/ivpu_mmu.h         |   4 +-
 drivers/accel/ivpu/ivpu_mmu_context.c | 158 ++++++++++++++------------
 drivers/accel/ivpu/ivpu_mmu_context.h |   9 +-
 drivers/accel/ivpu/ivpu_pm.c          |   2 +
 include/uapi/drm/ivpu_accel.h         |   6 +-
 16 files changed, 243 insertions(+), 284 deletions(-)

--
2.45.1
