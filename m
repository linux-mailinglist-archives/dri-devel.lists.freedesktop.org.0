Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7C8C565B
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66BF10E7AA;
	Tue, 14 May 2024 12:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CW1qUJkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42010E7AA;
 Tue, 14 May 2024 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691380; x=1747227380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MN7SlPdpAe5QBcnVhCSzhjMMbkyk5IJ2S33wWdWmnSs=;
 b=CW1qUJkmRvoCFVtCbfdU8Zs0SnUqKEG4kiPxOouQM4uZHHxVSstmfIQv
 gsv5Sdfr4zAnLr7rjVynN1fOTXUfQ3dgaxtIKNCzaCSSk4o2+1jbzzDIN
 ajAIVhFp+VovcM8SPJ4SSBZQbegsSg4KpZBPzfnlgnaSNVwsmLvw1zRGa
 XxGZumvU80Nd/BxxLY6hmYg+mL5kql5dsfBIjM0mOQwqKuQ/IYWoOET4p
 kX5B5CSywqFh3x9ci7K+l7jXgw31L03v0aNQN3yZ7MtEM6iW/1qTYnCaj
 uOx1LVPHcgCHvNiubtZB5qK1HJRiX1RpXRi8+LoS55DtcRuimrlo5ZDPM w==;
X-CSE-ConnectionGUID: ZzwfMwXzTwahsJDWTNvctw==
X-CSE-MsgGUID: 5q99dHepQNSOtgZToZcHiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22270719"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22270719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:19 -0700
X-CSE-ConnectionGUID: XZh4ZFrCR4CI5YnAWetkiQ==
X-CSE-MsgGUID: 9kdD4cv8SAaa0C+pjqHywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35140834"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
Date: Tue, 14 May 2024 15:55:14 +0300
Message-Id: <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

Simplify the flow by updating the EDID property when the EDID is read
instead of at .get_modes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++----
 drivers/gpu/drm/msm/dp/dp_panel.c   | 47 +++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
 3 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 672a7ba52eda..9622e58dce3e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -360,26 +360,25 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 static int dp_display_process_hpd_high(struct dp_display_private *dp)
 {
+	struct drm_connector *connector = dp->dp_display.connector;
+	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
-	struct edid *edid;
 
-	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
+	rc = dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;
 
 	dp_link_process_request(dp->link);
 
 	if (!dp->dp_display.is_edp)
-		drm_dp_set_subconnector_property(dp->dp_display.connector,
+		drm_dp_set_subconnector_property(connector,
 						 connector_status_connected,
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
-	edid = dp->panel->edid;
-
 	dp->dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
-	dp->audio_supported = drm_detect_monitor_audio(edid);
+	dp->audio_supported = info->has_audio;
 	dp_panel_handle_sink_request(dp->panel);
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 07db8f37cd06..a916b5f3b317 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -108,28 +108,6 @@ static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 	return bpp;
 }
 
-static int dp_panel_update_modes(struct drm_connector *connector,
-	struct edid *edid)
-{
-	int rc = 0;
-
-	if (edid) {
-		rc = drm_connector_update_edid_property(connector, edid);
-		if (rc) {
-			DRM_ERROR("failed to update edid property %d\n", rc);
-			return rc;
-		}
-		rc = drm_add_edid_modes(connector, edid);
-		return rc;
-	}
-
-	rc = drm_connector_update_edid_property(connector, NULL);
-	if (rc)
-		DRM_ERROR("failed to update edid property %d\n", rc);
-
-	return rc;
-}
-
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	struct drm_connector *connector)
 {
@@ -175,12 +153,13 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	if (rc)
 		return rc;
 
-	kfree(dp_panel->edid);
-	dp_panel->edid = NULL;
+	drm_edid_free(dp_panel->drm_edid);
+
+	dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
+
+	drm_edid_connector_update(connector, dp_panel->drm_edid);
 
-	dp_panel->edid = drm_get_edid(connector,
-					      &panel->aux->ddc);
-	if (!dp_panel->edid) {
+	if (!dp_panel->drm_edid) {
 		DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
 		if (!dp_catalog_link_is_connected(panel->catalog)) {
@@ -224,13 +203,13 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
 		return -EINVAL;
 	}
 
-	if (dp_panel->edid)
-		return dp_panel_update_modes(connector, dp_panel->edid);
+	if (dp_panel->drm_edid)
+		return drm_edid_connector_add_modes(connector);
 
 	return 0;
 }
 
-static u8 dp_panel_get_edid_checksum(struct edid *edid)
+static u8 dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
 
@@ -249,10 +228,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
+		/* FIXME: get rid of drm_edid_raw() */
+		const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
 		u8 checksum;
 
-		if (dp_panel->edid)
-			checksum = dp_panel_get_edid_checksum(dp_panel->edid);
+		if (edid)
+			checksum = dp_panel_get_edid_checksum(edid);
 		else
 			checksum = dp_panel->connector->real_edid_checksum;
 
@@ -539,5 +520,5 @@ void dp_panel_put(struct dp_panel *dp_panel)
 	if (!dp_panel)
 		return;
 
-	kfree(dp_panel->edid);
+	drm_edid_free(dp_panel->drm_edid);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4ea42fa936ae..6722e3923fa5 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -39,7 +39,7 @@ struct dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct dp_link_info link_info;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
 	struct dp_display_mode dp_mode;
 	struct dp_panel_psr psr_cap;
-- 
2.39.2

