Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C515A9C392
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256BE10E8EA;
	Fri, 25 Apr 2025 09:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZHOBa//O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB19410E8E8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:32:52 +0000 (UTC)
X-UUID: 3b8cad2821b811f09b6713c7f6bde12e-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=73OjGdGOMubdTfszLMelKp9ZlaTMb3ka3bmExa7Iw0c=; 
 b=ZHOBa//Oxy8BzHp/PRJ8oH6i+YdNP6e19k30+CA/rLp+KpiyQJTl9aGdWgKT50e50nxkK95DCPmX1B3vXJUkKQJHJuqoD4AbACcJRyJA0tp8N5Nr/oBszIzs6YzZn++n5KDfesjvMdyDyvdr/Izbdgsmb+lPdvhI3RMGAaF2qxQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:24601619-a242-4d11-9dfd-dc9880b3c62f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:911d9df0-ff26-40e8-a637-f0e9524b171a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b8cad2821b811f09b6713c7f6bde12e-20250425
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 306797372; Fri, 25 Apr 2025 17:32:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 17:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 17:32:39 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Paul-PL Chen <pual-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v5 09/19] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
 cmdq_pkt_jump_rel_temp()
Date: Fri, 25 Apr 2025 17:28:41 +0800
Message-ID: <20250425093237.1543918-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
References: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
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

Since all users have migrated to the new cmdq_pkt_jump* APIs without
shift_pa, the wrapper APIs cmdq_pkt_jump() and cmdq_pkt_jump_rel_temp()
can be removed.

Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 include/linux/soc/mediatek/mtk-cmdq.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index ee4ec64a7322..f956ee9a0b34 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -355,12 +355,6 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
  */
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr);
 
-/* This wrapper has to be removed after all users migrated to jump_abs */
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
-{
-	return cmdq_pkt_jump_abs(pkt, addr);
-}
-
 /**
  * cmdq_pkt_jump_rel() - Append jump command to the CMDQ packet, ask GCE
  *			 to execute an instruction that change current thread
@@ -373,12 +367,6 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
  */
 int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset);
 
-/* This wrapper has to be removed after all users migrated to jump_rel */
-static int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
-{
-	return cmdq_pkt_jump_rel(pkt, addr);
-}
-
 /**
  * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
  * @pkt:	The CMDQ packet
-- 
2.43.0

