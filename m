Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE519A48D0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF17C10E9B8;
	Fri, 18 Oct 2024 21:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYGH6tfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201B710E9A7;
 Fri, 18 Oct 2024 21:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729286159; x=1760822159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R76qaQsWJwXSD60V/rJWhDs90E5lGsxWrquGL4AWbf8=;
 b=LYGH6tfxDBlw2WG95WqC3EeIXfrGAf4ZEy5I5SGFaUzVmzBAWgG2Xw15
 pgkt1jcPfYm1VMUlsOp54ydTwrXDN5QfWL+p7pD0N2kMy/+Bell+HcQtM
 RRwR1eWKKvwfm8VnaktLngFloOH9hIzpOuz/4YsuOGl53Jt9A23GY1d/S
 6OceYv5udr1A8bYfxSb3lIHyzJ0NUDwwJQu7Lkcg27cORRf8ToiLK1rOX
 GXij5AziLeebUbhmD7nlw7IZvBWW4UglCaE6lrIXiJf+s9rGrjESWyPYp
 2sO11JhE2Ja854o9+Jzhs/tYLkTsk6yQmi08385EId9Urj2eJfyvYRbsH g==;
X-CSE-ConnectionGUID: DZ/muQhXQKyYZfFDVKOu3Q==
X-CSE-MsgGUID: gC+v8F0+QZaVHUEnm/w7yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46329579"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="46329579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:15:58 -0700
X-CSE-ConnectionGUID: zwD+a687Qg6tkmH50ziGOw==
X-CSE-MsgGUID: wQpINdcOS++x6FuY8nYr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="84040235"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:15:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 3/3] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
Date: Fri, 18 Oct 2024 14:16:23 -0700
Message-Id: <20241018211623.1367891-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018211623.1367891-1-matthew.brost@intel.com>
References: <20241018211623.1367891-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..0f760fd69d44 100644
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
 
@@ -3375,6 +3370,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			u32 *val = snap->snap[i].data + j;
 			char dumped[ASCII85_BUFSZ];
 
+			printk("%s:%d: j=%d", __func__, __LINE__, (int)j);
 			drm_puts(p, ascii85_encode(*val, dumped));
 		}
 
-- 
2.34.1

