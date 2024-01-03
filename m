Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A79F822B0E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE89910E2FC;
	Wed,  3 Jan 2024 10:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F275F10E2FC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276728; x=1735812728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ApaajnY+rwZFDQdOuaG9m/91sVoHFfcM8IuItBlF178=;
 b=ARRyTGfHNAx1/1lEV1W4KII089WNWnDV7ob+tvwalImZtMostDy/LFAK
 th7jA5yxt6FN9xIg1vK7CE0vNzZtLiijn6ZXBuwyrIEsEvOoLRs57164Z
 JF54Q+nsRw72PsPSjkrGIG9gKqMADsQk1LNjP/SmF0LJE1curXRr87x1H
 PsNvQvOgRi7nRfysIc6+pV8MRLQdYNFtXkEPa2jVUk7YIFpAMPDDIwuhm
 FVMjaPJJjWypwpJtk+EB4+alZrUyF0OkJTph5kxGo5DZtN0uxELRrBYke
 nOywvBcKi4AfV83/Rw8QNiQl1ibRtZLSeyXmtUO8VuC/WZmffrOGo64f+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341945"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341945"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953185040"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953185040"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 29/39] drm/msm/hdmi: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:43 +0200
Message-Id: <d0aa71adaaafaa590c6b548559be052f3c7ab703.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f28c61570533..4a5b5112227f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -236,24 +236,33 @@ static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 		msm_hdmi_audio_update(hdmi);
 }
 
-static struct edid *msm_hdmi_bridge_get_edid(struct drm_bridge *bridge,
-		struct drm_connector *connector)
+static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,
+							struct drm_connector *connector)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	uint32_t hdmi_ctrl;
 
 	hdmi_ctrl = hdmi_read(hdmi, REG_HDMI_CTRL);
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl | HDMI_CTRL_ENABLE);
 
-	edid = drm_get_edid(connector, hdmi->i2c);
+	drm_edid = drm_edid_read_ddc(connector, hdmi->i2c);
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
+	if (drm_edid) {
+		/*
+		 * FIXME: This should use connector->display_info.is_hdmi from a
+		 * path that has read the EDID and called
+		 * drm_edid_connector_update().
+		 */
+		const struct edid *edid = drm_edid_raw(drm_edid);
 
-	return edid;
+		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
+	}
+
+	return drm_edid;
 }
 
 static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
@@ -294,7 +303,7 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.post_disable = msm_hdmi_bridge_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
-	.get_edid = msm_hdmi_bridge_get_edid,
+	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
 };
 
-- 
2.39.2

