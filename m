Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3313020D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6326E419;
	Sat,  4 Jan 2020 11:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 701DE6E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 03:12:55 +0000 (UTC)
X-UUID: f44a66eac7e249c1ae5b04652d144ac0-20200103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RT3d9kWeiIuE9GL2srPbr1r8xa3wmXvPk20GUq9hFEg=; 
 b=j4oxqgxvsuaW0MJD0JOher3/tAJ6Bt4/j+QlLyanP+BGpBRj4NJb3Q5psUmxZ1BDfBXhgQynIVnJbTzQOFAHQyxWvJtnVaqzWBQiP8kSmNE6kcd9NxXzi0GLe/z3WM4PMObjQ133Ru/LPpkcNc6CloKWpZGvfl2ZXhuOZD0wwQI=;
X-UUID: f44a66eac7e249c1ae5b04652d144ac0-20200103
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1727894227; Fri, 03 Jan 2020 11:12:52 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 11:12:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 11:13:18 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND PATCH v6 16/17] drm/mediatek: add fifo_size into rdma private
 data
Date: Fri, 3 Jan 2020 11:12:27 +0800
Message-ID: <1578021148-32413-17-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

the fifo size of rdma in mt8183 is different.
rdma0 fifo size is 5k
rdma1 fifo size is 2k

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 405afef..0e0af04a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -62,6 +62,7 @@ struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
 	const struct mtk_disp_rdma_data	*data;
+	u32				fifo_size;
 };
 
 static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
@@ -130,10 +131,16 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	unsigned int threshold;
 	unsigned int reg;
 	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+	u32 rdma_fifo_size;
 
 	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_0, 0xfff, width);
 	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_1, 0xfffff, height);
 
+	if (rdma->fifo_size)
+		rdma_fifo_size = rdma->fifo_size;
+	else
+		rdma_fifo_size = RDMA_FIFO_SIZE(rdma);
+
 	/*
 	 * Enable FIFO underflow since DSI and DPI can't be blocked.
 	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
@@ -142,7 +149,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	 */
 	threshold = width * height * vrefresh * 4 * 7 / 1000000;
 	reg = RDMA_FIFO_UNDERFLOW_EN |
-	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
+	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
 	writel(reg, comp->regs + DISP_REG_RDMA_FIFO_CON);
 }
@@ -284,6 +291,16 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
+	if (of_find_property(dev->of_node, "mediatek,rdma_fifo_size", &ret)) {
+		ret = of_property_read_u32(dev->of_node,
+					   "mediatek,rdma_fifo_size",
+					   &priv->fifo_size);
+		if (ret) {
+			dev_err(dev, "Failed to get rdma fifo size\n");
+			return ret;
+		}
+	}
+
 	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_rdma_funcs);
 	if (ret) {
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
