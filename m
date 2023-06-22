Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B808A739CCA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168B210E549;
	Thu, 22 Jun 2023 09:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB7610E523
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by michel.telenet-ops.be with bizsmtp
 id C9Nk2A00Q1yfRTD069NkE2; Thu, 22 Jun 2023 11:22:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWY-000Bxr-C9;
 Thu, 22 Jun 2023 11:22:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003VyW-Uu;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 37/39] drm: renesas: shmobile: Remove internal CRTC state
 tracking
Date: Thu, 22 Jun 2023 11:21:49 +0200
Message-Id: <7a758de388d2f904ac94eb256d815bb6b7bc6663.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now the suspend/resume methods no longer need to look at internal driver
state, the dpms and started fields in the shmob_drm_crtc structure can
be removed, as well as the shmob_drm_crtc_dpms() wrapper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 35 ++++---------------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  3 --
 2 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index b11bb666de3bac46..f2332bb0fbbd51a1 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -196,9 +196,6 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	u32 value;
 	int ret;
 
-	if (scrtc->started)
-		return;
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return;
@@ -252,8 +249,6 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 
 	/* Turn vertical blank interrupt reporting back on. */
 	drm_crtc_vblank_on(crtc);
-
-	scrtc->started = true;
 }
 
 /* -----------------------------------------------------------------------------
@@ -314,9 +309,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
-	if (!scrtc->started)
-		return;
-
 	/*
 	 * Disable vertical blank interrupt reporting.  We first need to wait
 	 * for page flip completion before stopping the CRTC as userspace
@@ -335,8 +327,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	shmob_drm_clk_off(sdev);
 
 	pm_runtime_put(sdev->dev);
-
-	scrtc->started = false;
 }
 
 static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
@@ -344,21 +334,6 @@ static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
 	return container_of(crtc, struct shmob_drm_crtc, base);
 }
 
-static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
-{
-	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-
-	if (scrtc->dpms == mode)
-		return;
-
-	if (mode == DRM_MODE_DPMS_ON)
-		shmob_drm_crtc_start(scrtc);
-	else
-		shmob_drm_crtc_stop(scrtc);
-
-	scrtc->dpms = mode;
-}
-
 static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -378,13 +353,17 @@ static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					 struct drm_atomic_state *state)
 {
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
+
+	shmob_drm_crtc_start(scrtc);
 }
 
 static void shmob_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 					  struct drm_atomic_state *state)
 {
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
+
+	shmob_drm_crtc_stop(scrtc);
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
@@ -476,8 +455,6 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 
 	init_waitqueue_head(&sdev->crtc.flip_wait);
 
-	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
-
 	primary = shmob_drm_plane_create(sdev, 0);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index 37380c815f1f5a08..89a0746f9a35807d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -27,9 +27,6 @@ struct shmob_drm_crtc {
 
 	struct drm_pending_vblank_event *event;
 	wait_queue_head_t flip_wait;
-	int dpms;
-
-	bool started;
 };
 
 struct shmob_drm_connector {
-- 
2.34.1

