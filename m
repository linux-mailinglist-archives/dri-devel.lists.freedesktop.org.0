Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B4D08655
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7819C10E870;
	Fri,  9 Jan 2026 10:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y+viVM2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE6F10E870
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:03:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E54554E4201A;
 Fri,  9 Jan 2026 10:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 941D860734;
 Fri,  9 Jan 2026 10:03:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34B8F103C88BF; Fri,  9 Jan 2026 11:02:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767952990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=8alxgy33jWjnXMagw/l/0CRaIbDfLVcYqloF5nxf24g=;
 b=Y+viVM2eBcACHs1bFBv3S7gQrQfaczfHaNQ3EhNbsOYqV4YgrWL4CYTM+sACmVJekaTv96
 tROuxIVWWeR7BIAmuUBhMVpRmtXG4dhprIddP+E/sXgL5YRhFzBglDCOOuelsEM04L3geh
 vFeWDyCpX1rwMTN/uPPfHy26MVpSS9aEM98/7IOJsFdUfyVmFhf7tyHUN86+3FMSyOqiBT
 TjHoSObyU0jGMwPtSdy5prytFkn6CmNCvtvTtdVkK0blN7rbo+GVZuhhvFHLzRR+xtoZQc
 idY4z178sGyslRew5Iqcg9xDv9P+g0jFFo3uENvfarCn2sVTSyIgdwUuY5pH3g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/6] drm/bridge: convert users of of_drm_find_bridge(),
 part 3
Date: Fri, 09 Jan 2026 11:02:49 +0100
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEnSYGkC/52NQQ6DIBQFr2JYlwaoLdpV79EYg/DRnygYoKaN8
 e5F0xN0OfOSNyuJEBAiuRcrCbBgRO8yiFNB9KBcDxRNZiKYuDHOJDVhol1Akxc1jl7THtL8Srt
 vvW0tOtP+9gstbV1LUFLL2pJ8OQew+D5yzybzgDH58DnqC9/tn6GFU0bBlpW6clmJCh6d92lEd
 9Z+Is22bV+aMdqI6gAAAA==
X-Change-ID: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-4f997ea7c79f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
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

This series converts many DRM drivers from the now deprecated
of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
allows correct bridge refcounting. Where applicable it also converts
per-driver "next_bridge" pointers to the unified drm_bridge::next_bridge
which puts the reference automatically on bridge deallocation.

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
       7. ➜ of_drm_find_bridge
          a. ✔… add of_drm_get_bridge(), convert basic direct users
	        (v6.20?, one driver still pending)
	  b. … convert direct of_drm_get_bridge() users, part 2
	  c. ➜ convert direct of_drm_get_bridge() users, part 3
	  d.   convert direct of_drm_get_bridge() users, part 4
	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

This work is a continuation of the work to correctly handle bridge
refcounting for existing of_drm_find_bridge(). The ground work is in:

 - commit 293a8fd7721a ("drm/bridge: add of_drm_find_and_get_bridge()")
 - commit 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
 - commit 3fdeae134ba9 ("drm/bridge: add next_bridge pointer to struct drm_bridge")

The whole conversion is split in multiple series to make the review process
a bit smoother:

 - Part 2: mostly drivers in drivers/gpu/drm/bridge [2]
 - Part 3: other drivers, low-medium complexity [this series]
 - Part 4: other drivers, complex (not sent yet)

[2] https://lore.kernel.org/all/20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Patch 3: fix missing drm_bridge_put()
- Link to v1: https://lore.kernel.org/r/20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com

---
Luca Ceresoli (6):
      drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
      drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
      drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  7 +++----
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  4 +++-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c     |  7 +++++--
 drivers/gpu/drm/mediatek/mtk_hdmi.c         |  4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |  4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |  1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      |  4 ++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  6 +++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 10 +++++++++-
 9 files changed, 31 insertions(+), 16 deletions(-)
---
base-commit: 13450a1f72fd24c405626c881ae7c9ce5f0d2a28
change-id: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-4f997ea7c79f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

