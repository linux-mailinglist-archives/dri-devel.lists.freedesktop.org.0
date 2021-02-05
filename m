Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B669310A10
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 12:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D756F414;
	Fri,  5 Feb 2021 11:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A556F412
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:18:04 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A4F9B1F465DD;
 Fri,  5 Feb 2021 11:18:02 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
Date: Fri,  5 Feb 2021 12:17:57 +0100
Message-Id: <20210205111757.585248-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205111757.585248-1-boris.brezillon@collabora.com>
References: <20210205111757.585248-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
in the threaded irq handler as long as we can.

v2:
* Rework the loop to avoid a goto

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 21e552d1ac71..0581186ebfb3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -578,22 +578,20 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 {
 	struct panfrost_device *pfdev = data;
 	u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
-	int i, ret;
+	int ret;
 
-	for (i = 0; status; i++) {
-		u32 mask = BIT(i) | BIT(i + 16);
+	while (status) {
+		u32 as = ffs(status | (status >> 16)) - 1;
+		u32 mask = BIT(as) | BIT(as + 16);
 		u64 addr;
 		u32 fault_status;
 		u32 exception_type;
 		u32 access_type;
 		u32 source_id;
 
-		if (!(status & mask))
-			continue;
-
-		fault_status = mmu_read(pfdev, AS_FAULTSTATUS(i));
-		addr = mmu_read(pfdev, AS_FAULTADDRESS_LO(i));
-		addr |= (u64)mmu_read(pfdev, AS_FAULTADDRESS_HI(i)) << 32;
+		fault_status = mmu_read(pfdev, AS_FAULTSTATUS(as));
+		addr = mmu_read(pfdev, AS_FAULTADDRESS_LO(as));
+		addr |= (u64)mmu_read(pfdev, AS_FAULTADDRESS_HI(as)) << 32;
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
@@ -604,8 +602,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 
 		/* Page fault only */
 		ret = -1;
-		if ((status & mask) == BIT(i) && (exception_type & 0xF8) == 0xC0)
-			ret = panfrost_mmu_map_fault_addr(pfdev, i, addr);
+		if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
+			ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
 
 		if (ret)
 			/* terminal fault, print info about the fault */
@@ -617,7 +615,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 				"exception type 0x%X: %s\n"
 				"access type 0x%X: %s\n"
 				"source id 0x%X\n",
-				i, addr,
+				as, addr,
 				"TODO",
 				fault_status,
 				(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
@@ -626,6 +624,10 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 				source_id);
 
 		status &= ~mask;
+
+		/* If we received new MMU interrupts, process them before returning. */
+		if (!status)
+			status = mmu_read(pfdev, MMU_INT_RAWSTAT);
 	}
 
 	mmu_write(pfdev, MMU_INT_MASK, ~0);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
