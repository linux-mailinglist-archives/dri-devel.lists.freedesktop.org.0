Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE54246C2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D8E6EE1F;
	Wed,  6 Oct 2021 19:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF086EE1C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:23 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so5227116pjw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOPyAAlgkloGBvBKaHv+rjO0uew1lLPS4TPvNQXgGpg=;
 b=NfRXDAjZ56Sp834gnEHgLwuXxQVUtsJkT2wga3+6IgC06j+y5bTeXit8d+59Vzb3EB
 d5z8MUC2yTrMyl/REWDz7Xj7y4VryHU2ACdz7TdMZ2sEy74M46zyTFe14HUcaaYbxfCK
 nRCyGp7GzMSIaj6tmAg4lxzSmurSmmRsCLgRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOPyAAlgkloGBvBKaHv+rjO0uew1lLPS4TPvNQXgGpg=;
 b=Q1zvp+cSj37TziAyCO5dCQ2OaMjGZ/BidyzaLdx3AgMerAF/iERH5xDdV/HN5vIg73
 an7X2uYsOzU3bnTU9eg0J8K1svWBfvH1r+yBFLKv1IW2o4zuyIjx3g5bO77g/pLbQ5mY
 iWVRjp4VzH8OEcxXNQrmezmY6nhc8jfAL/QpTYz9CShD2BZ4VIlYq1I8Gs/Sd5x/AcZq
 5p5znrG3/bPUhIt4QSyricWsJQTnutu/xeYaSoKXCuicOgp4FzSL3naUX6vXWXcOzpPX
 sbj2dbrGIxnQekq7s/uSyJl29iXA/dRYPgC6MXzTGuQ0zQwtHKWcJnrHbuT4auPnWE2x
 wHeQ==
X-Gm-Message-State: AOAM533N58Q31cvA0YHKHcDb7U34jwoGWaHY5PnQeu4k6X6b79QPrq2o
 fTXHlgHHZKYP/STf7SWjimvEXw==
X-Google-Smtp-Source: ABdhPJyOSP9eTH58O4sZphYJfqDacdQGshqo1a+GgIDJL6zusxu34JwQnPr+XtN/rdjjr7tkocXkfA==
X-Received: by 2002:a17:902:6b0b:b0:13a:18bf:1ece with SMTP id
 o11-20020a1709026b0b00b0013a18bf1ecemr12512498plk.49.1633549103194; 
 Wed, 06 Oct 2021 12:38:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:22 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Inki Dae <inki.dae@samsung.com>, James Qian Wang <james.qian.wang@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
 John Stultz <john.stultz@linaro.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-pm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Sandy Huang <hjc@rock-chips.com>, Saravana Kannan <saravanak@google.com>,
 Sebastian Reichel <sre@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Tian Tao <tiantao6@hisilicon.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Tomi Valkeinen <tomba@kernel.org>,
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 00/34] component: Make into an aggregate bus
Date: Wed,  6 Oct 2021 12:37:45 -0700
Message-Id: <20211006193819.2654854-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
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

I'll definitely be sending a v3 so this is partially a request for
testing to shake out any more problems. Tested-by tags would be appreciated,
and Acked-by/Reviewed-by tags too. I sent this to gregkh which may be
incorrect but I don't know what better tree to send it all through.
Maybe drm?

I'll be faster at resending this next time, sorry for the long delay!

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
  component: Introduce the aggregate bus_type
  component: Move struct aggregate_device out to header file
  drm/msm: Migrate to aggregate driver
  component: Add {bind,unbind}_component() ops that take aggregate
    device
  drm/of: Add a drm_of_aggregate_probe() API
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
  drm/zte: Migrate to aggregate driver
  iommu/mtk: Migrate to aggregate driver
  mei: Migrate to aggregate driver
  power: supply: ab8500: Migrate to aggregate driver
  fbdev: omap2: Migrate to aggregate driver
  sound: hdac: Migrate to aggregate driver
  ASoC: codecs: wcd938x: Migrate to aggregate driver
  component: Get rid of drm_of_component_probe()
  component: Remove component_master_ops and friends
  component: Remove all references to 'master'

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

 drivers/base/component.c                      | 555 +++++++++++-------
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  20 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  21 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  21 +-
 drivers/gpu/drm/armada/armada_drv.c           |  23 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +-
 drivers/gpu/drm/drm_of.c                      |  20 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  20 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  21 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  20 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  20 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  24 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  23 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  20 +-
 drivers/gpu/drm/meson/meson_drv.c             |  21 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  46 +-
 drivers/gpu/drm/omapdrm/dss/dss.c             |  17 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  20 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  20 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  26 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  28 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  20 +-
 drivers/gpu/drm/zte/zx_drm_drv.c              |  20 +-
 drivers/iommu/mtk_iommu.c                     |  14 +-
 drivers/iommu/mtk_iommu.h                     |   6 +-
 drivers/iommu/mtk_iommu_v1.c                  |  14 +-
 drivers/misc/mei/hdcp/mei_hdcp.c              |  22 +-
 drivers/power/supply/ab8500_charger.c         |  22 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 +-
 include/drm/drm_of.h                          |   9 +-
 include/linux/component.h                     |  92 ++-
 sound/hda/hdac_component.c                    |  21 +-
 sound/soc/codecs/wcd938x.c                    |  20 +-
 33 files changed, 780 insertions(+), 488 deletions(-)


base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
https://chromeos.dev

