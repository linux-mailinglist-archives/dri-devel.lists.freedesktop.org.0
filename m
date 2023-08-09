Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B164775FF7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 14:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7D10E431;
	Wed,  9 Aug 2023 12:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEB510E142
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 12:57:29 +0000 (UTC)
X-UUID: 497f41de36b411ee9cb5633481061a41-20230809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2sZQxcx0KmG2jwUfxyeIK+/P1Dx+ENWRtNYfhOBak7g=; 
 b=GshYwU0A1toA9mM5S9yem/GK7QVOJkQ7ZraC3HXb79piT5qvS9psVVxmj7KIZH7TJtt7NfFcwiITrhaLEZh7Qjqfih1ErD3Gi+8CK6j9DcziRAYRnyOjcoIJ5xiE8/iqJXDr9wuEaNch4sKEV6XTnsk9wPpkGV1Vy94Nw7D6ux8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:1e3868cc-2c88-44f1-ba04-71a629830e16, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.31, REQID:1e3868cc-2c88-44f1-ba04-71a629830e16, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:0ad78a4, CLOUDID:db4956ee-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:230809205725Q5Y6HLRD,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD, TF_CID_SPAM_SNR, TF_CID_SPAM_SDM,
 TF_CID_SPAM_ASC, TF_CID_SPAM_FAS
X-UUID: 497f41de36b411ee9cb5633481061a41-20230809
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1011126167; Wed, 09 Aug 2023 20:57:25 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Aug 2023 20:57:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Aug 2023 20:57:23 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>, Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v5 0/2] Fix OVL iommu fault in cursor plane
Date: Wed, 9 Aug 2023 20:57:20 +0800
Message-ID: <20230809125722.24112-1-jason-jh.lin@mediatek.com>
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

Change in v5:
1. Rollback the entire series to v3.
2. Add more commit message inyo [PATCH v5 2/2].

Change in RESEND v4 :
1. Remove redundant plane_state assigning.

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

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 3 +++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.18.0

