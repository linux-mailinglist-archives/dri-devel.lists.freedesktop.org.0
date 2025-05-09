Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B061AB15F4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4473510EA50;
	Fri,  9 May 2025 13:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lw+EQEO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6810EA50;
 Fri,  9 May 2025 13:56:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06B7443B6D;
 Fri,  9 May 2025 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746798971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3gLOa47Xk0ok2K33C8I47xYA9XRAOM9sF3Fq2wGIFQc=;
 b=lw+EQEO287PssCQbUR5pbpq8hWm7h9CR05KLQtMfotqjCDKWEphI2S4R2sxAXowdZTfKdC
 OmHerQw6VCqG7SnTf10aZAkCjuyQsOYw/0RSu2PejQEA8yGzg9SSlEIJKW/s+3Ij5kBk22
 phDq54pI0DXGqnQrGhQkDkRMf4gSkETNGTZDTB1vhe0zaoyIZWcwRAOBomuFVhKR4YkZt0
 YfhwQ5/k1oOGjFpg9+X4l6h2xj6L0vvc7/dNrbEF2U+7SPCCCdjVku3BCyXKN3m9jMg9kV
 pJrsJt+IjI7h7HGimPq/bRngS2ihBVdyl4Yi8fbn8ccERhKObBh9G0PjFbOcKQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 00/22] drm: convert all bridges to devm_drm_bridge_alloc()
Date: Fri, 09 May 2025 15:53:26 +0200
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANYIHmgC/4WNyw6CMBBFf4V07Zi2VBRW/odhAX3IJNAhbdNoC
 P9uJXHt8tybnLOxaAPayLpqY8FmjEi+QH2qmJ4G/7SApjCTXF644gpMWGAMaMqjyWcbEiSCYZ5
 Jw7AiNEKNVrtGylaxYlmDdfg6Co++8IQxUXgfwSy+6899/evOAjgoKUTt3M20mt9HojSjP2taW
 L/v+wdg6Tv10AAAAA==
X-Change-ID: 20250404-drm-bridge-convert-to-alloc-api-614becf62294
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepleejpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhgrghllhgrihhsqdhpohhusehfohhsshdrshhtrdgto
 hhmpdhrtghpthhtohepthhrvggrphhkihhnghestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepihgrnhdrrhgrhiesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
bridge, and the only one supported from now on. It is the first milestone
towards removal of bridges from a still existing DRM pipeline without
use-after-free.

The steps in the grand plan [1] are:

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

This series is part of step 1 of the grand plan.

Current tasks in step 1 of the grand plan:

 A. ✔ add new alloc API and refcounting -> (now in drm-misc-next)
 B. ➜ convert all bridge drivers to new API (this series)
 C. … documentation, kunit tests (v1 under discussion)
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
 E. after (B), convert accessors; this is a large work and can be done
    in chunks
 F. debugfs improvements

More info about this series in the v2 cover [2].

Luca

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
[2] https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Fixed issues reported for some patches
- Added review tags
- Removed patches that have been applied
- Added revert for the exynos patch, applied by mistake
- Update cover with grand plan info and trim some of it
- Updated bouncing e-mail address in Cc list
- Link to v2: https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com/

Changes in v2:
- Improved cover letter with link to commit adding devm_drm_bridge_alloc()
- add review tags
- fix bugs in zynqmp, vc4 patches
- fix patch 1 error code checking
- Link to v1: https://lore.kernel.org/r/20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com

---
Luca Ceresoli (22):
      Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"
      drm: convert many bridge drivers from devm_kzalloc() to devm_drm_bridge_alloc() API
      drm/bridge: anx7625: convert to devm_drm_bridge_alloc() API
      drm/bridge: cdns-dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: convert to devm_drm_bridge_alloc() API
      drm/bridge: nxp-ptn3460: convert to devm_drm_bridge_alloc() API
      drm/bridge: sii902x: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dpi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dsi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi4: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi5: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: sdi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: venc: convert to devm_drm_bridge_alloc() API
      drm/rcar-du: dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: stm_lvds: convert to devm_drm_bridge_alloc() API
      drm/sti: dvo: convert to devm_drm_bridge_alloc() API
      drm: zynqmp_dp: convert to devm_drm_bridge_alloc() API
      drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API
      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
      drm/bridge: add devm_drm_put_bridge()
      drm/bridge: panel: convert to devm_drm_bridge_alloc() API
      drm/todo: add entry to remove devm_drm_put_bridge()

 Documentation/gpu/todo.rst                         | 15 ++++++
 drivers/gpu/drm/adp/adp-mipi.c                     |  8 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  8 ++--
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  9 ++--
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  7 ++-
 drivers/gpu/drm/bridge/aux-bridge.c                |  8 ++--
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |  9 ++--
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  8 ++--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  8 ++--
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  8 ++--
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  8 ++--
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |  8 ++--
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  7 ++-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  8 ++--
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  8 ++--
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 27 ++++++-----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  8 ++--
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  8 ++--
 drivers/gpu/drm/bridge/ite-it6263.c                |  8 ++--
 drivers/gpu/drm/bridge/ite-it6505.c                |  8 ++--
 drivers/gpu/drm/bridge/ite-it66121.c               |  8 ++--
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  8 ++--
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  7 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  8 ++--
 drivers/gpu/drm/bridge/lvds-codec.c                |  9 ++--
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 11 ++---
 drivers/gpu/drm/bridge/microchip-lvds.c            |  8 ++--
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  8 ++--
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  9 ++--
 drivers/gpu/drm/bridge/panel.c                     | 12 ++---
 drivers/gpu/drm/bridge/parade-ps8622.c             |  8 ++--
 drivers/gpu/drm/bridge/parade-ps8640.c             |  8 ++--
 drivers/gpu/drm/bridge/sii902x.c                   |  7 ++-
 drivers/gpu/drm/bridge/sii9234.c                   |  8 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c               |  8 ++--
 drivers/gpu/drm/bridge/simple-bridge.c             |  8 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  8 ++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  8 ++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  8 ++--
 drivers/gpu/drm/bridge/tc358762.c                  |  8 ++--
 drivers/gpu/drm/bridge/tc358764.c                  |  8 ++--
 drivers/gpu/drm/bridge/tc358767.c                  | 56 +++++++++++++++-------
 drivers/gpu/drm/bridge/tc358768.c                  |  8 ++--
 drivers/gpu/drm/bridge/tc358775.c                  |  8 ++--
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  8 ++--
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  8 ++--
 drivers/gpu/drm/bridge/ti-tdp158.c                 |  8 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  8 ++--
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |  8 ++--
 drivers/gpu/drm/drm_bridge.c                       | 17 +++++++
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |  7 +--
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  8 ++--
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  8 ++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  8 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  8 ++--
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         | 10 ++--
 drivers/gpu/drm/meson/meson_encoder_dsi.c          | 10 ++--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         | 10 ++--
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |  7 ++-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |  7 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                | 26 ++++------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                | 26 ++++------
 drivers/gpu/drm/omapdrm/dss/sdi.c                  | 25 ++++------
 drivers/gpu/drm/omapdrm/dss/venc.c                 | 23 ++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  8 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  8 ++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |  8 ++--
 drivers/gpu/drm/sti/sti_dvo.c                      | 29 +++++------
 drivers/gpu/drm/stm/lvds.c                         |  7 ++-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   | 31 +++++-------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |  1 -
 include/drm/drm_bridge.h                           |  4 ++
 72 files changed, 390 insertions(+), 379 deletions(-)
---
base-commit: 94c60d3c1079fc044e356a78ffc68ca7b0603039
change-id: 20250404-drm-bridge-convert-to-alloc-api-614becf62294

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

