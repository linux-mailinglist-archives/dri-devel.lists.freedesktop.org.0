Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004FB466C2D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259916FB8B;
	Thu,  2 Dec 2021 22:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4D6FBA2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:36 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id v23so835415pjr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5WjMVJlEvHCp7tTv7npHyleFiHNkXhRhHCdBOuZtqvQ=;
 b=Bjy1MQ1/dmjzsHusnNupzZgwROVBZHR+JowF629y1E1WFpdgUOafwyPSlDiFFbH4DS
 TtmOv1mKEn8sS6GtBLCyMvee4wdRX9qPCJLPht+ksdTUTV8k07HfHtgVui1y1uKKElqY
 h58KNT3N4Jkutcui3TbymX6qTPQ2JnAA4eAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5WjMVJlEvHCp7tTv7npHyleFiHNkXhRhHCdBOuZtqvQ=;
 b=pKkdMcstvuUBfCOcYO0lpNBGYQHwp5b8BdRCb4b5m12ZCY0ziGmukftd52PR463nQ6
 pbfjHbAjb8+LK3k9uJx5Ft/6iri6Pa6mNY5faUvAex5DKW3YGJtxmlEfNLELUkdTmHyd
 ghHu0TGSjpxUtevX1mHUd+xRNUEEc/McVMfGvkDzOmiN89RN7ljyjuEs5qRCzAYxknvK
 8Gi3TUEVCkwERSFUUPDDthEHBnHMVLOHvtSY+txe6XugrE+ZhT8A40ujE95uG1C5N4It
 5NplTXQMqgR2f8pg+ujgSDhTruOwDnRaFkfedEPRoq0bI4v8k1L+yLNrQUoD4+Si+rgI
 TGSg==
X-Gm-Message-State: AOAM5308xhDi7hfFYh+bvd8yJVRqzDbtoPJno6tQnxEMkj0D+aqNOoq5
 xo9RDpShhhSwU/XVIKLgddwKnw==
X-Google-Smtp-Source: ABdhPJyMSX7reHsiHW/u9oxdh7JPxePin6ydBK/uJtlLT6HG2XEj1YzWc6sEjYmPD3r5kOUwBPPOdA==
X-Received: by 2002:a17:903:4053:b0:143:6d84:984c with SMTP id
 n19-20020a170903405300b001436d84984cmr18435905pla.37.1638484055856; 
 Thu, 02 Dec 2021 14:27:35 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:34 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 00/34] component: Make into an aggregate bus
Date: Thu,  2 Dec 2021 14:26:58 -0800
Message-Id: <20211202222732.2453851-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
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
Cc: linux-fbdev@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, James Qian Wang <james.qian.wang@arm.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-omap@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>,
 Tomi Valkeinen <tomba@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Sebastian Reichel <sre@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is from discussion we had on reordering the device lists for
drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
the aggregate device onto and then we probe the aggregate device once
all the components are probed and call component_add(). The probe/remove
hooks are where the bind/unbind calls go, and then a shutdown hook is
added that can be used to shutdown the drm display pipeline at the right
time.

This works for me on my sc7180 board. I no longer get a warning from i2c
at shutdown that we're trying to make an i2c transaction after the i2c
bus has been shutdown. There's more work to do on the msm drm driver to
extract component device resources like clks, regulators, etc. out of
the component bind function into the driver probe but I wanted to move
everything over now in other component drivers before tackling that
problem.

Tested-by tags would be appreciated, and Acked-by/Reviewed-by tags too.

Changes since v3 (https://lore.kernel.org/r/20211026000044.885195-1-swboyd@chromium.org):
 - Picked up tags
 - Rebased to v5.16-rc2
 - Updated component.c for a few new patches there
 - Dropped a conversion patch
 - Added a conversion patch

Changes since v2 (https://lore.kernel.org/r/20211006193819.2654854-1-swboyd@chromium.org):
 - Picked up acks
 - Fixed build warnings/errors
 - Reworked patch series to rename 'master' in a different patch

Changes since v1 (https://lore.kernel.org/r/20210520002519.3538432-1-swboyd@chromium.org):
 - Use devlink to connect components to the aggregate device
 - Don't set the registering device as a parent of the aggregate device
 - New patch for bind_component/unbind_component ops that takes the
   aggregate device
 - Convert all drivers in the tree to use the aggregate driver approach
 - Allow one aggregate driver to be used for multiple aggregate devices

[1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org


Stephen Boyd (34):
  component: Introduce struct aggregate_device
  component: Remove most references to 'master'
  component: Introduce the aggregate bus_type
  component: Move struct aggregate_device out to header file
  component: Add {bind,unbind}_component() ops that take aggregate
    device
  drm/of: Add a drm_of_aggregate_probe() API
  drm/msm: Migrate to aggregate driver
  drm/komeda: Migrate to aggregate driver
  drm/arm/hdlcd: Migrate to aggregate driver
  drm/malidp: Migrate to aggregate driver
  drm/armada: Migrate to aggregate driver
  drm/etnaviv: Migrate to aggregate driver
  drm/kirin: Migrate to aggregate driver
  drm/exynos: Migrate to aggregate driver
  drm/imx: Migrate to aggregate driver
  drm/ingenic: Migrate to aggregate driver
  drm/mcde: Migrate to aggregate driver
  drm/mediatek: Migrate to aggregate driver
  drm/meson: Migrate to aggregate driver
  drm/omap: Migrate to aggregate driver
  drm/rockchip: Migrate to aggregate driver
  drm/sti: Migrate to aggregate driver
  drm/sun4i: Migrate to aggregate driver
  drm/tilcdc: Migrate to aggregate driver
  drm/vc4: Migrate to aggregate driver
  iommu/mtk: Migrate to aggregate driver
  mei: Migrate to aggregate driver
  power: supply: ab8500: Migrate to aggregate driver
  fbdev: omap2: Migrate to aggregate driver
  sound: hdac: Migrate to aggregate driver
  ASoC: codecs: wcd938x: Migrate to aggregate driver
  mei: pxp: Migrate to aggregate driver
  component: Get rid of drm_of_component_probe()
  component: Remove component_master_ops and friends

 drivers/base/component.c                      | 544 ++++++++++--------
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  20 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  21 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  21 +-
 drivers/gpu/drm/armada/armada_drv.c           |  23 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +-
 drivers/gpu/drm/drm_of.c                      |  18 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  20 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  21 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  20 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  20 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  25 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  23 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  20 +-
 drivers/gpu/drm/meson/meson_drv.c             |  21 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  46 +-
 drivers/gpu/drm/omapdrm/dss/dss.c             |  20 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  20 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  20 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  26 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  28 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  20 +-
 drivers/iommu/mtk_iommu.c                     |  14 +-
 drivers/iommu/mtk_iommu.h                     |   6 +-
 drivers/iommu/mtk_iommu_v1.c                  |  14 +-
 drivers/misc/mei/hdcp/mei_hdcp.c              |  22 +-
 drivers/misc/mei/pxp/mei_pxp.c                |  22 +-
 drivers/power/supply/ab8500_charger.c         |  22 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 +-
 include/drm/drm_of.h                          |  10 +-
 include/linux/component.h                     |  92 ++-
 sound/hda/hdac_component.c                    |  21 +-
 sound/soc/codecs/wcd938x.c                    |  20 +-
 33 files changed, 772 insertions(+), 490 deletions(-)

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Emma Anholt <emma@anholt.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: <linux-fbdev@vger.kernel.org>
Cc: <linux-omap@vger.kernel.org>
Cc: <linux-pm@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>

base-commit: 136057256686de39cc3a07c2e39ef6bc43003ff6
-- 
https://chromeos.dev

