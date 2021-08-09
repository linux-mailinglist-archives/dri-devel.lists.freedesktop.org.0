Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6362F3E3DA0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199389956;
	Mon,  9 Aug 2021 01:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AFB89935
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:09 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94F0D49A;
 Mon,  9 Aug 2021 03:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472907;
 bh=5zs1aJkriQ2ywhVxdC9W+EgyY5f4IOkXmG5dyvdhwAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dZMAOPS8beQXu70F2ZXK9/z3mBr93YgZszfe4de4gEQhNTr40t67v/A5VC09t84nC
 tBqV5sXYxdoJh7n1ENKV2NANUFOKqaQE4aXmTSvBq4c5v1wg195YZQHKS+gGmvZvvB
 w7Czzkq8jOHo7mIcaz59iHNLrBLEHDXNtkAVcsxc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 10/36] drm: xlnx: zynqmp_dpsub: Report HPD through the bridge
Date: Mon,  9 Aug 2021 04:34:31 +0300
Message-Id: <20210809013457.11266-11-laurent.pinchart@ideasonboard.com>
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

Now that the driver uses the connector bridge helper, HPD can be
reported directly for the connector through the drm_bridge_hpd_notify()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index eb05feef5d30..363015d248ab 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -17,7 +17,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
 
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -1533,12 +1532,12 @@ void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp)
 
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

