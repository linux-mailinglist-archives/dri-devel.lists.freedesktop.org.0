Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85EE640316
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 10:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04410E6B2;
	Fri,  2 Dec 2022 09:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2B10E1A4
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 09:19:33 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p12Cg-0007jN-EV; Fri, 02 Dec 2022 10:19:30 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/etnaviv: print MMU exception cause
Date: Fri,  2 Dec 2022 10:19:29 +0100
Message-Id: <20221202091929.2808211-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202091929.2808211-1-l.stach@pengutronix.de>
References: <20221202091929.2808211-1-l.stach@pengutronix.de>
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

From: Christian Gmeiner <christian.gmeiner@gmail.com>

The MMU tells us the fault status. While the raw register value is
already printed, it's a bit more user friendly to translate the
fault reasons into human readable format.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..f79203b774d9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1426,6 +1426,15 @@ static void sync_point_worker(struct work_struct *work)
 
 static void dump_mmu_fault(struct etnaviv_gpu *gpu)
 {
+	static const char *fault_reasons[] = {
+		"slave not present",
+		"page not present",
+		"write violation",
+		"out of bounds",
+		"read security violation",
+		"write security violation",
+	};
+
 	u32 status_reg, status;
 	int i;
 
@@ -1438,18 +1447,25 @@ static void dump_mmu_fault(struct etnaviv_gpu *gpu)
 	dev_err_ratelimited(gpu->dev, "MMU fault status 0x%08x\n", status);
 
 	for (i = 0; i < 4; i++) {
+		const char *reason = "unknown";
 		u32 address_reg;
+		u32 mmu_status;
 
-		if (!(status & (VIVS_MMUv2_STATUS_EXCEPTION0__MASK << (i * 4))))
+		mmu_status = (status >> (i * 4)) & VIVS_MMUv2_STATUS_EXCEPTION0__MASK;
+		if (!mmu_status)
 			continue;
 
+		if ((mmu_status - 1) < ARRAY_SIZE(fault_reasons))
+			reason = fault_reasons[mmu_status - 1];
+
 		if (gpu->sec_mode == ETNA_SEC_NONE)
 			address_reg = VIVS_MMUv2_EXCEPTION_ADDR(i);
 		else
 			address_reg = VIVS_MMUv2_SEC_EXCEPTION_ADDR;
 
-		dev_err_ratelimited(gpu->dev, "MMU %d fault addr 0x%08x\n", i,
-				    gpu_read(gpu, address_reg));
+		dev_err_ratelimited(gpu->dev,
+				    "MMU %d fault (%s) addr 0x%08x\n",
+				    i, reason, gpu_read(gpu, address_reg));
 	}
 }
 
-- 
2.30.2

