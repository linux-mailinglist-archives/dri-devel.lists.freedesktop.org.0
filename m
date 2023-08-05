Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA6771002
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 15:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C623810E1A6;
	Sat,  5 Aug 2023 13:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2CE10E1A7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 13:58:06 +0000 (UTC)
X-UUID: 16b06fe0339811eeb20a276fd37b9834-20230805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IP+acsE3RHl4zI7GdXWUg/GZYhDWt6M5CSaQkqn6B+4=; 
 b=D3P3CXVnDQU/ZYEbR82mfhySusExeirOcVZcZ2HFr2COT7mVlNr3OaMKIe9QMsIPEZyy+b0feEXEv4zenUEZwCtwf846amZ5hQrr6VGF7o6w/4d4Ijjr0Jqibxil/xYZBac+oUshSvKzexdTOPDcKw2rGUY4vTjBvbxBZ4MA4VQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:e835cc27-2f20-4e3a-8b12-5203666be0e9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.30, REQID:e835cc27-2f20-4e3a-8b12-5203666be0e9, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8, CLOUDID:541db7d2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:230805215801YH832MDA,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: 16b06fe0339811eeb20a276fd37b9834-20230805
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 841675858; Sat, 05 Aug 2023 21:58:00 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 5 Aug 2023 21:57:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 5 Aug 2023 21:57:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v4 0/2] Fix OVL iommu fault in cursor plane
Date: Sat, 5 Aug 2023 21:57:55 +0800
Message-ID: <20230805135757.6625-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix some IGT tests fail at iommu fault in OVL cursor plane.

Change in v4:
1. Change disable all layer method to update mtk_plane_state stored
   in mtk_crtc by drm_atomic_state from mtk_drm_crtc_atomic_enable().

Change in v3:
1. Add Fixes tag before s.o.b.

Change in v2:
1. Add Fixes tag.

Jason-JH.Lin (2):
  drm/mediatek: Fix iommu fault by swapping FBs after updating plane
    state
  drm/mediatek: Fix iommu fault during crtc enabling

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 15 +++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 13 +++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 ++
 3 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.18.0

