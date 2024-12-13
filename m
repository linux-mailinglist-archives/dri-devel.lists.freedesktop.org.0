Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3895A9F0488
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 07:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3A10EEFF;
	Fri, 13 Dec 2024 06:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atMf/NvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5676B10E18B;
 Fri, 13 Dec 2024 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734069808; x=1765605808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8fjnt+3duiW6gV/idOssZRatU3JZrpZdW81shR7YSU=;
 b=atMf/NvSUyX3GslVLz9JTh+wm9pLqIWIvHzlfnjMzXSl1xpr5I6bVejT
 0pJUH3s5k37pWny51sWEE9P5QeujKnrhGetgGXdP4v63coV3x1y7DmcuT
 SJAo1Zn9nCH8eaio+Ek8uEGysD9qMsq71iO/xncvij4t3i2W8l8g0bQOc
 MoY/+lhN8mvoBysGWD+bfMndPG4/Y/vc9i6LtoaNdYM282EtxoOE3Dd8M
 BBVFOY+JYeXkGH4UqJfZlLnWuVCgG1H3eoorLjCJhz8jCrgsZ4BP555lf
 KImpNn8s1BGwVfED2x7uNSUUkZ/RvelhqTRDPy4DITO1QeNT1zAoHC3oL w==;
X-CSE-ConnectionGUID: fmN26HFtS56MLhPxCXEJKA==
X-CSE-MsgGUID: 4DhQ7vuVTza+FO6zeQFRvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34646450"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34646450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:03:27 -0800
X-CSE-ConnectionGUID: PXIIOJQjRGaI1tlkvQa51Q==
X-CSE-MsgGUID: LAz5kJ+PTg+e+OsycEExbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96883954"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 22:03:25 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/dp: Add the DPCD register required for Extended wake
 timeout
Date: Fri, 13 Dec 2024 11:33:16 +0530
Message-Id: <20241213060317.2674290-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213060317.2674290-1-suraj.kandpal@intel.com>
References: <20241213060317.2674290-1-suraj.kandpal@intel.com>
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

