Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1B74CAA9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B52710E139;
	Mon, 10 Jul 2023 03:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854F810E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:39:13 +0000 (UTC)
X-UUID: 5394433e1ed311ee9cb5633481061a41-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5E6GCSOPPeBzjt5eT4wC80eT9w6Zqzi9GNxqzu2QMCg=; 
 b=h9K3SN9KOhIuaGNeM3ANipS58SZXUpH47+Q0u6Ry98DZIV6byAItB60XUqVdOcPOvb2qjHq1z7TjkpRZ4zwqE/NgMmCt9+9ttm/ujUNwu16Vt3CceXtTHx9WubGzf5wBjTdeRXC82GuJp1szV/19ghYSV0xLBhBKo6vo4n3NHBg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:4e6f6b0d-f9e5-42ba-873f-c72cc511ec61, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:01c9525, CLOUDID:5c15cfda-b4fa-43c8-9c3e-0d3fabd03ec0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5394433e1ed311ee9cb5633481061a41-20230710
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1750630283; Mon, 10 Jul 2023 11:39:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 11:39:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 11:39:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v6 0/2] Add dynamic connector selection mechanism
Date: Mon, 10 Jul 2023 10:52:45 +0800
Message-ID: <20230710025247.20365-1-jason-jh.lin@mediatek.com>
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support DSI and eDP as main display connector without modifying
mtk-drm driver, we add the dynamic connector selection mechanism.

Change in v6:
1. remove max_ddp_comp_nr.

Change in v5:
1. Change conn_routes array to single component enum id.

Change in v4:
1. Change variable naming from conn_route_num to num_conn_routes.
2. Change he encoder_index function return valuew from int to unsigned int.

Change in v3:
1. Change max_num comparison statement to max().

Change in v2:
1. rebase on linux-next: next-20230426
2. Fix alphabetical order and max_num condition check problem.

Change in v1:
1. based on mediatek-drm maintainer's tree / mediatek-drm-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Jason-JH.Lin (2):
  drm/mediatek: Add ability to support dynamic connector selection
  drm/mediatek: Add DSI support for mt8188 vdosys0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 84 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 38 ++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 +++
 9 files changed, 180 insertions(+), 9 deletions(-)

-- 
2.18.0

