Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BE9D9CCD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2110E96B;
	Tue, 26 Nov 2024 17:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HV89K9zK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC83899A3;
 Tue, 26 Nov 2024 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643140; x=1764179140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PkWiFYslfaLNg6YRsbTeeDCnGjQC7oOlwil3ks27fnM=;
 b=HV89K9zK5vJOrObgn8CvtMGCvO+zwVtBF8ZkBNcaujtfMks9N95e4bxk
 ib5ITZ1NbpZo2BR8++LURnjrjXVTE6rAbx3F1gpP1sKZFQGcnQ6n5+ShM
 6VMX9k1pzmKylPQUnnlhOy2vJm8EPoNX7gr0X45IdXvMfa4zg3Wh/pcje
 FQi4jE2+IFaJQR1nUoI9HE+fEOTloIMCu1cvr38ORkz+Snj93Ouh8F6p8
 QDqjOzyCHAnDnsvKgtBu83d3QRx9Mev/dfvNsakXRE4lDGG9Qg3beNpOm
 Byis4LsBV265irDWEcckxgNpu5w+4EdfKuPAnuBAccCtgFzcfqLKr+tjZ A==;
X-CSE-ConnectionGUID: Ux85hBoDQ9mzT99jDO3CTg==
X-CSE-MsgGUID: QPJZh7vZSYepeeFcyqdv2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676907"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676907"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
X-CSE-ConnectionGUID: EOKuP9mxQOy5ZN2lfnBCoA==
X-CSE-MsgGUID: C1/Zl3+NTVSOiHaajANVIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152574"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 0/8] Fix non-contiguous VRAM BO access in Xe
Date: Tue, 26 Nov 2024 09:46:07 -0800
Message-Id: <20241126174615.2665852-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fully reviewed and resending for final CI.

Dropping non-visible patch for now as it a bit larger, not strickly
required to unblock EU debug, and be sent independently in a follow up.

Matt

Matthew Brost (8):
  drm/xe: Add xe_bo_vm_access
  drm/ttm: Add ttm_bo_access
  drm/xe: Add xe_ttm_access_memory
  drm/xe: Take PM ref in delayed snapshot capture worker
  drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
  drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
  drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
  drm/xe: Only allow contiguous BOs to use xe_bo_vmap

 drivers/gpu/drm/ttm/ttm_bo_vm.c       | 40 ++++++++---
 drivers/gpu/drm/xe/display/intel_bo.c | 25 +------
 drivers/gpu/drm/xe/tests/xe_migrate.c | 13 ++--
 drivers/gpu/drm/xe/xe_bo.c            | 99 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump.c   |  6 ++
 drivers/gpu/drm/xe/xe_vm.c            | 17 ++---
 include/drm/ttm/ttm_bo.h              |  2 +
 7 files changed, 142 insertions(+), 60 deletions(-)

-- 
2.34.1

