Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FBDA429A6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18910E4AE;
	Mon, 24 Feb 2025 17:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S25UuhU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6945410E498;
 Mon, 24 Feb 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418041; x=1771954041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2HF//5vlOKnqTw3amAWY5VdbAzdNNEL5Z3GrC8zDGzg=;
 b=S25UuhU1v5bZyx97qiqXp65f8QX/88Y5UdSgmIo7VrLLWo2GNlGlZvNd
 rcCd7OhLWLtPvvmupnrggI9M2R2/zLsCY1IpDThK/sQkXzTrXCV+Ei8CN
 LI+cCT7W3h27+2XFXvTSTqNqzrHGTNV2jX+6So/06RgMRl5X+Bpe9qlNO
 iOS0Q72DZM7uTvyG85Qf09l5vcuqvWrhPW32Oaa6qT6dBDTzGiVZAqeVe
 hBo3TVk5EMPH1XaNgMA7JKuFCXRXUqZtFoFLFKdZ0kXERUMqxU/Sj7Xu3
 69/qep0gcUN4aeBzOYt3vbkaWhCuAy9jnZ9CBlJKtH44zthJVfK4k1hej Q==;
X-CSE-ConnectionGUID: UkLtB+2cT02rs7LJd3clKQ==
X-CSE-MsgGUID: RAof1UHZQ8aNEt41wL6XAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601786"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:21 -0800
X-CSE-ConnectionGUID: RIaEw/OFTBSqUVvwzrfQMQ==
X-CSE-MsgGUID: xXMRrctWTXaG5Ed9tyfOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374206"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:27:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:27:17 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] hax: drm/i915: Disable TPS4 support to force
 POST_LT_ADJ_REQ usage
Date: Mon, 24 Feb 2025 19:26:45 +0200
Message-ID: <20250224172645.15763-10-ville.syrjala@linux.intel.com>
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

Disable TPS4 in favor of POST_LT_ADJ_REQ for testing purposes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 3bd15054effe..7ccfa202dbc0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -792,6 +792,13 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 	source_tps4 = intel_dp_source_supports_tps4(display);
 	sink_tps4 = dp_phy != DP_PHY_DPRX ||
 		    drm_dp_tps4_supported(intel_dp->dpcd);
+
+	/* hax */
+	if (dp_phy == DP_PHY_DPRX &&
+	    drm_dp_post_lt_adj_req_supported(intel_dp->dpcd) &&
+	    crtc_state->port_clock != 810000)
+		sink_tps4 = false;
+
 	if (source_tps4 && sink_tps4) {
 		return DP_TRAINING_PATTERN_4;
 	} else if (crtc_state->port_clock == 810000) {
-- 
2.45.3

