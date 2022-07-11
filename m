Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3CD562A0B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 05:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437DB10F519;
	Fri,  1 Jul 2022 03:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E31C10F457
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 03:58:56 +0000 (UTC)
X-UUID: c8942c8113e44446ac8218def143e582-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:98d646e1-8d6a-4ee5-bb0b-aa3d0b9cbca4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:87442a2, CLOUDID:a8804186-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: c8942c8113e44446ac8218def143e582-20220701
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1184908001; Fri, 01 Jul 2022 11:58:48 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 1 Jul 2022 11:58:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 11:58:46 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Subject: [PATCH v15 00/16] drm/mediatek: Add MT8195 dp_intf driver
Date: Fri, 1 Jul 2022 11:58:29 +0800
Message-ID: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, liangxu.xu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpi/dpintf driver and the added helper functions are required for
the DisplayPort driver to work.

This series is separated from [1] which is original from Guillaume.
The display port driver is [2].

Changes for v15:
1. Add a patch to remove support for output yuv422 for previous socs.
2. Only remain output format of reg888/yuv422 support for mt8195.
3. Adjust the order of patches.

Changes for v14:
1. Separate a new binding patch to modify mediatek string format.
2. Use GENMASK(4, 0) for INT_MATRIX_SEL_MASK in patch
   "Add YUV422 output support"
3. Change kernel doc description of support_direct_pin.
4. Change to use pixels_per_iter to control quantity of transferred
   pixels per iterration.

Changes for v13:
1. Change mediatek,mt8195-dp_intf to mediatek,mt8195-dp-intf.
2. Add kernel doc for mtk_dpi_conf.
3. Drop patch of tvd_pll enable.
4. Squash some color format transfer related patches.
5. Add new patch to support setting of direct connection to pins.
6. Change fix tag of "drm/mediatek: dpi: Only enable dpi after the bridge is enabled".

Changes for v12:
1. Remove pll_gate.
2. Add more detailed commit message.
3. Separate tvd_clk patch and yuv422 output support from add dpintf
   support patch
4. Remove limit patch and use common driver codes to determine this.

Changes for v11:
1. Rename ck_cg to pll_gate.
2. Add some commit message to clarify the modification reason.
3. Fix some driver order and modify for reviewers' comments.

[1]:https://lore.kernel.org/all/20220523104758.29531-1-granquet@baylibre.com/
[2]:https://lore.kernel.org/all/20220610105522.13449-1-rex-bc.chen@mediatek.com/

Bo-Chen Chen (6):
  dt-bindings: mediatek,dpi: Revise mediatek strings to correct format
  drm/mediatek: dpi: Add kernel document for struct mtk_dpi_conf
  drm/mediatek: dpi: Remove output format of YUV
  drm/mediatek: dpi: Add support for quantization range
  drm/mediatek: dpi: Add YUV422 output support
  drm/mediatek: dpi: add config to support direct connection to dpi
    panels

Guillaume Ranquet (9):
  drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
  drm/mediatek: dpi: implement a swap_input toggle in SoC config
  drm/mediatek: dpi: move dimension mask to SoC config
  drm/mediatek: dpi: move hvsize_mask to SoC config
  drm/mediatek: dpi: move swap_shift to SoC config
  drm/mediatek: dpi: move the yuv422_en_bit to SoC config
  drm/mediatek: dpi: move the csc_enable bit to SoC config
  drm/mediatek: dpi: Only enable dpi after the bridge is enabled
  drm/mediatek: dpi: Add dp_intf support

Markus Schneider-Pargmann (1):
  dt-bindings: mediatek,dpi: Add DP_INTF compatible

 .../display/mediatek/mediatek,dpi.yaml        |  11 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 283 ++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |  18 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   3 +
 6 files changed, 257 insertions(+), 63 deletions(-)

-- 
2.18.0

