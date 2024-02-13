Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C20852F59
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F610E579;
	Tue, 13 Feb 2024 11:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5PNL34W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50F10E505;
 Tue, 13 Feb 2024 11:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707823887; x=1739359887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ws6vy/xwOj/fIoQrdaUpd4Ei8eCvaIHw6+8+Ogd8WAI=;
 b=O5PNL34WLFtcsNB2ASgz7ZzpV03jI26Fk/pWlNlhW5w1c4nDfTara0xY
 vMDBS9hnOMEdl/hf/MFmRqxKBdo0eJ15NnrgdcmfQQQiLJek4sJigCNHy
 RSABvN5+AAwHQfe3Mu0F11J+KSC7fcj3CmTBK6EIoOHDSHHQF51A0sk9Z
 FggTcJpVim9VuC9OtAuCm+N9EzJI6kfwETTFd7znr1aXlMxmxZWJjQlm9
 AAYfOSHxW9eJQDD2aWMY+XZGk26yNGG8KdBA1IjC8+/XKD3mrRD4cW4IH
 8XjG7pmONR3yGTnLXVLX+lxbDUGGta/GrkcyYWMw/QXEytJrarAMaxz9w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2181999"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2181999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="33668699"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 4/6] drm/i915/mst: use the MST mode detected previously
Date: Tue, 13 Feb 2024 13:30:59 +0200
Message-Id: <4fb849117a31940a3fbc26287c09ee3928e91991.1707823736.git.jani.nikula@intel.com>
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

Drop the duplicate read of DP_MSTM_CAP DPCD register, and the duplicate
logic for choosing MST mode, and store the chosen mode in struct
intel_dp. Rename intel_dp_configure_mst() to intel_dp_mst_configure()
while at it.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 23 ++++++++-----------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 01eb6e4e6049..4a8440a3a812 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1780,6 +1780,7 @@ struct intel_dp {
 
 	bool is_mst;
 	int active_mst_links;
+	enum drm_dp_mst_mode mst_detect;
 
 	/* connector directly attached - won't be use for modeset in mst world */
 	struct intel_connector *attached_connector;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 007cb2a04e38..72e91322e310 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4039,11 +4039,10 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	enum drm_dp_mst_mode sink_mst_mode;
-	enum drm_dp_mst_mode mst_detect;
 
 	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
 
-	mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
+	intel_dp->mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
@@ -4051,25 +4050,23 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
 		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
 		    intel_dp_mst_mode_str(sink_mst_mode),
 		    str_yes_no(i915->display.params.enable_dp_mst),
-		    intel_dp_mst_mode_str(mst_detect));
+		    intel_dp_mst_mode_str(intel_dp->mst_detect));
 
-	return mst_detect != DRM_DP_SST;
+	return intel_dp->mst_detect != DRM_DP_SST;
 }
 
 static void
-intel_dp_configure_mst(struct intel_dp *intel_dp)
+intel_dp_mst_configure(struct intel_dp *intel_dp)
 {
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
-
 	if (!intel_dp_mst_source_support(intel_dp))
 		return;
 
-	intel_dp->is_mst = sink_can_mst &&
-		i915->display.params.enable_dp_mst;
+	intel_dp->is_mst = intel_dp->mst_detect != DRM_DP_SST;
+
+	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
 
-	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
-					intel_dp->is_mst);
+	/* Avoid stale info on the next detect cycle. */
+	intel_dp->mst_detect = DRM_DP_SST;
 }
 
 static bool
@@ -5739,7 +5736,7 @@ intel_dp_detect(struct drm_connector *connector,
 
 	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
 
-	intel_dp_configure_mst(intel_dp);
+	intel_dp_mst_configure(intel_dp);
 
 	/*
 	 * TODO: Reset link params when switching to MST mode, until MST
-- 
2.39.2

