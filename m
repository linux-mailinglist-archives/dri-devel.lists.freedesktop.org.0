Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BE17E958
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A1B6E558;
	Mon,  9 Mar 2020 19:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F676E53E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:11 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8AA93C97;
 Mon,  9 Mar 2020 20:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783589;
 bh=zOycqsqrxsFfisDpJnhmuu2kjVqI6pYiO42MTH/9Llo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j/uvQ+xe1rDZ1GK54noAmXZtAxabe2/1cp2XtfLU70thAkZovVWLUGhPTizFJc1Bo
 7/rJAqIgIK54jLMptdCLXD+0htlAtRlygVjLKyLyT51ZgEnHclBp5LAAXH7hCIA34l
 /uTUjTKNLmOdHzYVTuMKkObU+4trnfHOYObH+d0g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/21] drm: mxsfb: Remove unneeded includes
Date: Mon,  9 Mar 2020 21:52:04 +0200
Message-Id: <20200309195216.31042-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A fair number of includes are not needed. Drop them, and add a couple of
required includes that were included indirectly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
index cffc70257bd3..204c1e52e9aa 100644
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
