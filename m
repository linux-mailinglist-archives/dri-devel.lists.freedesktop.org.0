Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C05090AF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 21:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A03710F270;
	Wed, 20 Apr 2022 19:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FA1E10F279
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 19:50:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,276,1643641200"; d="scan'208";a="117477390"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 21 Apr 2022 04:50:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.11])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id B5B76400966F;
 Thu, 21 Apr 2022 04:50:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 0/2] Add RZ/G2L DSI driver
Date: Wed, 20 Apr 2022 20:50:09 +0100
Message-Id: <20220420195011.73617-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch series aims to support the MIPI DSI encoder found in the RZ/G2L
SoC. It currently supports DSI mode only.

This unit supports MIPI Alliance Specification for Display Serial Interface (DSI) Specification. This unit provides a
solution for transmitting MIPI DSI compliant digital video and packets. Normative References are below.
* MIPI Alliance Specification for Display Serial Interface Version 1.3.1
* MIPI Alliance Specification for D-PHY Version 2.1

The following are key features of this unit.

* 1 channel
* The number of Lane: 4-lane
* Support up to Full HD (1920 × 1080), 60 fps (RGB888)
* Maximum Bandwidth: 1.5 Gbps per lane
* Support Output Data Format: RGB666 / RGB888

v2->v3:
 * Added Rb tag from Geert and Laurent for the binding patch.
 * Fixed the typo "Receive" -> "transmit"
 * Added accepible values for data-lanes
 * Sorted Header file in the example
 * Added SoC specific compaible along with generic one.
 * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function instead
   of the memory pointer
 * Fixed the comment in rzg2l_mipi_dsi_startup()
 * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
 * DRM bridge parameter initialization moved to probe
 * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
 * Inserted the missing blank lane after return in probe()
 * Added missing MODULE_DEVICE_TABLE
 * Added include linux/bits.h in header file
 * Fixed various macros in header file.
 * Reorder the make file for DSI, so that it is no more dependent
   on RZ/G2L DU patch series.
v1->v2:
 * Added full path for dsi-controller.yaml
 * Modeled DSI + D-PHY as single block and updated reg property
 * Fixed typo D_PHY->D-PHY
 * Updated description
 * Added interrupts and interrupt-names and updated the example 
 * Driver rework based on dt-binding changes (DSI + D-PHY) as single block
 * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
 * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
   and rzg2l_mipi_dsi_link_write
 * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
RFC->v1:
 * Added a ref to dsi-controller.yaml.
 * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
   and dropped DRM as it is implied by DRM_BRIDGE
 * Used devm_reset_control_get_exclusive() for reset handle
 * Removed bool hsclkmode from struct rzg2l_mipi_dsi
 * Added error check for pm, using pm_runtime_resume_and_get() instead of
   pm_runtime_get_sync()
 * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
 * Avoided read-modify-write stopping hsclock
 * Used devm_platform_ioremap_resource for resource allocation
 * Removed unnecessary assert call from probe and remove.
 * wrap the line after the PTR_ERR() in probe()
 * Updated reset failure messages in probe
 * Fixed the typo arstc->prstc
 * Made hex constants to lower case.
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-23-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
  drm: rcar-du: Add RZ/G2L DSI driver

 .../bindings/display/bridge/renesas,dsi.yaml  | 182 +++++
 drivers/gpu/drm/rcar-du/Kconfig               |   8 +
 drivers/gpu/drm/rcar-du/Makefile              |   2 +
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 690 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
 5 files changed, 1033 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
2.25.1

