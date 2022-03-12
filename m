Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB54D7127
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 22:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C12910E08F;
	Sat, 12 Mar 2022 21:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C110E08F
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 21:54:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; d="scan'208";a="113308965"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 997354005E2B;
 Sun, 13 Mar 2022 06:54:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/7] Add RZ/G2L Display support
Date: Sat, 12 Mar 2022 21:54:10 +0000
Message-Id: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.

This patch series aims to add basic display support on RZ/G2L SMARC EVK
platform. The output from DSI is connected to ADV7535.

The DU controller is similar to R-Car as it is connected to VSPD,
so reusing most of R-Car code with new CRTC driver specific to
RZ/G2L

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

Biju Das (7):
  dt-bindings: display: renesas,du: Document r9a07g044l bindings
  drm: rcar-du: Add num_rpf to struct rcar_du_device_info
  drm: rcar-du: Add max_width and max_height to struct
    rcar_du_device_info
  drm: rcar-du: Move rcar_du_output_name() to rcar_du_common.c
  drm: rcar-du: Factorise rcar_du_{atomic_check,modeset_init}
  drm: rcar-du: Factorise
    rcar_du_vsp{complete,enable,plane_atomic_check}
  drm: rcar-du: Add RZ/G2L LCDC Support

 .../bindings/display/renesas,du.yaml          |  54 ++
 drivers/gpu/drm/rcar-du/Kconfig               |  18 +-
 drivers/gpu/drm/rcar-du/Makefile              |  14 +
 drivers/gpu/drm/rcar-du/rcar_du_common.c      |  30 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   7 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 100 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  31 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  23 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h       |  12 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  18 +-
 drivers/gpu/drm/rcar-du/rzg2l_lcdc_crtc.c     | 722 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_lcdc_drv.c      | 221 ++++++
 drivers/gpu/drm/rcar-du/rzg2l_lcdc_plane.c    |  82 ++
 drivers/gpu/drm/rcar-du/rzg2l_lcdc_regs.h     |  64 ++
 14 files changed, 1351 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_lcdc_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_lcdc_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_lcdc_plane.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_lcdc_regs.h

-- 
2.17.1

