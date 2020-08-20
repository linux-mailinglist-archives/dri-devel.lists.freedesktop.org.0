Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E619524AFDB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68786E8E5;
	Thu, 20 Aug 2020 07:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4D488828C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:06:00 +0000 (UTC)
X-UUID: f50066c0bf4d43d680157dc9e53267d0-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T4O+YyIppnD25hiER8zzbit4v9W+Njgd5FCWpgHsGSk=; 
 b=XsYhDMyfCGwthmBM71aQLLTNg91vRETbGFYLNnn689vNsMeRCDFepKBG3icCTOOdIwMffjjPILwj4siGRydtY5+a4H0NsFpffaZAMsmgFvOmokEoMlwNDnCGL12NyViY6cIlRiqqau9gbP23eIoupyub/FY1Sz549dZ+1V265FE=;
X-UUID: f50066c0bf4d43d680157dc9e53267d0-20200820
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1240852115; Thu, 20 Aug 2020 14:05:57 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:48 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 17/21] drm/mediatek: add rdma bypass shadow register
 function
Date: Thu, 20 Aug 2020 14:04:14 +0800
Message-ID: <1597903458-8055-18-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

add rdma bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0683bef..91ed6c6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -46,12 +46,16 @@
 #define RDMA_FIFO_PSEUDO_SIZE(bytes)			(((bytes) / 16) << 16)
 #define RDMA_OUTPUT_VALID_FIFO_THRESHOLD(bytes)		((bytes) / 16)
 #define RDMA_FIFO_SIZE(rdma)			((rdma)->data->fifo_size)
+#define DISP_REG_RDMA_SHADOW_UPDATE		0x00bc
+#define DISP_RDMA_BYPASS_SHADOW				BIT(1)
+#define DISP_RDMA_READ_WORK_REG				BIT(2)
 #define DISP_RDMA_MEM_START_ADDR		0x0f00
 
 #define RDMA_MEM_GMC				0x40402020
 
 struct mtk_disp_rdma_data {
 	unsigned int fifo_size;
+	bool has_shadow;
 };
 
 /**
@@ -125,6 +129,21 @@ static void mtk_rdma_stop(struct mtk_ddp_comp *comp)
 	rdma_update_bits(comp, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN, 0);
 }
 
+static void mtk_rdma_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+
+	if (rdma->data->has_shadow) {
+		pr_err("disable rdma shadow\n");
+		mtk_ddp_write_mask(NULL, DISP_RDMA_BYPASS_SHADOW, comp,
+				   DISP_REG_RDMA_SHADOW_UPDATE,
+				   DISP_RDMA_BYPASS_SHADOW);
+		mtk_ddp_write_mask(NULL, DISP_RDMA_READ_WORK_REG, comp,
+				   DISP_REG_RDMA_SHADOW_UPDATE,
+				   DISP_RDMA_READ_WORK_REG);
+	}
+}
+
 static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 			    unsigned int height, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -238,6 +257,7 @@ static void mtk_rdma_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	.config = mtk_rdma_config,
 	.start = mtk_rdma_start,
 	.stop = mtk_rdma_stop,
+	.bypass_shadow = mtk_rdma_bypass_shadow,
 	.enable_vblank = mtk_rdma_enable_vblank,
 	.disable_vblank = mtk_rdma_disable_vblank,
 	.layer_nr = mtk_rdma_layer_nr,
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
