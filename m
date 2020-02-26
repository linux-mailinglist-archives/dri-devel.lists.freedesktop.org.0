Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2269B16FD71
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2101F6E4AB;
	Wed, 26 Feb 2020 11:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26F6E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:25:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C17E43F;
 Wed, 26 Feb 2020 12:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716340;
 bh=zGPoKpvvDjW3iA9JhoKfZXCQZTSkG6L6bcSbKIpdM4g=;
 h=From:To:Cc:Subject:Date:From;
 b=qdCDpCdXxtzM8XGHu+gmwueOHSW2pZzEK8hk7A5SYzpUlh5jCyQnClzXcNQoZvBIo
 bGBh9qbriXvYLS+TiqihO+SDvcCVx8zmkFxMQhTbp1ia7hDzcUXsTCkaGbyLRuGYD2
 Vqr6k9jVEK1FiHxzYLcs2jzZAbtSKQZMVw28VfJo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 00/54] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Date: Wed, 26 Feb 2020 13:24:20 +0200
Message-Id: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This version of the series is there just to make "dim apply" happy, as
it needs to get patches from the list. Sorry for the spam :-)

Laurent Pinchart (54):
  video: hdmi: Change return type of hdmi_avi_infoframe_init() to void
  drm/connector: Add helper to get a connector type name
  drm/edid: Add flag to drm_display_info to identify HDMI sinks
  drm/bridge: Document the drm_encoder.bridge_chain field as private
  drm/bridge: Fix atomic state ops documentation
  drm/bridge: Improve overview documentation
  drm/bridge: Add connector-related bridge operations and data
  drm/bridge: Add interlace_allowed flag to drm_bridge
  drm/bridge: Extend bridge API to disable connector creation
  drm/bridge: dumb-vga-dac: Rename internal symbols to simple-bridge
  drm/bridge: dumb-vga-dac: Rename driver to simple-bridge
  drm/bridge: simple-bridge: Add support for non-VGA bridges
  drm/bridge: simple-bridge: Add support for enable GPIO
  drm/bridge: simple-bridge: Add support for the TI OPA362
  drm/bridge: Add bridge driver for display connectors
  drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter
  drm/bridge: panel: Implement bridge connector operations
  drm/bridge: tfp410: Replace manual connector handling with bridge
  drm/bridge: tfp410: Allow operation without drm_connector
  drm: Add helper to create a connector for a chain of bridges
  drm/omap: dss: Cleanup DSS ports on initialisation failure
  drm/omap: Simplify HDMI mode and infoframe configuration
  drm/omap: Factor out display type to connector type conversion
  drm/omap: Use the drm_panel_bridge API
  drm/omap: dss: Fix output next device lookup in DT
  drm/omap: Add infrastructure to support drm_bridge local to DSS
    outputs
  drm/omap: dss: Make omap_dss_device_ops optional
  drm/omap: hdmi: Allocate EDID in the .read_edid() operation
  drm/omap: hdmi4: Rework EDID read to isolate data read
  drm/omap: hdmi5: Rework EDID read to isolate data read
  drm/omap: hdmi4: Register a drm_bridge for EDID read
  drm/omap: hdmi5: Register a drm_bridge for EDID read
  drm/omap: hdmi4: Move mode set, enable and disable operations to
    bridge
  drm/omap: hdmi5: Move mode set, enable and disable operations to
    bridge
  drm/omap: hdmi4: Implement drm_bridge .hpd_notify() operation
  drm/omap: dss: Remove .set_hdmi_mode() and .set_infoframe() operations
  drm/omap: venc: Register a drm_bridge
  drm/omap: Create connector for bridges
  drm/omap: Switch the HDMI and VENC outputs to drm_bridge
  drm/omap: Remove HPD, detect and EDID omapdss operations
  drm/omap: hdmi: Remove omap_dss_device operations
  drm/omap: venc: Remove omap_dss_device operations
  drm/omap: hdmi4: Simplify EDID read
  drm/omap: hdmi5: Simplify EDID read
  drm/omap: dpi: Sort includes alphabetically
  drm/omap: dpi: Reorder functions in sections
  drm/omap: dpi: Simplify clock setting API
  drm/omap: dpi: Register a drm_bridge
  drm/omap: sdi: Sort includes alphabetically
  drm/omap: sdi: Register a drm_bridge
  drm/omap: Hardcode omap_connector type to DSI
  drm/omap: dss: Inline the omapdss_display_get() function
  drm/omap: dss: Remove unused omapdss_of_find_connected_device()
    function
  drm/omap: dss: Remove unused omap_dss_device operations

 Documentation/gpu/drm-kms-helpers.rst         |  18 +-
 Documentation/gpu/todo.rst                    |  14 +
 arch/arm/configs/davinci_all_defconfig        |   2 +-
 arch/arm/configs/integrator_defconfig         |   2 +-
 arch/arm/configs/multi_v7_defconfig           |   2 +-
 arch/arm/configs/omap2plus_defconfig          |   7 +-
 arch/arm/configs/shmobile_defconfig           |   2 +-
 arch/arm/configs/sunxi_defconfig              |   2 +-
 arch/arm/configs/versatile_defconfig          |   2 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/arc/arcpgu_hdmi.c             |   2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |   2 +-
 drivers/gpu/drm/bridge/Kconfig                |  29 +-
 drivers/gpu/drm/bridge/Makefile               |   4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   8 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |   8 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |   8 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  10 +-
 drivers/gpu/drm/bridge/cdns-dsi.c             |   6 +-
 drivers/gpu/drm/bridge/display-connector.c    | 295 ++++++++++++++
 drivers/gpu/drm/bridge/dumb-vga-dac.c         | 300 --------------
 drivers/gpu/drm/bridge/lvds-codec.c           |   5 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |   8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |   8 +-
 drivers/gpu/drm/bridge/panel.c                |  17 +-
 drivers/gpu/drm/bridge/parade-ps8622.c        |   8 +-
 drivers/gpu/drm/bridge/parade-ps8640.c        |   5 +-
 drivers/gpu/drm/bridge/sii902x.c              |   8 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |   3 +-
 drivers/gpu/drm/bridge/simple-bridge.c        | 342 ++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  10 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |   8 +-
 drivers/gpu/drm/bridge/tc358764.c             |   8 +-
 drivers/gpu/drm/bridge/tc358767.c             |   9 +-
 drivers/gpu/drm/bridge/tc358768.c             |   6 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c         |   5 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   8 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            | 222 ++++------
 drivers/gpu/drm/bridge/ti-tpd12s015.c         | 211 ++++++++++
 drivers/gpu/drm/drm_bridge.c                  | 314 ++++++++++++++-
 drivers/gpu/drm/drm_bridge_connector.c        | 379 ++++++++++++++++++
 drivers/gpu/drm/drm_connector.c               |  15 +
 drivers/gpu/drm/drm_edid.c                    |  11 +-
 drivers/gpu/drm/drm_simple_kms_helper.c       |   2 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |   2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             |  10 +-
 drivers/gpu/drm/imx/imx-ldb.c                 |   2 +-
 drivers/gpu/drm/imx/parallel-display.c        |   4 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c               |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  10 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |   4 +-
 drivers/gpu/drm/msm/edp/edp.c                 |   2 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c          |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c               |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |   2 +-
 drivers/gpu/drm/omapdrm/displays/Kconfig      |  22 -
 drivers/gpu/drm/omapdrm/displays/Makefile     |   4 -
 .../omapdrm/displays/connector-analog-tv.c    |  97 -----
 .../gpu/drm/omapdrm/displays/connector-hdmi.c | 183 ---------
 .../gpu/drm/omapdrm/displays/encoder-opa362.c | 137 -------
 .../drm/omapdrm/displays/encoder-tpd12s015.c  | 217 ----------
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |   2 +-
 drivers/gpu/drm/omapdrm/dss/Makefile          |   2 +-
 drivers/gpu/drm/omapdrm/dss/base.c            |  55 +--
 drivers/gpu/drm/omapdrm/dss/display.c         |   9 -
 drivers/gpu/drm/omapdrm/dss/dpi.c             | 349 ++++++++--------
 drivers/gpu/drm/omapdrm/dss/dsi.c             |   4 +-
 drivers/gpu/drm/omapdrm/dss/dss-of.c          |  28 --
 drivers/gpu/drm/omapdrm/dss/dss.c             |  46 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi.h            |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           | 313 ++++++++-------
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c      |  59 +--
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.h      |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           | 295 ++++++++------
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  48 +--
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |   5 +-
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   5 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  46 +--
 drivers/gpu/drm/omapdrm/dss/output.c          |  53 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c             | 178 +++++---
 drivers/gpu/drm/omapdrm/dss/venc.c            | 269 +++++++------
 drivers/gpu/drm/omapdrm/omap_connector.c      | 247 +-----------
 drivers/gpu/drm/omapdrm/omap_connector.h      |   3 -
 drivers/gpu/drm/omapdrm/omap_drv.c            |  88 ++--
 drivers/gpu/drm/omapdrm/omap_encoder.c        |  83 +---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  11 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |   2 +-
 drivers/gpu/drm/sti/sti_dvo.c                 |   2 +-
 drivers/gpu/drm/sti/sti_hda.c                 |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |   2 +-
 drivers/gpu/drm/stm/ltdc.c                    |   2 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c            |   2 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c      |   2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |   2 +-
 drivers/video/hdmi.c                          |  11 +-
 include/drm/drm_bridge.h                      | 237 ++++++++++-
 include/drm/drm_bridge_connector.h            |  18 +
 include/drm/drm_connector.h                   |   9 +
 include/drm/drm_encoder.h                     |   3 +-
 include/linux/hdmi.h                          |   2 +-
 112 files changed, 3123 insertions(+), 2449 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/display-connector.c
 delete mode 100644 drivers/gpu/drm/bridge/dumb-vga-dac.c
 create mode 100644 drivers/gpu/drm/bridge/simple-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/ti-tpd12s015.c
 create mode 100644 drivers/gpu/drm/drm_bridge_connector.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/dss-of.c
 create mode 100644 include/drm/drm_bridge_connector.h

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
