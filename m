Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9162AC1CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8554989B3B;
	Mon,  9 Nov 2020 17:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60A89B42
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:06:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9H6X5U108580;
 Mon, 9 Nov 2020 11:06:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604941593;
 bh=Ay8F+FhyQ+y3GfyHQednv3vUE2c7p9bc8A5BhJll7dM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YAH0+um6lhUXki+TZ+DuAkbLt2B6j9R6QoRgWX7ng0XliyyXe2L/6X2Ma1Rt0Om8Q
 e9wfx+7F6ciTTH/CkQ9T38gx87NX08MdmkyQkq9X8kbKuIpNd+IGhBlV/NcxuFVfsj
 /duyP79Lwpb9Gou+57fjG4erCKan0lsTkiIJpd+E=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9H6Xls029717
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 11:06:33 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 11:06:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 11:06:32 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9H6FZd037277; 
 Mon, 9 Nov 2020 11:06:30 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Date: Mon, 9 Nov 2020 22:36:01 +0530
Message-ID: <20201109170601.21557-7-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109170601.21557-1-nikhil.nd@ti.com>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When removing the tidss driver, there is a warning reported by
kernel about an unhandled interrupt for mhdp driver.

[   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
... [snipped backtrace]
[   43.330735] handlers:
[   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded [<000000007e02b601>]
cdns_mhdp_irq_handler [cdns_mhdp8546]
[   43.344607] Disabling IRQ #31

This happens because as part of cdns_mhdp_bridge_hpd_disable, driver tries
to disable the interrupts. While disabling the SW_EVENT interrupts,
it accidentally enables the MBOX interrupts, which are not handled by
the driver.

Fix this with a read-modify-write to update only required bits.
Do the same for enabling interrupts as well.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 2cd809eed827..6beccd2a408e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2146,7 +2146,8 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
 
 	/* Enable SW event interrupts */
 	if (mhdp->bridge_attached)
-		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
+		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 }
 
@@ -2154,7 +2155,9 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 
-	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs + CDNS_APB_INT_MASK);
+	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
+	       CDNS_APB_INT_MASK_SW_EVENT_INT,
+	       mhdp->regs + CDNS_APB_INT_MASK);
 }
 
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
