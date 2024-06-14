Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FC9081DE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 04:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD70510EC01;
	Fri, 14 Jun 2024 02:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="D08jlQ2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8D10EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:46:29 +0000 (UTC)
X-UUID: 49665bf029f811efa22eafcdcd04c131-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FBOTipKdhwPMUM/fdFD0D1fdazLJkTD6AhWAkm3itOg=; 
 b=D08jlQ2tDnRUdqrPtjpl9gnTl+U/4Jl6pofBxfsaIaoW5QFwvYmQYJMvGuqFDxP1EsnpEQhahE1E9p27/+x5B/D9o7hgLHnTSRrbsHxmrOO8TLSeFXiGZKjSIf67CI6H2kfKcs2qWoQ0HbXR+YU+E5gVXo0qo9wzuhamdS4tPxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:26bed175-b0fd-4b89-af8c-5d31ab207883, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:95df9188-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 49665bf029f811efa22eafcdcd04c131-20240614
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1415769070; Fri, 14 Jun 2024 10:46:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 10:46:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 10:46:21 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bibby
 Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>, Fei Shao
 <fshao@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v9 00/21] Support IGT in display driver
Date: Fri, 14 Jun 2024 10:45:59 +0800
Message-ID: <20240614024620.19011-1-shawn.sung@mediatek.com>
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

This series adds support for running IGT (Intel GPU Tool) tests with
MediaTek display driver. The following changes will be applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1

Changes in v9:
- Separate the patch into smaller ones

Changes in v8:
- Start/Stop CRC CMDQ thread on when needed
- Squash and rearrange the commits
- Add more information to the commit message and comments

Changes in v7:
- Separate the patch into smaller ones

Changes in v6:
- Use drm_vblank_work to deffer the CRC work into bottom halves
- Separate the patches for "Premultiplied" and "None" alpha blending

Changes in v5:
- Add more descriptions to the codes
- Add DRM mode configs to the driver data
- Squash and rearrange the commits

Changes in v4:
- Separate the patch into smaller ones
- Change the title of some patches
- Revert the changes that are not related to the series

Changes in v3:
- Modify the dt-binding document of Mediatek OVL
- Set DRM mode configs accroding to the hardware capabilities
- Replace cmdq_pkt_jump_absolute() with cmdq_pkt_jump()

Changes in v2:
- Simplify CMDQ by adding commands that are currently used only
- Integrate CRC related codes into new APIs for Mixer and OVL to reuse
- Add CPU version CRC retrieval when CMDQ is disabled

Hsiao Chien Sung (21):
  soc: mediatek: Disable 9-bit alpha in ETHDR
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
  drm/mediatek: Set DRM mode configs accordingly
  drm/mediatek: Turn off the layers with zero width or height
  drm/mediatek: Support more 10bit formats in OVL
  drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
  drm/mediatek: Fix XRGB setting error in OVL
  drm/mediatek: Fix XRGB setting error in Mixer
  drm/mediatek: Add new color format MACROs in OVL
  drm/mediatek: Support DRM plane alpha in OVL
  drm/mediatek: Support DRM plane alpha in Mixer
  drm/mediatek: Support "None" blending in OVL
  drm/mediatek: Support "None" blending in Mixer
  drm/mediatek: Support "Pre-multiplied" blending in OVL
  drm/mediatek: Support "Pre-multiplied" blending in Mixer
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in OVL
  drm/mediatek: Support CRC in OVL adaptor

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 279 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  38 ++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  10 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 330 +++++++++++++++---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  37 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  24 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 110 +++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   7 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  15 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 13 files changed, 826 insertions(+), 50 deletions(-)

--
2.18.0

