Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D05960A652
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A949910E456;
	Mon, 24 Oct 2022 12:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B4B10E438;
 Mon, 24 Oct 2022 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614839; x=1698150839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zng3K7/RxORWnGsDCHbROONaBCCfJud83e+HAojLW9A=;
 b=Pt8zx6IcHGY0R/5R9JdaBKObfI4JdwPcxWNW4SDDJufcD8vrhlV4urVU
 fqoS9dccDAM5bsqUzjAwsK/Wa4+09GoSm6FoPDfy3nltRUPd/yGq8YEG5
 A8Ihro+XQjtSb+PVicP0lJMV+Oxevr+DUcwibXlbUx06cZ81lhP8N6Ayv
 +cl5GeJ/au/TiaJK1CxvWGTFzP3vHWqC12UCuBIqdWHzZvHZSIVhTSHAw
 IghToKi13bxvGfW9+76gBsvvqmDPwzr4BcqBLxEG/O0uUUDLhLDiPK3bY
 efYvRdaWhog/rzJZtoIjUFxTIWPfSWhUn/kGWMiCIOTWaXk6Mz2eiCChA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="306135923"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="306135923"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:33:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="876418598"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="876418598"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:33:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/16] drm/i915/hdmi: do dual mode detect only if connected
Date: Mon, 24 Oct 2022 15:33:29 +0300
Message-Id: <f8f2a4a147e1c87ba93269a607f71fc29c4b59f6.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For normal connector detect, there's really no point in trying dual mode
detect if the connector is disconnected. We can simplify the detect
sequence by skipping it. Since intel_hdmi_dp_dual_mode_detect() is only
called when EDID is present, we can drop the has_edid parameter.

The functional effect is speeding up disconnected connector detection
ever so slightly, and, combined with firmware EDID, also stop logging
about assuming dual mode adaptor.

It's a bit subtle, but this will also skip dual mode detect if the
connector is force connected and a) there's no EDID of any kind, normal
or override/firmware or b) there's EDID but it does not indicate
digital. These are corner cases no matter what, and arguably forcing
should not be limited by dual mode detect.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 93519fb23d9d..a332eaac86cd 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2355,7 +2355,7 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
 }
 
 static void
-intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
+intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
@@ -2371,16 +2371,13 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
 	 * CONFIG1 pin, but no such luck on our hardware.
 	 *
 	 * The only method left to us is to check the VBT to see
-	 * if the port is a dual mode capable DP port. But let's
-	 * only do that when we sucesfully read the EDID, to avoid
-	 * confusing log messages about DP dual mode adaptors when
-	 * there's nothing connected to the port.
+	 * if the port is a dual mode capable DP port.
 	 */
 	if (type == DRM_DP_DUAL_MODE_UNKNOWN) {
 		/* An overridden EDID imply that we want this port for testing.
 		 * Make sure not to set limits for that port.
 		 */
-		if (has_edid && !connector->override_edid &&
+		if (!connector->override_edid &&
 		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "Assuming DP dual mode adaptor presence based on VBT\n");
@@ -2435,18 +2432,18 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 		intel_gmbus_force_bit(i2c, false);
 	}
 
-	intel_hdmi_dp_dual_mode_detect(connector, edid != NULL);
-
-	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
-
 	to_intel_connector(connector)->detect_edid = edid;
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
 		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
 
+		intel_hdmi_dp_dual_mode_detect(connector);
+
 		connected = true;
 	}
 
+	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
+
 	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier, edid);
 
 	return connected;
-- 
2.34.1

