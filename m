Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A28852F5A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3221810E505;
	Tue, 13 Feb 2024 11:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L60gWilj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979D610E505;
 Tue, 13 Feb 2024 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707823893; x=1739359893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jhfjcpavFmdGnzN6Hq68n18wYY7JQnGZmwfZWmzjowQ=;
 b=L60gWilj++Fxq/cqYIax0gG+0YlBOzp7vmfSgDkAfwwtqRaT1Bn5IO00
 DoPDrzAHoZDWrcDJ+5KHikIDJXZ9fBaetdl+idj7+h9f1RQpxFn81UMSG
 DbarZAJm29sTSAurrXDnuTeKJwDbKoMlgcym6nA7yQYmdZL3kchTw3JS4
 4uBh81qMeOTM75dHIEFXP19bUEEQ+Xdy8XTzTp6vprAPkWNcoFiXUV0CA
 BytixGyRAynPQ6/PX49SLjAotsaacl1VU+IgAbRiAkgWWzydrY5/RgFYy
 +uZHQTh1Y9xIwRFYOWP2LHVh6+L8v67gUIQoGjQZu6MzR6mHfoKcJgpE+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1694690"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1694690"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7517560"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 5/6] drm/i915/mst: add intel_dp_mst_disconnect()
Date: Tue, 13 Feb 2024 13:31:00 +0200
Message-Id: <19287946420a86aaea54f3ee7ee8507978ea7c31.1707823736.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707823736.git.jani.nikula@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
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
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 72e91322e310..7f97d5512a3e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4069,6 +4069,20 @@ intel_dp_mst_configure(struct intel_dp *intel_dp)
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
@@ -5721,15 +5735,7 @@ intel_dp_detect(struct drm_connector *connector,
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
 
 		goto out;
 	}
-- 
2.39.2

