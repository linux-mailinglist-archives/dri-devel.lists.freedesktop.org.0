Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB3549E47
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0B710F797;
	Mon, 13 Jun 2022 20:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C48B10F797;
 Mon, 13 Jun 2022 20:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655150600; x=1686686600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wSmCcvgWtf4GY9G5S0S2OJpny7O6Y/mM/aQFhL7w3Ts=;
 b=Kf4jafmiahBYOWvioXwKtwRPkUIIhmaL9fL5FVhwUrYeI/o4Xhr20+aO
 EsEB2mZkGqLhRrIJzEHQ0ZS8nspb4ej6oYvnpS7fqlLpktfbeZmRgJ7gG
 4ZgTSykdJu7Q1R3FZgArNvoalekc+Bjtm1Lbb+qR21rnjZEr7ckYtPLOn
 qlkPDWBgon3R02pFRwOKZiJT+//yCQNYM7DW1r1QLqSZdB1VnOMQWUW4c
 ZPLjKjt8uYe/P67BNA5kLbbVsmKdWtwcUts6lWALDoiP1W+vCybxR8sgf
 78P+rRgMDIpVjlZKdq298HArWVAU+6IWDuG2PaonUvhYoY2IqEY/iKd4h g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="275926884"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="275926884"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 13:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="673479120"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by FMSMGA003.fm.intel.com with SMTP; 13 Jun 2022 13:03:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm: Clean up drm_crtc.h
Date: Mon, 13 Jun 2022 23:03:09 +0300
Message-Id: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Eliminate unnecessary includes from drm_crtc.h to avoid
pointless rebuilds of the entire universe when touching
some random header.

I didn't really feel like splitting this up per-driver since
that would have ended up being metric ton of one liners.
I'm thinking the conflicts (if any) should be trivial enough
to deal with even with bigger patches.

Also the cc list would have been massive so didn't do it.
Hopefully enough people actually read dri-devel...

Ville Syrjälä (8):
  drm: Drop drm_edid.h from drm_crtc.h
  drm: Drop drm_framebuffer.h from drm_crtc.h
  drm: Drop drm_blend.h from drm_crtc.h
  drm: Drop drm_connector.h from drm_crtc.h
  drm: Remove unnecessary junk from drm_crtc.h
  drm: Remove linux/fb.h from drm_crtc.h
  drm: Remove linux/media-bus-format.h from drm_crtc.h
  drm: Remove linux/i2c.h from drm_crtc.h

 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h        |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   |  1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h |  1 +
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c    |  1 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h |  1 +
 .../drm/arm/display/komeda/komeda_pipeline.c    |  2 ++
 .../gpu/drm/arm/display/komeda/komeda_plane.c   |  1 +
 .../arm/display/komeda/komeda_wb_connector.c    |  1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                |  1 +
 drivers/gpu/drm/arm/malidp_crtc.c               |  1 +
 drivers/gpu/drm/arm/malidp_mw.c                 |  2 ++
 drivers/gpu/drm/arm/malidp_planes.c             |  2 ++
 drivers/gpu/drm/armada/armada_510.c             |  1 +
 drivers/gpu/drm/armada/armada_fb.h              |  2 ++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c        |  1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c         |  1 +
 drivers/gpu/drm/ast/ast_mode.c                  |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c  |  1 +
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c    |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |  2 ++
 .../gpu/drm/bridge/analogix/analogix_dp_core.c  |  1 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  2 ++
 drivers/gpu/drm/bridge/chipone-icn6211.c        |  1 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c        |  1 +
 drivers/gpu/drm/bridge/display-connector.c      |  1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                |  1 +
 drivers/gpu/drm/bridge/ite-it66121.c            |  1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c        |  2 ++
 drivers/gpu/drm/bridge/lontium-lt9211.c         |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c         |  2 ++
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c      |  1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                |  1 +
 drivers/gpu/drm/bridge/parade-ps8640.c          |  1 +
 drivers/gpu/drm/bridge/sii902x.c                |  1 +
 drivers/gpu/drm/bridge/simple-bridge.c          |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c       |  1 +
 drivers/gpu/drm/bridge/tc358764.c               |  1 +
 drivers/gpu/drm/bridge/tc358767.c               |  1 +
 drivers/gpu/drm/bridge/tc358775.c               |  1 +
 drivers/gpu/drm/bridge/ti-dlpc3433.c            |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c           |  1 +
 drivers/gpu/drm/bridge/ti-tfp410.c              |  2 ++
 drivers/gpu/drm/display/drm_dp_helper.c         |  2 ++
 drivers/gpu/drm/display/drm_dp_mst_topology.c   |  1 +
 drivers/gpu/drm/drm_atomic.c                    |  2 ++
 drivers/gpu/drm/drm_atomic_helper.c             |  2 ++
 drivers/gpu/drm/drm_atomic_state_helper.c       |  2 ++
 drivers/gpu/drm/drm_atomic_uapi.c               |  1 +
 drivers/gpu/drm/drm_bridge.c                    |  1 +
 drivers/gpu/drm/drm_client_modeset.c            |  1 +
 drivers/gpu/drm/drm_connector.c                 |  1 +
 drivers/gpu/drm/drm_crtc.c                      |  2 ++
 drivers/gpu/drm/drm_crtc_helper.c               |  1 +
 drivers/gpu/drm/drm_damage_helper.c             |  1 +
 drivers/gpu/drm/drm_fb_helper.c                 |  1 +
 drivers/gpu/drm/drm_gem_atomic_helper.c         |  1 +
 drivers/gpu/drm/drm_kms_helper_common.c         |  1 +
 drivers/gpu/drm/drm_mipi_dbi.c                  |  2 ++
 drivers/gpu/drm/drm_mode_config.c               |  1 +
 drivers/gpu/drm/drm_modes.c                     |  2 ++
 drivers/gpu/drm/drm_modeset_helper.c            |  1 +
 drivers/gpu/drm/drm_of.c                        |  2 ++
 drivers/gpu/drm/drm_writeback.c                 |  1 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c   |  2 ++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c      |  1 +
 drivers/gpu/drm/exynos/exynos_dp.c              |  1 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c         |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c          |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c       |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c        |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_ipp.c         |  1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c       |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_scaler.c      |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c        |  1 +
 drivers/gpu/drm/exynos/exynos_mixer.c           |  3 +++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c     |  1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c           |  1 +
 drivers/gpu/drm/gma500/framebuffer.c            |  1 +
 drivers/gpu/drm/gma500/gma_display.c            |  1 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c          |  1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c          |  1 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c          |  1 +
 drivers/gpu/drm/gma500/psb_intel_modes.c        |  2 ++
 drivers/gpu/drm/gud/gud_connector.c             |  1 +
 drivers/gpu/drm/gud/gud_drv.c                   |  1 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    |  1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  1 +
 drivers/gpu/drm/i2c/tda998x_drv.c               |  1 +
 drivers/gpu/drm/i915/display/i9xx_plane.c       |  1 +
 drivers/gpu/drm/i915/display/intel_backlight.c  |  1 +
 drivers/gpu/drm/i915/display/intel_cursor.c     |  1 +
 .../gpu/drm/i915/display/intel_display_types.h  |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c         |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c         |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c        |  1 +
 drivers/gpu/drm/i915/display/intel_lspcon.c     |  1 +
 drivers/gpu/drm/i915/display/intel_opregion.c   |  2 ++
 drivers/gpu/drm/i915/display/intel_sprite.c     |  1 +
 .../gpu/drm/i915/display/skl_universal_plane.c  |  1 +
 drivers/gpu/drm/i915/intel_pm.c                 |  1 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c             |  1 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c           |  2 ++
 drivers/gpu/drm/imx/imx-ldb.c                   |  2 ++
 drivers/gpu/drm/imx/imx-tve.c                   |  1 +
 drivers/gpu/drm/imx/ipuv3-plane.c               |  2 ++
 drivers/gpu/drm/imx/parallel-display.c          |  2 ++
 drivers/gpu/drm/kmb/kmb_dsi.c                   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c                 |  2 ++
 drivers/gpu/drm/logicvc/logicvc_layer.c         |  2 ++
 drivers/gpu/drm/mcde/mcde_display.c             |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |  2 ++
 drivers/gpu/drm/mediatek/mtk_dpi.c              |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c        |  2 ++
 drivers/gpu/drm/meson/meson_overlay.c           |  2 ++
 drivers/gpu/drm/meson/meson_plane.c             |  2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       |  2 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c      |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c       |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      |  2 ++
 drivers/gpu/drm/msm/disp/mdp_format.c           |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          |  1 +
 drivers/gpu/drm/msm/msm_debugfs.c               |  1 +
 drivers/gpu/drm/msm/msm_fb.c                    |  1 +
 drivers/gpu/drm/msm/msm_fbdev.c                 |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c               |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c         |  1 +
 drivers/gpu/drm/omapdrm/dss/hdmi4.c             |  1 +
 drivers/gpu/drm/omapdrm/dss/hdmi5.c             |  1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c          |  1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c        |  1 +
 drivers/gpu/drm/omapdrm/omap_fb.c               |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c            |  1 +
 drivers/gpu/drm/omapdrm/omap_plane.c            |  2 ++
 drivers/gpu/drm/panel/panel-edp.c               |  1 +
 .../drm/panel/panel-raspberrypi-touchscreen.c   |  1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c   |  1 +
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c     |  1 +
 drivers/gpu/drm/panel/panel-simple.c            |  3 +++
 drivers/gpu/drm/pl111/pl111_display.c           |  2 ++
 drivers/gpu/drm/pl111/pl111_drv.c               |  1 +
 drivers/gpu/drm/pl111/pl111_versatile.c         |  2 ++
 drivers/gpu/drm/qxl/qxl_display.c               |  2 ++
 drivers/gpu/drm/qxl/qxl_draw.c                  |  1 +
 drivers/gpu/drm/radeon/atombios_crtc.c          |  1 +
 drivers/gpu/drm/radeon/evergreen.c              |  1 +
 drivers/gpu/drm/radeon/r100.c                   |  1 +
 drivers/gpu/drm/radeon/radeon_device.c          |  1 +
 drivers/gpu/drm/radeon/radeon_display.c         |  1 +
 drivers/gpu/drm/radeon/radeon_fb.c              |  1 +
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c     |  1 +
 drivers/gpu/drm/radeon/rs600.c                  |  1 +
 drivers/gpu/drm/radeon/rv770.c                  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c       |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c           |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_plane.c         |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c           |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c     |  2 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.c             |  1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c      |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  2 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c    |  3 +++
 drivers/gpu/drm/rockchip/rockchip_rgb.c         |  1 +
 .../gpu/drm/selftests/test-drm_damage_helper.c  |  1 +
 .../gpu/drm/selftests/test-drm_plane_helper.c   |  1 +
 drivers/gpu/drm/solomon/ssd130x.c               |  2 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                 |  2 ++
 drivers/gpu/drm/sti/sti_compositor.c            |  1 +
 drivers/gpu/drm/sti/sti_cursor.c                |  1 +
 drivers/gpu/drm/sti/sti_gdp.c                   |  2 ++
 drivers/gpu/drm/sti/sti_hda.c                   |  1 +
 drivers/gpu/drm/sti/sti_hdmi.c                  |  1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                 |  2 ++
 drivers/gpu/drm/sti/sti_plane.c                 |  2 ++
 drivers/gpu/drm/stm/ltdc.c                      |  4 ++++
 drivers/gpu/drm/sun4i/sun4i_backend.c           |  2 ++
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c       |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          |  1 +
 drivers/gpu/drm/sun4i/sun4i_layer.c             |  1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c              |  1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.h              |  1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c             |  1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c          |  2 ++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c          |  2 ++
 drivers/gpu/drm/tegra/dc.c                      |  2 ++
 drivers/gpu/drm/tegra/drm.c                     |  1 +
 drivers/gpu/drm/tegra/fb.c                      |  1 +
 drivers/gpu/drm/tegra/hub.c                     |  2 ++
 drivers/gpu/drm/tegra/plane.c                   |  1 +
 drivers/gpu/drm/tidss/tidss_dispc.c             |  3 +++
 drivers/gpu/drm/tidss/tidss_plane.c             |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c            |  1 +
 drivers/gpu/drm/tilcdc/tilcdc_panel.c           |  1 +
 drivers/gpu/drm/tilcdc/tilcdc_plane.c           |  1 +
 drivers/gpu/drm/tiny/arcpgu.c                   |  2 ++
 drivers/gpu/drm/tiny/bochs.c                    |  2 ++
 drivers/gpu/drm/tiny/cirrus.c                   |  2 ++
 drivers/gpu/drm/tiny/gm12u320.c                 |  2 ++
 drivers/gpu/drm/tiny/ili9225.c                  |  1 +
 drivers/gpu/drm/tiny/repaper.c                  |  1 +
 drivers/gpu/drm/tiny/st7586.c                   |  1 +
 drivers/gpu/drm/tve200/tve200_display.c         |  1 +
 drivers/gpu/drm/udl/udl_connector.c             |  1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c           |  2 ++
 drivers/gpu/drm/vc4/vc4_bo.c                    |  2 ++
 drivers/gpu/drm/vc4/vc4_crtc.c                  |  1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                   |  1 +
 drivers/gpu/drm/vc4/vc4_drv.h                   |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                   |  1 +
 drivers/gpu/drm/vc4/vc4_plane.c                 |  2 ++
 drivers/gpu/drm/vc4/vc4_txp.c                   |  1 +
 drivers/gpu/drm/virtio/virtgpu_display.c        |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h            |  1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c             |  2 ++
 drivers/gpu/drm/vkms/vkms_drv.h                 |  1 +
 drivers/gpu/drm/vkms/vkms_output.c              |  1 +
 drivers/gpu/drm/vkms/vkms_writeback.c           |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c              |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h             |  1 +
 drivers/gpu/drm/xen/xen_drm_front_conn.c        |  1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c         |  1 +
 include/drm/drm_crtc.h                          | 17 ++---------------
 include/drm/drm_encoder_slave.h                 |  2 ++
 include/drm/drm_fb_helper.h                     |  1 +
 230 files changed, 309 insertions(+), 16 deletions(-)

-- 
2.35.1

