Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66E5AA7A5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E380A10E757;
	Fri,  2 Sep 2022 06:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4A10E74C;
 Fri,  2 Sep 2022 06:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662098667; x=1693634667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1K8GWFW02ywn8iV44dtnLnnsEAJZYB49wD77HNHnNI=;
 b=X9xXhpZBIaocw2jqPIFphPKOfC0hmQr7tlWPZT7JVkcBV2yReAmoFCBg
 icnmbWBWwxI9p27NptUPIUzHSByX9FVqMr8PD3ewY5I99KEmTLg+ZWyTL
 BLRHpnKyb0DK99/myn4+/Nx/LI3bZRJjw69wO5pspJkNLIaIygDYl1K6p
 wqjchcD7YHEJq/hGS9mlPtx6RYU9uE/M/hmCUx71H7tjc3vQjzFnbmYpN
 uLAmJOmQK5H1wp5L4zgVaB8PFumilRjWvPfkASEbEfbNhFz8E/gzPaBkL
 9202Vi+JUmJ8kWDhi3EBcVdqWWHqWF/l5OQ7S4L2wVWY9/RKVb34cMlQL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359861290"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="359861290"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="755144611"
Received: from invictus.jf.intel.com ([10.165.21.188])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:25 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 09/11] drm/i915/mtl: Update MBUS_DBOX credits
Date: Thu,  1 Sep 2022 23:03:40 -0700
Message-Id: <20220902060342.151824-10-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
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

Display version 14 platforms have different credits values
compared to ADL-P. Update the credits based on pipe usage.

v2: Simplify DBOX BW Credit definition(MattR)

Bspec: 49213

Cc: Jose Roberto de Souza <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Original Author: Caz Yokoyama
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h |  4 +++
 drivers/gpu/drm/i915/intel_pm.c | 47 ++++++++++++++++++++++++++++++---
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d22fabe35a0c..f9237586ab4f 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1125,8 +1125,12 @@
 #define MBUS_DBOX_REGULATE_B2B_TRANSACTIONS_EN	REG_BIT(16) /* tgl+ */
 #define MBUS_DBOX_BW_CREDIT_MASK		REG_GENMASK(15, 14)
 #define MBUS_DBOX_BW_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, x)
+#define MBUS_DBOX_BW_4CREDITS_MTL		REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, 0x2)
+#define MBUS_DBOX_BW_8CREDITS_MTL		REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, 0x3)
 #define MBUS_DBOX_B_CREDIT_MASK			REG_GENMASK(12, 8)
 #define MBUS_DBOX_B_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_B_CREDIT_MASK, x)
+#define MBUS_DBOX_I_CREDIT_MASK			REG_GENMASK(7, 5)
+#define MBUS_DBOX_I_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_I_CREDIT_MASK, x)
 #define MBUS_DBOX_A_CREDIT_MASK			REG_GENMASK(3, 0)
 #define MBUS_DBOX_A_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_A_CREDIT_MASK, x)
 
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index ebce6171ccef..b19a1ecb010e 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -8448,6 +8448,27 @@ void intel_dbuf_post_plane_update(struct intel_atomic_state *state)
 				new_dbuf_state->enabled_slices);
 }
 
+static bool xelpdp_is_one_pipe_per_dbuf_bank(enum pipe pipe, u8 active_pipes)
+{
+	switch (pipe) {
+	case PIPE_A:
+	case PIPE_D:
+		if (is_power_of_2(active_pipes & (BIT(PIPE_A) | BIT(PIPE_D))))
+			return true;
+		break;
+	case PIPE_B:
+	case PIPE_C:
+		if (is_power_of_2(active_pipes & (BIT(PIPE_B) | BIT(PIPE_C))))
+			return true;
+		break;
+	default: /* to suppress compiler warning */
+		MISSING_CASE(pipe);
+		break;
+	}
+
+	return false;
+}
+
 void intel_mbus_dbox_update(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
@@ -8467,20 +8488,28 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
 	     new_dbuf_state->active_pipes == old_dbuf_state->active_pipes))
 		return;
 
+	if (DISPLAY_VER(i915) >= 14)
+		val |= MBUS_DBOX_I_CREDIT(2);
+
 	if (DISPLAY_VER(i915) >= 12) {
 		val |= MBUS_DBOX_B2B_TRANSACTIONS_MAX(16);
 		val |= MBUS_DBOX_B2B_TRANSACTIONS_DELAY(1);
 		val |= MBUS_DBOX_REGULATE_B2B_TRANSACTIONS_EN;
 	}
 
-	/* Wa_22010947358:adl-p */
-	if (IS_ALDERLAKE_P(i915))
+	if (DISPLAY_VER(i915) >= 14)
+		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(12) :
+						     MBUS_DBOX_A_CREDIT(8);
+	else if (IS_ALDERLAKE_P(i915))
+		/* Wa_22010947358:adl-p */
 		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(6) :
 						     MBUS_DBOX_A_CREDIT(4);
 	else
 		val |= MBUS_DBOX_A_CREDIT(2);
 
-	if (IS_ALDERLAKE_P(i915)) {
+	if (DISPLAY_VER(i915) >= 14) {
+		val |= MBUS_DBOX_B_CREDIT(0xA);
+	} else if (IS_ALDERLAKE_P(i915)) {
 		val |= MBUS_DBOX_BW_CREDIT(2);
 		val |= MBUS_DBOX_B_CREDIT(8);
 	} else if (DISPLAY_VER(i915) >= 12) {
@@ -8492,10 +8521,20 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
 	}
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		u32 pipe_val = val;
+
 		if (!new_crtc_state->hw.active ||
 		    !intel_crtc_needs_modeset(new_crtc_state))
 			continue;
 
-		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), val);
+		if (DISPLAY_VER(i915) >= 14) {
+			if (xelpdp_is_one_pipe_per_dbuf_bank(crtc->pipe,
+							     new_dbuf_state->active_pipes))
+				pipe_val |= MBUS_DBOX_BW_8CREDITS_MTL;
+			else
+				pipe_val |= MBUS_DBOX_BW_4CREDITS_MTL;
+		}
+
+		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), pipe_val);
 	}
 }
-- 
2.34.1

