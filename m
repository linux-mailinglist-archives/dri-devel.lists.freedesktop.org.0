Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07808A6C1F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B9310F097;
	Tue, 16 Apr 2024 13:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lr5ZNrRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE2110EE86
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273782; x=1744809782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pukhvgMf+XhdXbjoXwiY5kizWqR66w0dEiAKqDs53Q8=;
 b=lr5ZNrRDZ/B53YQ5Na4l+0jEFDf9Cygl0mTuqSSt+YzejkpMWKlE1iIQ
 B/U+Kon1bD267uIu+W+He2CSRI1a+s3LQstGq/pxyqpx6YItBtgyk+bdr
 g8MNYkDwPXiOEYDuRE7+Dy13q44cZMzHzYUIuGmJaS8wyOaOlXIKL8nJ/
 NJL0yBXkbdw596YDnxid3eZ7dUMxWgtdl45Nx/KvDS4y+GA94HXDK87C/
 lhKtZ7ozl7/IODM3PBVsobaXmzjDunKOPGxl1v/3P4hQfPl/Twz9dpA5F
 x2rbgP9bO3YRPLAEIvp8aIYY+d1sddHmZLxM03n7FYFjEkNhwE5raq+Aq Q==;
X-CSE-ConnectionGUID: qjWcDBpgRuKhUOvJFayRcA==
X-CSE-MsgGUID: N9ZZGFH2Qs+FsnBNoroqFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8875713"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8875713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:50 -0700
X-CSE-ConnectionGUID: ty6zDXlDRFiqBjSq42RyLw==
X-CSE-MsgGUID: CDMdBIfmTB+D0HjXJiA0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26906078"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 03/15] drm/panel-edp: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:17 +0300
Message-Id: <a68ee923449a70cc7a59d0d3c96b0bb6764296bd.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d29bacf25c12..ece1e3553c1f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -242,7 +242,7 @@ struct panel_edp {
 
 	const struct edp_panel_entry *detected_panel;
 
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	struct drm_display_mode override_mode;
 
@@ -617,13 +617,16 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	if (p->ddc) {
 		pm_runtime_get_sync(panel->dev);
 
-		if (!p->edid)
-			p->edid = drm_get_edid(connector, p->ddc);
+		if (!p->drm_edid)
+			p->drm_edid = drm_edid_read_ddc(connector, p->ddc);
+
+		drm_edid_connector_update(connector, p->drm_edid);
+
 		/*
 		 * If both edid and hard-coded modes exists, skip edid modes to
 		 * avoid multiple preferred modes.
 		 */
-		if (p->edid && !has_hard_coded_modes) {
+		if (p->drm_edid && !has_hard_coded_modes) {
 			if (has_override_edid_mode) {
 				/*
 				 * override_edid_mode is specified. Use
@@ -632,7 +635,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 				num += panel_edp_override_edid_mode(p, connector,
 						p->detected_panel->override_edid_mode);
 			} else {
-				num += drm_add_edid_modes(connector, p->edid);
+				num += drm_edid_connector_add_modes(connector);
 			}
 		}
 
@@ -981,8 +984,8 @@ static void panel_edp_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
-	kfree(panel->edid);
-	panel->edid = NULL;
+	drm_edid_free(panel->drm_edid);
+	panel->drm_edid = NULL;
 }
 
 static void panel_edp_shutdown(struct device *dev)
-- 
2.39.2

