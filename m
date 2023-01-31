Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F46830CF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942DD10E381;
	Tue, 31 Jan 2023 15:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70B010E37A;
 Tue, 31 Jan 2023 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177570; x=1706713570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70ncopoHGtYk9Twq8aYixnl0XY6kiVdLrV0O6I9A4KQ=;
 b=dvh1S4URalQnzs2c6/Hz32P7hYjRUiJELf5hOwBRxkLmHBYurwGrxk9R
 YtVn+fRsqykxuUDi2NVSc4MncCS63BFd7xJFVTeWBkTOrd/qkWAbaGNVa
 eGhKwSOpg0tFO4dPtcgoSvDnBG9Hfs8JA3Dan/hAZ7CnqcUFRfqbB1BiF
 SeDTXbuF2eiCOvuExBm80GP0JlmaLvE+CXzECBuVe0QIHHZgL5cQZNN3o
 qnECk1PEz16sVcbrlbp++qrymPLRCosc3dIiNc5hxULUOKfq69qYPQnva
 VmldJx4+0vtXVF4BN92Jtp1qrWSQi4EXDtHrpOX5PuG53bJW6IZBrsQZG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308205590"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308205590"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807155340"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="807155340"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:09 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/17] drm/display/dp_mst: Add helpers to query payload
 allocation properties
Date: Tue, 31 Jan 2023 17:05:43 +0200
Message-Id: <20230131150548.1614458-13-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230131150548.1614458-1-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add helper functions to query the virtual channel and time slots for a
payload and the current payload count and total allocated time slots in
an MST topology. These are needed by a follow-up i915 patch verifying
the SW vs. HW state of the MST topology.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 36 +++++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h       | 21 +++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index f2081f3fad0da..47605f67578ad 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3448,6 +3448,42 @@ bool drm_dp_mst_has_payload_alloc_errors(const struct drm_dp_mst_topology_state
 }
 EXPORT_SYMBOL(drm_dp_mst_has_payload_alloc_errors);
 
+/**
+ * drm_dp_mst_payload_vchannel - Return the DP virtual channel for a payload
+ * @mst_state: The MST atomic state containing @payload
+ * @payload: The payload to get the virtual channel for
+ *
+ * Return the DP virtual channel for @payload. The virtual channel is a
+ * contiguous range of MST Transmission Units on the DP main lanes between
+ * the source DPTX and the first downstream MST hub DPRX. Accordingly the
+ * channel is determined by the payload's position on the payload list
+ * ordered by VC start slot.
+ *
+ * Returns the 0-based virtual channel of @payload if it's in @mst_state with
+ * its time slots being allocated, or -1 otherwise.
+ */
+int drm_dp_mst_payload_vchannel(const struct drm_dp_mst_topology_state *mst_state,
+				const struct drm_dp_mst_atomic_payload *payload)
+{
+	struct drm_dp_mst_atomic_payload *pos;
+	int vc = 0;
+	bool found = false;
+
+	list_for_each_entry(pos, &mst_state->payloads, next) {
+		if (pos->vc_start_slot == -1)
+			continue;
+
+		if (pos == payload)
+			found = true;
+
+		if (pos->vc_start_slot < payload->vc_start_slot)
+			vc++;
+	}
+
+	return found ? vc : -1;
+}
+EXPORT_SYMBOL(drm_dp_mst_payload_vchannel);
+
 static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port,
 				 int offset, int size, u8 *bytes)
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 53b251b264e89..bb7c595096fed 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -846,6 +846,27 @@ void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
 			   const struct drm_dp_mst_atomic_payload *old_payload,
 			   struct drm_dp_mst_atomic_payload *new_payload);
 bool drm_dp_mst_has_payload_alloc_errors(const struct drm_dp_mst_topology_state *mst_state);
+int drm_dp_mst_payload_vchannel(const struct drm_dp_mst_topology_state *mst_state,
+				const struct drm_dp_mst_atomic_payload *payload);
+
+static inline int
+drm_dp_mst_payload_count(const struct drm_dp_mst_topology_state *mst_state)
+{
+	return mst_state->mgr->payload_count;
+}
+
+static inline int
+drm_dp_mst_allocated_time_slots(const struct drm_dp_mst_topology_state *mst_state)
+{
+	return drm_dp_mst_payload_count(mst_state) ?
+		mst_state->mgr->next_start_slot - mst_state->start_slot : 0;
+}
+
+static inline int
+drm_dp_mst_payload_time_slots(const struct drm_dp_mst_atomic_payload *payload)
+{
+	return payload->time_slots;
+}
 
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.37.1

