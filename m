Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E7B1E917
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEF710E930;
	Fri,  8 Aug 2025 13:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NN1jo9Bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B3A10E930
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:24:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 151D343A0E;
 Fri,  8 Aug 2025 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754659476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jpltjrzBkIbtVl37N24OosMyazu7AKz2Ez4giXXbdgE=;
 b=NN1jo9Bm64tqwTp255eXkPKj73eEKM8faZwFltnNaICRFSaQTXKLauolxGW99vz+lXtIlc
 Vlh6Y0b5xfUKKoDHiAdzV2DVlv0/5t8PH1NcEJVRZ0NjIC6TVVKFCArILUQxXcnOGreeqK
 Iy/ZnPC8PAnqE68Giolj4apX3gCTVyzo0iiM72VmzbBzA4k8KCH+qTBuRSgSSZdY/jIZ7Z
 Lzws7unJAQYPSp4j8P9MjVcPLHFiQH2+mGYSj845dTzRb57Y4K9J2Pcvi33zEi5Q3M+kt9
 8kxGKdOM/Wammqzh2+ul+hYUDMXi/1T9lM7EeLyDUGoiBGvgZp9HFkvt8ak5dQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/bridge: handle gracefully atomic updates during
 bridge removal
Date: Fri, 08 Aug 2025 15:24:27 +0200
Message-Id: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIv6lWgC/x2MQQqAMAzAviI9W5iCOPyKeHBb1R7mpJMhyP5u8
 RgS8kImYcowNS8IFc6cToWubcAf67kTclCG3vSDscZikIhOOKhZ7xTZY8koFFMh7MLonJbe0gZ
 6uIQ2fv77vNT6AS1ZyhNtAAAA
X-Change-ID: 20250808-drm-bridge-atomic-vs-remove-1d7bb202c8ef
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelueduleduteehieeigeegffdtheeigefffffggfeuheejgfehtdfgleegieehveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeejkedrvdduvddrvdejrdduudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeekrddvuddvrddvjedrudduhedphhgvlhhopegludejvddrudeirddtrddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrs
 hgvpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
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

This is a first attempt at gracefully handling the case of atomic updates
happening concurrently to physical removal of DRM bridges.

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
       1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
       2. ✔ drm_bridge_get_prev_bridge()
       3. … drm_bridge_get_next_bridge()
       4. … drm_for_each_bridge_in_chain()
       5. drm_bridge_connector_init
       6. of_drm_find_bridge
       7. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. debugfs improvements
 2. ➜ handle gracefully atomic updates during bridge removal
 3. … DSI host-device driver interaction
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

The idea was proposed by Maxime [0] and is based on the existing
drm_dev_enter/exit() already existing for the DRM device.

This small series implements the core mechanism in drm_bridge.c and uses it
in the ti-sn65dsi83 driver. This prevents usage of device resources by
various code paths that can happen concurrently to unplug of the SN65DSI8x
bridge.

[0] https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
      drm/bridge: ti-sn65dsi83: protect device resources on unplug

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 53 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c          | 58 +++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h              | 12 ++++++++
 3 files changed, 123 insertions(+)
---
base-commit: d2b48f2b30f25997a1ae1ad0cefac68c25f8c330
change-id: 20250808-drm-bridge-atomic-vs-remove-1d7bb202c8ef

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

