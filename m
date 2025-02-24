Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C5A42998
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221D810E347;
	Mon, 24 Feb 2025 17:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA6CtECo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAD910E494;
 Mon, 24 Feb 2025 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418024; x=1771954024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ZXPfJZe8QtCvHh4ujOI88p5saReZEldcmBcdzkQQO0=;
 b=TA6CtEColKc9uAoueGK1k8O19Ue0JiS7elZ54Rfd7wn4HoJBYpHNn5Nc
 9OkzzK5Cf7HmqUMx4Zs/mBvkyEVm4thv/h7IDRuMnLmk1BJXcB1rCIl6Y
 USVWnjzYptV/C0PZeHTtLyHky02CnZHU2Wt53pwCkbl9Rin5ZAwV219MP
 6B8PW6OeKJOCT/nJpU0lWz/Y7xMvYcxkvEF8s5UHi++6oMbcVwZ6j6TFp
 yLBb0iFulQUpW3sjmUPfILE560S1jGvAk+z47M01iX8X/eWC/qbMhLCD2
 J5HSY0SeSOdih0076e5WpfZxGDAHWU8Cv/eB1TVIu9182HltqUmMTieDf g==;
X-CSE-ConnectionGUID: PY/tjZrRQDCQX1m5BL0cGQ==
X-CSE-MsgGUID: nzyarF0OQiifGDeEVlnL8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601732"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:04 -0800
X-CSE-ConnectionGUID: H5mATvXnQeK0kr0YczL0/A==
X-CSE-MsgGUID: ZorKkRlqSpa+fXGoJxyhYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374122"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:27:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:26:59 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i915/dp: Have intel_dp_get_adjust_train() tell us if
 anything changed
Date: Mon, 24 Feb 2025 19:26:40 +0200
Message-ID: <20250224172645.15763-5-ville.syrjala@linux.intel.com>
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

In order to implement the POST_LT_ADJ_REQ sequence we need to
know whether the sink actually requested a changed to the
vswing/pre-emph values.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c  | 18 +++++++++++++-----
 .../drm/i915/display/intel_dp_link_training.h  |  2 +-
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index b2fb641e4e96..2506996bf16d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -489,12 +489,13 @@ static u8 intel_dp_get_lane_adjust_train(struct intel_dp *intel_dp,
 	_TRAIN_REQ_TX_FFE_ARGS(link_status, 2), \
 	_TRAIN_REQ_TX_FFE_ARGS(link_status, 3)
 
-void
+bool
 intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 			  const struct intel_crtc_state *crtc_state,
 			  enum drm_dp_phy dp_phy,
 			  const u8 link_status[DP_LINK_STATUS_SIZE])
 {
+	bool changed = false;
 	int lane;
 
 	if (intel_dp_is_uhbr(crtc_state)) {
@@ -513,10 +514,17 @@ intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 		       TRAIN_REQ_PREEMPH_ARGS(link_status));
 	}
 
-	for (lane = 0; lane < 4; lane++)
-		intel_dp->train_set[lane] =
-			intel_dp_get_lane_adjust_train(intel_dp, crtc_state,
-						       dp_phy, link_status, lane);
+	for (lane = 0; lane < 4; lane++) {
+		u8 new = intel_dp_get_lane_adjust_train(intel_dp, crtc_state,
+							dp_phy, link_status, lane);
+		if (intel_dp->train_set[lane] == new)
+			continue;
+
+		intel_dp->train_set[lane] = new;
+		changed = true;
+	}
+
+	return changed;
 }
 
 static int intel_dp_training_pattern_set_reg(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 46614124569f..1ba22ed6db08 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -23,7 +23,7 @@ void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 				   int link_bw, int rate_select, int lane_count,
 				   bool enhanced_framing);
 
-void intel_dp_get_adjust_train(struct intel_dp *intel_dp,
+bool intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state,
 			       enum drm_dp_phy dp_phy,
 			       const u8 link_status[DP_LINK_STATUS_SIZE]);
-- 
2.45.3

