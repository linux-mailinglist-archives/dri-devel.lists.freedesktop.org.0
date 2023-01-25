Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E4967B1F2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE3D10E7AF;
	Wed, 25 Jan 2023 11:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCCC10E7AB;
 Wed, 25 Jan 2023 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647349; x=1706183349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YlTdXMcBwi1pWu+UeyfEWMh7EaevaL7ebvCBbeGg7R8=;
 b=a2lzXI+y1qbpsBoP7uDAsEBMmL3M5677QI0e1Rpyq09g+VeLWXKhOXrR
 DwQHI6OPMGkXgQZHHeiOcyoG0B3r4y2CsT+wlgM4qs94NHI1775fU/Dpe
 4ydZdinAfCSygpGaS0sKq/Vgtv+tB/TtWJYEvYDTP9+oJ8OzBPDBTgnyw
 JACl5NwdOHH7xj1rZ48ur5ck25WJhcipOMxFY0Le9XejJLhXt+EoVVDW1
 CXP7zJ8ptLKJ5H3gcHEyiO4xbxwvn3zdw3MVfi/vQsIn74yzlxRdZdhVz
 AaIBw9oxoh7b2W+ez0HFsVpaHKmsObbuCcRRlaTVLRB4tKm9GJQHznYda Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412769945"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="412769945"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:49:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="786399730"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="786399730"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:49:07 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/display/dp_mst: Add a helper to verify the MST
 payload state
Date: Wed, 25 Jan 2023 13:48:51 +0200
Message-Id: <20230125114852.748337-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230125114852.748337-1-imre.deak@intel.com>
References: <20230125114852.748337-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function drivers can use to verify the MST payload state tracking
and compare this to the sink's payload table.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 169 ++++++++++++++++++
 include/drm/display/drm_dp.h                  |   3 +
 include/drm/display/drm_dp_mst_helper.h       |   3 +
 3 files changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 619f616d69e20..7597d27db4fa6 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4834,6 +4834,175 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 }
 EXPORT_SYMBOL(drm_dp_mst_dump_topology);
 
+static bool verify_mst_payload_state(struct drm_dp_mst_topology_state *mst_state)
+{
+	struct drm_dp_mst_topology_mgr *mgr = mst_state->mgr;
+	struct drm_dp_mst_atomic_payload *payload;
+	int payload_count = 0;
+	u64 time_slot_mask = 0;
+	u32 vcpi_mask = 0;
+	int last_set;
+
+	if (BITS_PER_TYPE(time_slot_mask) < mst_state->total_avail_slots)
+		return false;
+
+	list_for_each_entry(payload, &mst_state->payloads, next) {
+		u64 mask;
+
+		if (payload->vc_start_slot == -1)
+			continue;
+
+		if (!payload->time_slots)
+			return false;
+
+		if (payload->vc_start_slot < mst_state->start_slot)
+			return false;
+
+		if (payload->vc_start_slot + payload->time_slots - mst_state->start_slot >
+		    mst_state->total_avail_slots)
+			return false;
+
+		mask = GENMASK_ULL(payload->vc_start_slot + payload->time_slots - 1,
+				   payload->vc_start_slot);
+
+		if (time_slot_mask & mask)
+			return false;
+
+		time_slot_mask |= mask;
+
+		if (payload->vcpi < 1 ||
+		    payload->vcpi & ~DP_PAYLOAD_ID_MASK ||
+		    payload->vcpi > BITS_PER_TYPE(vcpi_mask))
+			return false;
+		if (BIT(payload->vcpi - 1) & vcpi_mask)
+			return false;
+		vcpi_mask |= BIT(payload->vcpi - 1);
+
+		payload_count++;
+	}
+
+	if (payload_count != mgr->payload_count)
+		return false;
+
+	last_set = fls64(time_slot_mask);
+
+	if (last_set &&
+	    GENMASK_ULL(last_set - 1, mst_state->start_slot) != time_slot_mask)
+		return false;
+
+	if (max(mst_state->start_slot, mgr->next_start_slot) !=
+	    max_t(int, mst_state->start_slot, last_set))
+		return false;
+
+	return true;
+}
+
+static int get_payload_table_vcpi(const u8 *table, int slot)
+{
+	if (slot == 0)
+		return FIELD_GET(DP_PAYLOAD_ID_SLOT0_5_0_MASK, table[0]) |
+		       (FIELD_GET(DP_PAYLOAD_ID_SLOT0_6, table[1]) << 6);
+	else
+		return FIELD_GET(DP_PAYLOAD_ID_MASK, table[slot]);
+}
+
+static bool verify_mst_payload_table(struct drm_dp_mst_topology_state *mst_state,
+				     const u8 *payload_table)
+{
+	struct drm_dp_mst_topology_mgr *mgr = mst_state->mgr;
+	struct drm_dp_mst_atomic_payload *payload;
+	int i;
+
+	list_for_each_entry(payload, &mst_state->payloads, next) {
+		if (payload->vc_start_slot == -1)
+			continue;
+
+		if (payload->vc_start_slot + payload->time_slots > DP_PAYLOAD_TABLE_SIZE)
+			return false;
+
+		for (i = 0; i < payload->time_slots; i++)
+			if (get_payload_table_vcpi(payload_table,
+						   payload->vc_start_slot + i) != payload->vcpi)
+				return false;
+	}
+
+	for (i = max(mgr->next_start_slot, mst_state->start_slot);
+	     i < DP_PAYLOAD_TABLE_SIZE;
+	     i++) {
+		if (get_payload_table_vcpi(payload_table, i) != 0)
+			return false;
+	}
+
+	return true;
+}
+
+static void print_mst_payload_state(struct drm_dp_mst_topology_mgr *mgr,
+				    struct drm_dp_mst_topology_state *mst_state,
+				    const u8 *payload_table)
+{
+	struct drm_dp_mst_atomic_payload *payload;
+	int i = 0;
+
+	drm_dbg(mgr->dev,
+		"Payload state: start_slot %d total_avail_slots %d next_start_slot %d payload_count %d\n",
+		mst_state->start_slot, mst_state->total_avail_slots,
+		mgr->next_start_slot, mgr->payload_count);
+
+	list_for_each_entry(payload, &mst_state->payloads, next) {
+		drm_dbg(mgr->dev,
+			"  Payload#%d: port %p VCPI %d delete %d vc_start_slot %d time_slots %d\n",
+			i, payload->port, payload->vcpi,
+			payload->delete, payload->vc_start_slot, payload->time_slots);
+		i++;
+	}
+
+	if (!payload_table)
+		return;
+
+	drm_dbg(mgr->dev, "Payload table:\n");
+	print_hex_dump(KERN_DEBUG, "  Ptbl ",
+		       DUMP_PREFIX_OFFSET, 16, 1,
+		       payload_table, DP_PAYLOAD_TABLE_SIZE, false);
+}
+
+/**
+ * drm_dp_mst_verify_payload_state - Verify the atomic state for payloads and the related sink payload table
+ * @state: atomic state
+ * @mgr: manager to verify the state for
+ * @verify_sink: %true if the sink payload table needs to be verified as well
+ *
+ * Verify @mgr's atomic state tracking all its payloads and optionally the
+ * related sink payload table.
+ */
+void drm_dp_mst_verify_payload_state(struct drm_atomic_state *state,
+				     struct drm_dp_mst_topology_mgr *mgr,
+				     bool verify_sink)
+{
+	struct drm_dp_mst_topology_state *mst_state;
+	u8 payload_table[DP_PAYLOAD_TABLE_SIZE];
+
+	mst_state = drm_atomic_get_new_mst_topology_state(state, mgr);
+	if (drm_WARN_ON(mgr->dev, !mst_state))
+		return;
+
+	if (drm_WARN_ON(mgr->dev, !verify_mst_payload_state(mst_state))) {
+		print_mst_payload_state(mgr, mst_state, NULL);
+		return;
+	}
+
+	if (!verify_sink)
+		return;
+
+	if (!dump_dp_payload_table(mgr, payload_table))
+		return;
+
+	if (!verify_mst_payload_table(mst_state, payload_table)) {
+		drm_err(mgr->dev, "MST payload state mismatches payload table\n");
+		print_mst_payload_state(mgr, mst_state, payload_table);
+	}
+}
+EXPORT_SYMBOL(drm_dp_mst_verify_payload_state);
+
 static void drm_dp_tx_work(struct work_struct *work)
 {
 	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct drm_dp_mst_topology_mgr, tx_work);
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 632376c291db6..bcc5183188a68 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -925,9 +925,12 @@
 #define DP_PAYLOAD_TABLE_UPDATE_STATUS      0x2c0   /* 1.2 MST */
 # define DP_PAYLOAD_TABLE_UPDATED           (1 << 0)
 # define DP_PAYLOAD_ACT_HANDLED             (1 << 1)
+# define DP_PAYLOAD_ID_SLOT0_5_0_MASK	    (0x3f << 2)
 
 #define DP_VC_PAYLOAD_ID_SLOT_1             0x2c1   /* 1.2 MST */
 /* up to ID_SLOT_63 at 0x2ff */
+# define DP_PAYLOAD_ID_SLOT0_6		    (1 << 7)
+# define DP_PAYLOAD_ID_MASK		    0x7f
 
 /* Source Device-specific */
 #define DP_SOURCE_OUI			    0x300
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 32c764fb9cb56..44c6710ebf315 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -848,6 +848,9 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 
 void drm_dp_mst_dump_topology(struct seq_file *m,
 			      struct drm_dp_mst_topology_mgr *mgr);
+void drm_dp_mst_verify_payload_state(struct drm_atomic_state *state,
+				     struct drm_dp_mst_topology_mgr *mgr,
+				     bool verify_sink);
 
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr);
 int __must_check
-- 
2.37.1

