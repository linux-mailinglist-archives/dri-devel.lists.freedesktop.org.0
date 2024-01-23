Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6938399BA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3042910E88F;
	Tue, 23 Jan 2024 19:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D72610E88F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038838; x=1737574838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awx+PIr/X+qF58NaPquGwAzW8T7ZaD1c7rPYDXZbyyk=;
 b=KqQHozSuXFX++PSuOaLtxoHxcHa+z7g3owFoh/Zsu1HpzqN5jLKWiZMY
 JtC8M2Jykn95IcSYZVVd8nMnLoTMARZTXEOgiK7s4IcdlWvxKkzCV6m59
 OHpIIYtV2QHUefYomwTozGMz6LdMKPH6wGxF6Xb45k6bET7uI26z1z4aZ
 4hWXGZNDMgjETmEU0c+03w/LPSr5RGiYFM/Mn0Y4v12hbelXDosBE1xlY
 dxMybZBYXCe35UeUxBcBphz34P0U0Sjk3Wh750WJ11b2xidNxnFA+JrW2
 TS9eignhybW6FP+e3AyZX9fbLi9DNZ8Eo+IfScSu7A9Y3kuFNv4n8K8sG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8997282"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8997282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="34520466"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 27/39] drm/mediatek/hdmi: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:33 +0200
Message-Id: <7fff7a6ff6b7e6f121eafaccfc4c368e492631f4.1706038510.git.jani.nikula@intel.com>
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

