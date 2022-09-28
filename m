Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41665EE9B3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6AD10E7AC;
	Wed, 28 Sep 2022 22:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8718A10E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1CC647C;
 Thu, 29 Sep 2022 00:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405292;
 bh=lylZQCEQc05RmSbwuyVzKRy40f0MhgDQKfa4CwKu01Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rojzPtkvcajrrTr0yz7a+H9FtMboLSSRAuvlexYZGh4sgAO9WJiuHZfGhAwgN1lg7
 ubnOJFiO+149gta+94rr13F2vXFobnctHIw7vNCJpIFmQTvsJOkL4wnihV7qAGwEXN
 sjgEQoB3qGWJk9c4qvCJYAqRWcjXO+4cHln6aMX0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 31/37] drm: xlnx: zynqmp_dpsub: Rename
 zynqmp_dpsub_handle_vblank with DRM prefix
Date: Thu, 29 Sep 2022 01:47:13 +0300
Message-Id: <20220928224719.3291-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
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
index 001bc24f92bd..5424f955be28 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1581,7 +1581,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
 
 	if (status & ZYNQMP_DP_INT_VBLANK_START)
-		zynqmp_dpsub_handle_vblank(dp->dpsub);
+		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
 
 	if (status & ZYNQMP_DP_INT_HPD_EVENT)
 		schedule_delayed_work(&dp->hpd_work, 0);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 746eeb824d30..df7f8e0c9eba 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -339,13 +339,13 @@ static void zynqmp_dpsub_map_crtc_to_plane(struct zynqmp_dpsub *dpsub)
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
index b5cb27159162..01be96b00e3f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -38,7 +38,7 @@ struct zynqmp_dpsub_drm {
 	struct drm_encoder encoder;
 };
 
-void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub);
+void zynqmp_dpsub_drm_handle_vblank(struct zynqmp_dpsub *dpsub);
 
 int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub);
 void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub);
-- 
Regards,

Laurent Pinchart

