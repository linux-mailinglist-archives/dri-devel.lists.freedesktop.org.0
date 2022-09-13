Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAB5B79A0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 20:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD610E0C3;
	Tue, 13 Sep 2022 18:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9710E0C6;
 Tue, 13 Sep 2022 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663094058; x=1694630058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g8ZpNjJt0Ue6qKGDjnfa93Ws3SjIwqrX10ilygY/b00=;
 b=Rs8++r5N22/Lt2NRa1IyhZK9pdC6FRBdQ8/gNSKKhg814yWoYAmMfmO0
 UR6q7RbiNFTEfWlWrJq7rDwh2MasVcFLBOwCxFXj0wv+0vBSfgu1O7e4M
 FhUfFymowVVGH3IU1zITzF1Pz3miorzoRKfWSuJFbl7dr/f7YxXHdXWfC
 v//XJe2DiPdtP/V92u8bDTVo4gLEVl1F+I4EPN30kpnp+h78khQuY4nIq
 tZG3tZydNEhwoGx6lOcZcNygzFifSScniASnAkYZkk/fdRrc+Vt2nQ8zD
 kDXD35G7xlYizclrj05n1QOG0aSxhPSyeH6Mx9RO1bsKUehz5oY3YkxJG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="281235524"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="281235524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="647045105"
Received: from invictus.jf.intel.com ([10.165.21.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 4/5] drm/i915/mtl: Update MBUS_DBOX credits
Date: Tue, 13 Sep 2022 11:33:40 -0700
Message-Id: <20220913183341.908028-5-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
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
v3:
 - Simplify only pipe per dbuf bank check(MattR)
 - Skip modeset check to ahndle the case when a new pipe within
   dbuf bank gets added/removed.(MattR)

Bspec: 49213

Cc: Jose Roberto de Souza <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Original Author: Caz Yokoyama
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 48 +++++++++++++++++---
 drivers/gpu/drm/i915/i915_reg.h              |  4 ++
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 617a1f2d01ea..01b0932757ed 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3412,6 +3412,25 @@ void intel_dbuf_post_plane_update(struct intel_atomic_state *state)
 				new_dbuf_state->enabled_slices);
 }
 
+static bool xelpdp_is_only_pipe_per_dbuf_bank(enum pipe pipe, u8 active_pipes)
+{
+	switch (pipe) {
+	case PIPE_A:
+		return !(active_pipes & BIT(PIPE_D));
+	case PIPE_D:
+		return !(active_pipes & BIT(PIPE_A));
+	case PIPE_B:
+		return !(active_pipes & BIT(PIPE_C));
+	case PIPE_C:
+		return !(active_pipes & BIT(PIPE_B));
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
@@ -3431,20 +3450,28 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
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
@@ -3456,11 +3483,20 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
 	}
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
-		if (!new_crtc_state->hw.active ||
-		    !intel_crtc_needs_modeset(new_crtc_state))
+		u32 pipe_val = val;
+
+		if (!new_crtc_state->hw.active)
 			continue;
 
-		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), val);
+		if (DISPLAY_VER(i915) >= 14) {
+			if (xelpdp_is_only_pipe_per_dbuf_bank(crtc->pipe,
+							      new_dbuf_state->active_pipes))
+				pipe_val |= MBUS_DBOX_BW_8CREDITS_MTL;
+			else
+				pipe_val |= MBUS_DBOX_BW_4CREDITS_MTL;
+		}
+
+		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), pipe_val);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0ab5fe70b482..fc57f304c16e 100644
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
 
-- 
2.34.1

