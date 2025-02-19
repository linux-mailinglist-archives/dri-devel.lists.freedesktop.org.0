Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331CA3C581
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C292D10E869;
	Wed, 19 Feb 2025 16:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+xTO80H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9FC10E85C;
 Wed, 19 Feb 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739984154; x=1771520154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60nckjAvEwo8lnuh60Lk9jDkK46KiEserXo4D8hJMuY=;
 b=G+xTO80HxhJJL4A8LYkDNYvZmFBnDR8TD/U/r1X8Mb2jsgjYeDxVXBn2
 5RYFQGqcd5A7TVEIgR3y+tvwYotMp+x+RkyhVGxy12agd99jelCK6GTCj
 0KQj3L7gqZ5sz63Ez3FQw8pZs7C1Q5nAjLhr2oF3TnXcVuyJZZc9sADxl
 R3ngr2M2cft4MijXetoTqco6DBGGysLJbnGoQcNAv5fxdbZ5nIqDwEpmV
 gCN3sYD0eksaXTsqJ+RTXUO2E9jt3wtVAm6Kh66lbgXEYJRgHHGPjvQMI
 sUs4vocFKFcfEAkZfFEIyETO0jCIuIFttFlMKmV7tmPiCQUR1Ryspzhjp A==;
X-CSE-ConnectionGUID: feV9CgsfQHKoPiw3Gyyuuw==
X-CSE-MsgGUID: VQoKKJBqQVqJAhyIjpVlvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40991901"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40991901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:55:50 -0800
X-CSE-ConnectionGUID: OwDbJPClR8+xEtwnivX99A==
X-CSE-MsgGUID: ESGAr5jVR92QRIUnHL3PfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114966328"
Received: from dut4410lnl.fm.intel.com ([10.105.8.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:23:41 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@ursulin.net,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v3 5/6] drm/xe/xe_query: Pass drm file to query funcs
Date: Wed, 19 Feb 2025 16:23:39 +0000
Message-ID: <20250219162340.116499-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219162340.116499-1-jonathan.cavitt@intel.com>
References: <20250219162340.116499-1-jonathan.cavitt@intel.com>
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

Pass the drm file to the query funcs in xe_query.c.  This will be
necessary for a future query.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 39 ++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 042f87a688e7..3aad4737bfec 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -110,7 +110,8 @@ hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
 
 static int
 query_engine_cycles(struct xe_device *xe,
-		    struct drm_xe_device_query *query)
+		    struct drm_xe_device_query *query,
+		    struct drm_file *file)
 {
 	struct drm_xe_query_engine_cycles __user *query_ptr;
 	struct drm_xe_engine_class_instance *eci;
@@ -179,7 +180,8 @@ query_engine_cycles(struct xe_device *xe,
 }
 
 static int query_engines(struct xe_device *xe,
-			 struct drm_xe_device_query *query)
+			 struct drm_xe_device_query *query,
+			 struct drm_file *file)
 {
 	size_t size = calc_hw_engine_info_size(xe);
 	struct drm_xe_query_engines __user *query_ptr =
@@ -240,7 +242,8 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
 }
 
 static int query_mem_regions(struct xe_device *xe,
-			    struct drm_xe_device_query *query)
+			     struct drm_xe_device_query *query,
+			     struct drm_file *file)
 {
 	size_t size = calc_mem_regions_size(xe);
 	struct drm_xe_query_mem_regions *mem_regions;
@@ -310,7 +313,9 @@ static int query_mem_regions(struct xe_device *xe,
 	return ret;
 }
 
-static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
+static int query_config(struct xe_device *xe,
+			struct drm_xe_device_query *query,
+			struct drm_file *file)
 {
 	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
 	size_t size =
@@ -351,7 +356,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	return 0;
 }
 
-static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
+static int query_gt_list(struct xe_device *xe,
+			 struct drm_xe_device_query *query,
+			 struct drm_file *file)
 {
 	struct xe_gt *gt;
 	size_t size = sizeof(struct drm_xe_query_gt_list) +
@@ -422,7 +429,8 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 }
 
 static int query_hwconfig(struct xe_device *xe,
-			  struct drm_xe_device_query *query)
+			  struct drm_xe_device_query *query,
+			  struct drm_file *file)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
@@ -490,7 +498,8 @@ static int copy_mask(void __user **ptr,
 }
 
 static int query_gt_topology(struct xe_device *xe,
-			     struct drm_xe_device_query *query)
+			     struct drm_xe_device_query *query,
+			     struct drm_file *file)
 {
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	size_t size = calc_topo_query_size(xe);
@@ -549,7 +558,9 @@ static int query_gt_topology(struct xe_device *xe,
 }
 
 static int
-query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
+query_uc_fw_version(struct xe_device *xe,
+		    struct drm_xe_device_query *query,
+		    struct drm_file *file)
 {
 	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
 	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
@@ -639,7 +650,8 @@ static size_t calc_oa_unit_query_size(struct xe_device *xe)
 }
 
 static int query_oa_units(struct xe_device *xe,
-			  struct drm_xe_device_query *query)
+			  struct drm_xe_device_query *query,
+			  struct drm_file *file)
 {
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	size_t size = calc_oa_unit_query_size(xe);
@@ -699,7 +711,9 @@ static int query_oa_units(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
 }
 
-static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
+static int query_pxp_status(struct xe_device *xe,
+			    struct drm_xe_device_query *query,
+			    struct drm_file *file)
 {
 	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
 	size_t size = sizeof(struct drm_xe_query_pxp_status);
@@ -727,7 +741,8 @@ static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *qu
 }
 
 static int (* const xe_query_funcs[])(struct xe_device *xe,
-				      struct drm_xe_device_query *query) = {
+				      struct drm_xe_device_query *query,
+				      struct drm_file *file) = {
 	query_engines,
 	query_mem_regions,
 	query_config,
@@ -757,5 +772,5 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !xe_query_funcs[idx]))
 		return -EINVAL;
 
-	return xe_query_funcs[idx](xe, query);
+	return xe_query_funcs[idx](xe, query, file);
 }
-- 
2.43.0

