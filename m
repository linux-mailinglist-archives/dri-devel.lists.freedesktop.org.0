Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B444D712E
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 22:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90010E095;
	Sat, 12 Mar 2022 21:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CD2310E095
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 21:54:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; d="scan'208";a="114196808"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id A20074005E2B;
 Sun, 13 Mar 2022 06:54:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/7] drm: rcar-du: Move rcar_du_output_name() to
 rcar_du_common.c
Date: Sat, 12 Mar 2022 21:54:14 +0000
Message-Id: <20220312215417.8023-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
References: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L SoC's does not have group/plane registers compared to RCar, hence it
needs a different CRTC implementation.

Move rcar_du_output_name() to a new common file rcar_du_common.c, So that
the same function can be reused by RZ/G2L SoC later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 New patch
---
 drivers/gpu/drm/rcar-du/Makefile         |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_common.c | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 20 ----------------
 3 files changed, 31 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 5b5d9b1821f7..7475c329e2cf 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 rcar-du-drm-y := rcar_du_crtc.o \
+		 rcar_du_common.o \
 		 rcar_du_drv.o \
 		 rcar_du_encoder.o \
 		 rcar_du_group.o \
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_common.c b/drivers/gpu/drm/rcar-du/rcar_du_common.c
new file mode 100644
index 000000000000..f9f9908cda6d
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_common.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rcar_du_common.c  --  R-Car Display Unit Common
+ *
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include "rcar_du_drv.h"
+
+const char *rcar_du_output_name(enum rcar_du_output output)
+{
+	static const char * const names[] = {
+		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
+		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
+		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
+		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
+		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
+		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
+		[RCAR_DU_OUTPUT_TCON] = "TCON",
+	};
+
+	if (output >= ARRAY_SIZE(names) || !names[output])
+		return "UNKNOWN";
+
+	return names[output];
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4640c356a532..f6e234dafb72 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -591,26 +591,6 @@ static const struct of_device_id rcar_du_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 
-const char *rcar_du_output_name(enum rcar_du_output output)
-{
-	static const char * const names[] = {
-		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
-		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
-		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
-		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
-		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
-		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
-		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
-		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
-		[RCAR_DU_OUTPUT_TCON] = "TCON",
-	};
-
-	if (output >= ARRAY_SIZE(names) || !names[output])
-		return "UNKNOWN";
-
-	return names[output];
-}
-
 /* -----------------------------------------------------------------------------
  * DRM operations
  */
-- 
2.17.1

