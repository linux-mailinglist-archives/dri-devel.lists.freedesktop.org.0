Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3089D9CD0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9910E988;
	Tue, 26 Nov 2024 17:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldNbc/4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0722899A3;
 Tue, 26 Nov 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643141; x=1764179141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uh9Jwo9O+TNbDlkFULMypNtBNGe09Nh9IU4Xyq1WC2c=;
 b=ldNbc/4/u+F8CBwjAu+q4dFelO0zgCdTxbrJkLY0cLSYLuDBSFykWXRB
 usq/iYe6vv8K+0ZcAWuPglcwKRDBgy9DnuC75W9wE3uNIqvbZYgOSkf7T
 OLtMOQgHL2rnhODARMWcfILEvI1/l/ylltkQ5GGiKUvdPa0KK27JuhBry
 nIbgjSKRANXp1bcf0DddPO8hEkv+A883bOhA5WsNwaY+i3RyB0Sbgf9J9
 zSQ1sJQsF9VvPO6A2ce/VPVaGJq1ftExHCh56PpuEgEDVb5Xt+wlBKDYv
 9FOSGWnoyNcOX71c0nd8fX6oKHpUJYBaFUnBhYA1kRJZi/OqSrsv/FqVF Q==;
X-CSE-ConnectionGUID: 5XEwUwVFQT28Y56ZYy4TxA==
X-CSE-MsgGUID: mZoV7wr9SW+S1QGjwS5iWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676919"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676919"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:41 -0800
X-CSE-ConnectionGUID: rJwy1/G4SDmaNF+oVE4Cew==
X-CSE-MsgGUID: DhZZF/ZdQHq9lxsi20NTWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152586"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 6/8] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
Date: Tue, 26 Nov 2024 09:46:13 -0800
Message-Id: <20241126174615.2665852-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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

Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
instead.

v2:
 - Fix error handling

Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1d7faeba157e..2492750505d6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3309,7 +3309,6 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 
 	for (int i = 0; i < snap->num_snaps; i++) {
 		struct xe_bo *bo = snap->snap[i].bo;
-		struct iosys_map src;
 		int err;
 
 		if (IS_ERR(snap->snap[i].data))
@@ -3322,16 +3321,12 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		}
 
 		if (bo) {
-			xe_bo_lock(bo, false);
-			err = ttm_bo_vmap(&bo->ttm, &src);
-			if (!err) {
-				xe_map_memcpy_from(xe_bo_device(bo),
-						   snap->snap[i].data,
-						   &src, snap->snap[i].bo_ofs,
-						   snap->snap[i].len);
-				ttm_bo_vunmap(&bo->ttm, &src);
-			}
-			xe_bo_unlock(bo);
+			err = ttm_bo_access(&bo->ttm, snap->snap[i].bo_ofs,
+					    snap->snap[i].data, snap->snap[i].len, 0);
+			if (!(err < 0) && err != snap->snap[i].len)
+				err = -EIO;
+			else if (!(err < 0))
+				err = 0;
 		} else {
 			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
 
-- 
2.34.1

