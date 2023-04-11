Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0786DDA47
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036C10E252;
	Tue, 11 Apr 2023 12:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 121BF10E252
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:08:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155600357"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 21:08:16 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id B093440065A3;
 Tue, 11 Apr 2023 21:08:12 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 0/8] Add RZ/{G2L,G2LC} and RZ/V2L DU support
Date: Tue, 11 Apr 2023 13:08:02 +0100
Message-Id: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.
 
The output from DSI is connected to ADV7535.

Created new CRTC/DRM driver specific to RZ/G2L alike SoCs using RCar DU lib.

This patch series tested on SMARC EVK based on RZ/{G2L,G2LC} and RZ/V2L SoCs.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20230411114235.366042-1-biju.das.jz@bp.renesas.com/T/#t

v6->v7:
 * Split DU lib and  RZ/G2L du driver as separate patch series as
   DU support added to more platforms based on RZ/G2L alike SoCs.
 * Rebased to latest drm-tip.
 * Added patch #2 for binding support for RZ/V2L DU
 * Added patch #4 for driver support for RZ/V2L DU
 * Added patch #5 for SoC DTSI support for RZ/G2L DU
 * Added patch #6 for SoC DTSI support for RZ/V2L DU
 * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L} SoCs.
 * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.

Biju Das (8):
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
  drm: rcar-du: Add RZ/G2L DU Support
  drm: rzg2l-du: Add RZ/V2L DU Support
  arm64: dts: renesas: r9a07g044: Add DU node
  arm64: dts: renesas: r9a07g054: Add DU node
  arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI
  arm64: dts: renesas: rzg2lc-smarc: Enable DU and link with DSI

 .../bindings/display/renesas,rzg2l-du.yaml    | 129 ++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  14 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  14 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  21 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |  21 +
 drivers/gpu/drm/rcar-du/Kconfig               |  17 +-
 drivers/gpu/drm/rcar-du/Makefile              |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  10 +
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 716 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h       |  26 +
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 197 +++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h        |  20 +
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c    |  26 +
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h    |  19 +
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c        | 157 ++++
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h        |  17 +
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  67 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c        |  82 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h        |  30 +
 19 files changed, 1594 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h

-- 
2.25.1

