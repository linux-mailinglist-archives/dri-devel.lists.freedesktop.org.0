Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D596A7C73
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B87B10E3E9;
	Thu,  2 Mar 2023 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9E510E3E3;
 Thu,  2 Mar 2023 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677745258; x=1709281258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tzw/h8feKEG69Dql62f2HqSjZs3B07o57rYeIIF7tp4=;
 b=MUl5skQW6Fbm5tbC62YugpmM/NC0TSNQxdpB3jYfuInIPxRTZXQVHHOZ
 nCNEhxx/4lXyErfupJ3PpFtkiK/AR9b027yOhmiw1r3smPS7fbB+KDpfy
 Gm6KMqQNoRFRv5+UPq1NtZ0YYuFjxxoJM/afVd+n1yay1Tph2MW1oI1eJ
 LDX96pjO7r/fDsR2tMSZ7o3KnNfLUhPXVEso3tBe8gw3aFnqnUNRjP/0P
 2Ztn6/l9Bod653+aqd6VEx2rHCmR3s4fvI7rL5Wz5iX820FoBlStd7rrN
 hUHifUhHS7YttoTGFx3FGC0jbhziboTkr/QtlA3pVKD1tZXLDQWsHE4iP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318455022"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="318455022"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 00:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743757591"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="743757591"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2023 00:20:56 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv4 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Date: Thu,  2 Mar 2023 13:45:32 +0530
Message-Id: <20230302081532.765821-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302081532.765821-1-arun.r.murthy@intel.com>
References: <20230302081532.765821-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable SDP error detection configuration, this will set CRC16 in
128b/132b link layer.
For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
added to enable/disable SDP CRC applicable for DP2.0 only, but the
default value of this bit will enable CRC16 in 128b/132b hence
skipping this write.
Corrective actions on SDP corruption is yet to be defined.

v2: Moved the CRC enable to link training init(Jani N)
v3: Moved crc enable to ddi pre enable <Jani N>
v4: Separate function for SDP CRC16 (Jani N)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  4 ++++
 .../drm/i915/display/intel_dp_link_training.c | 20 +++++++++++++++++++
 .../drm/i915/display/intel_dp_link_training.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e5979427b38b..127b3035f92d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2519,6 +2519,10 @@ static void intel_ddi_pre_enable_dp(struct intel_atomic_state *state,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 
+	if (HAS_DP20(dev_priv))
+		intel_dp_128b132b_sdp_crc16(enc_to_intel_dp(encoder),
+					    crtc_state);
+
 	if (DISPLAY_VER(dev_priv) >= 12)
 		tgl_ddi_pre_enable_dp(state, encoder, crtc_state, conn_state);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 3d3efcf02011..35d31e4efab9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1454,3 +1454,23 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
 	if (!passed)
 		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
 }
+
+void intel_dp_128b132b_sdp_crc16(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	/*
+	 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
+	 * disable SDP CRC. This is applicable for Display version 13.
+	 * Default value of bit 31 is '0' hence discarding the write
+	 * TODO: Corrective actions on SDP corruption yet to be defined
+	 */
+	if (intel_dp_is_uhbr(crtc_state))
+		/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
+		drm_dp_dpcd_writeb(&intel_dp->aux,
+				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
+				   DP_SDP_CRC16_128B132B_EN);
+
+	drm_dbg_kms(&i915->drm, "DP2.0 SDP CRC16 for 128b/132b enabled\n");
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 7fa1c0833096..2c8f2775891b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -39,4 +39,6 @@ static inline u8 intel_dp_training_pattern_symbol(u8 pattern)
 	return pattern & ~DP_LINK_SCRAMBLING_DISABLE;
 }
 
+void intel_dp_128b132b_sdp_crc16(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state);
 #endif /* __INTEL_DP_LINK_TRAINING_H__ */
-- 
2.25.1

