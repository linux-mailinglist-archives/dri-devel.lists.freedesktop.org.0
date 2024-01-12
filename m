Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AE82BCCF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916410EAB1;
	Fri, 12 Jan 2024 09:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD910EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:20:30 +0000 (UTC)
X-UUID: d0ce2c1cb12b11ee9e680517dc993faa-20240112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/5MRUAf8nzbyEgJGFVzsz6MlL8E4uCaojf+OWju13B8=; 
 b=shbLLU6aCW/Bh7DbF7m6TRxdbYiU72+hTRZUot8pOtGUmXJ1/XJ9tXsJTwz30ef0KDj/PZIsy6uYrIqFTnH10BDmVRvjCFK+hApulAUDVM/MevKEY1QgaETIzsjMno5B8J8HDjWbxy6MoofeGfXROS60lguvPmiLLdOYfak3rZ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:779d9b66-563a-4bbf-af01-dff1a673b736, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5d391d7, CLOUDID:5c522e8e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d0ce2c1cb12b11ee9e680517dc993faa-20240112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1331444285; Fri, 12 Jan 2024 17:20:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jan 2024 17:20:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jan 2024 17:20:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>
Subject: [PATCH v4 0/7] dma-buf: heaps: Add restricted heap
Date: Fri, 12 Jan 2024 17:20:07 +0800
Message-ID: <20240112092014.23999-1-yong.wu@mediatek.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Pavel Machek <pavel@ucw.cz>, Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The purpose of this patchset is for MediaTek secure video playback, and
also to enable other potential uses of this in the future. The 'restricted
dma-heap' will be used to allocate dma_buf objects that reference memory
in the secure world that is inaccessible/unmappable by the non-secure
(i.e. kernel/userspace) world.  That memory will be used by the secure/
trusted world to store secure information (i.e. decrypted media content).
The dma_bufs allocated from the kernel will be passed to V4L2 for video
decoding (as input and output). They will also be used by the drm
system for rendering of the content.

This patchset adds two MediaTek restricted heaps and they will be used in
v4l2[1] and drm[2].
1) restricted_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video
   Path). The buffer is reserved for the secure world after bootup and it
   is used for vcodec's ES/working buffer;
2) restricted_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
   dynamically reserved for the secure world and will be got when we start
   playing secure videos. Once the security video playing is complete, the
   CMA will be released. This heap is used for the vcodec's frame buffer. 

[1] https://lore.kernel.org/linux-mediatek/20231206081538.17056-1-yunfei.dong@mediatek.com/
[2] https://lore.kernel.org/all/20231223182932.27683-1-jason-jh.lin@mediatek.com/

Change note:
v4: 1) Rename the heap name from "secure" to "restricted". suggested from
     Simon/Pekka. There are still several "secure" string in MTK file
     since we use ARM platform in which we call this "secure world"/
     "secure command".

v3: https://lore.kernel.org/linux-mediatek/20231212024607.3681-1-yong.wu@mediatek.com/
    1) Separate the secure heap to a common file(secure_heap.c) and mtk
     special file (secure_heap_mtk.c),  and put all the tee related code
     into our special file.
    2) About dt-binding, Add "mediatek," prefix since this is Mediatek TEE
     firmware definition.
    3) Remove the normal CMA heap which is a draft for qcom.
    Rebase on v6.7-rc1.

v2: https://lore.kernel.org/linux-mediatek/20231111111559.8218-1-yong.wu@mediatek.com/
    1) Move John's patches into the vcodec patchset since they use the new
       dma heap interface directly.
       https://lore.kernel.org/linux-mediatek/20231106120423.23364-1-yunfei.dong@mediatek.com/
    2) Reword the dt-binding description.
    3) Rename the heap name from mtk_svp to secure_mtk_cm.
       This means the current vcodec/DRM upstream code doesn't match this.
    4) Add a normal CMA heap. currently it should be a draft version.
    5) Regarding the UUID, I still use hard code, but put it in a private
    data which allow the others could set their own UUID. What's more, UUID
    is necessary for the session with TEE. If we don't have it, we can't
    communicate with the TEE, including the get_uuid interface, which tries
    to make uuid more generic, not working. If there is other way to make
    UUID more general, please free to tell me.
    
v1: https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu@mediatek.com/
    Base on v6.6-rc1.

Yong Wu (7):
  dt-bindings: reserved-memory: Add mediatek,dynamic-restricted-region
  dma-buf: heaps: Initialize a restricted heap
  dma-buf: heaps: restricted_heap: Add private heap ops
  dma-buf: heaps: restricted_heap: Add dma_ops
  dma-buf: heaps: restricted_heap: Add MediaTek restricted heap and
    heap_init
  dma-buf: heaps: restricted_heap_mtk: Add TEE memory service call
  dma_buf: heaps: restricted_heap_mtk: Add a new CMA heap

 .../mediatek,dynamic-restricted-region.yaml   |  43 +++
 drivers/dma-buf/heaps/Kconfig                 |  16 +
 drivers/dma-buf/heaps/Makefile                |   4 +-
 drivers/dma-buf/heaps/restricted_heap.c       | 237 +++++++++++++
 drivers/dma-buf/heaps/restricted_heap.h       |  43 +++
 drivers/dma-buf/heaps/restricted_heap_mtk.c   | 322 ++++++++++++++++++
 6 files changed, 664 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml
 create mode 100644 drivers/dma-buf/heaps/restricted_heap.c
 create mode 100644 drivers/dma-buf/heaps/restricted_heap.h
 create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c

-- 
2.18.0


