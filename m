Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32613D212C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61376EE15;
	Thu, 22 Jul 2021 09:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019AD6EE13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:46:05 +0000 (UTC)
X-UUID: df7460fb12314284a66ca74b498fb515-20210722
X-UUID: df7460fb12314284a66ca74b498fb515-20210722
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 664237718; Thu, 22 Jul 2021 17:46:00 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:52 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 00/14] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Thu, 22 Jul 2021 17:45:37 +0800
Message-ID: <20210722094551.15255-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, PSEUDO_OVL and MERGE.

Add DRM and these modules support by the patches below:

Change in v2:
- Merge PSEUDO_OVL and ETHDR into one DRM component.
- Add mmsys config API for vdosys1 hardware setting.
- Add mmsys reset control using linux reset framework.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

This series are based on the following patch:
[1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2] arm64: dts: mt8195: add IOMMU and smi nodes
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[3] [01/24] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210630023504.18177-2-yong.wu@mediatek.com/
[4] Add gce support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=515599
[5] Add MediaTek SoC DRM (vdosys0) support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=516277
[6] [v5,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller head file
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210628113730.26107-3-Christine.Zhu@mediatek.com/

Nancy.Lin (14):
  dt-bindings: mediatek: add vdosys1 RDMA/MERGE definition for mt8195
  dt-bindings: mediatek: add ethdr definition for mt8195
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: reset: mt8195: Move reset controller constants into
    common location
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  arm64: dts: mt8195: add display node for vdosys1
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: mmsys: Add reset controller support for MT8195 vdosys1
  soc: mediatek: mmsys: add new mtk_mmsys struct member to store drm
    data.
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  drm/mediatek: add pseudo ovl support for MT8195
  drm/mediatek: add ETHDR support for MT8195
  drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   3 +
 .../display/mediatek/mediatek,disp.yaml       |  38 ++
 .../display/mediatek/mediatek,ethdr.yaml      | 144 +++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 217 +++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  16 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   4 +
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.c    | 593 ++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.h    |  23 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 381 +++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   9 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 413 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 456 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       | 109 ++++
 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h   | 160 +++++
 drivers/soc/mediatek/mt8195-mmsys.h           | 122 +++-
 drivers/soc/mediatek/mtk-mmsys.c              | 138 ++++
 drivers/soc/mediatek/mtk-mmsys.h              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 270 ++++----
 .../mt8195-resets.h                           |  12 +
 include/linux/soc/mediatek/mtk-mmsys.h        |  20 +
 25 files changed, 2996 insertions(+), 185 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h
 rename include/dt-bindings/{reset-controller => reset}/mt8195-resets.h (66%)

-- 
2.18.0

