Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FF1EF1FE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6F26E86B;
	Fri,  5 Jun 2020 07:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E586E863
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 07:32:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E44EB02C;
 Fri,  5 Jun 2020 07:32:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 wens@csie.org, jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org
Subject: [PATCH v3 00/43] Convert most CMA-based drivers to GEM object
 functions
Date: Fri,  5 Jun 2020 09:32:04 +0200
Message-Id: <20200605073247.4057-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the CMA-based drivers use the default implementation for the
callbacks in struct drm_driver. With this patch, these interfaces are
initialized with a common helper macro and GEM object functions replace
several deprecated interfaces.

To address Laurent's comment on the amount of changes per patch, I re-
organized the series.

 1) There are now DRIVER_OPS macros for drivers that require a virtual
    address on imported buffers, and macros for drivers that don't. Therefore,
    drivers don't switch to drm_gem_cma_prime_import_sg_table_vmap()
    implicitly when they begin using the DRIVER_OPS macro.

 2) I split each driver's patch into two: the first converts the driver to
    GEM CMA object functions, the second introduces the DRIVER_OPS macro.
    Neither patch should result in a functional change. I kept existing R-b
    and A-b tags on both patches. Existing Tested-by tags are only on the
    final patch, as that's closest to what has been tested.

 3) I dropped the conversion to drm_gem_prime_mmap() from the patchset. As
    part of this change, the CMA object functions could provide an mmap
    function, which is worth it's own series. The patch for aspeed requires
    drm_gem_prime_mmap(), so I removed it from the series.

Patches 1 to 3 update the existing macro and helper to similar naming as with
SHMEM, add a new DRIVER_OPS macro, and add helpers for drivers that override
the default implementation for .dumb_create(). The remaining patches up to
the final one convert the drivers. The kirin driver also changes to the
default dumb_create function. The final patch deletes .gem_print_info from
struct drm_driver.

I don't have much of the hardware, so it's only compile-tested on aarch64,
arm and x86-64 only. Several patches have Tested-by tags.

v3:
	* reorganized the series
	* split each driver patch into two small ones (Laurent)
	* drop the conversion to drm_gem_prime_mmap()
	* remove the patch for aspeed
v2:
  	* add more detailed commit messages (Laurent, Sam)
	* use default .dumb_create implementation in kirin (Emil)
	* fix zte build error (Sam, Emil)
	* introduce DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE (everyone)

Thomas Zimmermann (43):
  drm/cma-helper: Rename symbols from drm_cma_gem_ to drm_gem_cma_
  drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS macro
  drm/cma-helper: Add DRM_GEM_CMA_DRIVER_OPS to set default GEM CMA
    functions
  drm/arc: Use GEM CMA object functions
  drm/arc: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/arm: Use GEM CMA object functions
  drm/arm: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/atmel-hlcdc: Use GEM CMA object functions
  drm/atmel-hlcdc: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/fsl-dcu: Use GEM CMA object functions
  drm/fsl-dcu: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/hisilicon/kirin: Set .dumb_create to drm_gem_cma_dumb_create()
  drm/hisilicon/kirin: Use GEM CMA object functions
  drm/hisilicon/kirin: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/imx: Use GEM CMA object functions
  drm/imx: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/ingenic: Use GEM CMA object functions
  drm/ingenic: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/komeda: Use GEM CMA object functions
  drm/komeda: Set GEM CMA functions with
    DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE
  drm/malidp: Use GEM CMA object functions
  drm/malidp: Set GEM CMA functions with
    DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE
  drm/mcde: Use GEM CMA object functions
  drm/mcde: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/meson: Use GEM CMA object functions
  drm/meson: Set GEM CMA functions with
    DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE
  drm/mxsfb: Use GEM CMA object functions
  drm/mxsfb: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/rcar-du: Use GEM CMA object functions
  drm/rcar-du: Set GEM CMA functions with
    DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE
  drm/shmobile: Use GEM CMA object functions
  drm/shmobile: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/stm: Use GEM CMA object functions
  drm/stm: Set GEM CMA functions with
    DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE
  drm/sti: Use GEM CMA object functions
  drm/sti: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/tilcdc: Use GEM CMA object functions
  drm/tilcdc: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/tve200: Use GEM CMA object functions
  drm/tve200: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/zte: Use GEM CMA object functions
  drm/zte: Set GEM CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm: Remove struct drm_driver.gem_print_info

 drivers/gpu/drm/arc/arcpgu_drv.c              | 12 +--
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 11 +--
 drivers/gpu/drm/arm/hdlcd_drv.c               | 12 +--
 drivers/gpu/drm/arm/malidp_drv.c              | 11 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 11 +--
 drivers/gpu/drm/drm_gem.c                     |  2 -
 drivers/gpu/drm/drm_gem_cma_helper.c          | 12 +--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     | 11 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 12 +--
 drivers/gpu/drm/imx/imx-drm-core.c            | 12 +--
 drivers/gpu/drm/ingenic/ingenic-drm.c         | 13 +---
 drivers/gpu/drm/mcde/mcde_drv.c               | 12 +--
 drivers/gpu/drm/meson/meson_drv.c             | 15 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 11 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 11 +--
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 11 +--
 drivers/gpu/drm/sti/sti_drv.c                 | 12 +--
 drivers/gpu/drm/stm/drv.c                     | 11 +--
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 13 +---
 drivers/gpu/drm/tiny/hx8357d.c                |  2 +-
 drivers/gpu/drm/tiny/ili9225.c                |  2 +-
 drivers/gpu/drm/tiny/ili9341.c                |  2 +-
 drivers/gpu/drm/tiny/ili9486.c                |  2 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |  2 +-
 drivers/gpu/drm/tiny/repaper.c                |  2 +-
 drivers/gpu/drm/tiny/st7586.c                 |  2 +-
 drivers/gpu/drm/tiny/st7735r.c                |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           | 12 +--
 drivers/gpu/drm/zte/zx_drm_drv.c              | 11 +--
 include/drm/drm_drv.h                         | 17 -----
 include/drm/drm_gem_cma_helper.h              | 74 +++++++++++++++++--
 34 files changed, 105 insertions(+), 247 deletions(-)

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
