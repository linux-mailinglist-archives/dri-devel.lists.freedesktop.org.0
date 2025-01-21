Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF86A17735
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9825F10E4D4;
	Tue, 21 Jan 2025 06:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPMdZoDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89D310E4CE;
 Tue, 21 Jan 2025 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737439544; x=1768975544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkkDXw5IdmKrWqE1Ye5TXL+Yiue1nqhfT9LyyRK9+XA=;
 b=BPMdZoDWM7D32TlLIJViViGd2rvpZC6n0Ph3+ZT6pU6FtUlwWxbGceSH
 erxpEuwqof8JJ7w9Sx3nAB7ygP5fMnAwiZYdhRBRPxu5MvjcCsa3dqllS
 vSU9Si9cmCPoc2dVpN5VdrKY2AaR8RXpLiYZo5pPrgTN+17S4zPBpqn1H
 NKzAWrbOgSxe3u4oVJQZ4+ZJWSJ/qXkd/MIeUDNnzvGjAv0M35FkpD5zR
 T3reHWpBpvLiJnNvmg/55hbdbg4uiv2ArqOgUSgIMZZBz55WfNMDwxbr3
 oz9xFcS9IUi0vrTweSvFfuRbIlTp4gFNUG0G9ONn5vqUh1gILLmdkgLID w==;
X-CSE-ConnectionGUID: g92p468nR3uD1dUv091r/A==
X-CSE-MsgGUID: PH+BYc+LR0Gs6l/T97Rm4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37947890"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37947890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:05:44 -0800
X-CSE-ConnectionGUID: dxI9bdg1TmiPstSrbOGXDQ==
X-CSE-MsgGUID: Au7nVIwKT162gw/HVduNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106509105"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 20 Jan 2025 22:05:41 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/3] drm/display/dp: Define function to setup Extended wake
 time
Date: Tue, 21 Jan 2025 11:35:21 +0530
Message-Id: <20250121060522.1296166-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121060522.1296166-1-suraj.kandpal@intel.com>
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
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

Extended wake timeout request helps to give additional
time by reading the DPCD register through which sink requests the
minimal amount of time required to wake the sink up.
Source  device shall keep retying the AUX tansaction till the
extended timeout that is being granted for LTTPRs from the
sink device.

Spec: DP v2.1 Section 3.6.12.3
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 47 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa..9eae5ee85b13 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -459,6 +459,53 @@ void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
 
+void drm_dp_lttpr_wake_timeout_setup(struct drm_dp_aux *aux, bool transparent_mode)
+{
+	u8 val = 1;
+	int ret;
+
+	if (transparent_mode) {
+		static const u8 timeout_mapping[] = {
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS] = 1,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS] = 40,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_60_MS] = 60,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS] = 80,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS] = 100,
+		};
+
+		ret = drm_dp_dpcd_readb(aux, DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST, &val);
+		if (ret != 1) {
+			drm_dbg_kms(aux->drm_dev,
+				    "Failed to read Extended sleep wake timeout request\n");
+			return;
+		}
+
+		val = (val < sizeof(timeout_mapping) && timeout_mapping[val]) ?
+			timeout_mapping[val] : 1;
+
+		if (val > 1)
+			drm_dp_dpcd_writeb(aux,
+					   DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
+					   DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
+	} else {
+		ret = drm_dp_dpcd_readb(aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &val);
+		if (ret != 1) {
+			drm_dbg_kms(aux->drm_dev,
+				    "Failed to read Extended sleep wake timeout request\n");
+			return;
+		}
+
+		val = (val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) ?
+			(val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) * 10 : 1;
+
+		if (val > 1)
+			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
+					   DP_EXTENDED_WAKE_TIMEOUT_GRANT);
+	}
+}
+EXPORT_SYMBOL(drm_dp_lttpr_wake_timeout_setup);
+
 u8 drm_dp_link_rate_to_bw_code(int link_rate)
 {
 	switch (link_rate) {
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a56039..89a34dff85a4 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -633,6 +633,7 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
+void drm_dp_lttpr_wake_timeout_setup(struct drm_dp_aux *aux, bool transparent_mode);
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
-- 
2.34.1

