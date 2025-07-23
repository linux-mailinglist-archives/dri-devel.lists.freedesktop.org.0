Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551DB0EED6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 11:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AFA10E139;
	Wed, 23 Jul 2025 09:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jR+rdDGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525B810E133
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:54:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EC5443384;
 Wed, 23 Jul 2025 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753264472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gmVO0IQ6lgIkx0UIDC0DA82oQtxUZJ5xFddmjHi8fvQ=;
 b=jR+rdDGiooEQeuJKSDmzpG6EWJH4VOBkbF3Q3pH7GR6cn4gRpJyZZTW02kbnbKHXc70rtC
 OuSEXHDy9iaIOOYIwfzgbxYIkmqtiVIwTF3QqGjPumXNGq09bbDwDYhNKbC08FAAOSqYlN
 y3FsMia26PhFxlhPH9eWTvCC5uPKDn2VxFTgW7KZFS6EmJNQN5yf2946dS2zTJH+EFt0DO
 iUFwcV9vDw8a2UMb4bCtDAbekCKP17SGr6Km5ZLvoyg33fM6sNUxkXiw2wKT3T9avbWtsH
 ZjY4+xQ1NRWHx/vefxl9ELuJpLp78Qrh8A/FpJ6KWt1/6KwFtGhWQZjYMdO9TA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/9] drm/bridge: get/put the bridge when looping over the
 encoder chain
Date: Wed, 23 Jul 2025 11:54:07 +0200
Message-Id: <20250723-drm-bridge-alloc-getput-for_each_bridge-v1-0-be8f4ae006e9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD+xgGgC/02O22rDMBBEf8XouQpa2ZIvlNL/CCGsVutExJdUc
 kJKyL9XTUzp48wwM+cuEsfASXTFXUS+hhTmKQt4KwQdcTqwDD5roZU2qoZG+jhKF4PPCQ7DTPL
 Ay/myyH6Oe0Y67tewhwqQoXbWoMhr58h9uD2ftruXjvx1yYfLyxQOE0uaxzEsXVFZKq1tDKByG
 kzrvGtr7AlJVWw8k6JetdyI/6Bd8YeZvyQxrahJ6sr4sqx8WYPurvBbGzklXHvvz6LVSgFYsBv
 IEyBPHCcePjHE03fYZLQPsXs8fgAroQMHNAEAAA==
X-Change-ID: 20250718-drm-bridge-alloc-getput-for_each_bridge-f141ae17b65a
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejjeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptefgheetvddtteeutdeuvdefkeeifefhhedtleefkeekffeuueelteehgeduueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
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

This series adds drm_bridge_get/put() calls for DRM bridges used when
looping over bridges in an encoder chain.

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
       2. … drm_bridge_get_prev_bridge()
       3. … drm_bridge_get_next_bridge()
       4. ➜ drm_for_each_bridge_in_chain()
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

Most loops are based on drm_for_each_bridge_in_chain(), so add a scoped
variant that does not use an externally-declared iterator variable and
ensures that a reference to the bridge pointed to by the iterator is
taken/released before/after every iteration (and when breaking out of the
loop).

All conversions are trivial except for drm_bridge_connector_init() which
needs some preliminary cleanups (patches 1-2).

omapdrm/omap_encoder.c is the only driver iterating over the encoder bridge
chain starting from a specific bridge, instead of iterating over the whole
list. For this use case, add a drm_for_each_bridge_in_chain_from() variant.

This series depends on two fixes to bridge-connector:

 * commit 103578241512 ("drm/bridge-connector: Fix bridge in
   drm_connector_hdmi_audio_init()"), currently in drm/drm-fixes, not yet
   on drm-misc*

 * "drm/display: bridge-connector: correct CEC bridge pointers in
   drm_bridge_connector_init"
   (https://lore.kernel.org/lkml/20250719-fix-cec-bridges-v1-1-a60b1333c87d@oss.qualcomm.com/),
   not yet applied

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (9):
      drm/display: bridge-connector: use scope-specific variable for the bridge pointer
      drm/display: bridge-connector: remove unused variable assignment
      drm/bridge: add drm_for_each_bridge_in_chain_scoped()
      drm/display: bridge-connector: use drm_for_each_bridge_in_chain_scoped()
      drm/atomic: use drm_for_each_bridge_in_chain_scoped()
      drm/bridge: use drm_for_each_bridge_in_chain_scoped()
      drm/bridge: remove drm_for_each_bridge_in_chain()
      drm/bridge: add drm_for_each_bridge_in_chain_from()
      drm/omap: use drm_for_each_bridge_in_chain_from()

 .clang-format                                  |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 +++----
 drivers/gpu/drm/drm_atomic.c                   |  3 +-
 drivers/gpu/drm/drm_bridge.c                   |  3 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c         |  4 +-
 include/drm/drm_bridge.h                       | 52 ++++++++++++++++++++++++--
 6 files changed, 58 insertions(+), 19 deletions(-)
---
base-commit: 46c366851a0b2159bdb97afcac04e5dec0cf09e8
change-id: 20250718-drm-bridge-alloc-getput-for_each_bridge-f141ae17b65a
prerequisite-change-id: 20250718-fix-cec-bridges-245d334d3712:v1
prerequisite-patch-id: df6d3d4a62c942703fab374bee85c49e4ac259cc
prerequisite-message-id: <20250620011616.118-1-kernel@airkyi.com>
prerequisite-patch-id: ba5a6a15ea02bcee387db0e92ffb4cd0e1fbf816

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

