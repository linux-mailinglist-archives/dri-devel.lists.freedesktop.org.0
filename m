Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C4A42992
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9779F10E484;
	Mon, 24 Feb 2025 17:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh8zAafw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D15310E484;
 Mon, 24 Feb 2025 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418017; x=1771954017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Df8lLYHdR7ES7CuOed2xfa2zvmICDkIHqVOVSpzwRTA=;
 b=gh8zAafwP9lX5t7aYOupgIG7VsoT+hcAadzIdB9pM8u86L4voWTg8plO
 aq6SUAFXyoPTFaU62VgRSziN8pOXCvm5fAAoip9kUa/kh18rTvd+yZRfk
 ggqZjhWlrIV2C9BCHHwyzOp4bml/5BJ7iIWacK6Rhh7KftWxcHoZSGwb3
 rmfmi68qRJv7N8yU8+javOu22v4l9bQ93W8OJdFI18QxxnTM1fvOJSuuU
 h4mumuoBGiGznctqI7fNO+R0sFZ94rVMLVoKN6WtRBVn6SvPrK2qDQc/4
 HVXMi3tfLtAdMfvPYRUOZVhT5XA2xY4saymoq4UH6qfgZPfIEQZkfScz+ g==;
X-CSE-ConnectionGUID: ycdR5nzIRV2UiPkocJ6peA==
X-CSE-MsgGUID: oOeEro+MQnaNJEm/PcsFGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601720"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:26:57 -0800
X-CSE-ConnectionGUID: 4pWQi1M0TQ2Vzr086dEM8A==
X-CSE-MsgGUID: mpXXMvHrT1SrFFYrW2hG2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374105"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:26:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:26:52 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/dp: Add POST_LT_ADJ_REQ helpers
Date: Mon, 24 Feb 2025 19:26:38 +0200
Message-ID: <20250224172645.15763-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++++
 include/drm/display/drm_dp_helper.h     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f5c596234729..252f022f0837 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -122,6 +122,14 @@ bool drm_dp_clock_recovery_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
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
index 89a34dff85a4..bec97d29bfa2 100644
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
2.45.3

