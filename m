Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2DA82F306
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84A110E5BD;
	Tue, 16 Jan 2024 17:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9D210E593;
 Tue, 16 Jan 2024 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nRErE7hR7BlojnkflFeNg5EI92A4SbXDvdKiDrZsRW0=;
 b=GV2eGbqmpkXbG3XK11uxAC6C1Nspyo2DRYZ0N0gLeLqHijcZiBuC82ly
 3600rNvkAl+H3ckSk1UqUhvgWVFKcoyo1u7IIoJkkRONj9N3rsIxhNU1N
 iiOY0xFb3gJ926f03A18MHcqBluy/bpa4m3C+TkRV2uOVj9Lo0//DtMbD
 T5yicX2qujzCOzjqspD4jB7WOOx6wXKpTb+dI1SR+NyGvb+ZbDmlSoT8u
 SLrvoDiAL4f0O4PU00X68QOpbJqvsbtq06A3kRTnQe3Mqc+ZjC5R0DDOP
 IRxcIEKYTNrOwtM3bdeA0a3CvcgdlbkrKEdwA6XcgzBloD8tg5XWnA9Ih g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593357"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593357"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869626"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:46 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Check sizing of guc_capture output
Date: Tue, 16 Jan 2024 09:12:34 -0800
Message-Id: <20240116171237.118463-7-zhanjun.dong@intel.com>
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

Add capture output size check function to provide a reasonable
minimum size for error capture region before allocating the shared
buffer.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 76 +++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index dde3a269d114..f4153dc4ab86 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -559,6 +559,81 @@ xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
 	return 0;
 }
 
+static int
+guc_capture_output_min_size_est(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	int worst_min_size = 0;
+	size_t tmp = 0;
+
+	if (!guc->capture)
+		return -ENODEV;
+
+	/*
+	 * If every single engine-instance suffered a failure in quick succession but
+	 * were all unrelated, then a burst of multiple error-capture events would dump
+	 * registers for every one engine instance, one at a time. In this case, GuC
+	 * would even dump the global-registers repeatedly.
+	 *
+	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
+	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
+	 * dumps are split across different register types (where the '3' are global vs class
+	 * vs instance).
+	 */
+	for_each_hw_engine(hwe, gt, id) {
+		worst_min_size += sizeof(struct guc_state_capture_group_header_t) +
+					 (3 * sizeof(struct guc_state_capture_header_t));
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp, true))
+			worst_min_size += tmp;
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+					     hwe->class, &tmp, true)) {
+			worst_min_size += tmp;
+		}
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+					     hwe->class, &tmp, true)) {
+			worst_min_size += tmp;
+		}
+	}
+
+	return worst_min_size;
+}
+
+/*
+ * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
+ * before the i915 can read the data out and process it
+ */
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+
+static void check_guc_capture_size(struct xe_guc *guc)
+{
+	int min_size = guc_capture_output_min_size_est(guc);
+	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
+	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+
+	/*
+	 * NOTE: min_size is much smaller than the capture region allocation (DG2: <80K vs 1MB)
+	 * Additionally, its based on space needed to fit all engines getting reset at once
+	 * within the same G2H handler task slot. This is very unlikely. However, if GuC really
+	 * does run out of space for whatever reason, we will see an separate warning message
+	 * when processing the G2H event capture-notification, search for:
+	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
+	 */
+	if (min_size < 0)
+		xe_gt_warn(guc_to_gt(guc), "Failed to calculate error state capture buffer minimum size: %d!\n",
+			   min_size);
+	else if (min_size > buffer_size)
+		xe_gt_warn(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
+			   buffer_size, min_size);
+	else if (spare_size > buffer_size)
+		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+			  buffer_size, spare_size, min_size);
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
@@ -570,6 +645,7 @@ int xe_guc_capture_init(struct xe_guc *guc)
 	INIT_LIST_HEAD(&guc->capture->outlist);
 	INIT_LIST_HEAD(&guc->capture->cachelist);
 
+	check_guc_capture_size(guc);
 	return 0;
 }
 
-- 
2.34.1

