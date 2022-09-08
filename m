Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 738695B255A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BF510EB90;
	Thu,  8 Sep 2022 18:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53FD10EB93
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 18:10:17 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWLyh-0007bC-H7; Thu, 08 Sep 2022 20:10:15 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/etnaviv: export client GPU usage statistics via fdinfo
Date: Thu,  8 Sep 2022 20:10:13 +0200
Message-Id: <20220908181013.3214205-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908181013.3214205-1-l.stach@pengutronix.de>
References: <20220908181013.3214205-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This exposes a accumulated GPU active time per client via the
fdinfo infrastructure.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 38 ++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index b69edb40ae2a..11b1f11fcb58 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -22,6 +22,7 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
+#include "common.xml.h"
 
 /*
  * DRM operations:
@@ -471,7 +472,42 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(fops);
+static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_file_private *ctx = file->driver_priv;
+	struct drm_printer p = drm_seq_file_printer(m);
+	int i;
+
+	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
+	drm_printf(&p, "drm-client-id:\t%u\n", ctx->id);
+
+	for (i = 0; i < ETNA_MAX_PIPES; i++) {
+                struct etnaviv_gpu *gpu = priv->gpu[i];
+		char engine[8];
+		int cur = 0;
+
+		if (!gpu)
+			continue;
+
+		if (gpu->identity.features & chipFeatures_PIPE_2D)
+			cur = snprintf(engine, sizeof(engine), "2D");
+		if (gpu->identity.features & chipFeatures_PIPE_3D)
+			cur = snprintf(engine + cur, sizeof(engine) - cur,
+				       "%s3D", cur ? "/" : "");
+
+		drm_printf(&p, "drm-engine-%s:\t%llu ns\n", engine,
+			   ctx->sched_entity[i].elapsed_ns);
+	}
+}
+
+static const struct file_operations fops = {
+        .owner = THIS_MODULE,
+        DRM_GEM_FOPS,
+        .show_fdinfo = etnaviv_fop_show_fdinfo,
+};
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
-- 
2.30.2

