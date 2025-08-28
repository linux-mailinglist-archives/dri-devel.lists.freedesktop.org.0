Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8BB39648
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74C410E6CC;
	Thu, 28 Aug 2025 08:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="P739h/2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC2D10E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:13 +0000 (UTC)
X-UUID: 43c9b05483e611f0b33aeb1e7f16c2b6-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+650otIaLzyUp5/Ps4TfZ8nTIEmkXXQq3SPw7W37GNU=; 
 b=P739h/2e1FlQ5teJy1WUCFNOSk87LWyOb6ELrVLBKn1fjrIMAf9DvJbjpGRYU5TpwNVx0G45755LajLE3C+je+kDgQfkLj4sesjsWxmtsBzge6jwg9/Hri2vK6t9oZ+/d/kvyX62Y/snbIk8IFWzkTFLX73Dn2TmVBY7iTM1eEs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:c0a9a143-10bd-4adc-9dbc-bfef3f650672, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:fd0a9920-786d-4870-a017-e7b4f3839b3f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
 nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
 ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 43c9b05483e611f0b33aeb1e7f16c2b6-20250828
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 626211355; Thu, 28 Aug 2025 16:09:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:03 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 00/19] Add MediaTek SoC DRM support for MT8196
Date: Thu, 28 Aug 2025 16:06:55 +0800
Message-ID: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Changes in v4:
- [PATCH v4 11/19]
  Add New commit to refactor the naming of OVL Fornat.
- [PATCH v4 12/19]
  Refactor ovl_blend_mode fucntion
- [PATCH v4 13/19]
  Move mtk_ovl_get_blend_mode to this commit to align with driver.
- [PATCH v4 14/19]
  Remove the unused paramter cmdq
  Remove the reapet of pitch setting
- [PATCH v4 15/19]
  Remove the unused paramter cmdq
  Remove the useless parametrt of func():mtk_disp_blender_config
- [PATCH v4 16/19] 
  Simplified the driiver code to improve readability 
- [PATCH v4 17/19]
  Refine mtk_ovlsys_adaptor_layer_config's layer config checking. 
  Refine mtk_ovlsys_adaptor_config's logic
  Fix func()'s mtk_ovlsys_adaptor_stop settting
  Refine mtk_ovlsys_adaptor_clk_enbale to repaet NULL checking
- [PATCH v4 18/19]
  Fix the system report's syntext error

Changes in v3:
- [PATCH v3 06/17] 
  Refine runtime PM, top clocks and async controls for MMSYS 
- [PATCH v3 08/17]
  Refactor SOF settings by adding mtk_mutex_get_output_comp_sof() and
  extracting SOF logic from mtk_mutex_add_comp() 
  and mtk_mutex_remove_comp()
- [PATCH v3 10/17]
  Export OVL format definitions and format 
  conversion API
- [PATCH v3 11/17]
  Export OVL ignore pixel alpha logic
- [PATCH v3 12/17] 
  Refactor exdma_config setup to reduce complexity 
  and consolidate duplicate settings in exdma_layer_config()
- [PATCH v3 13/17]
  Refine blender's layer_config driver for improved efficiency
- [PATCH v3 14/17] Refine outproc driver: use readl() and writel() to 
  replace mtk_ddp_write_mask() for normal mode settings
- [PATCH v3 15/17]
  Refine ovlsys_adaptor driver:Use path instead of ovl_adaptor_comp for 
  searching component type. Improve efficiency of config, start, stop, 
  and layer_config functions
- [PATCH v3 16/17] 
  Refine mtk_find_possible_crtcs() function

Changes in v2:
- add support for MT8196's new hardware components (EXDMA, BLENDER, 
  OUTPROC) following the previous MTK OVL software architecture.
- reuse mtk_ovl drivers in MediaTek DRM display to support the new 
  MT8196 SoC.
- implement support for multiple mmsys instances within a single 
  mediatek-drm driver, improving flexibility and scalability.
- refactor existing components (mutex, OVL) to accommodate the new 
  architecture and improve code reusability.
- update component matching, binding log

Nancy Lin (12):
  dt-bindings: arm: mediatek: mmsys: add compatible for MT8196
  dt-bindings: soc: mediatek: add mutex yaml for MT8196
  soc: mediatek: Add runtime PM and top clocks and async controls for
    MMSYS
  soc: mediatek: add mmsys support for MT8196
  soc: mediatek: mutex: add mutex support for MT8196
  drm/mediatek: Export OVL formats definitions and format conversion API
  drm/mediatek: add EXDMA support for MT8196
  drm/mediatek: add BLENDER support for MT8196
  drm/mediatek: add OUTPROC support for MT8196
  drm/mediatek: add ovlsys_adaptor support for MT8196
  drm/mediatek: Add support for multiple mmsys in the one mediatek-drm
    driver
  drm/mediatek: Add support for MT8196 multiple mmsys

Paul-pl Chen (7):
  dt-bindings: display: mediatek: add EXDMA yaml for MT8196
  dt-bindings: display: mediatek: add BLENDER yaml for MT8196
  dt-bindings: display: mediatek: add OUTPROC yaml for MT8196
  soc: mediatek: mutex: Reused the switch case for SOF ID
  soc: mediatek: mutex: refactor SOF settings for output components
  drm/mediatek: Rename OVL format naming
  drm/mediatek: Export OVL Blend function

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   5 +
 .../display/mediatek/mediatek,blender.yaml    |  47 ++
 .../display/mediatek/mediatek,outproc.yaml    |  54 ++
 .../bindings/dma/mediatek,exdma.yaml          |  68 ++
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   2 +
 drivers/gpu/drm/mediatek/Makefile             |   4 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           | 342 +++++++--
 drivers/gpu/drm/mediatek/mtk_crtc.h           |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 136 +++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_blender.c   | 274 +++++++
 drivers/gpu/drm/mediatek/mtk_disp_blender.h   |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  66 ++
 drivers/gpu/drm/mediatek/mtk_disp_exdma.c     | 359 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c   | 235 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h   |  22 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 229 ++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h       |  29 +
 .../drm/mediatek/mtk_disp_ovlsys_adaptor.c    | 717 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 276 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  27 +-
 drivers/soc/mediatek/mt8196-mmsys.h           | 396 ++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 206 ++++-
 drivers/soc/mediatek/mtk-mmsys.h              |  18 +
 drivers/soc/mediatek/mtk-mutex.c              | 288 +++++--
 include/linux/soc/mediatek/mtk-mmsys.h        |  60 ++
 include/linux/soc/mediatek/mtk-mutex.h        |   4 +
 27 files changed, 3593 insertions(+), 293 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
 create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h

-- 
2.45.2

