Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA6DAE20D9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8A210E053;
	Fri, 20 Jun 2025 17:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Uo7BiYDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9FE10E053
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 17:26:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D65D31FCF0;
 Fri, 20 Jun 2025 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750440383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c8eSjCawGVWdlXECtniiqel92f7tcRDt7xWem+aFmR8=;
 b=Uo7BiYDkOB639SbZDZrTQB8x/FlPXqbAfpy3NW6HlxT/14QPByIGKgYRMjXqQ0DLvJNrmp
 lh6FbLj9Zg4P+gzGYQ1AciThA3u526I5xf5UKe9smPIA6RxH8Kbz8a1SfDNv5ixmnqvtvz
 eqDX05zv7qpbLDX29k72i02jtTsA0/rGlMEoms8rafOwhs3flrRhbbvMt/p8bdq9yUB8Hv
 9hO5tweQ9fsMMoF9XS/CVLtBu8G66SaXP32enH7JFdTEkccIZIWxub7WGj/UIiPrxExtnO
 N8rOdHDwCIbNsXcujyWJ9NgLkxLZgZS24vQae5efwA5WozmBNRgfkQpXQIW50g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v8 0/5] drm/bridge: get/put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Date: Fri, 20 Jun 2025 19:26:12 +0200
Message-Id: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALWZVWgC/y2N2wqDMBBEf0X2uQshtVL7K6UEza66YKNs0lIQ/
 73by+M5w8xskFmFM1yqDZSfkmVJBudDBXHq0sgoZAze+ZNrvEPSO/YqZEk3z0vEkcv6KB8ffj5
 YUVIwHwbRXP4aez62sa49RWrA9lflQV7f7+tt399qKoyPiwAAAA==
X-Change-ID: 20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-be39c442dcd6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidru
 ggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsthgvfhgrnhesrghgnhgvrhdrtghhpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomh
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
drm_bridge_chain_get_first_bridge().

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan as discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (in v6.16-rc1)
    B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
    C. ✔ kunit tests (now in drm-misc-next)
    D. … add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (under review)
    E. ➜ add get/put on drm_bridge accessors
       1. ➜ drm_bridge_chain_get_first_bridge() + add a cleanup action (this series)
       2. drm_bridge_chain_get_last_bridge()
       3. drm_bridge_get_prev_bridge()
       4. drm_bridge_get_next_bridge()
       5. drm_for_each_bridge_in_chain()
       6. drm_bridge_connector_init
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. debugfs improvements
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

All the patches in this series have already been sent as part of the larger
"[PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with bridge
refcount" series [2], hence the v8 number. They have all been Reviewed-by
Maxime too, however they could bnot be applied at that time, awaiting the
conversion of all bridge drivers to devm_drm_bridge_alloc(), now done (item
1.A).

I'm resending all patches to give them visibility now that they are ready
to be applied. I have removed the R-by tag from patch 4 which had to be
reworked on current code. All other patches are diff-identical.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
[2] https://lore.kernel.org/all/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v8:
- rebased on current drm-misc-next
- Patch 4: reworked based on current code
- Link to v7: https://lore.kernel.org/all/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com/

---
Luca Ceresoli (5):
      drm/bridge: add a cleanup action for scope-based drm_bridge_put() invocation
      drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/mxsfb: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/atomic-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/probe-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()

 drivers/gpu/drm/drm_atomic_helper.c |  7 +++++++
 drivers/gpu/drm/drm_probe_helper.c  |  1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c   |  3 ++-
 include/drm/drm_bridge.h            | 11 +++++++++--
 4 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: a59a271769149f0b8258507276f3d2a24370cbdb
change-id: 20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-be39c442dcd6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

