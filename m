Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3680B24B004
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403FE6E90D;
	Thu, 20 Aug 2020 07:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 473756E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:05:52 +0000 (UTC)
X-UUID: b756f09a9c244157af3ff069810e9104-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=81cl5lR8q9Xp2cMEda341JaElbb5a2VFUjfbX8XXRgM=; 
 b=cxBhGK5O7qRZASx6HpHjPKVRm1kK7sxUoxnhMkLslim0cJK1Z2KUgGc6s3vNzz81WLqKsqqqLaipXrh4ygAyrWoFXyj1o2DSaJbamC+hmvk8yYims8+LU6WZNJcu7Iwih+JQe7vqoH5+wevJkp4/GAD+DRoPd1sakQO3WQ5/7I4=;
X-UUID: b756f09a9c244157af3ff069810e9104-20200820
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 357292008; Thu, 20 Aug 2020 14:05:49 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:46 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 15/21] drm/mediatek: add color bypass shadow register
 function
Date: Thu, 20 Aug 2020 14:04:12 +0800
Message-ID: <1597903458-8055-16-git-send-email-yongqiang.niu@mediatek.com>
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

add color bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 31918fa..83b075a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -17,6 +17,8 @@
 #define DISP_COLOR_CFG_MAIN			0x0400
 #define DISP_COLOR_START_MT2701			0x0f00
 #define DISP_COLOR_START_MT8173			0x0c00
+#define DISP_COLOR_SHADOW_CTRL			0x0cb0
+#define COLOR_BYPASS_SHADOW				BIT(0)
 #define DISP_COLOR_START(comp)			((comp)->data->color_offset)
 #define DISP_COLOR_WIDTH(comp)			(DISP_COLOR_START(comp) + 0x50)
 #define DISP_COLOR_HEIGHT(comp)			(DISP_COLOR_START(comp) + 0x54)
@@ -26,6 +28,7 @@
 
 struct mtk_disp_color_data {
 	unsigned int color_offset;
+	bool has_shadow;
 };
 
 /**
@@ -63,9 +66,21 @@ static void mtk_color_start(struct mtk_ddp_comp *comp)
 	writel(0x1, comp->regs + DISP_COLOR_START(color));
 }
 
+static void mtk_color_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	struct mtk_disp_color *color = comp_to_color(comp);
+
+	if (color->data->has_shadow) {
+		mtk_ddp_write_mask(NULL, COLOR_BYPASS_SHADOW, comp,
+				   DISP_COLOR_SHADOW_CTRL,
+				   COLOR_BYPASS_SHADOW);
+	}
+}
+
 static const struct mtk_ddp_comp_funcs mtk_disp_color_funcs = {
 	.config = mtk_color_config,
 	.start = mtk_color_start,
+	.bypass_shadow = mtk_color_bypass_shadow,
 };
 
 static int mtk_disp_color_bind(struct device *dev, struct device *master,
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
