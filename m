Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074A6D0A08
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6F10EEDB;
	Thu, 30 Mar 2023 15:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7908810EEF1;
 Thu, 30 Mar 2023 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190861; x=1711726861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQfWFGXWHZ1emnDeGzJ1uC/IAi8OVEg8cfo2NVHHcsA=;
 b=FHeW1ckHgtHgiuz4/LA9xvseRav0YWD0hNFyDc4Ef61q+JYwHco2V9qO
 f0uVr+3RhhUfT5LDWCD39KI0WUHCJnyTvcUTtWgQ8nyq+GWccQ55mwb7L
 khI6ZAzeMGRPooSg6BDhOg7uXYG0u12nptzBnFA+Y8I1HTrEOkDRJRE9k
 9F0SVWMQTYdKpAUe0Fldqru5pvZTE6Tw4hnt2Nk3WeEniZM8w3hVVjH2+
 SroeH8fOlq8JDQyDd+wEoMgba8FjJ1SOhvQXuRiXf1/TfD/InZ6VgEDrf
 LLW48vBEBdMwWI7Fn38o6ZcpSJDDbs6yL9/4UNeRxsBQA1pcu/VyH/yc7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329722255"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="329722255"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687294930"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="687294930"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm/sti/sti_hdmi: convert to using is_hdmi from display
 info
Date: Thu, 30 Mar 2023 18:39:46 +0300
Message-Id: <932c52a915d08ebbe14f148806e6d61fe23e92d5.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Alain Volmat <alain.volmat@foss.st.com>,
 intel-gfx@lists.freedesktop.org
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
index 8539fe1fedc4..dc1562f14ceb 100644
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
2.39.2

