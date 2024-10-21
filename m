Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B39A91EB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491510E5A3;
	Mon, 21 Oct 2024 21:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fwdbq5aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4560010E056;
 Mon, 21 Oct 2024 21:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729545492; x=1761081492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/eqKwEkykFw0EmxBn6wWQTSWmwcMpLrzqmQxMmcO2P8=;
 b=Fwdbq5aCxnI+MVrZByy8R0DSXsKaw0LgLvCQgU62XQvO/ttf7RCvMvMn
 /1M6Ke8oXxIQE9oqV31slDoaunVH3/YsgZaAcCaLQptHPxTfo7uXVY/h4
 Q7OEAhc83MEM3X3zR1TduhtnVQNkW/xcijQ13cJYe8+3IAfBOObrrEPCl
 HKaUJBhHimkPzvCH7JHR9qpJk445WdS4wf92p9Z9BSojR8U04mfZtWMVK
 5a1oK8PmfMFA/6BxZZttjn4/ARy4vO44Cj/LMIATXlRv6EvO9KMNy/gy8
 NO+YQDiocRwjMGCJTIr9GOPs3AN5raZPEXzz0UyQwm8VW7y4xsAHspRWI w==;
X-CSE-ConnectionGUID: raz5vhXnTm+/opgZfo3B9A==
X-CSE-MsgGUID: euLA8H1CRFa57FUplBftug==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29257677"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29257677"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:10 -0700
X-CSE-ConnectionGUID: uzxHL5CVQDCDkc0k7VGVsw==
X-CSE-MsgGUID: KzQGW00PTsWlul4aixTLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80469574"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 0/9] Fix non-contiguous VRAM BO access in Xe
Date: Mon, 21 Oct 2024 14:18:26 -0700
Message-Id: <20241021211835.1675640-1-matthew.brost@intel.com>
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

Mapping a non-contiguous VRAM BO doesn't work, start to fix this.

v2:
 - Include missing local change
v3:
 - Use GPU for non-visible access
 - Take PM ref in xe_ttm_access_memory
 - Disable VMAP for non-contiguous BOs
v4:
 - Fix less than page sized non-visible access
 - Add PM ref to xe_ttm_access_memory
 - Add PM ref to delayed snapshot capture worker
 - Fix a couple of warnings in xe_res_cursor
 - Test all possible code paths
v5:
 - Fix 32 bit build (CI)

Matthew Brost (9):
  drm/xe: Add xe_bo_vm_access
  drm/ttm: Add ttm_bo_access
  drm/xe: Add xe_ttm_access_memory
  drm/xe: Take PM ref in delayed snapshot capture worker
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
  drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
  drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
  drm/xe: Only allow contiguous BOs to use xe_bo_vmap

 drivers/gpu/drm/ttm/ttm_bo_util.c     |  86 +++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c       |  65 +-----
 drivers/gpu/drm/xe/display/intel_bo.c |  25 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c |  13 +-
 drivers/gpu/drm/xe/xe_bo.c            | 106 +++++++--
 drivers/gpu/drm/xe/xe_devcoredump.c   |   6 +
 drivers/gpu/drm/xe/xe_migrate.c       | 325 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h       |   4 +
 drivers/gpu/drm/xe/xe_vm.c            |  17 +-
 include/drm/ttm/ttm_bo.h              |   2 +
 10 files changed, 533 insertions(+), 116 deletions(-)

-- 
2.34.1

