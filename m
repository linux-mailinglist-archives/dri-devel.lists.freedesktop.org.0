Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6587FA80
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8AB10F8CE;
	Tue, 19 Mar 2024 09:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXxg4TfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB1910F8CC;
 Tue, 19 Mar 2024 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839603; x=1742375603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rGBKCkYH2uUmu9PsGwyKtojLYCK4ehMZOEGGvGkt7uY=;
 b=hXxg4TfWr1VFAUykPG549z90DogpWKNp9kj7DnXfETYbYULQQkGIKfs0
 VlcYT76k2kkikQNJbRI0BLNxNoFXWeFuwTtIoPMZpKo9HiYx4oKzrRR2T
 JAJ7U0O2S34othySlO8wMXPaBMjswvQH8MPoIu4tWTyKU9R02KB79cuuF
 tUuGEVNaiH9kbjzy4pGAh24tpQ3G4Lz7Idouj1kCef3+CBwl7zDUnsH4y
 lcoQUlGLoAdfrpXLvhiuOP8dGX9bnqwAdCUUNtJ3lpbF6XhC/v8hqRFXg
 YYdZzz/a4rWmGk/NN7dYr0dhP5GiEBOgVQVVSZNzqcc3IYZQpQdabCrKa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238063"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238063"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13780700"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND v3 5/6] drm/i915/mst: add intel_dp_mst_disconnect()
Date: Tue, 19 Mar 2024 11:12:52 +0200
Message-Id: <c39239fb6bef87a89219c8fbe7799f97f91b9042.1710839496.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710839496.git.jani.nikula@intel.com>
References: <cover.1710839496.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Abstract the MST mode disconnect to a separate function.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e2f77855e4a0..9b8bd85c1a4e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4104,6 +4104,20 @@ intel_dp_mst_configure(struct intel_dp *intel_dp)
 	intel_dp->mst_detect = DRM_DP_SST;
 }
 
+static void
+intel_dp_mst_disconnect(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (!intel_dp->is_mst)
+		return;
+
+	drm_dbg_kms(&i915->drm, "MST device may have disappeared %d vs %d\n",
+		    intel_dp->is_mst, intel_dp->mst_mgr.mst_state);
+	intel_dp->is_mst = false;
+	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
+}
+
 static bool
 intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)
 {
@@ -5711,15 +5725,7 @@ intel_dp_detect(struct drm_connector *connector,
 		memset(intel_connector->dp.dsc_dpcd, 0, sizeof(intel_connector->dp.dsc_dpcd));
 		intel_dp->psr.sink_panel_replay_support = false;
 
-		if (intel_dp->is_mst) {
-			drm_dbg_kms(&dev_priv->drm,
-				    "MST device may have disappeared %d vs %d\n",
-				    intel_dp->is_mst,
-				    intel_dp->mst_mgr.mst_state);
-			intel_dp->is_mst = false;
-			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
-							intel_dp->is_mst);
-		}
+		intel_dp_mst_disconnect(intel_dp);
 
 		intel_dp_tunnel_disconnect(intel_dp);
 
-- 
2.39.2

