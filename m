Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D85AE8A4B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D42810E775;
	Wed, 25 Jun 2025 16:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jVtQ+rTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FC110E054
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:45:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C80D744384;
 Wed, 25 Jun 2025 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UAePG0vUXhaRNj9mevWdeevJm5P79lMTjP9E/BZsM4I=;
 b=jVtQ+rTJWj2SIXS/jzojK+YZSMt0Yt5pIWdj9uVZ6QUs1IBSI1JZc+PpD/hdKmuVpMz9HK
 ZAYIa/gE0/iSapQaTdA6tTWM104NqqrMD7rVQq90kIXHF3HzVaiCthfIY5VETMM7krs5ax
 8/p8WUwjoj+4WPaTgsuzF4Fv9zVTghreQlAHCAhW3vEDmgwJkALQ5sViZQTYYHkZsbBznG
 eggj0SsP+vtk9ktSfiG3RdNw3Wzf1Nlz161v+kSfZ4Ltw3iIaqEGwCfu/7z12hlQjMwCvX
 9lEDTY/dayfZC7tPS0fhVkWzYQJ/yPK3wflgiglNdE3APAJjsZUPo3iQZYD1Sg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 00/32] drm/mipi-dsi: avoid DSI host drivers to have
 pointers to DSI devices
Date: Wed, 25 Jun 2025 18:45:04 +0200
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJAnXGgC/x3MQQqEMAxA0atI1hOoxYp6FZmFmFSzsJVERBDvb
 nH5Fv/fYKzCBkN1g/IpJjkV1L8K5nVKC6NQMXjng2t9QNINyQTXbAemjFSimXE/FH0IsYvkXN9
 0UAa7cpTrm4//53kBvpQt+2wAAAA=
X-Change-ID: 20250625-drm-dsi-host-no-device-ptr-255f8fd00948
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeejhffgffelveehhfefudehtdeftdettdekgfekueeihedtieefudevjeffveegnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
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

This series is the first attempt at avoiding DSI host drivers to have
pointers to DSI devices (struct mipi_dsi_device), as discussed during the
Linux Plumbers Conference 2024 with Maxime and Dmitry.

It is working, but I consider this a draft in order to discuss and
challenge the proposed approach.

Overall work
============

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan as discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. … add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (in v6.16-rc1)
    B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
    C. ✔ kunit tests (now in drm-misc-next)
    D. … add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (under review)
    E. … add get/put on drm_bridge accessors
       1. … drm_bridge_chain_get_first_bridge() + add a cleanup action
       2. … drm_bridge_chain_get_last_bridge()
       3. drm_bridge_get_prev_bridge()
       4. drm_bridge_get_next_bridge()
       5. drm_for_each_bridge_in_chain()
       6. drm_bridge_connector_init
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. debugfs improvements
 2. handle gracefully atomic updates during bridge removal
 3. ➜ avoid DSI host drivers to have dangling pointers to DSI devices
      (this series)
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Motivation
==========

The motivation for this series is that with hot-pluggable hardware a DSI
device can be disconnected from the DSI host at runtime, and later on
reconnected, potentially with a different model having different bus
parameters.

DSI host drivers currently receive a struct mipi_dsi_device pointer in the
attach callback and some store it permanently for later access to the bur
format data (lanes, channel, pixel format etc). The stored pointer can
become dangling if the device is removed, leading to a use-after-free.

Currently the data exchange between DSI host and device happens primarily
by two means:

 * the device requests attach, detach and message transfer to the host by
   calling mipi_dsi_attach/detach/transfer which in turn call the callbacks
   in struct mipi_dsi_host_ops
    - for this to work, struct mipi_dsi_device has a pointer to the host:
      this is OK because the goal is supporting hotplug of the "remote"
      part of the DRM pipeline
 * the host accesses directly the fields of struct mipi_dsi_device, to
   which it receives a pointer in the .attach and .detach callbacks

The second bullet is the problematic one, which we want to remove.

Strategy
========

I devised two possible strategies to address it:

 1. change the host ops to not pass a struct mipi_dsi_device, but instead
    to pass only a copy of the needed information (bus format mainly), so
    the host driver does never access any info from the device
    
 2. let the host get info from the device as needed, but without having a
    pointer to it; this is be based on:
     - storing a __private mipi_dsi_device pointer in struct mipi_dsi_host
     - adding getters to the DSI core for the host to query the needed
       info, e.g. drm_mipi_dsi_host_get_device_lanes(host) (the getters
       would be allowed to dereference the device pointer)

This series implements strategy 1. It does so by adding a .attach_new host
op, which does not take a mipi_dsi_device pointer, and converting most host
drivers to it. Once all drivers are converted, the old op can be removed,
and .attach_new renamed to .attach.

Limitations of this series
==========================

I could not convert a few drivers is an obvious way, due to the use they
make of the device pointer. Those are not converted in this series (thus
the "draft" status mentioned above). They are described in a dedicated
section below.

Also, this series only address the .attach op. if the approach is generally
agreed I will proceed to .detach as well, which I estimate to be much
easier.

It is important to note that while the DSI bus specification allows
connecting multiple devices to the same bus using different channels, none
of the drivers in the current Linux kernel appears to support it, and this
series does not try to fill that gap.

Series layout
=============

The core of this work is in part 4 (adding .attach_new) and the driver
conversion in part 5.

The first two parts are generic cleanups that I deem generally a good
improvement and can be applied independently. They are in the same series
only to avoid patch conflicts. Part 3 is also quite orthogonal to the main
topic of the series. 

The above results in lots of patches and lots of files, so I had to trim
the recipients list in order to send a series that is comprehensive enough
to show the main idea. I'm OK with splitting it in smaller series if the
principle is OK. It would be nice if these 3 parts could be applied quickly
though, to shave the number of simple patches to maintain over iterations.

 * Generic cleanup: add lane number check in the core

     drm/mipi-dsi: add sanity check of lane number in mipi_dsi_attach()
     drm/hisilicon/kirin: remove redundant lanes number check
     drm/bridge: nwl-dsi: remove redundant lanes number check
     drm/mcde: remove redundant lanes number check

 * Generic cleanup: move attach/detach logging to the core

     drm/mipi-dsi: log DSI device attach and detach
     drm/bridge: samsung-dsim: remove redundant logging
     drm/bridge: nwl-dsi: remove redundant logging
     drm/bridge: cdns-dsi: remove redundant logging
     drm/mcde: remove redundant logging
     drm/sun4i: dsi: remove redundant logging

 * Remove some one-fo-a-kind mipi_dsi_device dereferences
 
     drm/bridge: synopsys/dsi2: remove DSI device pointer from private callbacks
     [RFC!] drm/meson: dsi: remove unneeded DSI device check

 * Introduce .attach_new host op
 
     drm/mipi-dsi: move format define above
     drm/mipi-dsi: add .attach_new to mipi_dsi_host_ops

 * Convert most drivers to attach_new (in increasing order of complexity)

     drm: adp: mipi: convert to the .attach_new op
     drm/kmb: dsi: convert to the .attach_new op
     drm/i915/dsi: convert to the .attach_new op
     drm/hisilicon/kirin: convert to the .attach_new op
     drm/bridge: synopsys/dsi2: convert to the .attach_new op
     drm/msm/dsi: convert to the .attach_new op
     drm/rcar-du: dsi: convert to the .attach_new op
     drm: renesas: rz-du: rzg2l_mipi_dsi: convert to the .attach_new op
     drm/vc4: dsi: convert to the .attach_new op
     drm/mediatek: dsi: convert to the .attach_new op
     drm/bridge: nwl-dsi: convert to the .attach_new op
     drm/bridge: cdns-dsi: convert to the .attach_new op
     drm/bridge: tc358768: convert to the .attach_new op
     drm/sprd: convert to the .attach_new op
     drm/bridge: synopsys: dw-mipi-dsi: convert to the .attach_new op
     drm/mcde: store a pointer to mipi_dsi_host to perform TE requests
     drm/mcde: use the DSI host pointer in mcde_dsi_irq
     drm/mcde: convert to the .attach_new op

Problematic cases, not yet converted
====================================

Drivers requesting an IRQ in command mode
-----------------------------------------

Two host drivers register an IRQ when in DSI command mode, both using
mipi_dsi_device.dev to get the TE GPIO.

 * samsung-dsim.c (samsung_dsim_host_attach), which has an interesting
   comment saying this should be changed:
   
 	/*
 	 * This is a temporary solution and should be made by more generic way.
 	 *
 	 * If attached panel device is for command mode one, dsi should register
 	 * TE interrupt handler.
 	 */
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
		ret = samsung_dsim_register_te_irq(dsi, &device->dev);

 * omapdrm/dss/dsi.c (omap_dsi_host_attach), doing similarly but without
   comments:
 
 	if (client->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
 	} else {
		r = omap_dsi_register_te_irq(dsi, client);

Maybe this could be handled by the core?

Drivers looking for a panel
---------------------------

Two host drivers use mipi_dsi_device->dev.of_node to look up a panel via
of_drm_find_panel() in .attach:

 * sun6i_mipi_dsi.c (sun6i_dsi_attach):
 
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);

 * tegra/dsi.c, which additionally does some checks in .detach:
 
    - tegra_dsi_host_attach:

 	if (!dsi->master) {
 		struct tegra_output *output = &dsi->output;
 
		output->panel = of_drm_find_panel(device->dev.of_node);
 		if (IS_ERR(output->panel))
 			output->panel = NULL;
		...	
 	}
	
    - tegra_dsi_host_detach -- not sure this check is really needed,
      similarly to patch "[RFC!] drm/meson: dsi: remove unneeded DSI device
      check" in this series:

 	struct tegra_dsi *dsi = host_to_tegra(host);
 	struct tegra_output *output = &dsi->output;
 
	if (output->panel && &device->dev == output->panel->dev) {
 		output->panel = NULL;
 
 		if (output->connector.dev)
 			drm_helper_hpd_irq_event(output->connector.dev);
 	}

Anusha, Maxime, do you think the ongoing work on panel lifetime and the
panel_bridge can interact with this? DO you see any short-term soliution
while that progresses?

Best regards,
Luca

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (32):
      drm/mipi-dsi: add sanity check of lane number in mipi_dsi_attach()
      drm/hisilicon/kirin: remove redundant lanes number check
      drm/bridge: nwl-dsi: remove redundant lanes number check
      drm/mcde: remove redundant lanes number check
      drm/mipi-dsi: log DSI device attach and detach
      drm/bridge: samsung-dsim: remove redundant logging
      drm/bridge: nwl-dsi: remove redundant logging
      drm/bridge: cdns-dsi: remove redundant logging
      drm/mcde: remove redundant logging
      drm/sun4i: dsi: remove redundant logging
      drm/bridge: synopsys/dsi2: remove DSI device pointer from private callbacks
      [RFC] drm/meson: dsi: remove unneeded DSI device check
      drm/mipi-dsi: move format define above
      drm/mipi-dsi: add .attach_new to mipi_dsi_host_ops
      drm: adp: mipi: convert to the .attach_new op
      drm/kmb: dsi: convert to the .attach_new op
      drm/i915/dsi: convert to the .attach_new op
      drm/hisilicon/kirin: convert to the .attach_new op
      drm/bridge: synopsys/dsi2: convert to the .attach_new op
      drm/msm/dsi: convert to the .attach_new op
      drm/rcar-du: dsi: convert to the .attach_new op
      drm: renesas: rz-du: rzg2l_mipi_dsi: convert to the .attach_new op
      drm/vc4: dsi: convert to the .attach_new op
      drm/mediatek: dsi: convert to the .attach_new op
      drm/bridge: nwl-dsi: convert to the .attach_new op
      drm/bridge: cdns-dsi: convert to the .attach_new op
      drm/bridge: tc358768: convert to the .attach_new op
      drm/sprd: convert to the .attach_new op
      drm/bridge: synopsys: dw-mipi-dsi: convert to the .attach_new op
      drm/mcde: store a pointer to mipi_dsi_host to perform TE requests
      drm/mcde: use the DSI host pointer in mcde_dsi_irq
      drm/mcde: convert to the .attach_new op

 drivers/gpu/drm/adp/adp-mipi.c                   |   4 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c   |  66 +++++++-------
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h   |   2 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c      |   4 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                 |  16 ++--
 drivers/gpu/drm/bridge/samsung-dsim.c            |   5 --
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c    |  18 ++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   |  20 ++---
 drivers/gpu/drm/bridge/tc358768.c                |  40 ++++-----
 drivers/gpu/drm/drm_mipi_dsi.c                   |  38 +++++++-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c     |  12 +--
 drivers/gpu/drm/i915/display/icl_dsi.c           |   4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c           |   4 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                    |   4 +-
 drivers/gpu/drm/mcde/mcde_display.c              |  18 ++--
 drivers/gpu/drm/mcde/mcde_drm.h                  |   8 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                  |  97 ++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_dsi.c               |  10 +--
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c        |  21 ++---
 drivers/gpu/drm/msm/dsi/dsi_host.c               |  18 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c  |  10 +--
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c   |  18 ++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c  |   2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c |   6 +-
 drivers/gpu/drm/sprd/megacores_pll.c             |   2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                  |   2 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                  |  28 +++---
 drivers/gpu/drm/sprd/sprd_dsi.h                  |   2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c           |   2 -
 drivers/gpu/drm/vc4/vc4_dsi.c                    |  12 +--
 include/drm/bridge/dw_mipi_dsi.h                 |   3 +-
 include/drm/bridge/dw_mipi_dsi2.h                |   6 +-
 include/drm/drm_mipi_dsi.h                       | 105 ++++++++++++++---------
 33 files changed, 320 insertions(+), 287 deletions(-)
---
base-commit: 1174bf15bd601f17556f721798cd9183e169549a
change-id: 20250625-drm-dsi-host-no-device-ptr-255f8fd00948

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

