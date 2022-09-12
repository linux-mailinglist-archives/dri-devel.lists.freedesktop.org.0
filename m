Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2E5B527F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5F710E12E;
	Mon, 12 Sep 2022 01:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A443910E113
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 01:30:18 +0000 (UTC)
X-UUID: 2b062ff0721b42d29ca988c5a208dfd4-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XkRfWrbHc24xFAs5OxLvU9eVC3fP9WVfInO1HW3MSRU=; 
 b=HsTOtMQkb0VwqFgoYRVKOPnitc5N8AIxvknTiz59UF0ybX46FzpQIgS5vsj75xjWjvfntI2+SbbvC14bp9q8/CRXkWio536W8COdHqB6xoEw9MTCKOPCW2sBnfjcber2bnUy0OwbA06rwgl2FDMk6HPej4+yMosD5eg7tTqAA6I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:06f5feba-cde7-4c62-a084-27d0f7933acf, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:15d0455d-5ed4-4e28-8b00-66ed9f042fbd,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2b062ff0721b42d29ca988c5a208dfd4-20220912
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 82929143; Mon, 12 Sep 2022 09:30:12 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 09:30:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:07 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to set
 gamma
Date: Mon, 12 Sep 2022 09:30:05 +0800
Message-ID: <20220912013006.27541-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the bootlaoder may set the RELAY_MODE to gamma be for the kerenl,
we have to clear the RELAY_MODE bit to make sure that the gamma is
enabled correctly.

Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma module")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index d706f76fd30e..15fe2a4f98de 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -18,6 +18,7 @@
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
 #define DISP_GAMMA_CFG				0x0020
+#define RELAY_MODE					BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
@@ -99,6 +100,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
+		reg = reg & ~RELAY_MODE;
 		reg = reg | GAMMA_LUT_EN;
 		writel(reg, regs + DISP_GAMMA_CFG);
 		lut_base = regs + DISP_GAMMA_LUT;
-- 
2.18.0

