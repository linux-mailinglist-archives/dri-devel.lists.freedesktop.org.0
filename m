Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF625EE991
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E87710E139;
	Wed, 28 Sep 2022 22:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B773210E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16E5147C;
 Thu, 29 Sep 2022 00:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405259;
 bh=xIvZ8XZu5IL62kFqUQ1SiKDDlDA6y1XQvCPGi0jvhSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WybRZeFmD5pGRiH2z9RJywjeywn/shGV1k03butrO4FiCesFeAC2yly2B/7uexB4o
 4f4cDi5oo6YQnQMNBUVC0W84Lhu41WFbQKTog2lc8WGnAbFPN3seB8qD4PJsn1Sv7o
 99vxarXR8DQ7QAWM+TlQtcZLVwd5cFlbZ3+ZIptE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/37] drm: xlnx: zynqmp_dpsub: Report HPD through the
 bridge
Date: Thu, 29 Sep 2022 01:46:52 +0300
Message-Id: <20220928224719.3291-11-laurent.pinchart@ideasonboard.com>
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

Now that the driver uses the connector bridge helper, HPD can be
reported directly for the connector through the drm_bridge_hpd_notify()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a18cb979be52..33fd69ed7550 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -17,7 +17,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
 
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -1534,12 +1533,12 @@ void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp)
 
 static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 {
-	struct zynqmp_dp *dp;
+	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
+					    hpd_work.work);
+	enum drm_connector_status status;
 
-	dp = container_of(work, struct zynqmp_dp, hpd_work.work);
-
-	if (dp->drm)
-		drm_helper_hpd_irq_event(dp->drm);
+	status = zynqmp_dp_bridge_detect(&dp->bridge);
+	drm_bridge_hpd_notify(&dp->bridge, status);
 }
 
 static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
-- 
Regards,

Laurent Pinchart

