Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973A7CA5A7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E7C10E19A;
	Mon, 16 Oct 2023 10:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BAE10E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:40:18 +0000 (UTC)
X-UUID: 65289d5e6c1011eea33bb35ae8d461a2-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J73lCwAGxTCTY3jaQt5VIAph0X2ymgcWkmopAQGmoZQ=; 
 b=YK1MCGP05wyViZrKQHbR0nrWzGOL8Wvuiwb5wMlTt6ZoyaXoYQwe4HfW77Jao0hdub+28b0QZWlvJRPQfkLsyyjDahO9AuGpXWpaLFrn/LJw/OJq+OlDiBh96A0qrLyvfK34Irv/SMjRNC+xUTWPih9TEUg5lVZC5MVbMaiKlRk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:ad24aefa-bc56-4824-add5-65e52f05b2ba, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:17da1615-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 65289d5e6c1011eea33bb35ae8d461a2-20231016
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 404123651; Mon, 16 Oct 2023 18:40:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:15 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 16/23] drm/mediatek: Start/Stop components with function
 pointers
Date: Mon, 16 Oct 2023 18:40:03 +0800
Message-ID: <20231016104010.3270-17-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.055400-8.000000
X-TMASE-MatchedRID: pgavo5B1z8Ab7D0aLEL5Ob2xWbKjBfWPkos2tunL8DQx3z93vsEFGlaP
 6AhhdqyDkPk8oBU71SyX+lB2vkxVIen2wHlv5vGuh2VzUlo4HVN51GakW92m5mXczQlokCRZk66
 /gtVjZsU/bV+L+3R3poAy6p60ZV62fJ5/bZ6npdiujVRFkkVsmxxi/+fqmSQWNia6+nAE/Nn2ds
 pT3gSgm5S5uQhxie42JcIl/BdB9kETxc8ImfDAwpcL/p4EeUtR69RxatSZdAIYDR45NApPNI6H7
 DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09q9Z1yWryVTWo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.055400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 514C887DF670E2E570D7584C40C2885EA556CB57D33444CC2B96B7E33A88BB302000:8
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsiao Chien
 Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By registering component related functions to the pointers,
we can easily manage them within a for-loop and simplify the
logic of component start/stop process.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index fffef2a4f919..354ba6186166 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -71,6 +71,8 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 static const struct mtk_ddp_comp_funcs _ethdr = {
 	.clk_enable = mtk_ethdr_clk_enable,
 	.clk_disable = mtk_ethdr_clk_disable,
+	.start = mtk_ethdr_start,
+	.stop = mtk_ethdr_stop,
 };
 
 static const struct mtk_ddp_comp_funcs _merge = {
@@ -188,16 +190,30 @@ void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 
 void mtk_ovl_adaptor_start(struct device *dev)
 {
+	int i;
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
-	mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->start)
+			continue;
+
+		comp_matches[i].funcs->start(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
 }
 
 void mtk_ovl_adaptor_stop(struct device *dev)
 {
+	int i;
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
-	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->stop)
+			continue;
+
+		comp_matches[i].funcs->stop(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
 }
 
 int mtk_ovl_adaptor_clk_enable(struct device *dev)
-- 
2.18.0

