Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4432B971A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 17:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9616E59B;
	Thu, 19 Nov 2020 16:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285F6E59B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 16:01:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1tjC003188;
 Thu, 19 Nov 2020 10:01:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605801715;
 bh=AH76u/JNzuyYiaEyRRM0VgCwzs/y6u3UdYsRA9KAN/w=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Yr5tEE707Bws9kkuCsLunWyk9cjQQojoGdviYs7mOvoxipD/yFuNTfmngTKeKcdlU
 wndSdVjD6+kmrFelDp912foJmYtutU9PQBsGIOrZyW6fzRsIV7Ax8yWVr5SEf+XppH
 9p4D5UntSlp7Zl9anUf5JFlYAmQ4WHT2rgcs4+HU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJG1tXF004296
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 10:01:55 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 10:01:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 10:01:54 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1apv003251; 
 Thu, 19 Nov 2020 10:01:52 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Date: Thu, 19 Nov 2020 21:31:34 +0530
Message-ID: <20201119160134.9244-7-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119160134.9244-1-nikhil.nd@ti.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
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
Use the enable / disable function as required in other places.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>
---

Notes:
    changes from v2:
    * Fix the interrupt enable logic at other places in code
    * Reorder functions so that they can be used earlier in the program

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 2cd809eed827..0442269aeb03 100644
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
@@ -2140,23 +2157,6 @@ static struct edid *cdns_mhdp_bridge_get_edid(struct drm_bridge *bridge,
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
