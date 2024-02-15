Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B12856B72
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F56110EA15;
	Thu, 15 Feb 2024 17:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXsjrsI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C1410E401;
 Thu, 15 Feb 2024 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708019208; x=1739555208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eo1jaMxJ1EFxtBjsZhs7ZWH/VbKo8GiKJ167yHvTH7w=;
 b=VXsjrsI9C5HGW4G4EPBDceUFudLhRdrIfEoe8A6/78HCvcHxhwEXJzwO
 g/h3xJ+ZOCGzfAlnkE4kN7p9i/ivUuJ1diYY0gcBe8jYm9gpBGwCHRb3Z
 YS3HFPCgk/K2xAFsOhTxJsXyOhzTgPmTPfXA5YivL8tA9pvEOWX9xegjA
 Q3ITQKrY60v6bwu4SuQBVghqc7zdqR/QfX7O2FiuiSu/+3cm2J6Pfnmmi
 BAgAc9rGllcZCPT9zIRoGwyZDXlxPlzNEmcRJC7tfAkP8AqbCEogrN5Ww
 EVI/CqdbasXMxtlsztHpzhhji8d4OZhKbhqumt5EQ5AWJM54aUW7uc9Yl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13514027"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13514027"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3892124"
Received: from dhalpin-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 5/6] drm/xe/stolen: lower the default alignment
Date: Thu, 15 Feb 2024 17:44:36 +0000
Message-ID: <20240215174431.285069-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215174431.285069-7-matthew.auld@intel.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
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

No need to be so aggressive here. The upper layers will already apply
the needed alignment, plus some allocations might wish to skip it. Main
issue is that we might want to have start/end bias range which doesn't
match the default alignment which is rejected by the allocator.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 662f1e9bfc65..2e94f90e1018 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -203,7 +203,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 {
 	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	u64 stolen_size, io_size, pgsize;
+	u64 stolen_size, io_size;
 	int err;
 
 	if (IS_SRIOV_VF(xe))
@@ -220,10 +220,6 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 		return;
 	}
 
-	pgsize = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
-	if (pgsize < PAGE_SIZE)
-		pgsize = PAGE_SIZE;
-
 	/*
 	 * We don't try to attempt partial visible support for stolen vram,
 	 * since stolen is always at the end of vram, and the BAR size is pretty
@@ -234,7 +230,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 		io_size = stolen_size;
 
 	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
-				     io_size, pgsize);
+				     io_size, SZ_4K);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
 		return;
-- 
2.43.0

