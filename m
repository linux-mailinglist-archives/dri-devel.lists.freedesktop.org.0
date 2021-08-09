Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE73E3DAD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EB689A34;
	Mon,  9 Aug 2021 01:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A223899AB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:18 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D11A24A1;
 Mon,  9 Aug 2021 03:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472917;
 bh=EwzZOZ5ALjHZMg4Dxl+vX/9TQDmXEQ7tVlhNFshmmfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q+57H1tjZYyZmBUquU5AuvrELZwxYuhfuBAaV+ZDbDzz2rGQeSQor/WeYLI+qv8hF
 aBgCSLUI69bge93zK1MiSD1C3fvLTPYei4xjIH+o1sh2tR8wysTY3Va9WJKmkmtV99
 tvHqKpIO+wRmdi9hH0tdge5XWNbxTihzel0WNJec=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 30/36] drm: xlnx: zynqmp_dpsub: Rename
 zynqmp_dpsub_handle_vblank with DRM prefix
Date: Mon,  9 Aug 2021 04:34:51 +0300
Message-Id: <20210809013457.11266-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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

The better convey its purpose, rename the zynqmp_dpsub_handle_vblank()
function that belongs to the DRM layer to
zynqmp_dpsub_drm_handle_vblank().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c  | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 ++--
 drivers/gpu/drm/xlnx/zynqmp_kms.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25cde59b1e05..09254e9c75cd 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1580,7 +1580,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
 
 	if (status & ZYNQMP_DP_INT_VBLANK_START)
-		zynqmp_dpsub_handle_vblank(dp->dpsub);
+		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
 
 	if (status & ZYNQMP_DP_INT_HPD_EVENT)
 		schedule_delayed_work(&dp->hpd_work, 0);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 35093f41c532..922d6c80c16b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -338,13 +338,13 @@ static void zynqmp_dpsub_map_crtc_to_plane(struct zynqmp_dpsub *dpsub)
 }
 
 /**
- * zynqmp_dpsub_handle_vblank - Handle the vblank event
+ * zynqmp_dpsub_drm_handle_vblank - Handle the vblank event
  * @dpsub: DisplayPort subsystem
  *
  * This function handles the vblank interrupt, and sends an event to
  * CRTC object. This will be called by the DP vblank interrupt handler.
  */
-void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub)
+void zynqmp_dpsub_drm_handle_vblank(struct zynqmp_dpsub *dpsub)
 {
 	drm_crtc_handle_vblank(&dpsub->drm->crtc);
 }
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
index 9674ce2e544d..1e01dbcb067c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -40,7 +40,7 @@ struct zynqmp_dpsub_drm {
 	struct drm_connector *connector;
 };
 
-void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub);
+void zynqmp_dpsub_drm_handle_vblank(struct zynqmp_dpsub *dpsub);
 
 int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub);
 void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub);
-- 
Regards,

Laurent Pinchart

