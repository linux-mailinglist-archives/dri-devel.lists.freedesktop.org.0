Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530CA18B55
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 06:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779D410E668;
	Wed, 22 Jan 2025 05:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YB58XMb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D5810E665;
 Wed, 22 Jan 2025 05:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737524063; x=1769060063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ncjlwy7VBVJ+FcmLV3OEporn/utsUHnVxtK6NwfCQDE=;
 b=YB58XMb+OfyA8oYBjasRKsJBNi6gSn+CV8rZycVhJ12lbRUxnn4SUEpN
 qVui/Y4Zdr2Shr1aVLYpE1J66+HGYv4Exx0rbOuvaXHIccjIt6M4ubBSC
 GfB3uOHh11ca7k0wVNzKLMAezY/69X7e/7qJh3Y2VsTG2EAcf40d/55Xr
 wsLDZjk4wGgAC//rOcOtNUOO7OnDwfv5mriRixHLKTMb3IfCqhwwqI3B/
 kQBsycLQA+tiCmO77egeKNiTMMC4dcVzEdiOpFeNn5/whokauACttbs7+
 9VYxkPADECFrzlBQzzuOZs1k1oy1WUmJqr+fG/E0NDObBBFtnjcxztL81 A==;
X-CSE-ConnectionGUID: hY0fjb+jSo6mT9TZM2ykKQ==
X-CSE-MsgGUID: uShZqnH3QGi6/LLeGmx06w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37662422"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37662422"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 21:34:23 -0800
X-CSE-ConnectionGUID: /nTX3torQGu4sU6PN0JVUA==
X-CSE-MsgGUID: oLeFBPKKTQydwMls9+V5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107920454"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 21 Jan 2025 21:34:21 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/3] drm/dp: Add the DPCD register required for Extended wake
 timeout
Date: Wed, 22 Jan 2025 11:03:56 +0530
Message-Id: <20250122053358.1545039-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122053358.1545039-1-suraj.kandpal@intel.com>
References: <20250122053358.1545039-1-suraj.kandpal@intel.com>
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
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
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

