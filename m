Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DECA46D5B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 22:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3045910E2EE;
	Wed, 26 Feb 2025 21:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KXVsMGRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF90B10E2EB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 21:24:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3245644359;
 Wed, 26 Feb 2025 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740605091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TgXFCdjVREXcRGUE0JevXJ8e89l3cM/elkjd9RzCGfY=;
 b=KXVsMGRz0Wxm2TObr9aSrau2qKoYmUNE+2C8hol5lxYBa6QSWTA/wphd/Sl33TGMisCfoA
 beltHL40H3Vs0GViZ+kGQQaDo309XhwS2P14m8G0Iym0nFIclkv5H9XnK3h2GUGh6cfF6S
 0iG9wh+/BnutFc1vlKQ4Yrm23RFs/3h7B2uWRaHabfffwXc2Z0Qzci+3E+yLd5EGVFO5L1
 wvadvFnb5CRxQIucNQcm9nrzQ0HNy5M39I1xG6Nl1dkb+Pb9i/uVBiys3F3AaUkfdgPiHm
 NiJeHUti0TsB4PP3/ukKorxpyq1gfRcaxro6ItmP+PEI/u0EudDO6aEcVQ7TAQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v8 0/2] drm: show "all" bridges in debugfs
Date: Wed, 26 Feb 2025 22:23:51 +0100
Message-Id: <20250226-drm-debugfs-show-all-bridges-v8-0-bb511cc49d83@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeGv2cC/43NQQ6CMBCF4auYWTumFqGNK+9hWLR0gEmAmg6ih
 nB3Kydw+b3F/1YQSkwC18MKiRYWjlOGPR6g6d3UEXLIBq10qbQuMaQRA/ln1wpKH1/ohgF94tC
 RYHXRZI3y5kwGcuKRqOX3nr/X2T3LHNNnf1vMb/0zvBhUaK2uVGFccIW5+RjngadTE0eot237A
 hzNoLfKAAAA
X-Change-ID: 20250225-drm-debugfs-show-all-bridges-642e870b71e7
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekheeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeiteekkefgtdduveeuffeuffevkeehieduhfefvdfhueekuefhhfdttddvkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
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

This series adds a /sys/kernel/debug/dri/bridges file showing all bridges
between drm_bridge_add() and drm_bridge_remove(), which might not be bound
to any encoder and thus not visible anywhere in debugfs.

It also cleans up the DRM bridge debugfs code by moving code to
drm_bridge.c.

Luca

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v8:
- moved more code to drm_bridge.c, which makes adding '#if CONFIG_DEBUG_FS' unnecessary
- a small fix to a harmless bug
- Link to v7: https://lore.kernel.org/r/20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com

This series was initially part of v6 of this other series:
- Link to v6: https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/

---
Luca Ceresoli (2):
      drm/bridge: move bridges_show logic from drm_debugfs.c
      drm/debugfs: add top-level 'bridges' file showing all added bridges

 drivers/gpu/drm/drm_bridge.c  | 70 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_debugfs.c | 38 +----------------------
 drivers/gpu/drm/drm_drv.c     |  2 ++
 include/drm/drm_bridge.h      |  3 ++
 4 files changed, 76 insertions(+), 37 deletions(-)
---
base-commit: b439ab75b6382f5c34aec6e87435cf7e58e72a35
change-id: 20250225-drm-debugfs-show-all-bridges-642e870b71e7

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

