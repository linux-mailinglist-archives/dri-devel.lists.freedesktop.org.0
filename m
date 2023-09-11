Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FF79A13E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 04:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68CA10E0B6;
	Mon, 11 Sep 2023 02:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2628910E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:30:50 +0000 (UTC)
X-UUID: 36af3e00504b11eea33bb35ae8d461a2-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+87uOL2WQvYvX9g5bStM5h9swQ1laB4yxiMeMo2iqXc=; 
 b=uf2/Wzg+L7T9MTAwoxRWPDfyQUIyCXE0Hxfbpd3z4Ot7lzyqPcWbk4O4xh7hh9E8y45mJKqChOgOFP9EF9naY5Gdk/LEGyxBY3/4r3IOo4Os4WsSemPu36wTXwRLsVKa+x8NEqVQB2TXZtAhjvT8S2sZri8wfjQveu6OzbfAAG8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:2fcd4e6f-6799-4aa9-ab3f-fbfa01e6997a, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:0ad78a4, CLOUDID:1d59adbe-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 36af3e00504b11eea33bb35ae8d461a2-20230911
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 141108311; Mon, 11 Sep 2023 10:30:46 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:30:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:30:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/9] dma-buf: heaps: Add MediaTek secure heap
Date: Mon, 11 Sep 2023 10:30:29 +0800
Message-ID: <20230911023038.30649-1-yong.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset consists of two parts, the first is from John and TJ.
It adds some heap interfaces, then our kernel users could allocate buffer
from special heap. The second part is adding MTK secure heap for SVP
(Secure Video Path). A total of two heaps are added, one is mtk_svp and
the other is mtk_svp_cma. The mtk_svp buffer is reserved for the secure
world after bootup and it is used for ES/working buffer, while the
mtk_svp_cma buffer is dynamically reserved for the secure world and will
be get ready when we start playing secure videos, this heap is used for the
frame buffer. Once the security video playing is complete, the CMA will be
released.

For easier viewing, I've split the new heap file into several patches.

The consumers of new heap and new interfaces are our codec and drm which
will send upstream soon, probably this week.

Base on v6.6-rc1.

John Stultz (2):
  dma-heap: Add proper kref handling on dma-buf heaps
  dma-heap: Provide accessors so that in-kernel drivers can allocate
    dmabufs from specific heaps

T.J. Mercier (1):
  dma-buf: heaps: Deduplicate docs and adopt common format

Yong Wu (6):
  dma-buf: heaps: Initialise MediaTek secure heap
  dma-buf: heaps: mtk_sec_heap: Initialise tee session
  dma-buf: heaps: mtk_sec_heap: Add tee service call for buffer
    allocating/freeing
  dma-buf: heaps: mtk_sec_heap: Add dma_ops
  dt-bindings: reserved-memory: MediaTek: Add reserved memory for SVP
  dma_buf: heaps: mtk_sec_heap: Add a new CMA heap

 .../mediatek,secure_cma_chunkmem.yaml         |  42 ++
 drivers/dma-buf/dma-heap.c                    | 127 +++--
 drivers/dma-buf/heaps/Kconfig                 |   8 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/mtk_secure_heap.c       | 458 ++++++++++++++++++
 include/linux/dma-heap.h                      |  42 +-
 6 files changed, 630 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
 create mode 100644 drivers/dma-buf/heaps/mtk_secure_heap.c

-- 
2.18.0


