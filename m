Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8DAB0A3C7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00EF10E98F;
	Fri, 18 Jul 2025 12:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMpNtu5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC9C10E98D;
 Fri, 18 Jul 2025 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752840125; x=1784376125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q4Fn307+wHhM7kkWrmZh9Obvryb4opgVHxeGqciWwdI=;
 b=kMpNtu5GwXh9Arjotlh2X67eTVY5aaerRDARvoSB1Pvt1hhNj0cAB/vx
 LHaRQif4nTHlal5dlDGsUqs7mcFRSqxjs/Vv0l7U1FFBHcSgq3OKnc45y
 vDnKp7N1m83fVdGM+zEz8JkLPqXYOiIZryPyhWpyM4/Y/g9b8YNbQcoLT
 BiWBcJ9+OSK+JOZryCXofb2sTZt+bpReiKrhT4N9TI2Ma6qJY/LTF5pS+
 igkb1zDu2UPeuFv/gbUDEnovfef778YCE40SOMf2bm1e1o4q10pn10GDK
 tHRQu0Llx52yC8DVZHvqjMKrWNKAM5g8UaZEq9T4KDypnTxTI99oKA2sz g==;
X-CSE-ConnectionGUID: I2DPzN6cRwe+p2MRPUVkMg==
X-CSE-MsgGUID: nfuEzZZFRWm6R9RCfyj5aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54345510"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54345510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:02:04 -0700
X-CSE-ConnectionGUID: Dn5CeDMHRpOPiQPgXGXGmw==
X-CSE-MsgGUID: 1m0AllnSTxWpRDh9qS9NJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="163674656"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.63])
 by orviesa005.jf.intel.com with SMTP; 18 Jul 2025 05:02:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 15:02:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 2/4] drm/dp: Add POST_LT_ADJ_REQ helpers
Date: Fri, 18 Jul 2025 15:01:52 +0300
Message-ID: <20250718120154.15492-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
References: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add small helpers (drm_dp_post_lt_adj_req_supported() and
drm_dp_post_lt_adj_req_in_progress()) to help with implementing
the POST_LT_ADJ_REQ sequence.

Tested-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++++
 include/drm/display/drm_dp_helper.h     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e316..440ff2d0b28c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -123,6 +123,14 @@ bool drm_dp_clock_recovery_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_clock_recovery_ok);
 
+bool drm_dp_post_lt_adj_req_in_progress(const u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	u8 lane_align = dp_link_status(link_status, DP_LANE_ALIGN_STATUS_UPDATED);
+
+	return lane_align & DP_POST_LT_ADJ_REQ_IN_PROGRESS;
+}
+EXPORT_SYMBOL(drm_dp_post_lt_adj_req_in_progress);
+
 u8 drm_dp_get_adjust_request_voltage(const u8 link_status[DP_LINK_STATUS_SIZE],
 				     int lane)
 {
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 87caa4f1fdb8..52ce28097015 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -37,6 +37,7 @@ bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
 bool drm_dp_clock_recovery_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			      int lane_count);
+bool drm_dp_post_lt_adj_req_in_progress(const u8 link_status[DP_LINK_STATUS_SIZE]);
 u8 drm_dp_get_adjust_request_voltage(const u8 link_status[DP_LINK_STATUS_SIZE],
 				     int lane);
 u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SIZE],
@@ -155,6 +156,13 @@ drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
 }
 
+static inline bool
+drm_dp_post_lt_adj_req_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return dpcd[DP_DPCD_REV] >= 0x13 &&
+		(dpcd[DP_MAX_LANE_COUNT] & DP_POST_LT_ADJ_REQ_SUPPORTED);
+}
+
 static inline bool
 drm_dp_fast_training_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-- 
2.49.0

