Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D2A3E5F8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772E010E9E7;
	Thu, 20 Feb 2025 20:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQDLcf76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB42410E9DF;
 Thu, 20 Feb 2025 20:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740083916; x=1771619916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60nckjAvEwo8lnuh60Lk9jDkK46KiEserXo4D8hJMuY=;
 b=SQDLcf76f5P5f0JGG8O+enOsHN1NTqZgMeNxAsV0GlrxO3XlHOg8WUHY
 yJEhIDcUkRsmbNedGUDxCFBzxgaUCp6ttX+exape53jtED8xIZG50T7aG
 XKQNs2tKaSJyzdZQO5RcwMVxUTlAwW1KB/8jEIQSaQzhg2fF0EcDb30i1
 7XZKhWM7ZcxUAavk4tSwCJ24FXdFK/mpuD6iMPmVJ4plxWYxKnV3rS6k9
 7KTsZIJ2OhKw9iS9j6JlPl/CiQ7NiNSUvv4nXOE0AA6Tzv91XqAMWXZds
 ZQ97VO8z76wXYZNb0FyyV5DdQOm9IyBmRsBjWnUuKDrMfPK2vHuMTJ0cv Q==;
X-CSE-ConnectionGUID: /HUJagLCRxOrIbJHeDERHw==
X-CSE-MsgGUID: i7pp+DPUS5CmNKhd8NFDLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41097941"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41097941"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:36 -0800
X-CSE-ConnectionGUID: nPPNdJlnSBudZVPUFX2u1w==
X-CSE-MsgGUID: oAfG8eX+RJOW466+NyeZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115100572"
Received: from dut4086lnl.fm.intel.com ([10.105.10.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:35 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v4 5/6] drm/xe/xe_query: Pass drm file to query funcs
Date: Thu, 20 Feb 2025 20:38:31 +0000
Message-ID: <20250220203832.130430-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220203832.130430-1-jonathan.cavitt@intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
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

