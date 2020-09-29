Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945427C0E5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718C56E461;
	Tue, 29 Sep 2020 09:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947826E197
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:19:51 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08T9JcVt064449;
 Tue, 29 Sep 2020 04:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601371178;
 bh=yLxaA0lrPVORKjJ+f1ClkPCwRD5JzC73FoQy/7QnHak=;
 h=From:To:CC:Subject:Date;
 b=dxzJ8TfwI3k0xGJl4nuzkkBDX9zX21e8zAFaA8buq6IWaPOtbYjDx0ES1aGWuxU/V
 EdLCmrVXSYwYpkbNXC/1WFT6a8jeIyjz4S81wOv2SI9wJaRr8dBkFKPCnlkIDAeX6I
 TjgpYMh2AqCrzvUJA1nkqcilsLIHkDuCuGoSExck=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08T9Jcws024496
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 04:19:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 04:19:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 04:19:37 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08T9JZ3r034002;
 Tue, 29 Sep 2020 04:19:36 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Subject: [PATCH v2] drm: bridge: cdns-mhdp8546: fix compile warning
Date: Tue, 29 Sep 2020 12:19:18 +0300
Message-ID: <20200929091918.24813-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On x64 we get:

drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]

The registers are 32 bit, so fix by casting to u32.

Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

v2:

No changes to code, added tags.


 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 621ebdbff8a3..d0c65610ebb5 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -748,7 +748,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
 	 * bridge should already be detached.
 	 */
 	if (mhdp->bridge_attached)
-		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
 	spin_unlock(&mhdp->start_lock);
@@ -1689,7 +1689,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	/* Enable SW event interrupts */
 	if (hw_ready)
-		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
 	return 0;
@@ -2122,7 +2122,7 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
 
 	/* Enable SW event interrupts */
 	if (mhdp->bridge_attached)
-		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
