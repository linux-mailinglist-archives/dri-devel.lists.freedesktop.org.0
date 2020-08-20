Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DBD24AFD1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A76A6E8C4;
	Thu, 20 Aug 2020 07:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A4E7884E2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:06:04 +0000 (UTC)
X-UUID: 953687bc1c584919a9de97a74478c4d0-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2KcvHK1Jr9oJkknwRko3J/Skm+3J8NuMuW2fpqtgTDE=; 
 b=sRnt7nEEIMj4iGqRSY4gUXU9jq/+3cfdi00nAnLy0HsBGVqh/+ItbTOgmEtbYSakhNQJL+Kkne6H5BpN8DPn3vYC9cbwN+dzG7JKSotkb6LmzokTzYLF953fftpgYyRvxjhFPggby9pOXKbsnRPrITZjWa+X+zW/X+Uwb69zFaI=;
X-UUID: 953687bc1c584919a9de97a74478c4d0-20200820
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 502150299; Thu, 20 Aug 2020 14:06:00 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:57 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 20/21] drm/mediatek: add ccorr bypass shadow register
 function
Date: Thu, 20 Aug 2020 14:04:17 +0800
Message-ID: <1597903458-8055-21-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:48 +0000
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

add ccorr bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b4a6df5..ff23a94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -55,6 +55,8 @@
 #define DISP_CCORR_COEF_2			0x0088
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
+#define DISP_CCORR_SHADOW			0x00A0
+#define CCORR_BYPASS_SHADOW				BIT(2)
 
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
@@ -284,6 +286,13 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 		      comp, DISP_CCORR_COEF_4);
 }
 
+static void mtk_ccorr_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	mtk_ddp_write_mask(NULL, CCORR_BYPASS_SHADOW, comp,
+			   DISP_CCORR_SHADOW,
+			   CCORR_BYPASS_SHADOW);
+}
+
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -381,6 +390,7 @@ static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
 	.ctm_set = mtk_ccorr_ctm_set,
+	.bypass_shadow = mtk_ccorr_bypass_shadow
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dither = {
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
