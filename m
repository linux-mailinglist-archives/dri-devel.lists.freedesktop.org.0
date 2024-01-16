Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE982F303
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264210E5AE;
	Tue, 16 Jan 2024 17:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FBC10E554;
 Tue, 16 Jan 2024 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=53wlPaaX7lKqVgqzNeVk7rMhjjLIBMIlQv1DnVk7AcM=;
 b=ljNZ36GaBWFXI3l3WVwxAs+SUKQhlhW/0NLNepxsUr6jwHWk64XC8ovx
 Mwne1LR4vqlUHjYR8nVKYFBElQOcplSYNJVRzPAvLBnuRwlo+m0a7MBw8
 5enypLoW7+CR0u8eQ/qG36BgCQ22SPekQ/OyppylimSnXJ1Zj8RdFdKsA
 3xTV3uE3EBMSWJROdRpBEMtOYTvLe2yRLWJcivxLvA+K7+1zbC6sYWMLR
 oWQhT7RaCe/XZNS+NgqHLgumsPVCIce0zM8rgzUHxJb0g666Ur+vf7FL7
 oJX/y3tUJs7fwHG8kwHXkSEBlZrbgdc9sNuNsNXTK+on1R6nqmtNMswqV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593376"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869634"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:46 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Pre-allocate output nodes for extraction
Date: Tue, 16 Jan 2024 09:12:36 -0800
Message-Id: <20240116171237.118463-9-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pre-allocate a fixed number of empty nodes up front (at the
time of ADS registration) that we can consume from or return to
an internal cached list of nodes.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 319e606eeb2a..52f1bacc08ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -479,6 +479,8 @@ xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
 	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
 }
 
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
+
 int
 xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
 {
@@ -497,6 +499,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, voi
 		return cache->status;
 	}
 
+	/*
+	 * ADS population of input registers is a good
+	 * time to pre-allocate cachelist output nodes
+	 */
+	guc_capture_create_prealloc_nodes(guc);
+
 	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
 	if (ret) {
 		cache->is_valid = true;
@@ -896,6 +904,30 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
 
 	return found;
 }
+static struct __guc_capture_parsed_output *
+guc_capture_alloc_one_node(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		new->reginfo[i].regs = kcalloc(guc->capture->max_mmio_per_node,
+					       sizeof(struct guc_mmio_reg), GFP_KERNEL);
+		if (!new->reginfo[i].regs) {
+			while (i)
+				kfree(new->reginfo[--i].regs);
+			kfree(new);
+			return NULL;
+		}
+	}
+	guc_capture_init_node(guc, new);
+
+	return new;
+}
 
 static struct __guc_capture_parsed_output *
 guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
@@ -937,6 +969,57 @@ guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *o
 	return new;
 }
 
+static void
+__guc_capture_create_prealloc_nodes(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *node = NULL;
+	int i;
+
+	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
+		node = guc_capture_alloc_one_node(guc);
+		if (!node) {
+			xe_gt_warn(guc_to_gt(guc), "Register capture pre-alloc-cache failure\n");
+			/* dont free the priors, use what we got and cleanup at shutdown */
+			return;
+		}
+		guc_capture_add_node_to_cachelist(guc->capture, node);
+	}
+}
+
+static int
+guc_get_max_reglist_count(struct xe_guc *guc)
+{
+	int i, j, k, tmp, maxregcount = 0;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
+		for (j = 0; j < GUC_CAPTURE_LIST_TYPE_MAX; ++j) {
+			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
+				if (j == GUC_CAPTURE_LIST_TYPE_GLOBAL && k > 0)
+					continue;
+
+				tmp = guc_cap_list_num_regs(guc->capture, i, j, k);
+				if (tmp > maxregcount)
+					maxregcount = tmp;
+			}
+		}
+	}
+	if (!maxregcount)
+		maxregcount = PREALLOC_NODES_DEFAULT_NUMREGS;
+
+	return maxregcount;
+}
+
+static void
+guc_capture_create_prealloc_nodes(struct xe_guc *guc)
+{
+	/* skip if we've already done the pre-alloc */
+	if (guc->capture->max_mmio_per_node)
+		return;
+
+	guc->capture->max_mmio_per_node = guc_get_max_reglist_count(guc);
+	__guc_capture_create_prealloc_nodes(guc);
+}
+
 static int
 guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
 {
-- 
2.34.1

