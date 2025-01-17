Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD4A14940
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1619A10EA57;
	Fri, 17 Jan 2025 05:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+M9+NCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD9E10EA56;
 Fri, 17 Jan 2025 05:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737092994; x=1768628994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8fjnt+3duiW6gV/idOssZRatU3JZrpZdW81shR7YSU=;
 b=J+M9+NCUdJVMkXkUvwLyh730Nv06ZmGUj/kPsuJQpECWwB7oa/39nnb+
 G9vnFQNa0c0W++SN7ZPAMv2Bv9Kq+YMly8FMMzjVeng4/Is7f77n6cHaC
 LcTwk2wov9V/SV3DA4w3ILzLZyTNJ4TktcLVE89cAI6Y/RWtIYHw2cGX6
 c95sZORrbQWWA8DbJEyZh0jCklui7B47l7TADCDY+jhhE++Z3Ev3ztP5/
 7mAwnus0tI8HH1QQ4KVgv3ijLicfUGFVeqFWtoTOGg5DTwZeONeuVNak9
 7I0k1t2H1k7avEqfuKG+UIksFvTMyGbzN4/knsIEksYzHgEsPB46aEHHZ w==;
X-CSE-ConnectionGUID: eF/baLdbSHi9kWLodiPvCA==
X-CSE-MsgGUID: 1zkZmZrrRTKoe9p7jrCsfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48910436"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="48910436"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 21:49:54 -0800
X-CSE-ConnectionGUID: ORe/fi+RQKSTt2sSdHSaYg==
X-CSE-MsgGUID: q6UNUrXZTNa+R1sRSFDuEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="136560355"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2025 21:49:52 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/dp: Add the DPCD register required for Extended wake
 timeout
Date: Fri, 17 Jan 2025 11:18:49 +0530
Message-Id: <20250117054850.1189650-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117054850.1189650-1-suraj.kandpal@intel.com>
References: <20250117054850.1189650-1-suraj.kandpal@intel.com>
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

