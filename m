Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EBC929F2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 17:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB6410E17F;
	Fri, 28 Nov 2025 16:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VUX78Sy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652A310E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 16:51:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BFB2E4E4194E;
 Fri, 28 Nov 2025 16:51:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 83CD460706;
 Fri, 28 Nov 2025 16:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B46510B02155; Fri, 28 Nov 2025 17:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764348710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=4LXnxBJlqd2UazTmBhwXwFStb/3+5cf3TPNAlsU5TvA=;
 b=VUX78Sy4XiyC9MPlVpttqJ9SQIQnLJGEto9dm/Wz9ym7T7bN/CgnVlY9YH1bFcC0CgzUQe
 cZofZ4OEZUrrcGm7JEzsnL/etiRVBFwZzGGetbM0bgfGQ8fhKl1CmChVPekpLxS7jOlSK/
 B1kea5ki5mVy1By5DwWomHJRAzf/5aB3po6F7XpWKHUzRNA/KlBEfcw2dr1S/BoUKwTmTY
 jTevGUZnNFJkK/0JxyFshBgnAEB0h6+hbX3C2stg8aS1MNDCf/acKsU6YDTC4b6Xv/aXH9
 y6s8LhEMqH9Ez7UYbhzo3zb3DijYvmvDN8X+0amDd5uaA6wuXX7uEGzIbnqiwg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 00/26] drm/bridge: add drm_of_find_bridge(), deprecate
 of_drm_find_bridge()
Date: Fri, 28 Nov 2025 17:50:10 +0100
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMLSKWkC/5WNQQ6DIBQFr2JYlwaQFu2q92iMUQH9ifINUNPGe
 PeiaQ/Q5cxL3qwkGA8mkFu2Em8WCIAugThlpBsa1xsKOjERTFw454pqP9HWg05LM47Y0d7E+Rl
 3X6OtLThdf3clS5bnVyVloUk6nL2x8DpijyrxACGifx/the/2lyn/ySycMsp0WxaNskYqeW8R4
 wju3OFEqm3bPvDOx3LmAAAA
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
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
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
          a. ➜ add of_drm_get_bridge(), convert most direct users
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
to drm_bridge_put() it. See items 1.E.{1-6} above.

of_drm_find_bridge() could be modified easily in the same way, but it has a
lot of (direct + indirect) callers, and most notably
drm_of_find_panel_or_bridge() which is very hard to adapt without reowrking
the panel_bridge lifetime.

This has been discussed in [1] and Maxime proposed an incremental approach:

> So maybe we can just create drm_of_find_bridge() that takes a reference,
> make of_drm_find_bridge() deprecated in favour of drm_of_find_bridge(),
> add a TODO, and call it a day. People will gradually switch to the new
> API over time.

That proposal is implemented by this series. Most of the direct callers are
also converted: they are all trivial conversions except for one, which is
handled by the last 3 patches.

Follow-up series will:
- convert remaining direct callers of of_drm_find_bridge()
- convert simple cases of drm_of_find_panel_or_bridge()

[1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- All patches: renamed drm_of_find_bridge() -> of_drm_get_bridge()
- Various fixes and improvements to patches 1-6, see individual patches
  changelog
- Removed bouncing recipient: Edmund Dea <edmund.j.dea@intel.com>
- Link to v1: https://lore.kernel.org/r/20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com

---
Luca Ceresoli (26):
      drm/bridge: add of_drm_get_bridge()
      drm/bridge: deprecate of_drm_find_bridge()
      drm/todo: add entry about converting to of_drm_get_bridge()
      drm/bridge: make of_drm_find_bridge() a wrapper of of_drm_get_bridge()
      drm/arcpgu: convert to of_drm_get_bridge()
      drm/bridge: add devm_of_drm_get_bridge
      drm/bridge: ite-it66121: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: imx8qxp-pixel-combiner: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: simple-bridge: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: tpd12s015: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: thc63lvd1024: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: use devm_of_drm_get_bridge() to put the next and companion bridges
      drm/bridge: lt8912b: use devm_of_drm_get_bridge() to put the hdmi bridge
      drm/bridge: tfp410: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: imx8qxp-ldb: use devm_of_drm_get_bridge() to put the companion bridge
      drm/rcar-du: lvds: use devm_of_drm_get_bridge() to put the next bridge
      drm/meson: encoder_*: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: sii902x: use devm_of_drm_get_bridge() to put the next bridge
      drm/mediatek: use devm_of_drm_get_bridge() to put the next bridge
      drm/kmb: dsi: use devm_of_drm_get_bridge() to put the next bridge
      drm/imx/ipuv3: use devm_of_drm_get_bridge() to put the next bridge
      drm/exynos: hdmi: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: dw-hdmi: use devm_of_drm_get_bridge() to put the next bridge
      drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      drm/bridge: imx8qxp-pixel-link: convert to of_drm_get_bridge()

 Documentation/gpu/todo.rst                         | 16 ++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  2 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 37 +++++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                   |  2 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  2 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |  2 +-
 drivers/gpu/drm/drm_bridge.c                       | 91 ++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  2 +-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |  2 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |  4 +-
 include/drm/drm_bridge.h                           | 10 +++
 24 files changed, 143 insertions(+), 55 deletions(-)
---
base-commit: e85e9ccf3f8404007f62dff9a02273fcdeb44206
change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

