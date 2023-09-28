Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094957B1B49
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24410E627;
	Thu, 28 Sep 2023 11:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC39410E626
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:36:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJm-0001sZ-Ei; Thu, 28 Sep 2023 13:36:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJl-009Z8S-VA; Thu, 28 Sep 2023 13:36:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 8/8] drm: lcdif: force modeset when FB format changes
Date: Thu, 28 Sep 2023 13:36:29 +0200
Message-Id: <20230928113629.103188-8-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113629.103188-1-l.stach@pengutronix.de>
References: <20230928113629.103188-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force a modeset if the new FB has a different format than the
currently active one. While it might be possible to change between
compatible formats without a full modeset as the format control is
also supposed to be double buffered, the colorspace conversion is
not, so when the CSC changes we need a modeset.

For now just always force a modeset when the FB format changes to
properly reconfigure all parts of the device for the new format.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Marek Vasut <marex@denx.de>
---
v3: no changes
v2: fix indentation
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++++++++++++++++-
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 9df278adf3e8..667d3a4716b0 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -30,9 +30,25 @@
 #include "lcdif_drv.h"
 #include "lcdif_regs.h"
 
+static int lcdif_atomic_check(struct drm_device *dev,
+			      struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	/*
+	 * Check modeset again in case crtc_state->mode_changed is
+	 * updated in plane's ->atomic_check callback.
+	 */
+	return drm_atomic_helper_check_modeset(dev, state);
+}
+
 static const struct drm_mode_config_funcs lcdif_mode_config_funcs = {
 	.fb_create		= drm_gem_fb_create,
-	.atomic_check		= drm_atomic_helper_check,
+	.atomic_check		= lcdif_atomic_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index c3e31fa0335e..f98b9d8e3aa4 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -649,18 +649,32 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs = {
 static int lcdif_plane_atomic_check(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
-									     plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
 	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	/* always okay to disable the plane */
+	if (!new_state->fb)
+		return 0;
 
 	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   &lcdif->crtc);
 
-	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						   DRM_PLANE_NO_SCALING,
-						   DRM_PLANE_NO_SCALING,
-						   false, true);
+	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, true);
+	if (ret)
+		return ret;
+
+	if (old_state->fb && new_state->fb->format != old_state->fb->format)
+		crtc_state->mode_changed = true;
+
+	return 0;
 }
 
 static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
-- 
2.39.2

