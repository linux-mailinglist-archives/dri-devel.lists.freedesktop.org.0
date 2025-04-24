Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C3A9BF5B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A399210E04C;
	Fri, 25 Apr 2025 07:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DuH1TtsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271B10E1B2;
 Thu, 24 Apr 2025 18:59:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 049FD4438B;
 Thu, 24 Apr 2025 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KvmqyVutPv+zs9lLb//iILWr2+AjUBSEyKFNcut/mes=;
 b=DuH1TtsBtBbKx8xuQFCItEVS7BlmRIhjrHT7qP3EZimFwTj+wdEQM7JxUOjbCjBX2wsdbp
 EMg22kKKTv/1tOD4aGC3ida2gGCYznBRttzpWQQmXV6HwuNMuLhmKySApyai+eLRdRvwsz
 aM/t2dcwAZpqLO/yKIDKagKPk5sjX0DZERY89Txi+ZuJdeIud5RPiMYe28LVRdx73KDSX+
 uxlAAhrU8kHXUIwEz0dgsQOImxPYADvpTF0101tN/YUA8GXoKtzmrsF4yiMTp5G0q/ALC9
 cBkKKZSSO99GpKjedDde7I6hwEsoIRyAi54/QUP432M9VcMUS5ZmUdCOBgX7UA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 00/34] drm: convert all bridges to devm_drm_bridge_alloc()
Date: Thu, 24 Apr 2025 20:59:07 +0200
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPyJCmgC/4WNywrCMBBFf6Vk7UgSY7Wu/A/pos3DDrSZkoSgl
 Py7seDa5bkXztlYtAFtZLdmY8FmjEi+gjw0TE+Df1pAU5lJLs9ccQUmLDAGNPXR5LMNCRLBMM+
 kYVgRWqFGq10rZadYtazBOnzthUdfecKYKLz3YBbf9ee+/HVnARyUFOLk3NV0mt9HojSjP2paW
 F9K+QDlZd8A0AAAAA==
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Adam Ford <aford173@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
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
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddutddprhgtphhtthhopegthhhfrdhfrhhithiisehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopegslhgvuhhnghestghhrhhomhhiuhhmrdhor
 hhgpdhrtghpthhtohepuggvthhlvghvrdgtrghsrghnohhvrgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepughhrghrmhgrrdgssehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Approved-At: Fri, 25 Apr 2025 07:12:50 +0000
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
bridge, and the only one supported from now on. It is also necessary for
implementing reference counting and thus needed to support removal of
bridges from a still existing DRM pipeline without use-after-free.

This series converts all DRM bridges to the new API.

Patch 1 uses a coccinelle semantic patch to mass-convert some of those
drivers -- thanks Maxime for having suggested the patch that served as a
starting point for me. I was unable to come up with a better patch
converting more drivers though, so I converted all others manually. Most of
them were trivial. I left the non-trivial ones at the end of the series to
help reviewers know where to look at more carefully.

Due to the large number of touched files, the list of recipients generated
by get_maintainers (b4 actually) was huge, 60~70 people (not counting
mailing lists), so I took the liberty of trimming the list as reasonably as
I could to DRM maintainers and frequent contributors, and added all other
recipients individually per-patch. I hope this is fine. Don't hesitate to
suggest more people which should be Cc-ed in a future series, or a better
Cc policy.

Current plan and status of the DRM bridge refcounting work:

 A. ✔ add new alloc API and refcounting -> (now in drm-misc-next)
 B. ➜ convert all bridge drivers to new API (this series)
 C. … documentation, kunit tests, debugfs improvements (v1 under discussion)
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
 E. after (B), convert accessors; this is a large work and can be done
    in chunks

Luca

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Improved cover letter with link to commit adding devm_drm_bridge_alloc()
- add review tags
- fix bugs in zynqmp, vc4 patches 
- fix patch 1 error code checking
- Link to v1: https://lore.kernel.org/r/20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com

---
Luca Ceresoli (34):
      drm: convert many bridge drivers from devm_kzalloc() to devm_drm_bridge_alloc() API
      platform: arm64: acer-aspire1-ec: convert to devm_drm_bridge_alloc() API
      drm/bridge: analogix-anx6345: convert to devm_drm_bridge_alloc() API
      drm/bridge: anx7625: convert to devm_drm_bridge_alloc() API
      drm/bridge: cdns-dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: display-connector: convert to devm_drm_bridge_alloc() API
      drm/bridge: lt9611uxc: convert to devm_drm_bridge_alloc() API
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: convert to devm_drm_bridge_alloc() API
      drm/bridge: nxp-ptn3460: convert to devm_drm_bridge_alloc() API
      drm/bridge: sii902x: convert to devm_drm_bridge_alloc() API
      drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API
      drm/bridge: tda998x: convert to devm_drm_bridge_alloc() API
      drm/bridge: ti-sn65dsi86: convert to devm_drm_bridge_alloc() API
      drm/exynos: mic: convert to devm_drm_bridge_alloc() API
      drm/mcde: convert to devm_drm_bridge_alloc() API
      drm/msm/dp: convert to devm_drm_bridge_alloc() API
      drm/msm/dsi: convert to devm_drm_bridge_alloc() API
      drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dpi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dsi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi4: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi5: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: sdi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: venc: convert to devm_drm_bridge_alloc() API
      drm/rcar-du: dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: stm_lvds: convert to devm_drm_bridge_alloc() API
      drm/vc4: convert to devm_drm_bridge_alloc() API
      drm/sti: dvo: convert to devm_drm_bridge_alloc() API
      drm: zynqmp_dp: convert to devm_drm_bridge_alloc() API
      drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API
      drm/bridge: imx8*-ldb: convert to devm_drm_bridge_alloc() API
      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
      drm/bridge: add devm_drm_put_bridge()
      drm/bridge: panel: convert to devm_drm_bridge_alloc() API

 drivers/gpu/drm/adp/adp-mipi.c                     |  8 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  9 ++--
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  8 ++--
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  9 ++--
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  7 ++-
 drivers/gpu/drm/bridge/aux-bridge.c                |  9 ++--
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |  9 ++--
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  8 ++--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  8 ++--
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  9 ++--
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  8 ++--
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |  9 ++--
 drivers/gpu/drm/bridge/display-connector.c         |  8 ++--
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  7 ++-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |  4 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |  3 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  9 ++--
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       | 10 ++--
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            | 32 ++++++++-----
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           | 20 +++++---
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 18 ++++---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  8 ++--
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  8 ++--
 drivers/gpu/drm/bridge/ite-it6263.c                |  9 ++--
 drivers/gpu/drm/bridge/ite-it6505.c                |  9 ++--
 drivers/gpu/drm/bridge/ite-it66121.c               |  9 ++--
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  9 ++--
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  8 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  9 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  7 ++-
 drivers/gpu/drm/bridge/lvds-codec.c                |  9 ++--
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 11 ++---
 drivers/gpu/drm/bridge/microchip-lvds.c            |  8 ++--
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  8 ++--
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  9 ++--
 drivers/gpu/drm/bridge/panel.c                     | 11 ++---
 drivers/gpu/drm/bridge/parade-ps8622.c             |  9 ++--
 drivers/gpu/drm/bridge/parade-ps8640.c             |  9 ++--
 drivers/gpu/drm/bridge/sii902x.c                   |  7 ++-
 drivers/gpu/drm/bridge/sii9234.c                   |  9 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c               |  9 ++--
 drivers/gpu/drm/bridge/simple-bridge.c             | 10 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  8 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  7 ++-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  8 ++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  8 ++--
 drivers/gpu/drm/bridge/tc358762.c                  |  9 ++--
 drivers/gpu/drm/bridge/tc358764.c                  |  9 ++--
 drivers/gpu/drm/bridge/tc358767.c                  | 56 +++++++++++++++-------
 drivers/gpu/drm/bridge/tc358768.c                  |  9 ++--
 drivers/gpu/drm/bridge/tc358775.c                  |  9 ++--
 drivers/gpu/drm/bridge/tda998x_drv.c               |  7 ++-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  8 ++--
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  9 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  7 ++-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |  8 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  9 ++--
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |  9 ++--
 drivers/gpu/drm/drm_bridge.c                       | 14 ++++++
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |  7 ++-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  7 ++-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  9 ++--
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  9 ++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  9 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  9 ++--
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         | 12 ++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c          | 12 ++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         | 12 ++---
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  9 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  9 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  9 ++--
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |  7 ++-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |  7 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                | 26 ++++------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                | 26 ++++------
 drivers/gpu/drm/omapdrm/dss/sdi.c                  | 25 ++++------
 drivers/gpu/drm/omapdrm/dss/venc.c                 | 23 ++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  9 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  8 ++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     | 10 ++--
 drivers/gpu/drm/sti/sti_dvo.c                      | 29 +++++------
 drivers/gpu/drm/stm/lvds.c                         |  7 ++-
 drivers/gpu/drm/vc4/vc4_dsi.c                      | 34 ++-----------
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   | 31 +++++-------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |  1 -
 drivers/platform/arm64/acer-aspire1-ec.c           |  7 ++-
 include/drm/drm_bridge.h                           |  4 ++
 87 files changed, 448 insertions(+), 510 deletions(-)
---
base-commit: 82d6ce3a9e828e73ef43b8072a89d94608ae1554
change-id: 20250404-drm-bridge-convert-to-alloc-api-614becf62294

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

