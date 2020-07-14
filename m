Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968EB21FF3D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90CB6E9D1;
	Tue, 14 Jul 2020 20:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0F6E9A0;
 Tue, 14 Jul 2020 20:58:33 +0000 (UTC)
IronPort-SDR: gHepiMO77TiGKW9oKSK4670xM1hhxFWTtWK7pIYbSpdUzRb3jcnqNgAbQUp0vY9pp0xduinej7
 dpTSfz1MyY3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444578"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444578"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:33 -0700
IronPort-SDR: ySOVHe7dTJicmefZdg3A8Lm/iZY79B6kdRDwc2YrXcV7P0h3hf/8BcMzzbeadQYfIf4N0RtdAF
 oZQ2jpqd9K0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504178"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:32 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 28/59] drm/kmb: Changed MMIO size
Date: Tue, 14 Jul 2020 13:57:14 -0700
Message-Id: <1594760265-11618-29-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
 drivers/gpu/drm/kmb/kmb_drv.c  | 16 ++++++++++++++--
 drivers/gpu/drm/kmb/kmb_regs.h |  6 +++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 4afdb9c..d13552a 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -29,6 +29,7 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
+#define DEBUG
 /*IRQ handler*/
 static irqreturn_t kmb_isr(int irq, void *arg);
 
@@ -327,6 +328,7 @@ static int kmb_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 
 	kmb_setup_mode_config(drm);
+	DRM_DEBUG("kmb_bind : after kmb_setup_mode_config\n");
 	ret = kmb_load(drm, 0);
 	if (ret)
 		goto err_free;
@@ -439,17 +441,27 @@ static int kmb_probe(struct platform_device *pdev)
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
index 85b55cb..e98e144 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -13,9 +13,9 @@
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
