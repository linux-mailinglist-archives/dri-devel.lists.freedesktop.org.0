Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C353D84AE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6816EA21;
	Wed, 28 Jul 2021 00:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507C56EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:31:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="234430361"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="234430361"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:31:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583284"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:31:47 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 01/14] drm/kmb: Enable LCD DMA for low TVDDCV
Date: Tue, 27 Jul 2021 17:31:13 -0700
Message-Id: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Edmund Dea <edmund.j.dea@intel.com>

There's an undocumented dependency between LCD layer enable bits [2-5]
and the AXI pipelined read enable bit [28] in the LCD_CONTROL register.
The proper order of operation is:

1) Clear AXI pipelined read enable bit
2) Set LCD layers
3) Set AXI pipelined read enable bit

With this update, LCD can start DMA when TVDDCV is reduced down to 700mV.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   | 14 ++++++++++++++
 drivers/gpu/drm/kmb/kmb_plane.c | 15 +++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 96ea1a2c11dd..c0b1c6f99249 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -203,6 +203,7 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 	unsigned long status, val, val1;
 	int plane_id, dma0_state, dma1_state;
 	struct kmb_drm_private *kmb = to_kmb(dev);
+	u32 ctrl = 0;
 
 	status = kmb_read_lcd(kmb, LCD_INT_STATUS);
 
@@ -227,6 +228,19 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
 						    kmb->plane_status[plane_id].ctrl);
 
+				ctrl = kmb_read_lcd(kmb, LCD_CONTROL);
+				if (!(ctrl & (LCD_CTRL_VL1_ENABLE |
+				    LCD_CTRL_VL2_ENABLE |
+				    LCD_CTRL_GL1_ENABLE |
+				    LCD_CTRL_GL2_ENABLE))) {
+					/* If no LCD layers are using DMA,
+					 * then disable DMA pipelined AXI read
+					 * transactions.
+					 */
+					kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
+							    LCD_CTRL_PIPELINE_DMA);
+				}
+
 				kmb->plane_status[plane_id].disable = false;
 			}
 		}
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index d5b6195856d1..2888dd5dcc2c 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -427,8 +427,14 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
 
-	/* FIXME no doc on how to set output format,these values are
-	 * taken from the Myriadx tests
+	/* Enable pipeline AXI read transactions for the DMA
+	 * after setting graphics layers. This must be done
+	 * in a separate write cycle.
+	 */
+	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_PIPELINE_DMA);
+
+	/* FIXME no doc on how to set output format,these values are taken
+	 * from the Myriadx tests
 	 */
 	out_format |= LCD_OUTF_FORMAT_RGB888;
 
@@ -526,6 +532,11 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 		plane->id = i;
 	}
 
+	/* Disable pipeline AXI read transactions for the DMA
+	 * prior to setting graphics layers
+	 */
+	kmb_clr_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_PIPELINE_DMA);
+
 	return primary;
 cleanup:
 	drmm_kfree(drm, plane);
-- 
2.25.1

