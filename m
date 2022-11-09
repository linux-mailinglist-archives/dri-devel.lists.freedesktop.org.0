Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF106227D6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 11:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F2710E025;
	Wed,  9 Nov 2022 10:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584B010E025
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 10:01:13 +0000 (UTC)
X-UUID: 672a15eb1d8a422ba83be023539cabe7-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=i0RvSmzfXal4CwyktVc7SkL+bv7kfZ77IrYMKCrSjfA=; 
 b=F5WJl9+sFbZm59O9XDcWPczxSQux4+XoD9Wz/L0Y+ksyUKMmFNyj9iTrAPQ4OqXFBzvioxXYsTHQ5iUQ0BAoFDPifEu7i+ftjyR0VB7nE2Hw1cD4hlXQjphgmyhLVdb6OMzYJOy6Rg9s2OOqtXTjp8v1wxVab3yXMWVA2qv2AXk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:cf7da57a-2380-42f4-b48c-4d7bbf27dd50, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.12, REQID:cf7da57a-2380-42f4-b48c-4d7bbf27dd50, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:62cd327, CLOUDID:54180f5d-100c-4555-952b-a62c895efded,
 B
 ulkID:221109180105PF4I8MEV,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 672a15eb1d8a422ba83be023539cabe7-20221109
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1701319199; Wed, 09 Nov 2022 18:01:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 9 Nov 2022 18:01:02 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 9 Nov 2022 18:01:01 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
Subject: [PATCH v4] drm: mediatek: Modify dpi power on/off sequence.
Date: Wed, 9 Nov 2022 18:00:59 +0800
Message-ID: <1667988059-8635-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: Xinlei Lee <xinlei.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Modify dpi power on/off sequence so that the first gpio operation will take effect.

Fixes: 6bd4763fd532 ("drm/mediatek: set dpi pin mode to gpio low to avoid leakage current")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
change note:
v3: Moved pull-down pin control after mtk_dpi_power_off.

v2: Remove the empty line between Fixes: and S-o-b.

v1: Rebase on linus/master v6.1-rc1. Change nothing.

Because dpi power_on/off is protected by dpi->refcount, the first time
it cannot be powered on and off successfully, it will cause leakage.
---
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 508a6d994e83..1f5d39a4077c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -461,9 +461,6 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	if (--dpi->refcount != 0)
 		return;
 
-	if (dpi->pinctrl && dpi->pins_gpio)
-		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
-
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
@@ -488,9 +485,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_pixel;
 	}
 
-	if (dpi->pinctrl && dpi->pins_dpi)
-		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
-
 	return 0;
 
 err_pixel:
@@ -721,12 +715,18 @@ static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	mtk_dpi_power_off(dpi);
+
+	if (dpi->pinctrl && dpi->pins_gpio)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
 }
 
 static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
+	if (dpi->pinctrl && dpi->pins_dpi)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
+
 	mtk_dpi_power_on(dpi);
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
 	mtk_dpi_enable(dpi);
-- 
2.18.0

