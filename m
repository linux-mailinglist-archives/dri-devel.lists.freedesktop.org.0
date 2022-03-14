Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD734D88DB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 17:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287B410E207;
	Mon, 14 Mar 2022 16:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F0C710E736
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 16:10:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,181,1643641200"; d="scan'208";a="114371778"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 15 Mar 2022 01:10:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07EB04018A3F;
 Tue, 15 Mar 2022 01:10:06 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] Add RZ/G2L DSI driver
Date: Mon, 14 Mar 2022 16:10:01 +0000
Message-Id: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
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

 .../bindings/display/bridge/renesas,dsi.yaml  | 146 ++++
 drivers/gpu/drm/rcar-du/Kconfig               |   8 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 686 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 147 ++++
 5 files changed, 988 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
2.17.1

