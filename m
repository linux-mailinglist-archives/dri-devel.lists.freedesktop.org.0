Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF017CEF8C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 07:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B0810E46D;
	Thu, 19 Oct 2023 05:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128A510E472
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 05:56:32 +0000 (UTC)
X-UUID: 3d6fee126e4411eea33bb35ae8d461a2-20231019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mEL9/fhI8H1OiHxV2ftXuZpY23MuQ9WuJPFzjUyfFPI=; 
 b=n4hIERnFmjNYSLSvfbdXb3P4AV6XHII8c+TJLF3K6yKLVUw7OLo1nh1ZJdT9zEqXvMJ4Yhuf4u6QGZKtThal7+GNpHsh6q6/RlXzvqldnmTkCBGRKiA4YOSqgBO8Gj6TdqanxAognov0dVaIcFNydzmbxpIUVIgaNxcWLzAx2nE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:844be11a-fb53-46f5-a415-37ad339f9980, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:dca44dc4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3d6fee126e4411eea33bb35ae8d461a2-20231019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1799444518; Thu, 19 Oct 2023 13:56:26 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 13:56:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 13:56:24 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 23/24] drm/mediatek: Fix underrun in VDO1 when switches
 off the layer
Date: Thu, 19 Oct 2023 13:56:18 +0800
Message-ID: <20231019055619.19358-24-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231019055619.19358-1-shawn.sung@mediatek.com>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.429600-8.000000
X-TMASE-MatchedRID: aRklFmtZ23BQlz7zzALRPqKa0xB73sAA7yWPaQc4INS0rcU5V/oSe8Ht
 HEmxq9+YYM3P0vRsc0DnftxNodBrx0c58yUI8WvNQ4srjeRbxTZCX8V1FiRRkjdlsYL2g/87xhL
 ap7By3FlX6UIPOG+iLYAGGZdCG6IYHxPMjOKY7A8LbigRnpKlKZvjAepGmdoOuzWZSe9bpwlKMn
 xvHPr3Lj/S/4Fp/m7C70j4gBQf6c8A81qNtiL9iCjCD/8vFIPkWsiUW0takmD4VH37RoClPds5P
 cWL6yHKSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.429600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0BB91304C2E49AC9F5E890F0C4820A3EDC72EF4E07FB41161E14A9D6A9DDA6932000:8
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not reset Merge while using CMDQ because reset API doesn't
wait for frame done event as CMDQ does and could lead to
underrun when the layer is switching off.

Fixes: aaf94f7c3ae6 ("drm/mediatek: Add display merge async reset control")

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index fd14a59bc951..c19fb1836034 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -104,7 +104,7 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 
-	if (priv->async_clk)
+	if (!cmdq_pkt && priv->async_clk)
 		reset_control_reset(priv->reset_ctl);
 }
 
-- 
2.18.0

