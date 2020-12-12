Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C72D9414
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB18E6E0F4;
	Mon, 14 Dec 2020 08:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 260E96E56A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 04:12:09 +0000 (UTC)
X-UUID: 0feeb428da3d4ccf8be70e074b0085b9-20201212
X-UUID: 0feeb428da3d4ccf8be70e074b0085b9-20201212
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 988465607; Sat, 12 Dec 2020 12:12:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:04 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 05/17] drm/mediatek: add component POSTMASK
Date: Sat, 12 Dec 2020 12:11:45 +0800
Message-ID: <1607746317-4696-6-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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

This patch add component POSTMASK

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 +++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 include/linux/soc/mediatek/mtk-mmsys.h      |  1 +
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8938554..4c91584 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -60,6 +60,10 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_LUT				0x0700
 
+#define DISP_POSTMASK_EN			0x0000
+#define DISP_POSTMASK_CFG			0x0020
+#define DISP_POSTMASK_SIZE			0x0030
+
 #define LUT_10BIT_MASK				0x03ff
 
 #define OD_RELAYMODE				BIT(0)
@@ -321,6 +325,24 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	}
 }
 
+static void mtk_postmask_config(struct mtk_ddp_comp *comp, unsigned int w,
+			      unsigned int h, unsigned int vrefresh,
+			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_POSTMASK_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, comp, DISP_POSTMASK_CFG);
+}
+
+static void mtk_postmask_start(struct mtk_ddp_comp *comp)
+{
+	writel(DITHER_EN, comp->regs + DISP_POSTMASK_EN);
+}
+
+static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
+{
+	writel_relaxed(0x0, comp->regs + DISP_POSTMASK_EN);
+}
+
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_aal_config,
@@ -348,6 +370,12 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	.stop = mtk_gamma_stop,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_postmask = {
+	.config = mtk_postmask_config,
+	.start = mtk_postmask_start,
+	.stop = mtk_postmask_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_od = {
 	.config = mtk_od_config,
 	.start = mtk_od_start,
@@ -374,6 +402,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_POSTMASK] = "postmask",
 };
 
 struct mtk_ddp_comp_match {
@@ -404,6 +433,8 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, NULL },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, NULL },
 	[DDP_COMPONENT_OVL_2L2]	= { MTK_DISP_OVL_2L,	2, NULL },
+	[DDP_COMPONENT_POSTMASK0]
+				= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 5aa52b7..1a55496 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -29,6 +29,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_UFOE,
 	MTK_DSI,
 	MTK_DPI,
+	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 42476c2..09ee424 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -31,6 +31,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OVL_2L1,
 	DDP_COMPONENT_OVL_2L2,
 	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_PWM0,
 	DDP_COMPONENT_PWM1,
 	DDP_COMPONENT_PWM2,
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
