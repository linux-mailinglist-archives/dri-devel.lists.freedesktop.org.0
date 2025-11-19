Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEFC6EAD9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ED410E5DE;
	Wed, 19 Nov 2025 13:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wONIZlzx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696EF10E5DE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:06:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A1FA24E4179C;
 Wed, 19 Nov 2025 13:06:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 586B260720;
 Wed, 19 Nov 2025 13:06:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F349A10371A4D; Wed, 19 Nov 2025 14:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763557559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=qjKCnJ8MWt1XzGq8HDqxEVxZ5da/4Lf/GYebHfI6vFs=;
 b=wONIZlzx6P2Z4sicT6r6z6gD+PYJghZTD15EHcfmR1Q6FWaW29w4/JWDMohCBRR0cKcQYk
 0M0XYcvRMY6mb3QqxiozdtPamzSECPaMwIsKaK6QiVPtzJhMrFOvv0a2HBPioi9XIPzWMe
 zz8kk4kcEaZ5zJIomhf7RpHxHVs9ATPCKH3J6P34x6Lpmv81RYDVCWPhQAKVyOgUNPvQP8
 lWXGJ/owLp9038/CpGurPlotLSAmv7+FBq8gzitIgeS6yvNKEdp8e9/zLMPevXMyHSXh0P
 f52+E19RPI3jxUMuU4EAS1nK44qc6g6SnRuuXhEGqyadTbwKodoeQ4BIc8O9jQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 00/26] drm/bridge: add drm_of_find_bridge(), deprecate
 of_drm_find_bridge()
Date: Wed, 19 Nov 2025 14:05:31 +0100
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJvAHWkC/y2NUQqDMBAFryL73YDR2NhepZRg3Y0u2EQ2tgji3
 U2ln/MG5m2QSJgS3IsNhL6cOIYM+lJAP3ZhIMWYGaqyarTWVqG81UsYs+mmKfZqoGX+LL/dRe8
 8B3R/b82trOurNaZFyMFZyPN6nj2e+34Aj3ziYHwAAAA=
X-Change-ID: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

This series deprecated of_drm_find_bridge(), adds a replacement which
handles bridge refcounting, and converts most of the direct users.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge()
          a. ➜ add drm_of_fund_bridge(), convert most direct users
	  b. convert other direct users
	  c. convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. … Add drm_dev_enter/exit() to protect device resources
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Almost all the functions returning a struct drm_bridge pointer have been
modified to drm_bridge_get() the returned bridge, and their users updated
to drm_bridge_put() it.

of_drm_find_bridge() could be modified easily in the same way, but it has a
lot of (direct + indirect) callers, and most notably
drm_of_find_panel_or_bridge() which is very hard to adapt without reowrking
the panel_bridge lifetime.

Moreover of_drm_find_bridge() shold be called drm_of_find_bridge() by the
DRM subsystem conventions.

This has been discussed in [1] and Maxime proposed an incremental approach:

> One way to solve it would be that, for example, of_drm_find_bridge is
> oddly named according to our convention and it would make more sense to
> be called drm_of_find_bridge().
>
> So maybe we can just create drm_of_find_bridge() that takes a reference,
> make of_drm_find_bridge() deprecated in favour of drm_of_find_bridge(),
> add a TODO, and call it a day. People will gradually switch to the new
> API over time.

That proposal is implemented by this series. Most of the direct callers are
also converted: they are all trivial conversions except for one, which is
handled by the last 3 patches.

[1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (26):
      drm/bridge: add drm_of_find_bridge()
      drm/bridge: deprecate of_drm_find_bridge()
      drm/todo: add entry about converting to drm_of_find_bridge()
      drm/bridge: make of_drm_find_bridge() a wrapper of drm_of_find_bridge()
      drm/arcpgu: convert to drm_of_find_bridge()
      drm/bridge: add devm_drm_of_find_bridge
      drm/bridge: ite-it66121: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: imx8qxp-pixel-combiner: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: simple-bridge: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: tpd12s015: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: thc63lvd1024: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: use devm_drm_of_find_bridge() to put the next and companion bridges
      drm/bridge: lt8912b: use devm_drm_of_find_bridge() to put the hdmi bridge
      drm/bridge: tfp410: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: imx8qxp-ldb: use devm_drm_of_find_bridge() to put the companion bridge
      drm/rcar-du: lvds: use devm_drm_of_find_bridge() to put the next bridge
      drm/meson: encoder_*: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: sii902x: use devm_drm_of_find_bridge() to put the next bridge
      drm/mediatek: use devm_drm_of_find_bridge() to put the next bridge
      drm/kmb: dsi: use devm_drm_of_find_bridge() to put the next bridge
      drm/imx/ipuv3: use devm_drm_of_find_bridge() to put the next bridge
      drm/exynos: hdmi: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: dw-hdmi: use devm_drm_of_find_bridge() to put the next bridge
      drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      drm/bridge: imx8qxp-pixel-link: convert to drm_of_find_bridge()

 Documentation/gpu/todo.rst                         | 16 ++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  2 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 37 ++++++------
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                   |  2 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  2 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |  2 +-
 drivers/gpu/drm/drm_bridge.c                       | 66 ++++++++++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  2 +-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |  2 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |  4 +-
 include/drm/drm_bridge.h                           | 10 ++++
 24 files changed, 125 insertions(+), 48 deletions(-)
---
base-commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd
change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

