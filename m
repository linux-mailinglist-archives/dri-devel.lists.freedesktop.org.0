Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BC59FFB4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F98BBF57;
	Wed, 24 Aug 2022 16:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2A091AD1;
 Mon, 15 Aug 2022 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660553925; x=1692089925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+QXcJIOXR1vrrsHnPhx+seBgBDzNwvg86mSKHqQu/lE=;
 b=FEYoDqpdYXC1YQQf4vsTwm5iZWBTO9v9nUgtP6ftu4T6xzSMOBfWrDPg
 E+CthL+K6ksl/mWAo2APcnJLUhQu5BXZ1iifxM1FyfHZaBP8sLHQfyfm2
 Cp6RnxDK/7zCG6SDHwDk3xB+3t1oSoSuDABJqQ9hh0IsH2P04EC7s9DaF
 rWzAGcKxlVrTtOzVJ6XffA60bV12BfQfhWh1SXqRCQBe5W/p42ECRmBRg
 m2QlTUOxVxNItBXr3rBTXL0BNLHPiwpd2iGmRaVJk2wQKdLMmcSIgRmHd
 CSoDAQmuRL7TqYP0DJ2z+ahVSDBhfx5ym96Ocz90Uh9p3fAZr0eq/hlf/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="353663519"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="353663519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:58:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="635408161"
Received: from abelova-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.50.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:58:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/dp: add drm_dp_phy_name() for getting DP PHY name
Date: Mon, 15 Aug 2022 11:58:34 +0300
Message-Id: <b08dc12a7e621a48ec35546d6cd1ed4b1434810d.1660553850.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1660553850.git.jani.nikula@intel.com>
References: <cover.1660553850.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper for getting the DP PHY name. In the interest of caller
simplicity and to avoid allocations and passing in of buffers, duplicate
the const strings to return. It's a minor penalty to pay for simplicity
in all the call sites.

v2: Rebase, add kernel-doc, ensure non-NULL always

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 32 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 32b295003f49..92990a3d577a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -390,6 +390,38 @@ void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
 
+/**
+ * drm_dp_phy_name() - Get the name of the given DP PHY
+ * @dp_phy: The DP PHY identifier
+ *
+ * Given the @dp_phy, get a user friendly name of the DP PHY, either "DPRX" or
+ * "LTTPR <N>", or "<INVALID DP PHY>" on errors. The returned string is always
+ * non-NULL and valid.
+ *
+ * Returns: Name of the DP PHY.
+ */
+const char *drm_dp_phy_name(enum drm_dp_phy dp_phy)
+{
+	static const char * const phy_names[] = {
+		[DP_PHY_DPRX] = "DPRX",
+		[DP_PHY_LTTPR1] = "LTTPR 1",
+		[DP_PHY_LTTPR2] = "LTTPR 2",
+		[DP_PHY_LTTPR3] = "LTTPR 3",
+		[DP_PHY_LTTPR4] = "LTTPR 4",
+		[DP_PHY_LTTPR5] = "LTTPR 5",
+		[DP_PHY_LTTPR6] = "LTTPR 6",
+		[DP_PHY_LTTPR7] = "LTTPR 7",
+		[DP_PHY_LTTPR8] = "LTTPR 8",
+	};
+
+	if (dp_phy < 0 || dp_phy >= ARRAY_SIZE(phy_names) ||
+	    WARN_ON(!phy_names[dp_phy]))
+		return "<INVALID DP PHY>";
+
+	return phy_names[dp_phy];
+}
+EXPORT_SYMBOL(drm_dp_phy_name);
+
 void drm_dp_lttpr_link_train_clock_recovery_delay(void)
 {
 	usleep_range(100, 200);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index db0fe9f8a612..ab55453f2d2c 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -69,6 +69,8 @@ bool drm_dp_128b132b_link_training_failed(const u8 link_status[DP_LINK_STATUS_SI
 u8 drm_dp_link_rate_to_bw_code(int link_rate);
 int drm_dp_bw_code_to_link_rate(u8 link_bw);
 
+const char *drm_dp_phy_name(enum drm_dp_phy dp_phy);
+
 /**
  * struct drm_dp_vsc_sdp - drm DP VSC SDP
  *
-- 
2.34.1

