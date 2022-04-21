Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F2A50A57D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAAE10E167;
	Thu, 21 Apr 2022 16:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47F7C10E167
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 16:31:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,279,1643641200"; d="scan'208";a="117591258"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 22 Apr 2022 01:31:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.11])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9351140065CE;
 Fri, 22 Apr 2022 01:31:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v3 0/4] Add RZ/G2L Display support
Date: Thu, 21 Apr 2022 17:31:24 +0100
Message-Id: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
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
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.

This patch series aims to add basic display support on RZ/G2L SMARC EVK
platform. The output from DSI is connected to ADV7535.

The DU controller is similar to R-Car as it is connected to VSPD,
so most of code is based on R-Car with new CRTC/DRM driver specific to
RZ/G2L

V2->v3:
 * Added new bindings for RZ/G2L DU
 * Removed indirection and created new DRM driver based on R-Car DU
v1->v2:
 * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
 * Updated commit description for bindings
 * Removed LCDC references from bindings
 * Changed clock name from du.0->aclk from bindings
 * Changed reset name from du.0->du from bindings
 * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
 * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
 * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
 * Added forward declaration for struct reset_control

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220312084205.31462-2-biju.das.jz@bp.renesas.com/

RFC->v1:
 * Changed  minItems->maxItems for renesas,vsps.
 * Added RZ/G2L LCDC driver with special handling for CRTC reusing
   most of RCar DU code
 * Fixed the comments for num_rpf from rpf's->RPFs/ and vsp->VSP.
RFC:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-12-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-13-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-19-biju.das.jz@bp.renesas.com/

Biju Das (4):
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  drm: rcar-du: Fix typo
  drm: rcar-du: Add num_rpf to struct rcar_du_device_info
  drm: rcar-du: Add RZ/G2L DU Support

 .../bindings/display/renesas,rzg2l-du.yaml    | 159 ++++
 drivers/gpu/drm/rcar-du/Kconfig               |  16 +-
 drivers/gpu/drm/rcar-du/Makefile              |   9 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  17 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   8 +-
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 745 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h       | 104 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 192 +++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h        | 102 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c    | 113 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h    |  29 +
 drivers/gpu/drm/rcar-du/rzg2l_du_group.h      |  32 +
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c        | 782 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h        |  43 +
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  64 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c        | 420 ++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h        |  93 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c  | 247 ++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h  |  42 +
 20 files changed, 3212 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_group.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h

-- 
2.25.1

