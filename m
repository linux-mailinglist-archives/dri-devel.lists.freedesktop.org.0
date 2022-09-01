Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA765A9744
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7720A10E702;
	Thu,  1 Sep 2022 12:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA0010E707;
 Thu,  1 Sep 2022 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036491; x=1693572491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uBeEuUWSSctgfOb4ooLTPiBPTgIUYUcIbj4dYD/aUV4=;
 b=Hh2WevXfBitsbHKiF8FWQW17EEtN44Z2XbaFhwPNgoeaj2q7zet3mlYk
 rtG2+MLyQ9QhSGWtvmpeZ3w0LKsU57zcnZAhAkaWI19r/9Y98yrBWrjtT
 xXJikQNrzRYsOyVcdxjZLYVSGMEDlHc68PBYQ3ZV5DgxLPDM1aQnt+wS3
 CysJtvvUWZZNwC/jT2hwzVO95vNzBdBdxZrEphKujuB9AiWHcL92YF1zF
 42wYV8/H06uCjCbpWIATl4Isp6x25KRThqcq01J5BBBxXb9zl5k8dfjHQ
 mG9wrzG4+lElxmxsHoWKH+9js/aDeLpOV1AF/JoEy5SP/OhT/1eWCLVuT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="295711904"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="295711904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:48:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="680843647"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:48:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/sti/sti_hdmi: convert to using is_hdmi from display
 info
Date: Thu,  1 Sep 2022 15:47:09 +0300
Message-Id: <74fbd7a83712009734534d92e5499d4d87f0c53b.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi in display info over calling
drm_detect_hdmi_monitor(). Remove the now redundant hdmi_monitor member
from struct sti_hdmi.

Cc: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 11 ++++++-----
 drivers/gpu/drm/sti/sti_hdmi.h |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index cb82622877d2..7e6d47c1c43b 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -266,6 +266,7 @@ static void hdmi_active_area(struct sti_hdmi *hdmi)
  */
 static void hdmi_config(struct sti_hdmi *hdmi)
 {
+	struct drm_connector *connector = hdmi->drm_connector;
 	u32 conf;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -275,7 +276,7 @@ static void hdmi_config(struct sti_hdmi *hdmi)
 
 	/* Select encryption type and the framing mode */
 	conf |= HDMI_CFG_ESS_NOT_OESS;
-	if (hdmi->hdmi_monitor)
+	if (connector->display_info.is_hdmi)
 		conf |= HDMI_CFG_HDMI_NOT_DVI;
 
 	/* Set Hsync polarity */
@@ -985,15 +986,15 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto fail;
 
-	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
-	DRM_DEBUG_KMS("%s : %dx%d cm\n",
-		      (hdmi->hdmi_monitor ? "hdmi monitor" : "dvi monitor"),
-		      edid->width_cm, edid->height_cm);
 	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
 
 	count = drm_add_edid_modes(connector, edid);
 	drm_connector_update_edid_property(connector, edid);
 
+	DRM_DEBUG_KMS("%s : %dx%d cm\n",
+		      (connector->display_info.is_hdmi ? "hdmi monitor" : "dvi monitor"),
+		      edid->width_cm, edid->height_cm);
+
 	kfree(edid);
 	return count;
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.h b/drivers/gpu/drm/sti/sti_hdmi.h
index 05b2f3d0d48d..6d4c3f57bc46 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.h
+++ b/drivers/gpu/drm/sti/sti_hdmi.h
@@ -57,7 +57,6 @@ struct hdmi_audio_params {
  * @reset: reset control of the hdmi phy
  * @ddc_adapt: i2c ddc adapter
  * @colorspace: current colorspace selected
- * @hdmi_monitor: true if HDMI monitor detected else DVI monitor assumed
  * @audio_pdev: ASoC hdmi-codec platform device
  * @audio: hdmi audio parameters.
  * @drm_connector: hdmi connector
@@ -83,7 +82,6 @@ struct sti_hdmi {
 	struct reset_control *reset;
 	struct i2c_adapter *ddc_adapt;
 	enum hdmi_colorspace colorspace;
-	bool hdmi_monitor;
 	struct platform_device *audio_pdev;
 	struct hdmi_audio_params audio;
 	struct drm_connector *drm_connector;
-- 
2.34.1

