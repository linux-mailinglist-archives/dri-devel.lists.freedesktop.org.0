Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E6A2B00B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A49E10E8FC;
	Thu,  6 Feb 2025 18:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZPyHjq0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B324010E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:14:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AD0A43297;
 Thu,  6 Feb 2025 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1H6zMSHgovZ8rpqxVZkBI0Z3cJ30uvILWLcJm8N02JM=;
 b=ZPyHjq0BGCRWUOtBshRR21ZOe22wJBcxc6Ej72SMJpslJ+N+kx7dQ/OLu5Q7eCXhNJLqS+
 HFadNUx6LkwnrOSiEgODArRmq4sQso+jUCqHFyeAMIlyfpdsSsHuAZgZv6ylGSBgD7lW+4
 fj+00WOK2gdoMgQPG/S0UcMN6KN9C31qCFJ1NhiZEUBPLfakzEGjU2qM7mTkFnnbNFSWwg
 wuNDfG2gIFQAW1nDSVjXJmklNsm2IlXNpDxkiW0lEI744uqd2eYfWBj6I/4NsEAblWz/es
 QiDKUcyAyy/SmtnACOGGNjffG0HnBWqX0XNxdL8MMa2PvxaFEISvq5g80t/mdw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v6 00/26] Add support for hot-pluggable DRM bridges
Date: Thu, 06 Feb 2025 19:14:15 +0100
Message-Id: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPj7pGcC/23PzW7DIAwH8FepOI8J82GSnvYe0w4FnAapDRXJ0
 KYq7z5STYumcvxb9s/2nc2UI83seLizTCXOMU014MuB+fE0nYnHUDOTQmqhoOdjWm6XzzMP+cp
 djqF2ALoOCe1AvWR18JZpiF8P9P2j5jHOS8rfjx0FtuovJ7HFFeCCa2fAGXLWBPPmUloucXr16
 co2sMgdMSCaiKwIeSUH6RGDwWdE7Ugnmo8VVRGnPdhOdcL5/hnRO9KDbSJ6Q7wOAxGCo8Yl5g8
 BqaCJmIqAVQLNCcgT/EfWdf0Bk7JiN8oBAAA=
X-Change-ID: 20240319-hotplug-drm-bridge-16b86e67fe92
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeiteekkefgtdduveeuffeuffevkeehieduhfefvdfhueekuefhhfdttddvkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvl
 hhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Hello,

this series aims at supporting Linux devices with a DRM pipeline whose
final components can be hot-plugged and hot-unplugged, including one or
more bridges.

Use case and overall description
================================

If you don't know the topic, see cover letter for v5:
https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com/

Roadmap and current status
==========================

Up to v4 the design idea was heavily based on a "hotplug bridge driver" to
decouple the two sides of the DRM pipeline. After a long discussion during
Linux Plumbers Conference 2024, a different strategy was agreed with other
DRM developers, which adds:

 1. add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices 
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

This version implements the first item but in a way more complete form than
in v5. Items 2-4 have not yet been developed. This version is sent to allow
discussing the bridge refcounting in its latest and greatest shape.

The largest change singe v5 is now we always create a panel_bridge when a
drm_panel is added. This wight be not strictly needed, but makes
panel_bridge creation and lifetime way more straightforward, thusmakeing
the bridge refcounting work a tad more linear.

Patch series overview
=====================

 * 2 Preliminary patches (maybe to be removed as this work progresses):
   - drm/bridge: allow bridges to be informed about added and removed bridges
   - drm/encoder: add drm_encoder_cleanup_from()

 * Implement refcounting in the drm_bridge core:
   - drm/bridge: add support for refcounted DRM bridges
   - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
   - drm/bridge: add documentation of refcounted bridges

 * Adapt some existing bridges to be refcounted and/or to refcount bridges
   they take a pointer to:
   - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
   - drm/bridge: panel: use dynamic lifetime management
   - drm/bridge: samsung-dsim: use supporting variable for out_bridge
   - drm/bridge: samsung-dsim: refcount the out_bridge

 * Add hotplug-bridge (may be removed as this work progresses): 
   - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

 * Prelimiary, simple cleanups:
   - drm/debugfs: fix printk format for bridge index
   - drm: of: drm_of_find_panel_or_bridge: move misplaced comment
   - drm/bridge: panel: use drm_bridge_is_panel() instead of open code
   - drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge

 * debugfs improvements to show bridges, part 1:
   - drm/debugfs: add top-level 'bridges' file showing all added bridges

 * Restructure panel code to always add a panel_bridge:
   - drm/panel: move all code into bridge/panel.c
   - drm/bridge: panel: forbid initializing a panel with unknown connector type
   - drm/bridge: panel: add a panel_bridge to every panel
   - drm/bridge: move devm_drm_of_get_bridge and drmm_of_get_bridge to drm_bridge.c

 * Add new get_bridge variant for drivers supporting non-graph DT:
   - drm/bridge: add devm_drm_of_get_bridge_by_node()
   - drm/bridge: samsung-dsim: use devm_drm_of_get_bridge[_by_node] to find the out_bridge
   
 * Preliminary patches (maybe to be removed as this work progresses):
   - drm/bridge: allow bridges to be informed about added and removed bridges
   - drm/encoder: add drm_encoder_cleanup_from()

 * Implement refcounting in the drm_bridge core:
   - drm/bridge: add support for refcounted DRM bridges
   - drm/bridge: devm_drm_of_get_bridge and drmm_of_get_bridge: automatically put the bridge
   - drm/bridge: increment refcount in of_drm_find_bridge()
   - drm/bridge: add devm_drm_put_bridge() and devm_drm_put_and_clear_bridge()
   - drm/bridge: add documentation of refcounted bridges
   - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)

 * debugfs improvements to show bridges, part 2:
   - drm/debugfs: bridges_show: show refcount
   - drm/bridge: add list of removed refcounted bridges
   - drm/debugfs: show removed bridges
   
 * Adapt some existing bridges to be refcounted and/or to refcount bridges
   they take a pointer to:
   - drm/bridge: samsung-dsim: use refcounting for the out_bridge
   - drm/bridge: panel: use dynamic lifetime management
   - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
   
 * Add hotplug-bridge (may be removed as this work progresses): 
   - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges (HEAD -> ge/luca/wip)

That's all
==========

Thanks for you patience in reading this, and many thanks to Dmitry
Baryshkov for the very nice and useful discussion during FOSDEM.

Luca

Changes in v6:
- add drm_bridge_alloc() for safe initial refcount
- always create panel bridge when adding a panel
  - as a prerequisite, move all drm_panel.c code into bridge/panel.c
- add devm functions to get bridges (auto put on consumer removal)
- add devm_drm_of_get_bridge_by_node() for drivers supporting non-graph DT
- debugfs: show refcount and "[removed]" in bridges file
- debugfs: add /sys/kernel/debug/dri/bridges showing all bridges
  (including removed ones)
- add preliminary, trivial cleanup patches
- Link to v5: https://lore.kernel.org/r/20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com

Changes in v5:
- Implemented DRM bridge refcounting
- removed the non-DRM patches, now in a separate series
- Updated To/Cc list
- Link to v4: https://lore.kernel.org/r/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com

Changes in v4:
- Replaced DRM bridge notifier with a new callback in struct drm_bridge_funcs
- Added patch for missing devlink (LEDs used by backlight)
- Various cleanups
- Rebased on v6.11
- Link to v3: https://lore.kernel.org/r/20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com

Changes in v3 (too many changes in v3 to mention them all, but here are the
big ones):
- Rewrote the DT format to allow fully decoupled overlays and to avoid
  adding properties (with the NVMEM exception still to be solved)
- Implemented device instantiation based on the new DT format: i2c in
  i2c-core-of.c nobus-devices in the connector driver
- DRM: insert/remove an LVDS DRM connector on hot(un)plug events
- Added patch for a devlink issue on overlay removal (mostly to start
  discussion)
- Link to v2: https://lore.kernel.org/r/20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com

Changes in v2:
- Added bindings and driver for ge,sunh-addon-connector
- Removed bindings for the hotplug-video-connector, this is now represented
  in DT as part of the ge,sunh-addon-connector
- Various monior improvements to the DRM hotplug-bridge driver
- Link to v1: https://lore.kernel.org/r/20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (26):
      drm/debugfs: fix printk format for bridge index
      drm: of: drm_of_find_panel_or_bridge: move misplaced comment
      drm/bridge: panel: use drm_bridge_is_panel() instead of open code
      drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge
      drm/debugfs: add top-level 'bridges' file showing all added bridges
      drm/panel: move all code into bridge/panel.c
      drm/bridge: panel: forbid initializing a panel with unknown connector type
      drm/bridge: panel: add a panel_bridge to every panel
      drm/bridge: move devm_drm_of_get_bridge and drmm_of_get_bridge to drm_bridge.c
      drm/bridge: add devm_drm_of_get_bridge_by_node()
      drm/bridge: samsung-dsim: use devm_drm_of_get_bridge[_by_node] to find the out_bridge
      drm/bridge: allow bridges to be informed about added and removed bridges
      drm/encoder: add drm_encoder_cleanup_from()
      drm/bridge: add support for refcounted DRM bridges
      drm/bridge: devm_drm_of_get_bridge and drmm_of_get_bridge: automatically put the bridge
      drm/bridge: increment refcount in of_drm_find_bridge()
      drm/bridge: add devm_drm_put_bridge() and devm_drm_put_and_clear_bridge()
      drm/bridge: add documentation of refcounted bridges
      drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
      drm/debugfs: bridges_show: show refcount
      drm/bridge: add list of removed refcounted bridges
      drm/debugfs: show removed bridges
      drm/bridge: samsung-dsim: use refcounting for the out_bridge
      drm/bridge: panel: use dynamic lifetime management
      drm/bridge: ti-sn65dsi83: use dynamic lifetime management
      drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

 Documentation/gpu/drm-kms-helpers.rst   |  11 +-
 MAINTAINERS                             |   6 +-
 drivers/gpu/drm/Makefile                |   1 -
 drivers/gpu/drm/atmel-hlcdc/Kconfig     |   2 +-
 drivers/gpu/drm/bridge/Kconfig          |  42 +-
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c | 666 +++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/panel.c          | 716 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/bridge/samsung-dsim.c   |  65 +--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c   |   7 +-
 drivers/gpu/drm/drm_bridge.c            | 444 +++++++++++++++++++-
 drivers/gpu/drm/drm_debugfs.c           |  84 +++-
 drivers/gpu/drm/drm_drv.c               |   1 +
 drivers/gpu/drm/drm_encoder.c           |  21 +
 drivers/gpu/drm/drm_internal.h          |  10 +
 drivers/gpu/drm/drm_kms_helper_common.c |   1 +
 drivers/gpu/drm/drm_of.c                |  68 ---
 drivers/gpu/drm/drm_panel.c             | 575 -------------------------
 drivers/gpu/drm/tests/Makefile          |   1 +
 drivers/gpu/drm/tests/drm_bridge_test.c |  72 ++++
 include/drm/drm_bridge.h                | 154 +++++++
 include/drm/drm_encoder.h               |   1 +
 include/drm/drm_of.h                    |   1 +
 include/drm/drm_panel.h                 |   8 +
 24 files changed, 2131 insertions(+), 827 deletions(-)
---
base-commit: 08dbfc84db00b76df96829787bacc734c1c018b9
change-id: 20240319-hotplug-drm-bridge-16b86e67fe92

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

