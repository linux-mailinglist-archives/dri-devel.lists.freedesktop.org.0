Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F417A9A4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 17:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151936EBDD;
	Thu,  5 Mar 2020 16:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246B06EBD8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 16:00:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5CD7BAF9F;
 Thu,  5 Mar 2020 15:59:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, abrodkin@synopsys.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jingoohan1@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, xinliang.liu@linaro.org,
 zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 sebastian.reichel@collabora.com
Subject: [PATCH 00/22] drm: Convert drivers to drm_simple_encoder_init()
Date: Thu,  5 Mar 2020 16:59:28 +0100
Message-Id: <20200305155950.2705-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A call to drm_simple_encoder_init() initializes an encoder without
further functionality. It only provides the destroy callback to
cleanup the encoder's state. Only few drivers implement more
sophisticated encoders than that. Most drivers implement such a
simple encoder and can use drm_simple_encoder_init() instead.

The patchset converts drivers where the encoder's instance is
embedded in a larger data structure. The driver releases the
memory during cleanup. Each patch replaces drm_encoder_init() with
drm_simple_encoder_init() and removes the (now unused) driver's
encoder functions.

While the patchset is fairly large, the indiviual patches are self-
contained and can be merged independently from each other. The
simple-encoder functionality is currently in drm-misc-next, where
these patches could go as well.

Future directions: There's another common case where the driver
calls kzalloc() plus drm_encoder_init(). Such drivers are not
handled by this patchset. The plan here is to use a simple encoder
with either managed memory allocation (once it's merged), or embed
the encoder in a larger data structure and drop kzalloc() entirely.

The patchset has been compile-tested on x86-64, aarch64 and arm.

Thomas Zimmermann (22):
  drm/arc: Use simple encoder
  drm/atmel-hlcdc: Use simple encoder
  drm/exynos: Use simple encoder
  drm/fsl-dcu: Use simple encoder
  drm/gma500: Use simple encoder
  drm/hisilicon/kirin: Use simple encoder
  drm/i2c/tda998x: Use simple encoder
  drm/imx: Use simple encoder
  drm/ingenic: Use simple encoder
  drm/mediatek: Use simple encoder
  drm/rcar-du: Use simple encoder
  drm/rockchip: Use simple encoder
  drm/shmobile: Use simple encoder
  drm/sun4i: Use simple encoder
  drm/tegra: Use simple encoder
  drm/tidss: Use simple encoder
  drm/tilcdc: Use simple encoder
  drm/vc4: Use simple encoder
  drm/virtgpu: Use simple encoder
  drm/vkms: Use simple encoder
  drm/writeback: Use simple encoder
  drm/zte: Use simple encoder

 drivers/gpu/drm/arc/arcpgu_hdmi.c              | 10 +++-------
 drivers/gpu/drm/arc/arcpgu_sim.c               |  8 ++------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   | 12 ++++--------
 drivers/gpu/drm/drm_writeback.c                | 10 +++-------
 drivers/gpu/drm/exynos/exynos_dp.c             |  8 ++------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c        |  8 ++------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c        |  8 ++------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c       |  8 ++------
 drivers/gpu/drm/exynos/exynos_hdmi.c           |  8 ++------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c      | 14 +++-----------
 drivers/gpu/drm/gma500/cdv_intel_crt.c         | 14 +++-----------
 drivers/gpu/drm/gma500/cdv_intel_dp.c          | 16 +++-------------
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c        |  4 ++--
 drivers/gpu/drm/gma500/cdv_intel_lvds.c        | 17 +++--------------
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c         |  7 +++----
 drivers/gpu/drm/gma500/mdfld_output.h          |  1 -
 drivers/gpu/drm/gma500/mdfld_tmd_vid.c         |  6 ------
 drivers/gpu/drm/gma500/mdfld_tpo_vid.c         |  6 ------
 drivers/gpu/drm/gma500/oaktrail_hdmi.c         | 14 ++------------
 drivers/gpu/drm/gma500/oaktrail_lvds.c         |  5 +++--
 drivers/gpu/drm/gma500/psb_intel_drv.h         |  1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c        | 18 +++---------------
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c     |  5 -----
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c   |  8 ++------
 drivers/gpu/drm/i2c/tda998x_drv.c              | 14 +++-----------
 drivers/gpu/drm/imx/dw_hdmi-imx.c              |  8 ++------
 drivers/gpu/drm/imx/imx-drm-core.c             |  6 ------
 drivers/gpu/drm/imx/imx-drm.h                  |  1 -
 drivers/gpu/drm/imx/imx-ldb.c                  |  8 ++------
 drivers/gpu/drm/imx/imx-tve.c                  |  8 ++------
 drivers/gpu/drm/imx/parallel-display.c         |  8 ++------
 drivers/gpu/drm/ingenic/ingenic-drm.c          |  9 +++------
 drivers/gpu/drm/mediatek/mtk_dpi.c             | 14 +++-----------
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 +++-----------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c      | 14 +++-----------
 .../gpu/drm/rockchip/analogix_dp-rockchip.c    |  9 +++------
 drivers/gpu/drm/rockchip/cdn-dp-core.c         |  9 +++------
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  8 ++------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    |  8 ++------
 drivers/gpu/drm/rockchip/inno_hdmi.c           |  8 ++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c         |  8 ++------
 drivers/gpu/drm/rockchip/rockchip_lvds.c       | 10 +++-------
 drivers/gpu/drm/rockchip/rockchip_rgb.c        |  8 ++------
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c      | 14 +++-----------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c         | 12 +++---------
 drivers/gpu/drm/sun4i/sun4i_lvds.c             | 12 +++---------
 drivers/gpu/drm/sun4i/sun4i_rgb.c              | 17 +++--------------
 drivers/gpu/drm/sun4i/sun4i_tv.c               | 17 +++--------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c         | 12 +++---------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c          |  8 ++------
 drivers/gpu/drm/tegra/drm.h                    |  2 --
 drivers/gpu/drm/tegra/dsi.c                    | 10 +++-------
 drivers/gpu/drm/tegra/hdmi.c                   |  9 +++------
 drivers/gpu/drm/tegra/output.c                 |  6 +-----
 drivers/gpu/drm/tegra/rgb.c                    |  8 ++------
 drivers/gpu/drm/tegra/sor.c                    |  8 ++------
 drivers/gpu/drm/tidss/tidss_encoder.c          | 10 +++-------
 drivers/gpu/drm/tilcdc/tilcdc_external.c       | 10 +++-------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c          |  8 ++------
 drivers/gpu/drm/vc4/vc4_dpi.c                  |  8 ++------
 drivers/gpu/drm/vc4/vc4_dsi.c                  | 15 +++------------
 drivers/gpu/drm/vc4/vc4_hdmi.c                 | 17 ++++-------------
 drivers/gpu/drm/vc4/vc4_vec.c                  |  8 ++------
 drivers/gpu/drm/virtio/virtgpu_display.c       |  8 ++------
 drivers/gpu/drm/vkms/vkms_output.c             |  8 ++------
 drivers/gpu/drm/zte/zx_hdmi.c                  |  8 ++------
 drivers/gpu/drm/zte/zx_tvenc.c                 |  8 ++------
 drivers/gpu/drm/zte/zx_vga.c                   |  8 ++------
 68 files changed, 151 insertions(+), 488 deletions(-)

--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
