Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F635B0A3CC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752610E996;
	Fri, 18 Jul 2025 12:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZo5dZOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24C710E995;
 Fri, 18 Jul 2025 12:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752840132; x=1784376132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LtkqC1wnic414PTb1cQdABZQykLiO+vZHjbpjx3v0zs=;
 b=YZo5dZOHi7wrwSn+DxHi8hnXmrgab61i1heeN/kZ7LFZT0gWnBBd0v69
 CkvX9QQDnV2VLnUJgWmYezmm32YrsWP6fxkxI5ravrfDGkpxKiEmcylR9
 EdSXQQYwxQirxHr+/AuE6NAPt0ux84U5LtO1K7fJiLJ4/oJCYmaakYDAa
 TUK6FAQtCsl0EbiZDJwY9q3S74rNo6WrOCkaNfnica+YlhaSQwA5NMRRe
 xKYgpyyZctUpT6gxRXPwQRyPEQkCwWe/ddEM8K+5fe2AjjqHrgda00mqk
 a8zbtA9NW7R16IzRW1tot+UE41vV4wR8/xdjXy8PrmjGZumfgvMy9aA4/ g==;
X-CSE-ConnectionGUID: Ki8DWCsuSp+DuGlQrZiezg==
X-CSE-MsgGUID: w0N3MWTARUeudp1KDgcX7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54345525"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54345525"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:02:11 -0700
X-CSE-ConnectionGUID: LjOdX4jeRs6iG+Ma2EiW/Q==
X-CSE-MsgGUID: cxvDj2RnThq1EINGPw3ufQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="163674692"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.63])
 by orviesa005.jf.intel.com with SMTP; 18 Jul 2025 05:02:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 15:02:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/4] hax: drm/i915: Disable TPS4 support to force
 POST_LT_ADJ_REQ usage
Date: Fri, 18 Jul 2025 15:01:54 +0300
Message-ID: <20250718120154.15492-5-ville.syrjala@linux.intel.com>
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

Disable TPS4 in favor of POST_LT_ADJ_REQ for testing purposes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 1a9e28f1ca76..d79c5a11b3fe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -794,6 +794,13 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
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
2.49.0

