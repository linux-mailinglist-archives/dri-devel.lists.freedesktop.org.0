Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1A7582D7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CC210E388;
	Tue, 18 Jul 2023 16:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B9410E397
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by michel.telenet-ops.be with bizsmtp
 id Ngur2A00J0ucMBo06gurXM; Tue, 18 Jul 2023 18:54:52 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nYz-Fq;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gd1-H1;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 24/41] drm: renesas: shmobile: Use media bus formats in
 platform data
Date: Tue, 18 Jul 2023 18:54:29 +0200
Message-Id: <a3272a3e0953d7a9fd59dad737595efccabea5a0.1689698048.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the custom shmob_drm_interface enumeration values with standard
media bus formats.  This simplifies driver handling of bus formats and
prepares for DT support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Keep table instead of replacing it by a switch() statement,
  - Fix shmob_drm_interface_data.bus_fmt comment.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 37 +++++++++++--------
 include/linux/platform_data/shmob_drm.h       | 13 +------
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index c9ac8a86a7c39097..08b254f0f2874786 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -34,25 +35,31 @@
 
 static int shmob_drm_init_interface(struct shmob_drm_device *sdev)
 {
-	static const u32 ldmt1r[] = {
-		[SHMOB_DRM_IFACE_RGB8] = LDMT1R_MIFTYP_RGB8,
-		[SHMOB_DRM_IFACE_RGB9] = LDMT1R_MIFTYP_RGB9,
-		[SHMOB_DRM_IFACE_RGB12A] = LDMT1R_MIFTYP_RGB12A,
-		[SHMOB_DRM_IFACE_RGB12B] = LDMT1R_MIFTYP_RGB12B,
-		[SHMOB_DRM_IFACE_RGB16] = LDMT1R_MIFTYP_RGB16,
-		[SHMOB_DRM_IFACE_RGB18] = LDMT1R_MIFTYP_RGB18,
-		[SHMOB_DRM_IFACE_RGB24] = LDMT1R_MIFTYP_RGB24,
-		[SHMOB_DRM_IFACE_YUV422] = LDMT1R_MIFTYP_YCBCR,
+	static const struct {
+		u32 fmt;
+		u32 ldmt1r;
+	} bus_fmts[] = {
+		{ MEDIA_BUS_FMT_RGB888_3X8,	 LDMT1R_MIFTYP_RGB8 },
+		{ MEDIA_BUS_FMT_RGB666_2X9_BE,	 LDMT1R_MIFTYP_RGB9 },
+		{ MEDIA_BUS_FMT_RGB888_2X12_BE,	 LDMT1R_MIFTYP_RGB12A },
+		{ MEDIA_BUS_FMT_RGB444_1X12,	 LDMT1R_MIFTYP_RGB12B },
+		{ MEDIA_BUS_FMT_RGB565_1X16,	 LDMT1R_MIFTYP_RGB16 },
+		{ MEDIA_BUS_FMT_RGB666_1X18,	 LDMT1R_MIFTYP_RGB18 },
+		{ MEDIA_BUS_FMT_RGB888_1X24,	 LDMT1R_MIFTYP_RGB24 },
+		{ MEDIA_BUS_FMT_UYVY8_1X16,	 LDMT1R_MIFTYP_YCBCR },
 	};
+	unsigned int i;
 
-	if (sdev->pdata->iface.interface >= ARRAY_SIZE(ldmt1r)) {
-		dev_err(sdev->dev, "invalid interface type %u\n",
-			sdev->pdata->iface.interface);
-		return -EINVAL;
+	for (i = 0; i < ARRAY_SIZE(bus_fmts); i++) {
+		if (bus_fmts[i].fmt == sdev->pdata->iface.bus_fmt) {
+			sdev->ldmt1r = bus_fmts[i].ldmt1r;
+			return 0;
+		}
 	}
 
-	sdev->ldmt1r = ldmt1r[sdev->pdata->iface.interface];
-	return 0;
+	dev_err(sdev->dev, "unsupported bus format 0x%x\n",
+		sdev->pdata->iface.bus_fmt);
+	return -EINVAL;
 }
 
 static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
index f3cb19ff9f818aca..6c19d4fbbe39586b 100644
--- a/include/linux/platform_data/shmob_drm.h
+++ b/include/linux/platform_data/shmob_drm.h
@@ -18,17 +18,6 @@ enum shmob_drm_clk_source {
 	SHMOB_DRM_CLK_EXTERNAL,
 };
 
-enum shmob_drm_interface {
-	SHMOB_DRM_IFACE_RGB8,		/* 24bpp, 8:8:8 */
-	SHMOB_DRM_IFACE_RGB9,		/* 18bpp, 9:9 */
-	SHMOB_DRM_IFACE_RGB12A,		/* 24bpp, 12:12 */
-	SHMOB_DRM_IFACE_RGB12B,		/* 12bpp */
-	SHMOB_DRM_IFACE_RGB16,		/* 16bpp */
-	SHMOB_DRM_IFACE_RGB18,		/* 18bpp */
-	SHMOB_DRM_IFACE_RGB24,		/* 24bpp */
-	SHMOB_DRM_IFACE_YUV422,		/* 16bpp */
-};
-
 struct shmob_drm_panel_data {
 	unsigned int width_mm;		/* Panel width in mm */
 	unsigned int height_mm;		/* Panel height in mm */
@@ -36,7 +25,7 @@ struct shmob_drm_panel_data {
 };
 
 struct shmob_drm_interface_data {
-	enum shmob_drm_interface interface;
+	unsigned int bus_fmt;		/* MEDIA_BUS_FMT_* */
 	unsigned int clk_div;
 };
 
-- 
2.34.1

