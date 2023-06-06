Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FAC723B5A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B3B10E2F5;
	Tue,  6 Jun 2023 08:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6094E10E307
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:22:17 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3568LtZR066276;
 Tue, 6 Jun 2023 03:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686039715;
 bh=P+Pz7QTxeDNcMEQ6FvThwTsTY3IJY+048fGtIqlAyL0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZsV/i6DwmTLq+1vo24Pdi+doxkjSmMF/ilhw2np/Vu9nDSeawHI+zU5OvQaN7785N
 q9MNoLPlyQ0/3XCat/CKi60xpjE+SuDc8PY481xxw+CpnGoqdQ+t92Kat6gx++u1FE
 w1g4fSAY/swWNjDos+tEyuEo/roeR9ItN8URwstE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3568Lt2e012409
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jun 2023 03:21:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 03:21:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 03:21:55 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3568Lsb5019672;
 Tue, 6 Jun 2023 03:21:55 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v7 8/8] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Date: Tue, 6 Jun 2023 13:51:42 +0530
Message-ID: <20230606082142.23760-9-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606082142.23760-1-a-bhatia1@ti.com>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nikhil Devshatwar <nikhil.nd@ti.com>

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
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Notes:
    changes from v2:
    * Fix the interrupt enable logic at other places in code
    * Reorder functions so that they can be used earlier in the program

    changes from v5:
    * Manual rebase to linux-next.

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f12fb62821f7..ecb935e46b62 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -54,6 +54,26 @@
 #include "cdns-mhdp8546-hdcp.h"
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
@@ -749,9 +769,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
 	 * MHDP_HW_STOPPED happens only due to driver removal when
 	 * bridge should already be detached.
 	 */
-	if (mhdp->bridge_attached)
-		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
-		       mhdp->regs + CDNS_APB_INT_MASK);
+	cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);
 
 	spin_unlock(&mhdp->start_lock);
 
@@ -1740,8 +1758,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	/* Enable SW event interrupts */
 	if (hw_ready)
-		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
-		       mhdp->regs + CDNS_APB_INT_MASK);
+		cdns_mhdp_bridge_hpd_enable(bridge);
 
 	return 0;
 aux_unregister:
@@ -2212,23 +2229,6 @@ static struct edid *cdns_mhdp_bridge_get_edid(struct drm_bridge *bridge,
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
2.40.1

