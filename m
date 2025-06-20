Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F04AE1793
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 11:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D6010EB25;
	Fri, 20 Jun 2025 09:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g00pauM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F05410EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 09:32:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DE6B42E7E;
 Fri, 20 Jun 2025 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750411954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pW7seCsvA/di8xhjH2QlcBSJqaTTcUeZ8U1FgY8sRzU=;
 b=g00pauM6+DAKb0eFI2LgpE4wQR47ROhxS4OUrzCImT7pUHlXRMuA5Wd8IvNI+GR5EIOytM
 lX86Uv8ZQBE1eL6EICPJECb0PkyhulgPsONHkUy9uchpuvErSbm6VWW7BYLsBxf2k9dROv
 dkIL8o/JFUmOQnWXvApX9DSvifBF/vVvx5sMitBewPgSyGcnKQxmor5XClxM0LdsurrhfL
 7+sVG9fyFiDounxo0tkWDdChiU4vs82wJLPDy1imCLrI7/kWH9Uym4i0Hvvxu7zGy5h4wa
 rNPs3Q3Pbp+jPON6bqLYYmI3CN5+kPwuUxM2DYCBRynSmlRWj21baLLBTAlXKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] drm/bridge: get/put the bridge reference in
 drm_bridge.c, warn on old alloc pattern
Date: Fri, 20 Jun 2025 11:32:05 +0200
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJUqVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3ZSiXN2koswUoExiTk5+sm56aklBaQmyeLKuQWKSUXKiiYVhsrG
 5EtCogqLUtMwKsDXRsbW1ABNM/7l2AAAA
X-Change-ID: 20250620-drm-bridge-alloc-getput-drm-bridge-c-0ab2ca481c37
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdektdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomh
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

This small series adds drm_bridge_get/put() calls where applicable in the
bridge core code, and adds a warning when the old allocation patter is
used.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free.

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

 A. ✔ add new alloc API and refcounting (in v6.16-rc1)
 B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
 C. ✔ kunit tests (now in drm-misc-next)
 D. ➜ after (B), add get/put to drm_bridge_add/remove() + attach/detech()
      and warn on old allocation pattern (this series)
 E. after (B), convert accessors; this is a large work and can be done
    in chunks
 F. debugfs improvements

Specifically, this series does two things related to the recently
introduced devm_drm_bridge_alloc() [0]:

 A) add drm_bridge_get/put() in the two places within drm_bridge.c where a
    bridge reference is taken/relased
 B) add a warning on bridges using the old allocation pattern instead of
    devm_drm_bridge_alloc()

These are loosely related topics, but I'm sending them in a single series
to avoid trivial patch conflicts, as they touch the same lines. This will
holefully help getting the patches applied more efficiently and quickly. I
hope this is fine being 3 small patches.

Part A) is made of patches 1 and 2. Those have been previously sent in
"[PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with bridge
refcount" [2] (as patches 3 and 4), and already Reviewed-by Maxime at that
time. However they could not be applied until the conversion of all bridge
drivers to devm_drm_bridge_alloc(), which got completed a few days
ago. Hence the reason this is v8.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
[2] https://lore.kernel.org/all/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      drm/bridge: get/put the bridge reference in drm_bridge_add/remove()
      drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()
      drm/bridge: add warning for bridges not using devm_drm_bridge_alloc()

 drivers/gpu/drm/drm_bridge.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)
---
base-commit: a59a271769149f0b8258507276f3d2a24370cbdb
change-id: 20250620-drm-bridge-alloc-getput-drm-bridge-c-0ab2ca481c37

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

