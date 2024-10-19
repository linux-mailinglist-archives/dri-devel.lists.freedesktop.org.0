Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BBE9A5073
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514D10E3B2;
	Sat, 19 Oct 2024 19:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kStHKP0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF410E3AA;
 Sat, 19 Oct 2024 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729365605; x=1760901605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rgdWjLCAsWDICAk8WcCYB+yo/wtl3ra7r8m7MBpFXLE=;
 b=kStHKP0lo4tjjhhLqEaa7YX3JJVxft9UlgQRFgzMAonnO8nZde1Hjk39
 UFngqtZT5JH4uEB9kAsSxBxSH6IidSmy1P1DLYlZZHUClk8BFz7Dr/ovN
 OTdyw4aoImabbYeenrTn7OoQC2YeyXBFzCiZOYIjQBTAsUxlUWClOBnCy
 aba68r+bBDWnKO66uGLIs3pIlgnIVU22R+78C9LViMjeNz7sdmzR+dcaE
 lXVjxwawH/EsF1a1jzoMALnip7/hDxBL3McPhBmrHPn6988d1aair5dzL
 hZ1DVaxIjwOcnGaJtpi1VM42F41wRuICr7rUgKecinnm6LxyAQEqC9L4A A==;
X-CSE-ConnectionGUID: 6MYElfkCTxmFzNZukYBetw==
X-CSE-MsgGUID: 5874iQkJTraU+WZCF2D4Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28978587"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28978587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
X-CSE-ConnectionGUID: lwzLkfViTEG/snsVS7navQ==
X-CSE-MsgGUID: w0fpAjuZQ3KZ+D1DuFEffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="84212406"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 4/6] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
Date: Sat, 19 Oct 2024 12:20:28 -0700
Message-Id: <20241019192030.1505020-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..c8782da3a5c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3303,7 +3303,6 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 
 	for (int i = 0; i < snap->num_snaps; i++) {
 		struct xe_bo *bo = snap->snap[i].bo;
-		struct iosys_map src;
 		int err;
 
 		if (IS_ERR(snap->snap[i].data))
@@ -3316,16 +3315,12 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
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

