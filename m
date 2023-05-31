Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E187718987
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F7310E1E7;
	Wed, 31 May 2023 18:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C29610E073
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 18:45:32 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q4Qp8-0006ld-4S; Wed, 31 May 2023 20:45:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: [PATCH 2/2] drm: lcdif: force modeset when FB format changes
Date: Wed, 31 May 2023 20:45:27 +0200
Message-Id: <20230531184527.1220305-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531184527.1220305-1-l.stach@pengutronix.de>
References: <20230531184527.1220305-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
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
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index bbea44ee7a66..aa2eecdecb28 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -573,18 +573,32 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
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

