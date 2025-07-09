Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC9AFEF0D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 18:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D1C10E29D;
	Wed,  9 Jul 2025 16:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eeneYBFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B76F10E29D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 16:48:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F388D42FF4;
 Wed,  9 Jul 2025 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752079722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hFIAcRXKF8yAPpxtHHvP/ydmkeQ/HrlpuldN38nkgEM=;
 b=eeneYBFy4J/fwLHz3XHg1YYTMSr4nFWrc4w4W+NtQvWCo6xvrhLf+B7bdztqfX9RMpJ3uU
 +9mOZQm9d4plQH8KC0LcZqmdSsGU5GZh6AcDmw6DdmI6HuWw9g0eXncQdHiktKLyjkwyfQ
 BMzpq2FdvS+WJBILu4i37Lug8HIQZ0cNuXn6jfMlksc9yXMnX9mFv8zKrdljPc/IWBKLFD
 0bl34H2Pn/eGqRrVk+kEoUnIQtisZKGlZTUi9wpmYYV0nu+WXNNWbQQdHR51iEhruwyUwY
 Dj8tJeCR8UREpMKNPQEeNS5werXQOrkv3Mloik5CW9m6Zo8xB6ya1M92em5ucg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/9] drm/bridge: get/put the bridge returned by
 drm_bridge_get_last_bridge()
Date: Wed, 09 Jul 2025 18:47:59 +0200
Message-Id: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD+dbmgC/y2N2wrCMBAFf6XsswtJxIj+ikiIzaYu1LRsohRK/
 9318jhzYM4KlYSpwrlbQejFlaeiYHcd9PdYBkJOyuCMO5ijOWGSB96Eky5xHKceB2rzs318+Pm
 gJhRa2p/RpuxjzN7ZvQcNz0KZl+/p5bptb1FRSkCEAAAA
X-Change-ID: 20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-1df6aaf62136
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Zijun Hu <quic_zijuhu@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeejhffgffelveehhfefudehtdeftdettdekgfekueeihedtieefudevjeffveegnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghloheplgduledvrdduieekrddurddufegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguv
 ggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvg
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

This series adds drm_bridge_get/put() calls for DRM bridges returned by
drm_bridge_get_last_bridge().

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (in v6.16-rc1)
    B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
    C. ✔ kunit tests (now in drm-misc-next)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (now in drm-misc-next)
    E. ➜ add get/put on drm_bridge accessors
       1. … drm_bridge_chain_get_first_bridge() + add a cleanup action
       2. … drm_bridge_get_prev_bridge()
       3. ➜ drm_bridge_get_next_bridge()
       4. drm_for_each_bridge_in_chain()
       5. drm_bridge_connector_init
       6. of_drm_find_bridge
       7. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. debugfs improvements
 2. handle gracefully atomic updates during bridge removal
 3. … avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

There are various users of drm_bridge_get_last_bridge() which cannot be
converted easily. Luckily they are not really looking for the next bridge,
but for something else, such as getting the last bridge in the encoder
chain or checking whether a bridge is the last in the encoder chain. So
introduce better functions for those users and use them instead of
drm_bridge_get_last_bridge(), making the code cleaner at the same time.

Finally add a drm_bridge_get() ti drm_bridge_get_next_bridge() and
drm_bridge_put() to the remaining, and legitimate, calls.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (9):
      list: add list_last_entry_or_null()
      drm/bridge: add drm_bridge_chain_get_last_bridge()
      drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()
      drm/omapdrm: use drm_bridge_chain_get_last_bridge()
      drm/bridge: add drm_bridge_is_last()
      drm/display: bridge_connector: use drm_bridge_is_last()
      drm/bridge: get the bridge returned by drm_bridge_get_next_bridge()
      drm/bridge: put the bridge returned by drm_bridge_get_next_bridge()
      drm/imx: parallel-display: put the bridge returned by drm_bridge_get_next_bridge()

 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c    | 12 ++++------
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 ++--
 drivers/gpu/drm/drm_bridge.c                   |  2 ++
 drivers/gpu/drm/imx/ipuv3/parallel-display.c   |  4 +++-
 drivers/gpu/drm/omapdrm/omap_drv.c             |  8 +++----
 include/drm/drm_bridge.h                       | 32 +++++++++++++++++++++++++-
 include/linux/list.h                           | 14 +++++++++++
 7 files changed, 61 insertions(+), 16 deletions(-)
---
base-commit: 0f168e7be696a17487e83d1d47e5a408a181080f
change-id: 20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-1df6aaf62136

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

