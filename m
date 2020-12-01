Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25C2CA278
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2786E546;
	Tue,  1 Dec 2020 12:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C376E546
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:19:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CJBNI082364;
 Tue, 1 Dec 2020 06:19:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606825151;
 bh=qUD4xgPpcHR1r08N8CwlANZxxuAiLU0xtAa2ub+S9O8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=bdvxihnC1B0WgzPzwlnhOJEFFKny7jmuut/Q5fo9geHILyAVz9HCxMCak4HOMeuPg
 qKpm2q3BCYfB3KVWT0r5GGxCwu2L/USTHKZnJE45nBbVq2IWk+iBPCQHc7PvvOqPrd
 O/Zn/e7ZM0RwYJodf9k3/SD6KLbV4vX+Zmf91hEk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1CJBWU016679
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 06:19:11 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 06:19:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 06:19:10 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIn3S118162; 
 Tue, 1 Dec 2020 06:19:08 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: [PATCH v4 7/7] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Date: Tue, 1 Dec 2020 17:48:30 +0530
Message-ID: <20201201121830.29704-8-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201121830.29704-1-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
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
Use the enable / disable function as required in other places.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

Notes:
    changes from v2:
    * Fix the interrupt enable logic at other places in code
    * Reorder functions so that they can be used earlier in the program

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 9c17e4bb517e..d0ed950f4f87 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -52,6 +52,26 @@
 
 #include "cdns-mhdp8546-j721e.h"
 
+static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	/* Enable SW event interrupts */
+	if (mhdp->bridge_attached)
+		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
+		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		       mhdp->regs + CDNS_APB_INT_MASK);
+}
+
+static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
+	       CDNS_APB_INT_MASK_SW_EVENT_INT,
+	       mhdp->regs + CDNS_APB_INT_MASK);
+}
+
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int ret, empty;
@@ -747,9 +767,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
 	 * MHDP_HW_STOPPED happens only due to driver removal when
 	 * bridge should already be detached.
 	 */
-	if (mhdp->bridge_attached)
-		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
-		       mhdp->regs + CDNS_APB_INT_MASK);
+	cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);
 
 	spin_unlock(&mhdp->start_lock);
 
@@ -1689,8 +1707,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	/* Enable SW event interrupts */
 	if (hw_ready)
-		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
-		       mhdp->regs + CDNS_APB_INT_MASK);
+		cdns_mhdp_bridge_hpd_enable(bridge);
 
 	return 0;
 }
@@ -2146,23 +2163,6 @@ static struct edid *cdns_mhdp_bridge_get_edid(struct drm_bridge *bridge,
 	return cdns_mhdp_get_edid(mhdp, connector);
 }
 
-static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
-{
-	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
-
-	/* Enable SW event interrupts */
-	if (mhdp->bridge_attached)
-		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
-		       mhdp->regs + CDNS_APB_INT_MASK);
-}
-
-static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
-{
-	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
-
-	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs + CDNS_APB_INT_MASK);
-}
-
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_enable = cdns_mhdp_atomic_enable,
 	.atomic_disable = cdns_mhdp_atomic_disable,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
