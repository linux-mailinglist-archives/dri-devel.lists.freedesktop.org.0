Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586347A9E91
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 22:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D152110E610;
	Thu, 21 Sep 2023 20:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F41610E60E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 20:03:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qjPtI-0000PB-Ps; Thu, 21 Sep 2023 22:03:12 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qjPtI-00804q-Cn; Thu, 21 Sep 2023 22:03:12 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the atomic
 commit
Date: Thu, 21 Sep 2023 22:03:09 +0200
Message-Id: <20230921200312.3989073-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921200312.3989073-1-l.stach@pengutronix.de>
References: <20230921200312.3989073-1-l.stach@pengutronix.de>
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

drm_atomic_helper_commit_tail_rpm makes it hard for drivers to follow
the documented encoder/bridge enable flow, as it commits all CRTC enables
before the planes are fully set up, so drivers that can't enable the
display link without valid plane setup either need to do the plane setup
in the CRTC enable or violate the flow by enabling the display link after
the planes have been set up. Neither of those options seem like a good
idea.

For devices that only do coarse-grained runtime PM for the whole display
controller and not per CRTC, like the i.MX LCDIF, we can handle hardware
wakeup and suspend in the atomic_commit_tail. Add a commit tail which
follows the more conventional atomic commit flow of first diabling any
unused CRTCs, setting up all the active plane state, then enable all
active display pipes and also handles the device runtime PM at the
appropriate times.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: new patch
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++++++--
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 18de2f17e249..205f6855fb1b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -36,8 +36,28 @@ static const struct drm_mode_config_funcs lcdif_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
+void lcdif_commit_tail(struct drm_atomic_state *old_state)
+{
+	struct drm_device *drm = old_state->dev;
+
+	pm_runtime_get_sync(drm->dev);
+
+	drm_atomic_helper_commit_modeset_disables(drm, old_state);
+	drm_atomic_helper_commit_planes(drm, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+	drm_atomic_helper_commit_modeset_enables(drm, old_state);
+
+	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_wait_for_vblanks(drm, old_state);
+
+	pm_runtime_put(drm->dev);
+
+	drm_atomic_helper_cleanup_planes(drm, old_state);
+}
+
 static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = lcdif_commit_tail,
 };
 
 static const struct drm_encoder_funcs lcdif_encoder_funcs = {
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index e277592e5fa5..ccee5e28f236 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -540,7 +540,11 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
-	pm_runtime_get_sync(drm->dev);
+	/*
+	 * Update the RPM usage count, actual resume already happened in
+	 * lcdif_commit_tail wrapping all the atomic update.
+	 */
+	pm_runtime_get_noresume(drm->dev);
 
 	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
 
@@ -576,7 +580,11 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	spin_unlock_irq(&drm->event_lock);
 
-	pm_runtime_put_sync(drm->dev);
+	/*
+	 * Update the RPM usage count, actual suspend happens in
+	 * lcdif_commit_tail wrapping all the atomic update.
+	 */
+	pm_runtime_put(drm->dev);
 }
 
 static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
-- 
2.39.2

