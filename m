Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D038CA17733
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C659610E4CF;
	Tue, 21 Jan 2025 06:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HA4/qqTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091B410E4CA;
 Tue, 21 Jan 2025 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737439542; x=1768975542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8fjnt+3duiW6gV/idOssZRatU3JZrpZdW81shR7YSU=;
 b=HA4/qqTJW8ZmV6MRZIIZ2SOzmkqp6DrxOzwJL3hbW33masCAJgECuG3u
 bwc3ZphGhMvr2sM5ZA2gJ760dSHe7MwTeDgF+jToXfNezP/+FRfmyLiUN
 MGuEmnX6w/JKQhen6IBX1CgC654CJvcJf2+Rbpz2jt3+FZSYKOpEsTYQY
 yipAap69zgeiEhbLBxHtNdk9hm9dq2QiQqUH9mbrxX9XX98Dwc6MZa7l7
 WxlxFhpGTnQKHU85OTsOdc9RaGS05nyxFbQ/1FDDpeMOD5YuuB3nLikMN
 7El5EAYRCiIdslpENRq57lS/GFz1LAjvG+0N4CGWgsJTbnP0BARKojV9c g==;
X-CSE-ConnectionGUID: JBEM7CyoRR+1jTwKHyQ1Sw==
X-CSE-MsgGUID: dep6XDQ3SIWHUj+F1GeZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37947870"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37947870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:05:41 -0800
X-CSE-ConnectionGUID: oxh0TzRISXSYYn19DuwCrg==
X-CSE-MsgGUID: JZmv+FKLSS6dc06zMytliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106509085"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 20 Jan 2025 22:05:38 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/3] drm/dp: Add the DPCD register required for Extended wake
 timeout
Date: Tue, 21 Jan 2025 11:35:20 +0530
Message-Id: <20250121060522.1296166-2-suraj.kandpal@intel.com>
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

Add DPCD registers required to configure Extended Wake Timeout
for LTTPR.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 include/drm/display/drm_dp.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index a6f8b098c56f..480370bba1de 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -696,6 +696,9 @@
 #define DP_UPSTREAM_DEVICE_DP_PWR_NEED	    0x118   /* 1.2 */
 # define DP_PWR_NOT_NEEDED		    (1 << 0)
 
+#define DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT	    0x119   /* 1.4a */
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED	    (1 << 0)
+
 #define DP_FEC_CONFIGURATION		    0x120    /* 1.4 */
 # define DP_FEC_READY			    (1 << 0)
 # define DP_FEC_ERR_COUNT_SEL_MASK	    (7 << 1)
@@ -1168,6 +1171,15 @@
 # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP 1.4 */
 # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP 1.4 */
 
+#define DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST	0x2211  /* 1.4a */
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_MASK		0xff
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS		0x00
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS	0x01
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS	0x02
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_60_MS	0x03
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS	0x04
+# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS	0x05
+
 #define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
 # define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
 # define DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE		GENMASK(1, 0)
@@ -1473,6 +1485,8 @@
 #define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
 #define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
 #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
+# define DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK		0x7f
+# define DP_EXTENDED_WAKE_TIMEOUT_GRANT			(1 << 7)
 #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	    0xf0006 /* 2.0 */
 # define DP_PHY_REPEATER_128B132B_SUPPORTED		    (1 << 0)
 /* See DP_128B132B_SUPPORTED_LINK_RATES for values */
-- 
2.34.1

