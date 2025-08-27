Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D27B38148
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EB310E7C0;
	Wed, 27 Aug 2025 11:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kJel7V3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37E210E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:40:15 +0000 (UTC)
X-UUID: 96a39b5c833a11f0b33aeb1e7f16c2b6-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iyCEldzk4Mz7ktOwec/w57CiVepRjvEdcwkCHofTpdY=; 
 b=kJel7V3cQiQGTuIbQVwTH1pwWNooWCDgDoXnfutJWhwyRgo3mSu+PW904VQV96eS+UNGYxs+lP5KACOBDLnZ1GSV1u9I2fZSoy0NLsqTTaFQmLVDKhSEZYuaBy4SBn9eHueaXf37LoWAj81edCZr1NlziE4YfaWVKLNCufrWsAo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:b39ac41a-2284-4d2e-bfc5-69a7a46d2cea, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:cea59020-786d-4870-a017-e7b4f3839b3f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 96a39b5c833a11f0b33aeb1e7f16c2b6-20250827
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 98461193; Wed, 27 Aug 2025 19:40:10 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:08 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul-PL
 Chen" <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Xiandong Wang" <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v7 04/20] soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in
 cmdq_pkt_create()
Date: Wed, 27 Aug 2025 19:37:36 +0800
Message-ID: <20250827114006.3310175-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cmdq_get_mbox_priv() in cmdq_pkt_create() to ensure getting private
data before generating GCE instructions.

Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 455221e8de24..8feeaa320359 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -140,6 +140,7 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
 	}
 
 	pkt->pa_base = dma_addr;
+	cmdq_get_mbox_priv(client->chan, &pkt->priv);
 
 	return 0;
 }
-- 
2.43.0

