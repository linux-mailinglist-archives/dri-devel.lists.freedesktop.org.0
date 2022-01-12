Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57C48CA17
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EFF10E721;
	Wed, 12 Jan 2022 17:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id C26EE10E724
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:46:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106270320"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 09C604005E1F;
 Thu, 13 Jan 2022 02:46:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [RFC 00/28] Add RZ/G2L Display support
Date: Wed, 12 Jan 2022 17:45:44 +0000
Message-Id: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-clk@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
Video signal processor (VSPD) and Display unit(DU). The output of
LCDC is connected to Display parallel interface and MIPI link video
interface. 

This patch series aims to add basic display support on RZ/G2L SMARC
EVK platform. The output from DSI is connected to ADV7535.

Implemntation details:-

Clock:-

PLL5 generates 2 clock sources, FOUTPOSTDIV and FOUT1PH0
and vclk is sourced through DSI divider which is connected
to a mux with the above clock sources.

Pll5-->Mux->DSI divider--> vclk.

The parameters used for generating PLL5 frequency is based on
a LUT[1] from the bsp release.

DSI mode and DPI mode needs different set of PLL5 parameters
for generating the video clock. Currently we support only
DSI mode. later extend this to support DPI mode.

LCDC:

DU shares same clocks and reset line with VSPD and FCPVD.
it does not have DU group and plane registers like R-Car.
it supports FHD@60 for DSI interface.

VSPD:
 
VSPD does not have version register, so a new compatible
introduced to get version string.

Please share your valuable comments on this patch series.

[1]https://github.com/renesas-rz/rz_linux-cip/tree/rzg2l-cip41/drivers/gpu/drm/rcar-du

Biju Das (28):
  clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
  clk: renesas: rzg2l: Add PLL5_4 clk mux support
  clk: renesas: rzg2l: Add DSI divider clk support
  clk: renesas: r9a07g044: Add M1 clock support
  clk: renesas: r9a07g044: Add {M2, M2_DIV2} Clocks support
  clk: renesas: r9a07g044: Add M3 Clock support
  clk: renesas: r9a07g044: Add M4 Clock support
  clk: renesas: r9a07g044: Add LCDC clock and reset entries
  clk: renesas: r9a07g044: Add DSI clock and reset entries
  drm: rcar-du: of: Increase buff size for compatible variable
  drm: rcar-du: Add num_rpf to struct rcar_du_device_info
  drm: rcar-du: Add max_width and max_height to struct
    rcar_du_device_info
  drm: rcar-du: Add RCAR_DU_FEATURE_PLANE feature bit
  drm: rcar-du: Allow DU plane feature based on DU feature bit
  drm: rcar_du: Add RCAR_DU_FEATURE_GROUP feature bit
  drm: rcar-du: Allow DU group feature based on feature bit
  dt-bindings: display: renesas,du: Document r9a07g044l bindings
  drm: rcar-du: Add RZ/G2L LCDC Support
  media: dt-bindings: media: renesas,vsp1: Document RZ/{G2L,V2L} VSPD
    bindings
  media: vsp1: Add support for the RZ/G2L VSPD
  dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
  drm: rcar-du: Add RZ/G2L DSI driver
  arm64: dts: renesas: r9a07g044: Add fcpvd node
  arm64: dts: renesas: r9a07g044: Add vspd node
  arm64: dts: renesas: r9a07g044: Add DU node
  arm64: dts: renesas: r9a07g044: Add dsi node
  arm64: dts: renesas: r9a07g044: Link DSI with DU node
  arm64: dts: renesas: rzg2l-smarc: Enable Display on carrier board

 .../bindings/display/bridge/renesas,dsi.yaml  | 143 ++++
 .../bindings/display/renesas,du.yaml          |  54 ++
 .../bindings/media/renesas,vsp1.yaml          |   4 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  94 +++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  61 ++
 drivers/clk/renesas/r9a07g044-cpg.c           |  57 ++
 drivers/clk/renesas/rzg2l-cpg.c               | 426 +++++++++++
 drivers/clk/renesas/rzg2l-cpg.h               |  31 +
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        | 151 +++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 144 +++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   9 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |  15 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  17 +-
 drivers/gpu/drm/rcar-du/rcar_du_of.c          |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |  52 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   9 +-
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 676 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
 drivers/media/platform/vsp1/vsp1.h            |   1 +
 drivers/media/platform/vsp1/vsp1_drv.c        |  31 +-
 drivers/media/platform/vsp1/vsp1_lif.c        |   7 +-
 drivers/media/platform/vsp1/vsp1_regs.h       |   1 +
 25 files changed, 2070 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
2.17.1

