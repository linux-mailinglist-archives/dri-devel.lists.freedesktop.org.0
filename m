Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAD07DF828
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD4F10E937;
	Thu,  2 Nov 2023 16:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F0C10E936
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:58:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0K-000357-QY; Thu, 02 Nov 2023 17:57:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0F-0067Eo-8v; Thu, 02 Nov 2023 17:57:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0E-00Bjbm-TZ; Thu, 02 Nov 2023 17:57:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Russell King <linux@armlinux.org.uk>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Zhu Wang <wangzhu9@huawei.com>, Rob Herring <robh@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Thierry Reding <treding@nvidia.com>, Marian Cichy <m.cichy@pengutronix.de>,
 Dan Carpenter <error27@gmail.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Deepak R Varma <drv@mailo.com>, Jani Nikula <jani.nikula@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 00/16] drm: Convert to platform remove callback returning
 void
Date: Thu,  2 Nov 2023 17:56:41 +0100
Message-ID: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4120;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6QYM0SU3kXEp/3Rx24czlnqsJN0YtugMXofEMzocIhI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TJCnXlJTkkfRNtfDCRgNgoYImgoMcqTIUGU
 YPFEI8hNtuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPUyQAKCRCPgPtYfRL+
 TlE1B/9NxDv3OWR8FrrOhkWCsLmrwRFKWVyDmyJSx60Ka0DnSfGX5PCxeEQX54ei+hOZqfLgOrV
 dyJPHuu/UbIkK39U0o0NSnUyxMAdg0IUMyOtDMNTgWD+4xmfMqH6d2PacWn5ecdXfhgoLTEGO0J
 Efnk/t1kkH8kW4oj8RUKjDSUb9qdDuuKfvqki0nTiWtiYujDISWZRNVCHeSiRItvUBj5pyei3sh
 TmKFd9Rcv/2AjgpC3Yq2P6GtbftnRl90/79DwE6NBT7fpR+h5KWk5xDyijTkL2zKpArX16e/QLc
 eXdbf6zdC11Tt5f6LOJ9xMQA1iPo4CxvwDoCJ4yHiVLd3jFk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this series converts all platform drivers below drivers/gpu/drm to use
.remove_new(). It starts with a fix for a problem that potentially might
crash the kernel that I stumbled over while implementing the conversion.

Some of the conversion patches following this fix were already send in
earlier series:

	https://lore.kernel.org/dri-devel/20230801110239.831099-1-u.kleine-koenig@pengutronix.de
	https://lore.kernel.org/dri-devel/20230318190804.234610-1-u.kleine-koenig@pengutronix.de

and three patches (bridge/tpd12s015, exynos + tilcdc) are new. Parts of
the above series were picked up, the patches resend here are not.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

Compared to the earlier submissions this patch series is rebased to
today's drm-misc-next. Otherwise there is no relevant change.

Best regards
Uwe

Uwe Kleine-König (16):
  drm/bridge: tpd12s015: Drop buggy __exit annotation for remove
    function
  drm/arcpgu: Convert to platform remove callback returning void
  drm/armada: Convert to platform remove callback returning void
  drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
  drm/bridge: cdns-mhdp8546: Convert to platform remove callback
    returning void
  drm/bridge: tpd12s015: Convert to platform remove callback returning
    void
  drm/etnaviv: Convert to platform remove callback returning void
  drm/exynos: Convert to platform remove callback returning void
  drm/imx/dcss: Convert to platform remove callback returning void
  drm/imx: lcdc: Convert to platform remove callback returning void
  drm/kmb: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  drm/meson: Convert to platform remove callback returning void
  drm/nouveau: Convert to platform remove callback returning void
  drm/sprd: Convert to platform remove callback returning void
  drm/tilcdc: Convert to platform remove callback returning void

 drivers/gpu/drm/armada/armada_crtc.c          |  5 ++---
 drivers/gpu/drm/armada/armada_drv.c           |  5 ++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 22 +++++++++----------
 drivers/gpu/drm/bridge/ti-tpd12s015.c         |  6 ++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  6 ++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  5 ++---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  6 ++---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  6 ++---
 drivers/gpu/drm/exynos/exynos_dp.c            |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  5 ++---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_mic.c       |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  6 ++---
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  6 ++---
 drivers/gpu/drm/exynos/exynos_mixer.c         |  6 ++---
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |  6 ++---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  6 ++---
 drivers/gpu/drm/kmb/kmb_drv.c                 |  5 ++---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  5 ++---
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  5 ++---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  6 ++---
 drivers/gpu/drm/nouveau/nouveau_platform.c    |  5 ++---
 drivers/gpu/drm/sprd/sprd_dpu.c               |  6 ++---
 drivers/gpu/drm/sprd/sprd_drm.c               |  5 ++---
 drivers/gpu/drm/sprd/sprd_dsi.c               |  6 ++---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  9 ++++----
 drivers/gpu/drm/tiny/arcpgu.c                 |  6 ++---
 32 files changed, 74 insertions(+), 128 deletions(-)


base-commit: 6fd9487147c4f18ad77eea00bd8c9189eec74a3e
-- 
2.42.0

