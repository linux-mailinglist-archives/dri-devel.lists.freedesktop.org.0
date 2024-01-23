Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1496838BFA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75F10F241;
	Tue, 23 Jan 2024 10:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC3C10EDBB;
 Tue, 23 Jan 2024 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005726; x=1737541726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r1SGjFbZ50BXnnoWbXE6ojq+34GJ7lTl9UhjNtzoJ68=;
 b=DHs9R85NE1yoCWHkUyvNBGNfNn4778G9zbKeQNtWdHa0F+MtT4yjG7SD
 nPejAL16YEWOyJBVbA7xpPHpy5KZS9o1f6UboxG354+ToluJ4T4cccy5k
 H5K0r3cNXEfPh+IfraaV6nDwK8lanlHzLnVv5+1PR7sTL1HsNPUaLvNRb
 fckFKVDqAcgb41oK6+0o1YGCyYgxAXEOw38debQasdsHN5NEop0TKT0jQ
 zu3kYGjE+UcaqkJ2b/4vSbnCAl5Rsa2CZiziMUobpET3kFZP8Nxh+UK4D
 samV1/wBBAR1GcQpuiZUIlzJVYFYq0O3E+oJt9TKlvvtr5OIF97HEsK9N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134152"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134152"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283387"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283387"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:45 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/19] drm/i915/dp: Factor out intel_dp_update_sink_caps()
Date: Tue, 23 Jan 2024 12:28:38 +0200
Message-Id: <20240123102850.390126-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out a function updating the sink's link rate and lane count
capabilities, used by a follow-up patch enabling the DP tunnel BW
allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 11 ++++++++---
 drivers/gpu/drm/i915/display/intel_dp.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f40706c5d1aad..23434d0aba188 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3949,6 +3949,13 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
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
@@ -3965,9 +3972,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
 				 drm_dp_is_branch(intel_dp->dpcd));
 
-		intel_dp_set_sink_rates(intel_dp);
-		intel_dp_set_max_sink_lane_count(intel_dp);
-		intel_dp_set_common_rates(intel_dp);
+		intel_dp_update_sink_caps(intel_dp);
 	}
 
 	if (intel_dp_has_sink_count(intel_dp)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index a7906d8738c4a..49553e43add22 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -106,6 +106,7 @@ int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
 int intel_dp_max_common_rate(struct intel_dp *intel_dp);
 int intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
+void intel_dp_update_sink_caps(struct intel_dp *intel_dp);
 
 void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
 			   u8 *link_bw, u8 *rate_select);
-- 
2.39.2

