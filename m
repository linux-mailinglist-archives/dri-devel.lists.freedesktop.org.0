Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4B147738
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429F06E1BD;
	Fri, 24 Jan 2020 03:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252476E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:42:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACC1797D;
 Fri, 24 Jan 2020 04:42:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579837358;
 bh=cEuXsuE8FkJlSAdTgAsQFeXKHYH3NSThqnZgs6uuzGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mBagGwJkLiFI/PHqSu4SChDf8pmKnG2Sva3W7hZH7+ncjYPsVpcAKn8C1V6WW210C
 LCfqM4YuC3dnnuhPXIeew6AMJ171ald1Pr+pTcDeMjhrrzOSSqQnqFK7bwoa5FxatA
 Yxx6wk18NhS/RyZuykGwaZhHkXGn4GmMpJCUObtI=
Date: Fri, 24 Jan 2020 05:42:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 00/51] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20200124034222.GA18358@pendragon.ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
 <e3df30e4-7336-cb16-aa98-0e609cdfb5ce@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3df30e4-7336-cb16-aa98-0e609cdfb5ce@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Mon, Jan 06, 2020 at 03:45:59PM +0100, Neil Armstrong wrote:
> On 19/12/2019 11:44, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series is the fourth attempt to (nearly, see [1]) complete the
> > rework of the omapdrm driver to move to drm_bridge and drm_panel.
> > 
> > Versions, available at [2], explains in its long cover letter the
> > rationale for the changes. I won't duplicate it here as it is still
> > valid as-is.
> > 
> > Compared to v3, this version has been rebased on top of drm-misc-next,
> > minor issues reported during review have been fixed, and tags collected.
> > 
> > There is however still one major open issue in the way hotplug detection
> > and notification is handled. This has been discussed in length with
> > Andrzej and Daniel in [3] (where we have competed for the largest number
> > of quote levels in an e-mail, and may have won). I do agree with some of
> > the points they have raised, but I would like to propose addressing them
> > on top of this series.
> > 
> > The rationale for this proposal is as follows. Hotplug notification is
> > an area that hasn't received enough love, and there is quite a lot of
> > work there to fix the world. The code in this series has already been
> > reworked to decouple the notification mechanism from both the producers
> > (as in bridges) and consumers (as in other bridges) of hotplug events,
> > isolating the implementation of the mechanism in drm_bridge.c and
> > drm_bridge_connector.c.
> > 
> > The implementation has known shortcomings in that it doesn't support
> > blocking hotplug notifications along the chain of bridges, or native
> > notification of encoders or DRM devices. While those are valid concerns,
> > I'm worried that fixing them as part of this series would not only
> > massively delay the other parts, but would also have no user as I have
> > no use case for these features. The implementation would then be largely
> > untested, and very likely fail to test of real users.
> > 
> > For these reasons I would like to improve the hotplug notification
> > mechanism on top of this series, when someone will hit for real the
> > issues that have been previously raised. If that person isn't me, I am
> > willing to help them solve the problems at that point.
> > 
> > The patches can be found at
> > 
> >         git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
> > 
> > [1] The only notable exception is the omapdrm-specific DSI panel driver
> > that implements a large number of custom operations. This is being
> > addressed separately.
> > 
> > [2] https://patchwork.kernel.org/cover/11102445/
> > 
> > [3] https://patchwork.kernel.org/patch/11034193/
> > 
> > Laurent Pinchart (50):
> >   video: hdmi: Change return type of hdmi_avi_infoframe_init() to void
> >   drm/connector: Add helper to get a connector type name
> >   drm/edid: Add flag to drm_display_info to identify HDMI sinks
> >   drm/bridge: Add connector-related bridge operations and data
> >   drm/bridge: Extend bridge API to disable connector creation
> >   drm/bridge: dumb-vga-dac: Rename internal symbols to simple-bridge
> >   drm/bridge: dumb-vga-dac: Rename driver to simple-bridge
> >   drm/bridge: simple-bridge: Add support for non-VGA bridges
> >   drm/bridge: simple-bridge: Add support for enable GPIO
> >   drm/bridge: simple-bridge: Add support for the TI OPA362
> >   drm/bridge: Add bridge driver for display connectors
> >   drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter
> >   drm/bridge: panel: Implement bridge connector operations
> >   drm/bridge: tfp410: Replace manual connector handling with bridge
> >   drm/bridge: tfp410: Allow operation without drm_connector
> >   drm: Add helper to create a connector for a chain of bridges
> >   drm/omap: dss: Cleanup DSS ports on initialisation failure
> >   drm/omap: Simplify HDMI mode and infoframe configuration
> >   drm/omap: Factor out display type to connector type conversion
> >   drm/omap: Use the drm_panel_bridge API
> >   drm/omap: dss: Fix output next device lookup in DT
> >   drm/omap: Add infrastructure to support drm_bridge local to DSS
> >     outputs
> >   drm/omap: dss: Make omap_dss_device_ops optional
> >   drm/omap: hdmi: Allocate EDID in the .read_edid() operation
> >   drm/omap: hdmi4: Rework EDID read to isolate data read
> >   drm/omap: hdmi5: Rework EDID read to isolate data read
> >   drm/omap: hdmi4: Register a drm_bridge for EDID read
> >   drm/omap: hdmi5: Register a drm_bridge for EDID read
> >   drm/omap: hdmi4: Move mode set, enable and disable operations to
> >     bridge
> >   drm/omap: hdmi5: Move mode set, enable and disable operations to
> >     bridge
> >   drm/omap: hdmi4: Implement drm_bridge .hpd_notify() operation
> >   drm/omap: dss: Remove .set_hdmi_mode() and .set_infoframe() operations
> >   drm/omap: venc: Register a drm_bridge
> >   drm/omap: Create connector for bridges
> >   drm/omap: Switch the HDMI and VENC outputs to drm_bridge
> >   drm/omap: Remove HPD, detect and EDID omapdss operations
> >   drm/omap: hdmi: Remove omap_dss_device operations
> >   drm/omap: venc: Remove omap_dss_device operations
> >   drm/omap: hdmi4: Simplify EDID read
> >   drm/omap: hdmi5: Simplify EDID read
> >   drm/omap: dpi: Sort includes alphabetically
> >   drm/omap: dpi: Reorder functions in sections
> >   drm/omap: dpi: Simplify clock setting API
> >   drm/omap: dpi: Register a drm_bridge
> >   drm/omap: sdi: Sort includes alphabetically
> >   drm/omap: sdi: Register a drm_bridge
> >   drm/omap: Hardcode omap_connector type to DSI
> >   drm/omap: dss: Remove unused omap_dss_device operations
> >   drm/omap: dss: Inline the omapdss_display_get() function
> >   drm/omap: dss: Remove unused omapdss_of_find_connected_device()
> >     function
> > 
> > Wen Yang (1):
> >   drm/omap: Fix possible object reference leak
> > 
> >  Documentation/gpu/todo.rst                    |  14 +
> >  arch/arm/configs/davinci_all_defconfig        |   2 +-
> >  arch/arm/configs/integrator_defconfig         |   2 +-
> >  arch/arm/configs/multi_v7_defconfig           |   2 +-
> >  arch/arm/configs/omap2plus_defconfig          |   7 +-
> >  arch/arm/configs/shmobile_defconfig           |   2 +-
> >  arch/arm/configs/sunxi_defconfig              |   2 +-
> >  arch/arm/configs/versatile_defconfig          |   2 +-
> >  drivers/gpu/drm/Makefile                      |   3 +-
> >  drivers/gpu/drm/arc/arcpgu_hdmi.c             |   2 +-
> >  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |   2 +-
> >  drivers/gpu/drm/bridge/Kconfig                |  29 +-
> >  drivers/gpu/drm/bridge/Makefile               |   4 +-
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   8 +-
> >  .../drm/bridge/analogix/analogix-anx6345.c    |   8 +-
> >  .../drm/bridge/analogix/analogix-anx78xx.c    |   8 +-
> >  .../drm/bridge/analogix/analogix_dp_core.c    |  10 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c             |   6 +-
> >  drivers/gpu/drm/bridge/display-connector.c    | 292 ++++++++++++++
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c         | 300 --------------
> >  drivers/gpu/drm/bridge/lvds-encoder.c         |   5 +-
> >  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |   8 +-
> >  drivers/gpu/drm/bridge/nxp-ptn3460.c          |   8 +-
> >  drivers/gpu/drm/bridge/panel.c                |  17 +-
> >  drivers/gpu/drm/bridge/parade-ps8622.c        |   8 +-
> >  drivers/gpu/drm/bridge/sii902x.c              |   8 +-
> >  drivers/gpu/drm/bridge/sil-sii8620.c          |   3 +-
> >  drivers/gpu/drm/bridge/simple-bridge.c        | 342 ++++++++++++++++
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  10 +-
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |   8 +-
> >  drivers/gpu/drm/bridge/tc358764.c             |   8 +-
> >  drivers/gpu/drm/bridge/tc358767.c             |   9 +-
> >  drivers/gpu/drm/bridge/thc63lvd1024.c         |   5 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   8 +-
> >  drivers/gpu/drm/bridge/ti-tfp410.c            | 222 ++++-------
> >  drivers/gpu/drm/bridge/ti-tpd12s015.c         | 211 ++++++++++
> >  drivers/gpu/drm/drm_bridge.c                  | 168 +++++++-
> >  drivers/gpu/drm/drm_bridge_connector.c        | 373 ++++++++++++++++++
> >  drivers/gpu/drm/drm_connector.c               |  15 +
> >  drivers/gpu/drm/drm_edid.c                    |  11 +-
> >  drivers/gpu/drm/drm_simple_kms_helper.c       |   2 +-
> >  drivers/gpu/drm/exynos/exynos_dp.c            |   3 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +-
> >  drivers/gpu/drm/exynos/exynos_hdmi.c          |   2 +-
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |   2 +-
> >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |   2 +-
> >  drivers/gpu/drm/i2c/tda998x_drv.c             |  10 +-
> >  drivers/gpu/drm/imx/imx-ldb.c                 |   2 +-
> >  drivers/gpu/drm/imx/parallel-display.c        |   2 +-
> >  drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
> >  drivers/gpu/drm/mcde/mcde_dsi.c               |   5 +-
> >  drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c            |   2 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  10 +-
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c         |   4 +-
> >  drivers/gpu/drm/msm/edp/edp.c                 |   2 +-
> >  drivers/gpu/drm/msm/edp/edp_bridge.c          |   2 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi.c               |   2 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |   2 +-
> >  drivers/gpu/drm/omapdrm/displays/Kconfig      |  22 --
> >  drivers/gpu/drm/omapdrm/displays/Makefile     |   4 -
> >  .../omapdrm/displays/connector-analog-tv.c    |  97 -----
> >  .../gpu/drm/omapdrm/displays/connector-hdmi.c | 183 ---------
> >  .../gpu/drm/omapdrm/displays/encoder-opa362.c | 137 -------
> >  .../drm/omapdrm/displays/encoder-tpd12s015.c  | 217 ----------
> >  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |   2 +-
> >  drivers/gpu/drm/omapdrm/dss/Makefile          |   2 +-
> >  drivers/gpu/drm/omapdrm/dss/base.c            |  55 +--
> >  drivers/gpu/drm/omapdrm/dss/display.c         |   9 -
> >  drivers/gpu/drm/omapdrm/dss/dpi.c             | 351 ++++++++--------
> >  drivers/gpu/drm/omapdrm/dss/dsi.c             |   4 +-
> >  drivers/gpu/drm/omapdrm/dss/dss-of.c          |  28 --
> >  drivers/gpu/drm/omapdrm/dss/dss.c             |  46 ++-
> >  drivers/gpu/drm/omapdrm/dss/hdmi.h            |   4 +-
> >  drivers/gpu/drm/omapdrm/dss/hdmi4.c           | 308 ++++++++-------
> >  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c      |  59 +--
> >  drivers/gpu/drm/omapdrm/dss/hdmi4_core.h      |   4 +-
> >  drivers/gpu/drm/omapdrm/dss/hdmi5.c           | 290 +++++++-------
> >  drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  48 +--
> >  drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |   5 +-
> >  .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   9 +-
> >  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  46 +--
> >  drivers/gpu/drm/omapdrm/dss/output.c          |  53 ++-
> >  drivers/gpu/drm/omapdrm/dss/sdi.c             | 178 ++++++---
> >  drivers/gpu/drm/omapdrm/dss/venc.c            | 270 +++++++------
> >  drivers/gpu/drm/omapdrm/omap_connector.c      | 247 +-----------
> >  drivers/gpu/drm/omapdrm/omap_connector.h      |   3 -
> >  drivers/gpu/drm/omapdrm/omap_drv.c            |  88 +++--
> >  drivers/gpu/drm/omapdrm/omap_encoder.c        |  83 +---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |   2 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  11 +-
> >  drivers/gpu/drm/rockchip/rockchip_lvds.c      |   2 +-
> >  drivers/gpu/drm/rockchip/rockchip_rgb.c       |   2 +-
> >  drivers/gpu/drm/sti/sti_dvo.c                 |   2 +-
> >  drivers/gpu/drm/sti/sti_hda.c                 |   2 +-
> >  drivers/gpu/drm/sti/sti_hdmi.c                |   2 +-
> >  drivers/gpu/drm/stm/ltdc.c                    |   2 +-
> >  drivers/gpu/drm/sun4i/sun4i_lvds.c            |   2 +-
> >  drivers/gpu/drm/sun4i/sun4i_rgb.c             |   2 +-
> >  drivers/gpu/drm/tilcdc/tilcdc_external.c      |   2 +-
> >  drivers/gpu/drm/vc4/vc4_dpi.c                 |   2 +-
> >  drivers/gpu/drm/vc4/vc4_dsi.c                 |   2 +-
> >  drivers/video/hdmi.c                          |  11 +-
> >  include/drm/drm_bridge.h                      | 213 +++++++++-
> >  include/drm/drm_bridge_connector.h            |  18 +
> >  include/drm/drm_connector.h                   |   9 +
> >  include/linux/hdmi.h                          |   2 +-
> >  107 files changed, 2939 insertions(+), 2415 deletions(-)
> >  create mode 100644 drivers/gpu/drm/bridge/display-connector.c
> >  delete mode 100644 drivers/gpu/drm/bridge/dumb-vga-dac.c
> >  create mode 100644 drivers/gpu/drm/bridge/simple-bridge.c
> >  create mode 100644 drivers/gpu/drm/bridge/ti-tpd12s015.c
> >  create mode 100644 drivers/gpu/drm/drm_bridge_connector.c
> >  delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
> >  delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
> >  delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
> >  delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
> >  delete mode 100644 drivers/gpu/drm/omapdrm/dss/dss-of.c
> >  create mode 100644 include/drm/drm_bridge_connector.h
> > 
> 
> Tell me how I can help to apply drm/bridge patches
> 
> 4 to 15 looks ok and are already reviewed, should I apply them ?

Sorry for the late reply, I've missed your e-mail.

I'm about to send a v5 with a bug fix for interlaced modes support. I've
rebased it on top of the latest drm-next branch, fixing a few conflicts.
I hope it will be the last iteration.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
