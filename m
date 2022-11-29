Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781663C7ED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D367110E1B3;
	Tue, 29 Nov 2022 19:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6997C10E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749468; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=x4ACPi/mFEo8bcgZDh23yUYuSMk3MfBQvJRzo/w5mRk=;
 b=j4W68pBViRgv2A41FrCHCYDXpDP6TsDv5bNM8uiOzylCIHMKLUGSV7f7LF4Dj1Msuhjoo/
 vVjS3JHL7KxEoq76+/3f22S1w2Gnxpn3ARW53F6Cjgc27wzwHcJ38ogiIVjzZiJ6kUuDVp
 OE4+MhuB/k4M32ZMrlpK6wjYYsdH3eM=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 00/26] drm: Get rid of #ifdef CONFIG_PM* guards
Date: Tue, 29 Nov 2022 19:17:07 +0000
Message-Id: <20221129191733.137897-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset updates the DRM drivers to use the new set of PM-related
macros introduced recently.

The point of these macros is to allow the PM functions to be
automatically dropped by the compiler when CONFIG_PM or CONFIG_SUSPEND
is disabled, without having to use #ifdef guards.

This has the advantages of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Checkpatch complains about patch [11/26], as I replaced a
"#if defined(IS_NOT_BROKEN)" to a "if (IS_ENABLED(IS_NOT_BROKEN))".
I don't really know how to make it better so I left it like that.

Compile-tested with allyesconfig, with the following cases:
- CONFIG_PM=y CONFIG_PM_SLEEP=y
- CONFIG_PM=y CONFIG_PM_SLEEP=n
- CONFIG_PM=n

V2:
- Patch [1/26] now adds a macro named
  DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() instead of exporting a
  dev_pm_ops instance.
- Patches [3/26] to [7/26] are updated accordingly.
- I updated the description of patches [12/26], [20/26] and [23/26].
  The code itself did not change.

Note that I can commit to drm-misc-next but not drm-next, so I cannot
apply this patchset myself when it's all properly tagged.

Cheers,
-Paul


Paul Cercueil (26):
  drm: modeset-helper: Add DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS macro
  drm: bochs: Define and use generic PM ops
  drm: imx: Define and use generic PM ops
  drm: rockchip: Define and use generic PM ops
  drm: tegra: Define and use generic PM ops
  drm: sun4i: Define and use generic PM ops
  drm: mxsfb: Define and use generic PM ops
  drm: atmel-hlcdc: Remove #ifdef guards for PM related functions
  drm: exynos: Remove #ifdef guards for PM related functions
  drm: imx/dcss: Remove #ifdef guards for PM related functions
  drm: bridge/dw-hdmi: Remove #ifdef guards for PM related functions
  drm: etnaviv: Remove #ifdef guards for PM related functions
  drm: fsl-dcu: Remove #ifdef guards for PM related functions
  drm: mediatek: Remove #ifdef guards for PM related functions
  drm: omap: Remove #ifdef guards for PM related functions
  drm: panfrost: Remove #ifdef guards for PM related functions
  drm: rcar-du: Remove #ifdef guards for PM related functions
  drm: rockchip: Remove #ifdef guards for PM related functions
  drm: shmobile: Remove #ifdef guards for PM related functions
  drm: tegra: Remove #ifdef guards for PM related functions
  drm: tilcdc: Remove #ifdef guards for PM related functions
  drm: vboxvideo: Remove #ifdef guards for PM related functions
  drm: vc4: Remove #ifdef guards for PM related functions
  drm: gm12u320: Remove #ifdef guards for PM related functions
  drm: tidss: Remove #ifdef guards for PM related functions
  drm/i915/gt: Remove #ifdef guards for PM related functions

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  9 ++---
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 17 ++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         | 30 ++++++---------
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 13 ++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 12 ++----
 drivers/gpu/drm/exynos/exynos_dp.c            | 11 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 11 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 11 ++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 10 ++---
 drivers/gpu/drm/exynos/exynos_drm_mic.c       | 11 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 12 ++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 12 ++----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  9 ++---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  8 +---
 drivers/gpu/drm/imx/dcss/dcss-dev.c           | 17 +++++----
 drivers/gpu/drm/imx/dcss/dcss-dev.h           |  7 ++--
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |  8 +---
 drivers/gpu/drm/imx/imx-drm-core.c            | 23 ++---------
 drivers/gpu/drm/mediatek/mtk_dp.c             |  6 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  9 ++---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 22 +----------
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |  6 +--
 drivers/gpu/drm/omapdrm/omap_drv.c            |  7 ++--
 drivers/gpu/drm/omapdrm/omap_gem.c            |  5 ++-
 drivers/gpu/drm/omapdrm/omap_gem.h            |  2 -
 drivers/gpu/drm/panfrost/panfrost_device.c    | 10 +++--
 drivers/gpu/drm/panfrost/panfrost_device.h    |  4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  7 +---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  9 ++---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  6 +--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   | 25 ++----------
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  9 ++---
 drivers/gpu/drm/sun4i/sun4i_drv.c             | 26 ++-----------
 drivers/gpu/drm/tegra/dpaux.c                 |  6 +--
 drivers/gpu/drm/tegra/drm.c                   | 23 ++---------
 drivers/gpu/drm/tidss/tidss_drv.c             | 29 +++++++-------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  9 ++---
 drivers/gpu/drm/tiny/bochs.c                  | 29 ++------------
 drivers/gpu/drm/tiny/gm12u320.c               | 15 ++++----
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  6 +--
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  6 +--
 include/drm/drm_modeset_helper.h              | 38 +++++++++++++++++++
 42 files changed, 184 insertions(+), 361 deletions(-)

-- 
2.35.1

