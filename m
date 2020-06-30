Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A820FEF0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E765D6E444;
	Tue, 30 Jun 2020 21:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC806E317;
 Tue, 30 Jun 2020 21:28:46 +0000 (UTC)
IronPort-SDR: 4sd21iWc5G9lQ42CaWeloChLEn01mUu48/opOxehJoj2roiHVVLGVGWzFSTIuiFDXusFEw9gHl
 3JciTPt1JOrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144554778"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="144554778"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:46 -0700
IronPort-SDR: +k+Xv6Nmwy26PN1sREQ8SezwOihJxLJZ6n888H+6q+0rSAmkQDx6c1LhHvQSPSmPNvdIhfSIzI
 UBLGR8y47mqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066727"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:45 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 28/59] drm/kmb: Changed MMIO size
Date: Tue, 30 Jun 2020 14:27:40 -0700
Message-Id: <1593552491-23698-29-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also added debug messages

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c  | 19 +++++++++++++++++--
 drivers/gpu/drm/kmb/kmb_regs.h |  6 +++---
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index b1cc8ad..b4e1e50 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -49,6 +49,7 @@
 #include "kmb_plane.h"
 #include "kmb_dsi.h"
 
+#define DEBUG
 /*IRQ handler*/
 static irqreturn_t kmb_isr(int irq, void *arg);
 
@@ -331,18 +332,22 @@ static int kmb_drm_bind(struct device *dev)
 	struct kmb_drm_private *lcd;
 	int ret;
 
+	DRM_DEBUG("kmb_bind : ENTER\n");
 	drm = drm_dev_alloc(&kmb_driver, dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	DRM_DEBUG("kmb_bind : after alloc drm\n");
 	lcd = devm_kzalloc(dev, sizeof(*lcd), GFP_KERNEL);
 	if (!lcd)
 		return -ENOMEM;
 
+	DRM_DEBUG("kmb_bind : after alloc lcd\n");
 	drm->dev_private = lcd;
 	dev_set_drvdata(dev, drm);
 
 	kmb_setup_mode_config(drm);
+	DRM_DEBUG("kmb_bind : after kmb_setup_mode_config\n");
 	ret = kmb_load(drm, 0);
 	if (ret)
 		goto err_free;
@@ -455,17 +460,27 @@ static int kmb_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
 	struct component_match *match = NULL;
+	int ret;
 
 	/* there is only one output port inside each device, find it */
+	DRM_DEBUG("%s : ENTER", __func__);
+
 	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
+	DRM_DEBUG("%s : port = 0x%pOF\n", __func__, port);
 	if (!port)
 		return -ENODEV;
 
+	DRM_DEBUG("%s : after get_remote", __func__);
+	DRM_DEBUG("Adding component %pOF\n", port);
 	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
+	DRM_DEBUG("%s : after get_match", __func__);
 	of_node_put(port);
 
-	return component_master_add_with_match(&pdev->dev, &kmb_master_ops,
-					       match);
+	 ret = component_master_add_with_match(&pdev->dev, &kmb_master_ops,
+					match);
+
+	DRM_DEBUG("%s : EXIT ret=%d\n", __func__, ret);
+	return ret;
 }
 
 static int kmb_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index bb80bc5..f8a7abf 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -33,9 +33,9 @@
 /*from Data Book section 12.11.6.1 page 4972 */
 #define LCD_BASE_ADDR                           (0x20930000)
 #define MSS_CAM_BASE_ADDR			(MIPI_BASE_ADDR + 0x10000)
-#define LCD_MMIO_SIZE				(0x10000)
-#define MIPI_MMIO_SIZE				(0x10000)
-#define MSS_CAM_MMIO_SIZE			(0x10000)
+#define LCD_MMIO_SIZE				(0x3000)
+#define MIPI_MMIO_SIZE				(0x4000)
+#define MSS_CAM_MMIO_SIZE			(0x10)
 
 /***************************************************************************
  *		   LCD controller control register defines
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
