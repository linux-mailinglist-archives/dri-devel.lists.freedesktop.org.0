Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B94008C2
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 02:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7776E8F2;
	Sat,  4 Sep 2021 00:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F97A6E8E9;
 Sat,  4 Sep 2021 00:35:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="216404816"
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; d="scan'208";a="216404816"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 17:35:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; d="scan'208";a="511701405"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 17:35:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 2/2] drm/i915/dg2: Define MOCS table for DG2
Date: Fri,  3 Sep 2021 17:35:44 -0700
Message-Id: <20210904003544.2422282-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210904003544.2422282-1-matthew.d.roper@intel.com>
References: <20210904003544.2422282-1-matthew.d.roper@intel.com>
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

Bspec: 45101, 45427
Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_mocs.c | 37 +++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 133cfe07cb9f..d66be8457d26 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -342,6 +342,30 @@ static const struct drm_i915_mocs_entry xehpsdv_mocs_table[] = {
 	MOCS_ENTRY(63, 0, L3_1_UC),
 };
 
+static const struct drm_i915_mocs_entry dg2_mocs_table[] = {
+	/* UC - Coherent; GO:L3 */
+	MOCS_ENTRY(0, 0, L3_1_UC | L3_LKUP(1)),
+	/* UC - Coherent; GO:Memory */
+	MOCS_ENTRY(1, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
+	/* UC - Non-Coherent; GO:Memory */
+	MOCS_ENTRY(2, 0, L3_1_UC | L3_GLBGO(1)),
+
+	/* WB - LC */
+	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
+};
+
+static const struct drm_i915_mocs_entry dg2_mocs_table_g10_ax[] = {
+	/* Wa_14011441408: Set Go to Memory for MOCS#0 */
+	MOCS_ENTRY(0, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
+	/* UC - Coherent; GO:Memory */
+	MOCS_ENTRY(1, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
+	/* UC - Non-Coherent; GO:Memory */
+	MOCS_ENTRY(2, 0, L3_1_UC | L3_GLBGO(1)),
+
+	/* WB - LC */
+	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
+};
+
 enum {
 	HAS_GLOBAL_MOCS = BIT(0),
 	HAS_ENGINE_MOCS = BIT(1),
@@ -371,7 +395,18 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
 	memset(table, 0, sizeof(struct drm_i915_mocs_table));
 
 	table->unused_entries_index = I915_MOCS_PTE;
-	if (IS_XEHPSDV(i915)) {
+	if (IS_DG2(i915)) {
+		if (IS_DG2_GT_STEP(i915, G10, STEP_A0, STEP_B0)) {
+			table->size = ARRAY_SIZE(dg2_mocs_table_g10_ax);
+			table->table = dg2_mocs_table_g10_ax;
+		} else {
+			table->size = ARRAY_SIZE(dg2_mocs_table);
+			table->table = dg2_mocs_table;
+		}
+		table->uc_index = 1;
+		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
+		table->unused_entries_index = 3;
+	} else if (IS_XEHPSDV(i915)) {
 		table->size = ARRAY_SIZE(xehpsdv_mocs_table);
 		table->table = xehpsdv_mocs_table;
 		table->uc_index = 2;
-- 
2.25.4

