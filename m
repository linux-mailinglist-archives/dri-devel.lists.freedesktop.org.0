Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755A2F0DD8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1289D87;
	Mon, 11 Jan 2021 08:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D201A89C63
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:44:06 +0000 (UTC)
X-UUID: 096091ece4744d42bc83a839f72ac26d-20210111
X-UUID: 096091ece4744d42bc83a839f72ac26d-20210111
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 403095666; Mon, 11 Jan 2021 15:44:03 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:44:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:44:01 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 07/15] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer
 usecase
Date: Mon, 11 Jan 2021 15:43:43 +0800
Message-ID: <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

enable OVL_LAYER_SMI_ID_EN for multi-layer usecase

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b47c238..4934bee 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -23,6 +23,7 @@
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
+#define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
@@ -61,6 +62,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool smi_id_en;
 };
 
 /**
@@ -116,7 +118,17 @@ static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
 
 static void mtk_ovl_start(struct mtk_ddp_comp *comp)
 {
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+
 	writel_relaxed(0x1, comp->regs + DISP_REG_OVL_EN);
+
+	if(ovl->data->smi_id_en) {
+		unsigned int reg;
+
+		reg = readl(comp->regs + DISP_REG_OVL_DATAPATH_CON);
+		reg = reg | OVL_LAYER_SMI_ID_EN;
+		writel_relaxed(reg, comp->regs + DISP_REG_OVL_DATAPATH_CON);
+	}
 }
 
 static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
