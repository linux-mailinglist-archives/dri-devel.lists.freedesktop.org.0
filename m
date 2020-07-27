Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A022E3D7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8506E141;
	Mon, 27 Jul 2020 02:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15F16E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:17 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65FDF1AF1;
 Mon, 27 Jul 2020 04:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815633;
 bh=pvJTSks2GGeqcEhD+F9Gjz6+OkxYuILCL6WTdxIdgrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RsbP+LTk4QSZYCXNoEIF6BAo7yCiPO1WWH1lJidkyGExa0Z7vYh1daozZ+jA6GPIL
 NHDcEZMouDHR+rZ1VD4gCh2v7swvEug2lcBtY0GehYkNvagyuIJQecFxAI/0oA8KON
 SYB5EWSFSQetglE8LIooWZjdr+j9kGEoNzMg+nzs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/22] drm: mxsfb: Remove unneeded includes
Date: Mon, 27 Jul 2020 05:06:41 +0300
Message-Id: <20200727020654.8231-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A fair number of includes are not needed. Drop them, and add a couple of
required includes that were included indirectly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 12 +++---------
 drivers/gpu/drm/mxsfb/mxsfb_drv.c  |  5 -----
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index aef72adabf41..c4f1575b4210 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -10,19 +10,13 @@
 
 #include <linux/clk.h>
 #include <linux/iopoll.h>
-#include <linux/of_graph.h>
-#include <linux/platform_data/simplefb.h>
+#include <linux/spinlock.h>
 
-#include <video/videomode.h>
-
-#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_cma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_of.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 689f50b1ef68..0ee9e5cd492b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -9,15 +9,10 @@
  */
 
 #include <linux/clk.h>
-#include <linux/component.h>
 #include <linux/dma-mapping.h>
-#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_graph.h>
-#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
-#include <linux/dma-resv.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
