Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F67582DF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03AF10E39B;
	Tue, 18 Jul 2023 16:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1C110E389
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by xavier.telenet-ops.be with bizsmtp
 id Ngus2A0031C8whw01gus1Y; Tue, 18 Jul 2023 18:54:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001na6-Qs;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000geJ-Rh;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 40/41] drm: renesas: shmobile: Atomic conversion part 3
Date: Tue, 18 Jul 2023 18:54:45 +0200
Message-Id: <7d43277a392ca26f197451296ffb910a001476f0.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Complete the conversion to atomic mode setting by converting the
connector, and setting the DRIVER_ATOMIC flag.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 5 +----
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index e4d176b1f47654a8..729028a15efae00c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -501,7 +501,6 @@ static void shmob_drm_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = shmob_drm_connector_destroy,
@@ -581,9 +580,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 	if (ret < 0)
 		goto error;
 
-	drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
-	drm_object_property_set_value(&connector->base,
-		sdev->ddev.mode_config.dpms_property, DRM_MODE_DPMS_OFF);
+	connector->dpms = DRM_MODE_DPMS_OFF;
 
 	sdev->connector = connector;
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index b7643884b49f0bc8..58a16efde4e3cb4f 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -98,7 +98,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
 DEFINE_DRM_GEM_DMA_FOPS(shmob_drm_fops);
 
 static const struct drm_driver shmob_drm_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	DRM_GEM_DMA_DRIVER_OPS,
 	.fops			= &shmob_drm_fops,
 	.name			= "shmob-drm",
-- 
2.34.1

