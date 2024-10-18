Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF329A48C1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDE610E9B0;
	Fri, 18 Oct 2024 21:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWS1M0BY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2410E9B1;
 Fri, 18 Oct 2024 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729285840; x=1760821840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqYbb/5kgM8RqJScYe4258g9LPWqoUfhryQi96wIhi4=;
 b=mWS1M0BYk1+p+WBnX5YxCfvun9HeluWi7i70d9QzyShQCIxoJsr5+gqh
 b4NvDfWcZHyz45LQNrFCmPlPPspJWD9hPRk4L0EXQv5owV3nJmwjGq9n3
 aiRYasyQrhDIunRRDmAApMZBSqalk+M8dOULO806g5Gk2W0WTvBPsfsuV
 +wvvynzo/quVJSwhO+e2fjBr2ZkZhpe4fzgK7IY8yBlCsggKMWUFOL081
 ZZSaTI06KYLxNw/+FPQxBJiBf7BbpMcb1cNsQjCOMBjdTbEIhXO3wrsYE
 mYLeYw/gwwzJXcgzBkZ0wTWPIfaKPZ6uAgz9NTKpj/6ZciqHolzG6aCm7 A==;
X-CSE-ConnectionGUID: Hi/KUCsDSAiRECKpXtL/eQ==
X-CSE-MsgGUID: n+jGRPU2QryMQjILVlh05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="54241736"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="54241736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:10:40 -0700
X-CSE-ConnectionGUID: oy5jwcoCT0eJC3Ks1ZJa0A==
X-CSE-MsgGUID: xe48bGU2T5CSzHtekJzsIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79311947"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:10:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 3/3] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
Date: Fri, 18 Oct 2024 14:11:03 -0700
Message-Id: <20241018211103.1367643-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018211103.1367643-1-matthew.brost@intel.com>
References: <20241018211103.1367643-1-matthew.brost@intel.com>
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

Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..2eae9ce41c06 100644
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
+			else
+				err = 0;
 		} else {
 			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
 
-- 
2.34.1

