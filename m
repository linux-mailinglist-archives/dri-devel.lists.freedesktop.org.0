Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE5E986EE2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13A410EB0B;
	Thu, 26 Sep 2024 08:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YSCmne2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CAB10EB0B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:36:18 +0000 (UTC)
X-UUID: 6346161e7be211efb66947d174671e26-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mUIEIOTVEOxWCkdNGpdYL1C7JlQvaQX1nk+/uj7MHS0=; 
 b=YSCmne2ZwQT1lDJo0+yn/tlrQg4uRf3XqKSgLnsn/HDpm01TehPjM/IxXj1aSljvbsHDq3UzE8iltSFLe3gll9nOZUZG1fNaMQcSxQ/6r9va6CmxXuKO/OuqmI2haRAt1MBhWHrFdeF/nAxMQR02BAT3rFSkYnrJv7p4b8Er314=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:e48866cb-9dcb-4962-a60d-82bc21aba7d0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:90dbccd0-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6346161e7be211efb66947d174671e26-20240926
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1312321736; Thu, 26 Sep 2024 16:36:13 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 16:36:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 16:36:11 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 0/2] Fix degradation problem of alpha blending series
Date: Thu, 26 Sep 2024 16:35:24 +0800
Message-ID: <20240926083526.24629-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs not support pre-multiplied pixel formats and extending
configuration of OVL pre-multiplied color formats, such as MT8173.

Fix the SoC degradation problem by this sreies.

---

Chnage in v6:
1. Use blend_modes instead of function pointer in OVL
2. Use ethdr instead of mdp_rdma to get blend_modes
3. Add 0 checking for adding blend_mode property for mtk_plane

Change in v5:
Add fix patch for mtk_plane

Change in v4:
Add lost cases of mtk_ovl_fmt_convert_with_blend

Change in v3:
Change MACRO approach to function pointer in driver data

Change in v2:
Fix build error and typo

Change in v1:
Add fix patch for OVL unsupport color format settings by driver data

---

Jason-JH.Lin (2):
  drm/mediatek: ovl: Add blend_modes to driver data
  drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

 drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 ++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 48 ++++++++++++++++---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 +++
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 +++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c          | 15 +++---
 drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
 10 files changed, 80 insertions(+), 17 deletions(-)

-- 
2.43.0

