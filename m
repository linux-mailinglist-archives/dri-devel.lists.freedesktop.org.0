Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676C16069B
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5229E6E2A9;
	Sun, 16 Feb 2020 21:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409FF6E4CB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:17 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13A8E40DD;
 Sun, 16 Feb 2020 22:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887052;
 bh=Ku55dVMpabRicIOMUCto4f4y+V/PyT7+0mB153Nl5gk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8lbm7Ajlby91d8cIwf2bTRlUulLuM6v4z7J20vHwEiYVKHFNj8anyq0Lp2XJrtnH
 VVmihoaPuUBWAhxAcN5Onw+0gMfWYAn02BLKHUUsEjBMwKk7dVggQQvtnqtiAq0AWk
 gcyhyWtL44yL1enYTiw/tcllUBRH47BAXEhs+CHQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 51/51] drm/omap: dss: Remove unused
 omapdss_of_find_connected_device() function
Date: Sun, 16 Feb 2020 23:03:08 +0200
Message-Id: <20200216210308.17312-52-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The omapdss_of_find_connected_device() function isn't used anymore,
remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/Makefile  |  2 +-
 drivers/gpu/drm/omapdrm/dss/dss-of.c  | 28 ---------------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 ---
 3 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/dss-of.c

diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapdrm/dss/Makefile
index 5950c3f52c2e..f967e6948f2e 100644
--- a/drivers/gpu/drm/omapdrm/dss/Makefile
+++ b/drivers/gpu/drm/omapdrm/dss/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_OMAP2_DSS_INIT) += omapdss-boot-init.o
 
 obj-$(CONFIG_OMAP_DSS_BASE) += omapdss-base.o
-omapdss-base-y := base.o display.o dss-of.o output.o
+omapdss-base-y := base.o display.o output.o
 
 obj-$(CONFIG_OMAP2_DSS) += omapdss.o
 # Core DSS files
diff --git a/drivers/gpu/drm/omapdrm/dss/dss-of.c b/drivers/gpu/drm/omapdrm/dss/dss-of.c
deleted file mode 100644
index b7981f3b80ad..000000000000
--- a/drivers/gpu/drm/omapdrm/dss/dss-of.c
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-#include <linux/err.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
-
-#include "omapdss.h"
-
-struct omap_dss_device *
-omapdss_of_find_connected_device(struct device_node *node, unsigned int port)
-{
-	struct device_node *remote_node;
-	struct omap_dss_device *dssdev;
-
-	remote_node = of_graph_get_remote_node(node, port, 0);
-	if (!remote_node)
-		return NULL;
-
-	dssdev = omapdss_find_device_by_node(remote_node);
-	of_node_put(remote_node);
-
-	return dssdev ? dssdev : ERR_PTR(-EPROBE_DEFER);
-}
-EXPORT_SYMBOL_GPL(omapdss_of_find_connected_device);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 6ecbc7273032..ab19d4af8de7 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -471,9 +471,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct omap_dss_device *
-omapdss_of_find_connected_device(struct device_node *node, unsigned int port);
-
 enum dss_writeback_channel {
 	DSS_WB_LCD1_MGR =	0,
 	DSS_WB_LCD2_MGR =	1,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
