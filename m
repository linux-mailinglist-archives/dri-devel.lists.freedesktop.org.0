Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6722822B08
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048E610E2F1;
	Wed,  3 Jan 2024 10:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7210E2F1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276716; x=1735812716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awx+PIr/X+qF58NaPquGwAzW8T7ZaD1c7rPYDXZbyyk=;
 b=Y5uLeX/Fck/Dg/xYbgEWIkuUsko27jo1Uj4POMJCS0KYH/MHWt1khqyQ
 h4Y7J6nXwFUJwowcsND7RLjlmyIMunTZumipXclVtfM+htNW1Npx5tqFI
 Pb5vQyZeKinjnHo07bxdSv0myusMLrX3HfW0QMmJrFMlWpSs5FEDNpXWl
 YqTMwz+4yTji+q8OnKm/1w43zvU3fJpBkJ77R0C6lpRQea2OmQHuG6G1L
 NdyUp8JErbiREQeXTZKU5TE2Kb2xcR+t9SYSvSL+5K1GpNTU5mYgY1B7S
 RfGkarKm4r0osvpdJdS6t+atugyHAV8IhyVGnHUsPAQ8nIVYLFqQ+ezBF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341912"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341912"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953185023"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953185023"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 27/39] drm/mediatek/hdmi: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:41 +0200
Message-Id: <86810aa84406512832dc3fb1ad20720a8bc567a6.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 86133bf16326..c6bdc565e4a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1265,19 +1265,27 @@ static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridg
 	return mtk_hdmi_detect(hdmi);
 }
 
-static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
-					     struct drm_connector *connector)
+static const struct drm_edid *mtk_hdmi_bridge_edid_read(struct drm_bridge *bridge,
+							struct drm_connector *connector)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	if (!hdmi->ddc_adpt)
 		return NULL;
-	edid = drm_get_edid(connector, hdmi->ddc_adpt);
-	if (!edid)
-		return NULL;
-	hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
-	return edid;
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_adpt);
+	if (drm_edid) {
+		/*
+		 * FIXME: This should use !connector->display_info.has_audio (or
+		 * !connector->display_info.is_hdmi) from a path that has read
+		 * the EDID and called drm_edid_connector_update().
+		 */
+		const struct edid *edid = drm_edid_raw(drm_edid);
+
+		hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
+	}
+
+	return drm_edid;
 }
 
 static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
@@ -1417,7 +1425,7 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
 	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
 	.detect = mtk_hdmi_bridge_detect,
-	.get_edid = mtk_hdmi_bridge_get_edid,
+	.edid_read = mtk_hdmi_bridge_edid_read,
 };
 
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-- 
2.39.2

