Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033DB428725
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 09:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F586E417;
	Mon, 11 Oct 2021 07:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B29E6E417
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 07:02:53 +0000 (UTC)
X-UUID: fdd0e469a2e949298b1827122c71b0bf-20211011
X-UUID: fdd0e469a2e949298b1827122c71b0bf-20211011
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2083840527; Mon, 11 Oct 2021 15:02:48 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 15:02:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 11 Oct 2021 15:02:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 15:02:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7,
 00/15] Support multi hardware decode using of_platform_populate
Date: Mon, 11 Oct 2021 15:02:32 +0800
Message-ID: <20211011070247.792-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series adds support for multi hardware decode into mtk-vcodec, by first
adding use of_platform_populate to manage each hardware information: interrupt,
clock, register bases and power. Secondly add core thread to deal with core
hardware message, at the same time, add msg queue for different hardware
share messages. Lastly, the architecture of different specs are not the same,
using specs type to separate them.

This series has been tested with both MT8183 and MT8173. Decoding was working
for both chips.

Patches 1~3 rewrite get register bases and power on/off interface.

Patch 4 add to support multi hardware.

Patch 5 separate video encoder and decoder document

Patches 6-15 add interfaces to support core hardware.
----
Changes compared with v6:
- Use of_platform_populate to manage multi hardware, not component framework for patch 4/15
- Re-write dtsi document for hardware architecture changed for patch 13/15
-The dtsi will write like below in patch 13/15:
    vcodec_dec: vcodec_dec@16000000 {
        compatible = "mediatek,mt8192-vcodec-dec";
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;
        reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
        mediatek,scp = <&scp>;
        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
        vcodec_lat {
            compatible = "mediatek,mtk-vcodec-lat";
            reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
            reg-name = "reg-misc";
            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
                 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
                 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
                 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
                 <&topckgen CLK_TOP_MAINPLL_D4>;
            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
                  "vdec-vdec", "vdec-top";
            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
        };

        vcodec_core {
            compatible = "mediatek,mtk-vcodec-core";
            reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
            reg-names = "reg-misc";
            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
                 <&vdecsys CLK_VDEC_VDEC>,
                 <&vdecsys CLK_VDEC_LAT>,
                 <&vdecsys CLK_VDEC_LARB1>,
                 <&topckgen CLK_TOP_MAINPLL_D4>;
            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
                  "vdec-vdec", "vdec-top";
            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
        };
    };

Changes compared with v5:
- Add decoder hardware block diagram for patch 13/15

Changes compared with v4:
- Fix comments for patch 4/15
  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  Fix platform_set_drvdata.
- Fix build error for patch 9/15
- Add depend patch in case of error header file for patch 13/15

Changes compared with v3:
- Fix return value for patch 1/15
- Fix comments for patch 4/15
  > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
  Add prameter in pdata, for all platform will use compoent after mt8183

  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  > + Has asked the same question in [1].  Why it removes the
  > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
  Must call component_master_add_with_match after platform_set_drvdata for component architecture.
- Fix yaml files check fail for patch 5/15
- Fix yaml file check fail for patch 14/15

Changes compared with v1:
- Fix many comments for patch 3/14
- Remove unnecessary code for patch 4/14
- Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
- Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
- Using yaml format to instead of txt file for patch 12/14

Yunfei Dong (15):
  media: mtk-vcodec: Get numbers of register bases from DT
  media: mtk-vcodec: Align vcodec wake up interrupt interface
  media: mtk-vcodec: Refactor vcodec pm interface
  media: mtk-vcodec: Manage multi hardware information
  dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
    dt-bindings
  media: mtk-vcodec: Use pure single core for MT8183
  media: mtk-vcodec: Add irq interface for multi hardware
  media: mtk-vcodec: Add msg queue feature for lat and core architecture
  media: mtk-vcodec: Generalize power and clock on/off interfaces
  media: mtk-vcodec: Add new interface to lock different hardware
  media: mtk-vcodec: Add core thread
  media: mtk-vcodec: Support 34bits dma address for vdec
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
  media: mtk-vcodec: Add core dec and dec end ipi msg
  media: mtk-vcodec: Use codec type to separate different hardware

 .../media/mediatek,vcodec-comp-decoder.yaml   | 193 ++++++++++++
 .../media/mediatek,vcodec-decoder.yaml        | 175 +++++++++++
 .../media/mediatek,vcodec-encoder.yaml        | 185 +++++++++++
 .../bindings/media/mediatek-vcodec.txt        | 130 --------
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 233 +++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 165 ++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  53 ++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   2 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  75 ++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  12 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 +++++-
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 290 ++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 157 ++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
 33 files changed, 1756 insertions(+), 278 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

-- 
2.25.1

