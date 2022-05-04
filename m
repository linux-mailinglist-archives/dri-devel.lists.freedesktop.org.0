Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E16519B4B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE89E10FCAD;
	Wed,  4 May 2022 09:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E310FC69
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:14:48 +0000 (UTC)
X-UUID: 391dbbdc3b02457c9aa2a74a5a66e120-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c415f63b-080b-4030-9b40-9580c8930da4, OB:10,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:95
X-CID-INFO: VERSION:1.1.4, REQID:c415f63b-080b-4030-9b40-9580c8930da4, OB:10,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:95
X-CID-META: VersionHash:faefae9, CLOUDID:a98974c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:f1846824bb4a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 391dbbdc3b02457c9aa2a74a5a66e120-20220504
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1354402336; Wed, 04 May 2022 17:14:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 17:14:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 17:14:43 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v20 00/25] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Wed, 4 May 2022 17:14:15 +0800
Message-ID: <20220504091440.2052-1-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.

Add DRM and these modules support by the patches below:

Changes in v20:
- fix reviewer comment
  - update mmsys update bit api name
  - add mtk_mmsys_update_bits error message if lose gce property
  - list all mt8195 vdosys1 reset bits

Changes in v19:
- fix reviewer comment
  - separate mt8195 mmsys component to a new patch
  - separate mt8195 vdo0 and vdo1 routing table
  - separate mmsys_write_reg api to a new patch and simplify write reg code
  - separate mmsys 64 bit reset to a new patch
  - separate mtk-mutex dp_intf1 component to a new patch

Changes in v18:
- fix reviewer comment
  - fix rdma binding doc
  - fix ethdr binding doc
  - refine mmsys config cmdq support
  - refine merge reset control flow, get reset control in probe function
  - add ethdr reset control error handling and remove dbg log
- rebase to vdosys0 series v20 (ref [5])

Changes in v17:
- fix reviewer comment in v16
  - separate ovl adaptor comp in mtk-mmsys and mtk-mutex
  - separate mmsys config API
  - move mdp_rdma binding yaml
- fix ovl adaptor pm runtime get sync timing issue
- rebase to vdosys0 series v19 (ref [5])
- rebase to [7] for modify vblank register change

Changes in v16:
- fix reviewer comment in v 15
  - fix mtk_drm_ddp_comp.c alignment
  - fix vdosys0 mmsys num before adding vdosys1 patch

Changes in v15:
- fix ethdr uppercase hex number in dts

Changes in v14:
- remove MTK_MMSYS 64 bit dependency
- add ethdr.yaml back and fix dt_schema check fail

Resend v13
- add related maintainer in maillist

Changes in v13:
- fix reviewer comment in v12
  - fix rdma dt-binding format
  - fix dts node naming
- fix 32 bit build error
  - modify 64bit dependency for mtk-mmsys
- rebase to vdosys0 series v16. (ref [5])

Changes in v12:
- fix reviewer comment in v11
  - modify mbox index
  - refine dma dev for ovl_adaptor sub driver

Changes in v11:
- remove ethdr vblank spin lock
- refine ovl_adaptor print message

Changes in v10:
- refine ethdr reset control using devm_reset_control_array_get_optional_exclusive
- fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue

Changes in v9:
- rebase on kernel-5.16-rc1
- rebase on vdosys0 series v13. (ref [5])
- fix ovl_adaptor sub driver is brought up unintentionally
- fix clang build test fail- duplicate ethdr/mdp_rdma init_module/cleanup_module symbol issue 

Changes in v8:
- separate merge async reset to new patch.
- separate drm ovl_adaptor sub driver to new patch.
- fix reviewer comment in v7.

Changes in v7:
- rebase on vdosys0 series v12 (ref[5])
- add dma description in ethdr binding document.
- refine vdosys1 bit definition of mmsys routing table.
- separate merge modification into 3 pathces.
- separate mutex modification into 2 patches.
- add plane color coding for mdp_rdma csc.
- move mdp_rdma pm control to ovl_adaptor.
- fix reviewer comment in v6.

Changes in v6:
- rebase on kernel-5.15-rc1.
- change mbox label to gce0 for dts node of vdosys1.
- modify mmsys reset num for mt8195.
- rebase on vdosys0 series v10. (ref [5])
- use drm to bring up ovl_adaptor driver.
- move drm iommu/mutex check from kms init to drm bind.
- modify rdma binding doc location. (Documentation/devicetree/bindings/arm/)
- modify for reviewer's comment in v5.

Changes in v5:
- add mmsys reset controller reference.

Changes in v4:
- use merge common driver for merge1~4.
- refine ovl_adaptor rdma driver.
- use ovl_adaptor ddp_comp function instead of ethdr.
- modify for reviewer's comment in v3.

Changes in v3:
- modify for reviewer's comment in v2.
- add vdosys1 2 pixels align limit.
- add mixer odd offset support.

Changes in v2:
- Merge PSEUDO_OVL and ETHDR into one DRM component.
- Add mmsys config API for vdosys1 hardware setting.
- Add mmsys reset control using linux reset framework.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

This series are based on the following patch:
[1] arm64: dts: Add mediatek SoC mt8195 and evaluation board
    20220112114724.1953-4-tinghan.shen@mediatek.com
[2] arm64: dts: mt8195: add IOMMU and smi nodes
    20210615173233.26682-15-tinghan.shen@mediatek.com
[3] arm64: dts: mt8195: add gce node
    20220126090109.32143-1-jason-jh.lin@mediatek.com
[4] [v2] arm64: dts: mt8195: add display node for vdosys0
    20220225021535.2655-1-jason-jh.lin@mediatek.com
[5] Add MediaTek SoC DRM (vdosys0) support for mt8195 - v20 series
    20220419094143.9561-1-jason-jh.lin@mediatek.com
[6] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
    20220407075726.17771-2-yong.wu@mediatek.com
[7] [V2] drm/mediatek: Add vblank register/unregister callback functions
    20220321072320.15019-1-rex-bc.chen@mediatek.com

Nancy.Lin (25):
  dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  dt-bindings: mediatek: add ethdr definition for mt8195
  soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: add mtk_mmsys_update_bits API
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
    vdosys1
  soc: mediatek: mmsys: add mmsys for support 64 reset bits
  soc: mediatek: mmsys: add reset control for MT8195 vdosys1
  soc: mediatek: add mtk-mutex component - dp_intf1
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  drm/mediatek: add display MDP RDMA support for MT8195
  drm/mediatek: add display merge advance config API for MT8195
  drm/mediatek: add display merge start/stop API for cmdq support
  drm/mediatek: add display merge mute/unmute support for MT8195
  drm/mediatek: add display merge async reset control
  drm/mediatek: add ETHDR support for MT8195
  drm/mediatek: add mediatek-drm plane color encoding info
  drm/mediatek: add ovl_adaptor support for MT8195
  drm/mediatek: add dma dev get function
  drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
  drm/mediatek: add drm ovl_adaptor sub driver for MT8195
  drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
  arm64: dts: mt8195: add display node for vdosys1

 .../display/mediatek/mediatek,ethdr.yaml      | 191 +++++++
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  94 ++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 227 +++++++-
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  38 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  94 +++-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 514 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  96 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 125 +++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  58 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 351 ++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.h      |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 369 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  26 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 315 +++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |  20 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 146 +++++
 drivers/soc/mediatek/mtk-mmsys.c              | 134 +++--
 drivers/soc/mediatek/mtk-mmsys.h              |   1 +
 drivers/soc/mediatek/mtk-mutex.c              |  37 ++
 include/dt-bindings/reset/mt8195-resets.h     |  45 ++
 include/linux/soc/mediatek/mtk-mmsys.h        |  25 +
 25 files changed, 2709 insertions(+), 235 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h

-- 
2.18.0

