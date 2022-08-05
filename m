Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993A58A91D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 11:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62814A6EE;
	Fri,  5 Aug 2022 09:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E501121F6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 09:57:53 +0000 (UTC)
X-UUID: c4ce5b75291b4d76bb39870bb8d9ab59-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4OqmmuQrd/hrrrBUtAqVX37bzM4ElGzOj3/krihQ8eo=; 
 b=jvKbLU7KRVa8c384GRSJFRMRMqbuRP/w36j5p/1hbVBxQN8ropHNXqTgdccmoPFDkf5LIPGpmI+26URUUCNCTzN4ePLtP1ch7vEjnuAnizVl2/b0+VRzFzbuHaM2UbTQ+OWzgaz156oQ8ykPnHF0Za3jygMu9axP2IqdOsgbtAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:090a01da-98dc-432c-bcae-a17d162f789a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:95
X-CID-INFO: VERSION:1.1.8, REQID:090a01da-98dc-432c-bcae-a17d162f789a, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:95
X-CID-META: VersionHash:0f94e32, CLOUDID:5492e09b-da39-4e3b-a854-56c7d2111b46,
 C
 OID:0db1cf9bdb49,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: c4ce5b75291b4d76bb39870bb8d9ab59-20220805
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1677544444; Fri, 05 Aug 2022 17:57:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 17:57:47 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 5 Aug 2022 17:57:46 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 1/2] soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
Date: Fri, 5 Aug 2022 17:57:40 +0800
Message-ID: <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add mmsys func to manipulate dpi output format config for MT8186.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

---
 drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
 drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
 include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index eb1ad9c37a9c..620c062e4893 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -3,6 +3,7 @@
 #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
 #define __SOC_MEDIATEK_MT8186_MMSYS_H
 
+#define MT8186_DPI_OUTPUT_FORMAT		0X400
 #define MT8186_MMSYS_OVL_CON			0xF04
 #define MT8186_MMSYS_OVL0_CON_MASK			0x3
 #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 9bbf0103b225..0e71a3296046 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,
+			       struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_DPI_OUTPUT_FORMAT, mask,
+			      val, cmdq_pkt);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_confing);
+
 void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
 				  struct cmdq_pkt *cmdq_pkt)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 7a73305390ba..8218a906bb87 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -89,4 +89,7 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
 void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
 				     struct cmdq_pkt *cmdq_pkt);
 
+void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,
+			       struct cmdq_pkt *cmdq_pkt);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0

