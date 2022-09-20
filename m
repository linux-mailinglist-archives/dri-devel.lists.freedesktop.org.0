Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475615BE116
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607A010E468;
	Tue, 20 Sep 2022 09:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850DB10E472
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:01 +0000 (UTC)
X-UUID: 2ef7ae4d88f4493e8461bb8720430304-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ttq0pKiSe6uVcSj6n9DaO3vOaI+EVmioWYw/ksaT8H8=; 
 b=JwpM9j3OVmvwAXbdYoOjmykM8X+m4ld1RJOzGtd9zGvfXrMCS1Az+cn7zwLzGaxukuv/0Zx5rFbGqAicrdKoQFlfPj+3j6ZrNP6QaWHaPHbkH7a4ElrQBsnxGmswTsqKya4md/GIT5mLW3CP4xiGORkzG6rDCaQ/7HaE/sjX5nI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:3b9d98c5-312a-4053-baa9-de2bf2ebb0bb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:debd6670-dafa-4a42-b716-cf2cd4845592,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2ef7ae4d88f4493e8461bb8720430304-20220920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1965133039; Tue, 20 Sep 2022 17:00:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 01/18] phy: mediatek: add a new helper to update bitfield
Date: Tue, 20 Sep 2022 17:00:21 +0800
Message-ID: <20220920090038.15133-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to FIELD_PREP() macro can be used to prepare a bitfield value,
local ones can be remove; add the new helper to make bitfield update
easier.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-io.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
index 500fcdab165d..a723d4afc9b4 100644
--- a/drivers/phy/mediatek/phy-mtk-io.h
+++ b/drivers/phy/mediatek/phy-mtk-io.h
@@ -8,6 +8,7 @@
 #ifndef __PHY_MTK_H__
 #define __PHY_MTK_H__
 
+#include <linux/bitfield.h>
 #include <linux/io.h>
 
 static inline void mtk_phy_clear_bits(void __iomem *reg, u32 bits)
@@ -35,4 +36,10 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
 	writel(tmp, reg);
 }
 
+/* field @mask should be constant and continuous */
+static inline void mtk_phy_update_field(void __iomem *reg, u32 mask, u32 val)
+{
+	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
+}
+
 #endif
-- 
2.18.0

