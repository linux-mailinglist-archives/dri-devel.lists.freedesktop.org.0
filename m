Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C0B16062
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FBB10E696;
	Wed, 30 Jul 2025 12:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m20fsQ9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4FD10E694;
 Wed, 30 Jul 2025 12:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878847; x=1785414847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lle3e3Z0TIjtHnQgtqg5ZnCG+sKPvy+v3pxn2VZKFxk=;
 b=m20fsQ9U6ud4aKFvJubTqrEA6/RB0qmQ8pDGFmCwLLrNSXH+ED641UYb
 18Rtu202GHMOjLfrJ01OiMNLbtURXACW1WpzfflAgadQijnrdvR30Rrgm
 t/vATvO1mw5UAq979Wu+aWyzso3Fa3j6GBcTvbHpxxY8ng4WkI6Ng8XgK
 /2DLpqoqWmDjJimWNNO95phtdp2zgAdxKjiStqgh3NGzQJ+4Z2rxS4Wm4
 qrxaME2YkGXgcdmieJUBSVmhrlm3EdKONITLq4ScijNbGuTTbJZl5BjvJ
 zIgeQDlPom5tFtHVtts66LljjS3TF9jXizWg5VrhOwy2BhiJE6AWcOI71 A==;
X-CSE-ConnectionGUID: FcHUTuJyQRKNcZ6R0QcvvQ==
X-CSE-MsgGUID: 0m7RSWMIRECHVUDc5aJ/SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450128"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:07 -0700
X-CSE-ConnectionGUID: 4MfgqvN+SS+D+9nIdl6mFA==
X-CSE-MsgGUID: 2LOPifC0QnCkYLh1uVoQ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649447"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/25] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Date: Wed, 30 Jul 2025 18:30:29 +0530
Message-Id: <20250730130050.1001648-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++------
 include/drm/drm_gpuvm.h     | 11 ++++-
 2 files changed, 83 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f04d80a3a63b..2aeae8c2296f 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2110,6 +2110,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req->va.addr + req->va.range;
+	bool is_madvise_ops = (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
+	bool needs_map = !is_madvise_ops;
 	int ret;
 
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
@@ -2122,26 +2124,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool skip_madvise_ops = is_madvise_ops && merge;
 
+		needs_map = !is_madvise_ops;
 		if (addr == req->va.addr) {
 			merge &= obj == req->gem.obj &&
 				 offset == req->gem.offset;
 
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
 					.va.range = range - req->va.range,
@@ -2156,6 +2167,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr < req->va.addr) {
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
+					struct drm_gpuva_op_map map_req = {
+						.va.addr =  req->va.addr,
+						.va.range = end - req->va.addr,
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
 		} else if (addr > req->va.addr) {
@@ -2206,20 +2248,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					   (addr - req->va.addr);
 
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
+					struct drm_gpuva_op_map map_req = {
+						.va.addr =  addr,
+						.va.range = req_end - addr,
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
index 75c616fdc119..a8e9f70501ef 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -811,10 +811,19 @@ enum drm_gpuva_op_type {
 };
 
 /** DOC: flags for struct drm_gpuva_op_map
- *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE DEFAULT split and merge,
+ *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT split and merge,
  *  It cannot be combined with other flags.
+ *
+ *  %DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
+ *  drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the user-provided
+ *  range and split the existing non-GEM object VMA if the start or end of
+ *  the input range lies within it. The operations can create up to 2 REMAPS
+ *  and 2 MAPs. Unlike DRM_GPUVM_SM_MAP_OPS_FLAG_NONE flag, the operation with
+ *  this flag will never have UNMAPs and merges, and can be without any final
+ *  operations.
  */
 #define DRM_GPUVM_SM_MAP_OPS_FLAG_NONE 0
+#define DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE BIT(0)
 
 /**
  * struct drm_gpuva_op_map - GPU VA map operation
-- 
2.34.1

