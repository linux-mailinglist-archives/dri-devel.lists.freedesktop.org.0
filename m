Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC27870C0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 15:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B006D10E550;
	Thu, 24 Aug 2023 13:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8381D10E54F;
 Thu, 24 Aug 2023 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692884785; x=1724420785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CaoHY4p+qUgm3IS7tBRqBO4KNsX3ZdXL70kJayIFbdc=;
 b=JTrAco2RPuBQQYrBn8pgXVYzRj9EMY4sk1GEgc349+Q4E5Sq0J1uzo5L
 60DOGZ7VypU1BXfFCsOSibJ6k9BPtujFKMAPd2O4N/bZrIN1HfsBTy04e
 l89B8qYP3E7Bc55wmwTcafOcH8rod+hfokSEvdLrpipyAA3D1nf947nWL
 PwBOHLQ76eoF2KGEWU1jz1/MK4N7JLJ82kcfG8InRHFo8pP9TajsJ5cSh
 VkvNJj44BVmcF2+QJzGWMJEMNgcgWVccZXUCEoD6DuZWmpIUN+/PiSeZq
 WVClsqUJ9NUt6McyTvqZ+NDWBS4hWOnWxJKamCaADuAJ8xNxy/sFies4H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354773212"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354773212"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983706472"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="983706472"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/display: use drm_edid_is_digital()
Date: Thu, 24 Aug 2023 16:46:03 +0300
Message-Id: <dbc0269d34f3140aff410eefae8a2711c59299b3.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce the use of struct edid and drm_edid_raw().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
 drivers/gpu/drm/i915/display/intel_hdmi.c |  9 ++++-----
 drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index f66340b4caf0..310670bb6c25 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -657,21 +657,18 @@ static bool intel_crt_detect_ddc(struct drm_connector *connector)
 	drm_edid = intel_crt_get_edid(connector, i2c);
 
 	if (drm_edid) {
-		const struct edid *edid = drm_edid_raw(drm_edid);
-		bool is_digital = edid->input & DRM_EDID_INPUT_DIGITAL;
-
 		/*
 		 * This may be a DVI-I connector with a shared DDC
 		 * link between analog and digital outputs, so we
 		 * have to check the EDID input spec of the attached device.
 		 */
-		if (!is_digital) {
+		if (drm_edid_is_digital(drm_edid)) {
 			drm_dbg_kms(&dev_priv->drm,
-				    "CRT detected via DDC:0x50 [EDID]\n");
-			ret = true;
+				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
 		} else {
 			drm_dbg_kms(&dev_priv->drm,
-				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
+				    "CRT detected via DDC:0x50 [EDID]\n");
+			ret = true;
 		}
 	} else {
 		drm_dbg_kms(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9442bf43550e..aa9915098dda 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2452,7 +2452,6 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	intel_wakeref_t wakeref;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 	bool connected = false;
 	struct i2c_adapter *i2c;
 
@@ -2475,9 +2474,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	to_intel_connector(connector)->detect_edid = drm_edid;
 
-	/* FIXME: Get rid of drm_edid_raw() */
-	edid = drm_edid_raw(drm_edid);
-	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
+	if (drm_edid_is_digital(drm_edid)) {
 		intel_hdmi_dp_dual_mode_detect(connector);
 
 		connected = true;
@@ -2485,7 +2482,9 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
 
-	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier, edid);
+	/* FIXME: Get rid of drm_edid_raw() */
+	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
+					     drm_edid_raw(drm_edid));
 
 	return connected;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 7d25a64698e2..917771e19e38 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2094,10 +2094,8 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 
 	status = connector_status_unknown;
 	if (drm_edid) {
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
 		/* DDC bus is shared, match EDID to connector type */
-		if (edid && edid->input & DRM_EDID_INPUT_DIGITAL)
+		if (drm_edid_is_digital(drm_edid))
 			status = connector_status_connected;
 		else
 			status = connector_status_disconnected;
@@ -2111,8 +2109,7 @@ static bool
 intel_sdvo_connector_matches_edid(struct intel_sdvo_connector *sdvo,
 				  const struct drm_edid *drm_edid)
 {
-	const struct edid *edid = drm_edid_raw(drm_edid);
-	bool monitor_is_digital = !!(edid->input & DRM_EDID_INPUT_DIGITAL);
+	bool monitor_is_digital = drm_edid_is_digital(drm_edid);
 	bool connector_is_digital = !!IS_DIGITAL(sdvo);
 
 	DRM_DEBUG_KMS("connector_is_digital? %d, monitor_is_digital? %d\n",
-- 
2.39.2

