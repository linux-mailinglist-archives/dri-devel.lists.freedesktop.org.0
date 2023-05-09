Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6D6FC2E9
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FD010E379;
	Tue,  9 May 2023 09:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDF510E371
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:36:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3499UnYr071952;
 Tue, 9 May 2023 04:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1683624649;
 bh=8taID+G2ciET/Nm9QcwqHumVXPYzXyNQltrMDx3JFjM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OF/vjnq7ceWTczsxkvLENm3rXiH5BJxSdC0KWZ5i5QhOseUq4rpI+Cq/4+Z8VEQc+
 RZq0JyGp0Z5DMJxuVtlAzTQxInh2wvQtovKT5n6hnvad3Lld5Yc51kCRTFIi7/DaLP
 rrmaSZ24MNc1UL6CE07VaVAQxIo6faqCub5ZTGzQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3499UnAU022512
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 May 2023 04:30:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 04:30:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 04:30:48 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3499UmeV020547;
 Tue, 9 May 2023 04:30:48 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Francesco Dolcini
 <francesco@dolcini.it>
Subject: [PATCH v6 8/8] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Date: Tue, 9 May 2023 15:00:36 +0530
Message-ID: <20230509093036.3303-9-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509093036.3303-1-a-bhatia1@ti.com>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>
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
index a677b1267525..66a771b140bc 100644
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
@@ -2215,23 +2232,6 @@ static struct edid *cdns_mhdp_bridge_get_edid(struct drm_bridge *bridge,
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

