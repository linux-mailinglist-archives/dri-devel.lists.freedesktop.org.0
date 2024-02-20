Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4F85C80E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62110E563;
	Tue, 20 Feb 2024 21:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwFZ/3R/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD6D10E539;
 Tue, 20 Feb 2024 21:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463914; x=1739999914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wXysqF9K+f29gK3Q/gpoEbBmSfS8NQGjfmB5n8EGY9s=;
 b=KwFZ/3R/BVQtgAfYjCTfuVky60OhvdT9ny3CP/pbguZebo7YTHCx7OZ0
 yLwQA+90SZTMQIKQfEKnS0ymq/UsZqTrHMyn7y2m+Bz+VzrNmO+D3cRjb
 s4iA6whGfyBS8aTiXbTACKp0g2DEMZVjr74uL0qNsl3C6MGjVRVKH9kor
 uQmYwKPcYBlvWwC5w41SZmUaCb1IiZCzDvPFIwrsuq8WqVudHADhLhzf5
 hVf/k6SHlt0xgMD7vUjnE/XE/biyYOi/oa3kA9fRtdX2aqBrkqJx4+H2C
 DnWme13XTn0UfGM+DQH/+ST3FabvZowIuPvCfHznKTudjDTt2qhV7PgG3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738660"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738660"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061598"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:32 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 08/21] drm/i915/dp: Factor out intel_dp_update_sink_caps()
Date: Tue, 20 Feb 2024 23:18:28 +0200
Message-Id: <20240220211841.448846-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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

Factor out a function updating the sink's link rate and lane count
capabilities, used by a follow-up patch enabling the DP tunnel BW
allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 11 ++++++++---
 drivers/gpu/drm/i915/display/intel_dp.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 20e04cbdffcae..520c04245c2df 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3944,6 +3944,13 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
 					  &intel_dp->desc);
 }
 
+void intel_dp_update_sink_caps(struct intel_dp *intel_dp)
+{
+	intel_dp_set_sink_rates(intel_dp);
+	intel_dp_set_max_sink_lane_count(intel_dp);
+	intel_dp_set_common_rates(intel_dp);
+}
+
 static bool
 intel_dp_get_dpcd(struct intel_dp *intel_dp)
 {
@@ -3960,9 +3967,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
 				 drm_dp_is_branch(intel_dp->dpcd));
 
-		intel_dp_set_sink_rates(intel_dp);
-		intel_dp_set_max_sink_lane_count(intel_dp);
-		intel_dp_set_common_rates(intel_dp);
+		intel_dp_update_sink_caps(intel_dp);
 	}
 
 	if (intel_dp_has_sink_count(intel_dp)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index ee0600b4425e1..10e859b62bbe9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -104,6 +104,7 @@ int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
 int intel_dp_max_common_rate(struct intel_dp *intel_dp);
 int intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
+void intel_dp_update_sink_caps(struct intel_dp *intel_dp);
 
 void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
 			   u8 *link_bw, u8 *rate_select);
-- 
2.39.2

