Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893696F02B2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 10:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2FD10E35F;
	Thu, 27 Apr 2023 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D584C10E354
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:40:51 +0000 (UTC)
X-UUID: 323f2068e4d711edb6b9f13eb10bd0fe-20230427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oIbfjJ3OavkLDjGoIVUXgc/e5g7Z0WCTQAniVtrOY2Q=; 
 b=OpnaGd0p35h4iW7OpdCsl0MLb+a/ZAK7tcHujSI6XoPga3pSyDKOOMETrTxdxZmHkJCFJOLlOmwfG5ft14lW9NxVBkSgU/TnK8yb/LPTjZv9iR7hbDw+7uxoGR9/X5bWL6WKCFpQnHDyyfH4VjgN+KCdmPh5NSpZimra+gCtABg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:1c7cb2f2-b64a-4e7b-acf8-8448e28261be, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:100
X-CID-INFO: VERSION:1.1.22, REQID:1c7cb2f2-b64a-4e7b-acf8-8448e28261be, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:100
X-CID-META: VersionHash:120426c, CLOUDID:4fe00f30-6935-4eab-a959-f84f8da15543,
 B
 ulkID:2304271640462SG83525,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 323f2068e4d711edb6b9f13eb10bd0fe-20230427
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 122693121; Thu, 27 Apr 2023 16:40:43 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 27 Apr 2023 16:40:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Apr 2023 16:40:41 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v2 0/2] Add dynamic connector selection mechanism
Date: Thu, 27 Apr 2023 16:40:38 +0800
Message-ID: <20230427084040.3651-1-jason-jh.lin@mediatek.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support DSI and eDP as main display connector without modifying
mtk-drm driver, we add the dynamic connector selection mechanism.

Change in v2:
1. rebase on linux-next: next-20230426
2. Fix alphabetical order and max_num condition check problem.

Change in v1:
1. based on mediatek-drm maintainer's tree / mediatek-drm-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Jason-JH.Lin (2):
  drm/mediatek: Add ability to support dynamic connector selection
  drm/mediatek: Add DSI support for mt8188 vdosys0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 112 +++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  28 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 +++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   8 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c          |   9 ++
 9 files changed, 219 insertions(+), 11 deletions(-)

-- 
2.18.0

