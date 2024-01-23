Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E795B8399BD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BD810E893;
	Tue, 23 Jan 2024 19:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AA710E893
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038850; x=1737574850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ApaajnY+rwZFDQdOuaG9m/91sVoHFfcM8IuItBlF178=;
 b=HLE56/LR7TrfT08y2+/nz18GcQx5qYReJW5gRB4jiK5WO56Mvfo1GTOF
 0Qx6gaz0/+Y0PbfAKBTWusyXFL1t8eGSXWFI5IPzWJBFoACOH5kyT7muf
 1vFyecL+Ll8wkAOiXhzgcUhRaE2cnrT3HQg+rnE2H4L7Jvim3XqVC3WOe
 pJb1tZQNYdKtvjz3dBJs/VlDzjVZ3+UZh1IlCsQGNUMgeoXM9arORxWQl
 IT5BGmxWYug0arL3C5FrPyNztPkTl77FOVCLHcPPuefAjcM6wtbpAgdad
 nqK68udPI/VkcFogoKyufqIgmCvPzNCR9qpbCedzucw8XVBTQco5pVCg8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8997321"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8997321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="34520494"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 29/39] drm/msm/hdmi: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:35 +0200
Message-Id: <2f127a42e3a9472f5a7c6bcbc8a42433e94acb3f.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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

