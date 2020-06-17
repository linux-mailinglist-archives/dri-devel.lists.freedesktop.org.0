Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B6F1FD260
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7976E97F;
	Wed, 17 Jun 2020 16:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0536E977
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:40:51 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8092AC3;
 Wed, 17 Jun 2020 18:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592412047;
 bh=BiBz8BAHWaDSM90Mrx9zkTHBl00DzMyXkQuDKTDs1qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7+hl1WEXCvgdVnfuFvsNDvrPh+K1XBevypzJjEH/W3QY9H8z0u1bxfF/zr98uLb9
 n674fSUQxCFqIGFgvsQWx1G2XBB0a9+LhQnzDpNBtWuOlRRT3akmPJ5iEvbrI2Nie2
 yKxK3Y2xmen3ScrfqrDdston/rmQykt5jxSzh5JQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/22] drm: mxsfb: Remove unneeded includes
Date: Wed, 17 Jun 2020 19:40:02 +0300
Message-Id: <20200617164015.30448-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
References: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, robert.chiras@nxp.com, leonard.crestez@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de
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
index d3de45735237..522680f84874 100644
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
