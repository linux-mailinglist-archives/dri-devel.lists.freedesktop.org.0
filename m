Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6864726056
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F6D10E505;
	Wed,  7 Jun 2023 13:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5510E4F1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:28 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6snx-0004N0-3d; Wed, 07 Jun 2023 15:02:25 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 4/8] drm/etnaviv: make clock handling symetric between runtime
 resume and suspend
Date: Wed,  7 Jun 2023 15:02:19 +0200
Message-Id: <20230607130223.3533464-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607130223.3533464-1-l.stach@pengutronix.de>
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the clock is enabled in the runtime resume function, but are
disabled a level further down in the callstack in the suspend function.
Move the clock disable into the suspend function to make handling
symmetrical between resume and suspend.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 54a1249c5bca..57cf77ed2fcf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1632,7 +1632,7 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
 	} while (1);
 }
 
-static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
+static void etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 {
 	if (gpu->initialized && gpu->fe_running) {
 		/* Replace the last WAIT with END */
@@ -1651,8 +1651,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 	}
 
 	gpu->exec_state = -1;
-
-	return etnaviv_gpu_clk_disable(gpu);
 }
 
 static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
@@ -1789,6 +1787,7 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 		pm_runtime_put_sync_suspend(gpu->dev);
 	} else {
 		etnaviv_gpu_hw_suspend(gpu);
+		etnaviv_gpu_clk_disable(gpu);
 	}
 
 	if (gpu->mmu_context)
@@ -1922,7 +1921,9 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
-	return etnaviv_gpu_hw_suspend(gpu);
+	etnaviv_gpu_hw_suspend(gpu);
+
+	return etnaviv_gpu_clk_disable(gpu);
 }
 
 static int etnaviv_gpu_rpm_resume(struct device *dev)
-- 
2.39.2

