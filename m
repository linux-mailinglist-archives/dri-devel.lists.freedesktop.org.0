Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177775459B4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 03:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EA1113E04;
	Fri, 10 Jun 2022 01:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4D1113DF9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 01:53:23 +0000 (UTC)
X-UUID: 0fd3a86573ad4aac8628c509aec582fe-20220610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:0901b385-18fd-4fde-ac37-18d5e8f46b05, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:963252e5-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 0fd3a86573ad4aac8628c509aec582fe-20220610
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 287709467; Fri, 10 Jun 2022 09:53:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 09:53:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jun 2022 09:53:16 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v2,
 1/4] media: mediatek: vcodec: Fix decoder v4l2 bus_info not correctly
Date: Fri, 10 Jun 2022 09:53:12 +0800
Message-ID: <20220610015315.25513-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix v4l2 capability bus_info value with correct chip name according to compatible.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
changed with v1:
- change bus_info from "platform:mt%d" to "platform:mt%d-dec"
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..4bdb5ae4a116 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -185,11 +185,32 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
+static int mtk_vcodec_dec_get_chip_name(void *priv)
+{
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
+
+	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
+		return 8173;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
+		return 8183;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
+		return 8192;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
+		return 8195;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
+		return 8186;
+	else
+		return 8173;
+}
+
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
+
 	strscpy(cap->driver, MTK_VCODEC_DEC_NAME, sizeof(cap->driver));
-	strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
 
 	return 0;
-- 
2.18.0

