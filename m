Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B87229934
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122FA892E5;
	Wed, 22 Jul 2020 13:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873EB6E049
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 13:30:47 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEpa-0002o0-5T; Wed, 22 Jul 2020 15:30:46 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/imx: drop explicit drm_mode_config_cleanup
Date: Wed, 22 Jul 2020 15:30:35 +0200
Message-Id: <20200722133042.30140-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_mode_config_init() and drop the explicit calls to
drm_mode_config_cleanup().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 3421043a558d..d10887b9b2e4 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -20,6 +20,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -222,7 +223,9 @@ static int imx_drm_bind(struct device *dev)
 	drm->mode_config.allow_fb_modifiers = true;
 	drm->mode_config.normalize_zpos = true;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	ret = drm_vblank_init(drm, MAX_CRTC);
 	if (ret)
@@ -261,7 +264,6 @@ static int imx_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 	component_unbind_all(drm->dev, drm);
 err_kms:
-	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
 
 	return ret;
@@ -277,11 +279,9 @@ static void imx_drm_unbind(struct device *dev)
 
 	component_unbind_all(drm->dev, drm);
 
-	drm_mode_config_cleanup(drm);
+	drm_dev_put(drm);
 
 	dev_set_drvdata(dev, NULL);
-
-	drm_dev_put(drm);
 }
 
 static const struct component_master_ops imx_drm_ops = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
