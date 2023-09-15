Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0C7A1996
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BA610E5EF;
	Fri, 15 Sep 2023 08:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974EC10E5E4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:18 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by andre.telenet-ops.be with bizsmtp
 id m8uF2A00Z1C8whw018uFew; Fri, 15 Sep 2023 10:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aK-003lIW-9l;
 Fri, 15 Sep 2023 10:54:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ad-00Gddo-AT;
 Fri, 15 Sep 2023 10:54:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 40/41] drm: renesas: shmobile: Atomic conversion part 3
Date: Fri, 15 Sep 2023 10:53:55 +0200
Message-Id: <042f9ff076c4b1c87235c74c8b76c9d161e126ec.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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
v4:
  - No changes,

v3:
  - No changes,

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
index 283e953e21d34bc2..c498d0d9b4fc4fc5 100644
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

