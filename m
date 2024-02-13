Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDC852F57
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D50810E4C9;
	Tue, 13 Feb 2024 11:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5sBdsOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2440E10E565;
 Tue, 13 Feb 2024 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707823883; x=1739359883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XleGZnfmcAbEKT/3ZtX2PlLXmFLVw2Ikt8ZgvWmRgGU=;
 b=U5sBdsOxLylqnaEZqaPT2mbTM/+LGLkKbgDIxGvEcDnwyxrOZcRnLHxt
 D0JGW1oUDQ4jJ6XVt9JnpGTu7VDk0XVwvqKuukCarEy9GXtya7zIJClbg
 4K61jnVuvdoZWQf0B2UsJ2ozrxY+m3isN1QhU9LnvPlGPctL21tgvUoIb
 JUyXa5dZIMaSQ+QeLjw/EseniLhKq/BfFQKgVvuNYjEJd77doQ7TLR8bJ
 bOcSpElXAOyFi8xB4T/DWeMTycAp5BjYW5lwijLmvjumyzTZIwa6iYNp+
 UvJ9m3egL2f/14h5KS4n81kn1mRe00czthZLnCzKoHBUg+rZ2Re7hHxl0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1965674"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1965674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7607627"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 3/6] drm/i915/mst: abstract choosing the MST mode to use
Date: Tue, 13 Feb 2024 13:30:58 +0200
Message-Id: <7c54416835620ae497cb8e0d2c62d124eeb5efeb.1707823736.git.jani.nikula@intel.com>
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

Clarify the conditions for choosing the MST mode to use by adding a new
function intel_dp_mst_mode_choose(). This also prepares for being able
to extend the MST modes to single-stream sideband messaging.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 944f566525dd..007cb2a04e38 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4015,6 +4015,24 @@ static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
 		return str_yes_no(mst_mode == DRM_DP_MST);
 }
 
+static enum drm_dp_mst_mode
+intel_dp_mst_mode_choose(struct intel_dp *intel_dp,
+			 enum drm_dp_mst_mode sink_mst_mode)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (!i915->display.params.enable_dp_mst)
+		return DRM_DP_SST;
+
+	if (!intel_dp_mst_source_support(intel_dp))
+		return DRM_DP_SST;
+
+	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+		return DRM_DP_SST;
+
+	return sink_mst_mode;
+}
+
 static bool
 intel_dp_mst_detect(struct intel_dp *intel_dp)
 {
@@ -4025,12 +4043,7 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
 
 	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
 
-	if (i915->display.params.enable_dp_mst &&
-	    intel_dp_mst_source_support(intel_dp) &&
-	    sink_mst_mode == DRM_DP_MST)
-		mst_detect = DRM_DP_MST;
-	else
-		mst_detect = DRM_DP_SST;
+	mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
-- 
2.39.2

