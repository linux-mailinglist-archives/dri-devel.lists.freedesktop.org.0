Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658ABB1DB7E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE74610E880;
	Thu,  7 Aug 2025 16:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITcuoaDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2410E87F;
 Thu,  7 Aug 2025 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583407; x=1786119407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0OLlipL3I6d3sfvF4O87kHaRSQvwB4je8RP1ri4u5o=;
 b=ITcuoaDNbhMGf4H64JLC2K9OueLBSXeTKnrUsN+yiQuqp6YwGQg1hanW
 wmP0h426sWsAYizbZE2P/zy/4hbwERgFfjfm/bBjSYnZPX/OdxZNr2z+m
 IR8GZCVM7+RqDZmvn/hJEd0XjH1HptRhKZtk/gTxLTqn8Q/UaeHyrzwc8
 BC/De5Uy0q/xYIr3CN23+5vOhlnaOJfYVtumTxm42CsE61z7SR7gBkoMS
 Y8oICKhqG4wfZsdg+n4pp2eFtpStaMNDepC1sHCpNtMcT4zxDjisukJTF
 YJY+61hqPgaErC9e7mjXGOpf7Tf1OsLNd5pm47BUBsFfhc1cZq1VzTkSj g==;
X-CSE-ConnectionGUID: NuuBDzLoR4+DLV9mrStc+g==
X-CSE-MsgGUID: liM+10O9TrKBKGzWoAhwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845549"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:16:46 -0700
X-CSE-ConnectionGUID: hHVFDQ9bS3yc26FwN4prgg==
X-CSE-MsgGUID: 5epDC9ucQ/WSfbjjHkhzog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937742"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:16:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Date: Thu,  7 Aug 2025 22:13:16 +0530
Message-Id: <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

- DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
  drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
user-provided range and split the existing non-GEM object VMA if the
start or end of the input range lies within it. The operations can
create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
used by the Xe driver to assign attributes to GPUVMA's within the
user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
the operation with this flag will never have UNMAPs and
merges, and can be without any final operations.

v2
- use drm_gpuvm_sm_map_ops_create with flags instead of defining new
  ops_create (Danilo)
- Add doc (Danilo)

v3
- Fix doc
- Fix unmapping check

v4
- Fix mapping for non madvise ops

v5
- Fix mapping (Matthew Brost)
- Rebase on top of struct changes

v6
- flag moved to map_req

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++------
 include/drm/drm_gpuvm.h     | 11 +++++
 2 files changed, 84 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index b3a01c40001b..d8f5f594a415 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2110,6 +2110,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req->op_map.va.addr + req->op_map.va.range;
+	bool is_madvise_ops = (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
+	bool needs_map = !is_madvise_ops;
 	int ret;
 
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->op_map.va.addr, req->op_map.va.range)))
@@ -2122,26 +2124,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool skip_madvise_ops = is_madvise_ops && merge;
 
+		needs_map = !is_madvise_ops;
 		if (addr == req->op_map.va.addr) {
 			merge &= obj == req->op_map.gem.obj &&
 				 offset == req->op_map.gem.offset;
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = range - req->op_map.va.range,
@@ -2156,6 +2167,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr < req->op_map.va.addr) {
@@ -2173,20 +2187,45 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			u.keep = merge;
 
 			if (end == req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
+
 				break;
 			}
 
 			if (end < req_end) {
+				if (skip_madvise_ops)
+					continue;
+
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops) {
+					struct drm_gpuvm_map_req map_req = {
+						.op_map.va.addr =  req->op_map.va.addr,
+						.op_map.va.range = end - req->op_map.va.addr,
+					};
+
+					ret = op_map_cb(ops, priv, &map_req);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = end - req_end,
@@ -2198,6 +2237,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr > req->op_map.va.addr) {
@@ -2206,20 +2248,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					   (addr - req->op_map.va.addr);
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
+
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = end - req_end,
@@ -2234,12 +2285,20 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops) {
+					struct drm_gpuvm_map_req map_req = {
+						.op_map.va.addr =  addr,
+						.op_map.va.range = req_end - addr,
+					};
+
+					return op_map_cb(ops, priv, &map_req);
+				}
 				break;
 			}
 		}
 	}
-
-	return op_map_cb(ops, priv, req);
+	return needs_map ? op_map_cb(ops, priv, req) : 0;
 }
 
 static int
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 116f77abd570..fa2b74a54534 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1054,6 +1054,17 @@ enum drm_gpuvm_sm_map_ops_flags {
 	  * %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT sm_map ops
 	  */
 	DRM_GPUVM_SM_MAP_OPS_FLAG_NONE = 0,
+
+	/**
+	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
+	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
+	 * user-provided range and split the existing non-GEM object VMA if the
+	 * start or end of the input range lies within it. The operations can
+	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
+	 * in default mode, the operation with this flag will never have UNMAPs
+	 * and merges, and can be without any final operations.
+	 */
+	DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE = BIT(0),
 };
 
 /**
-- 
2.34.1

