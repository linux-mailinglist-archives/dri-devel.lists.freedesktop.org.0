Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25836A2EDAB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715E10E530;
	Mon, 10 Feb 2025 13:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dmik5K9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC92710E530
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:26:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8DC88204DB;
 Mon, 10 Feb 2025 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739193985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NRhOS8sOlpVsUYb5XVfm/t0X9liLh/hHnaqEK22vnb4=;
 b=dmik5K9W7cSqp13sEv8rfY2LLmZwenKo+xjmCW3HdNL6ft0M4erCgl+EcamI7VuuUPEVva
 R3TDL3cJRmqOtQ5ldViLX0hhSnaeFp3tC8JKZkXpIVmgbnx1L3YQF836EHo/YObPjcmE4G
 j/mix2j8dErKpGkIS10ZD+srj2ayLpuf5NloCmjkFZMWEuVOoUEPLvYMDalJvI+G4KAEQN
 R8LvhfKLnoNJyB3rrPx6hjc+HJ19ewhcV85Udunfg26qcIqys7oLyPzC9Ilj6JkKSDfDse
 keku70rc9aQLjdVCcs9j3TetRsVkbm0AzKFjCnoZWgbbQX48Gn03JS7sQEyLeQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v6 0/4] Add support for errors recovery in the TI SN65DSI83
 bridge driver
Date: Mon, 10 Feb 2025 14:26:15 +0100
Message-ID: <20250210132620.42263-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleetudffledtvddtffegudfgjeffgeegkeehjeeigffgieevhfekffehheehieeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
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

Hi,

Usually the TI SN65DSI83 recovers from error by itself but during ESD
tests, we have some cases where the TI SN65DSI83 didn't recover.

In order to handle those cases, this series adds support for a recovery
mechanism.

Compare to the previous iteration, this v6 series fixes a NULL
pointer dereference.

Best regards,
Hervé Codina

Changes v5 -> v6
  v5: https://lore.kernel.org/lkml/20250203161607.223731-1-herve.codina@bootlin.com/

  - Patch 1:
    No change

  - Patch 2
    Add 'Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>'
    Add 'Reviewed-by: Maxime Ripard <mripard@kernel.org>'

  - Patch 3
    Add 'Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>'
    Add 'Reviewed-by: Maxime Ripard <mripard@kernel.org>'

  - Patch 4
    Add 'Reviewed-by: Maxime Ripard <mripard@kernel.org>'
    Fix a NULL pointer dereference reported by Alexander Stein in v5.
    Mode the dev_warn() signaling the pipe reset closer to the pipe
    reset operation itfelf.

Changes v4 -> v5
  v4: https://lore.kernel.org/lkml/20250203145824.155869-1-herve.codina@bootlin.com/

  Exact same changes as the v4. The v4 series doesn't apply on top of
  v6.14-rc1 and should be simply ignore.
  This v5 series is the v4 fixed to apply on top of v6.14-rc1.

Changes v3 -> v4
  v3: https://lore.kernel.org/lkml/20250108101907.410456-1-herve.codina@bootlin.com/

  - Patch 1:
    No changes

  - Patch 2 and 3 (patch 2 in v3):
    Rename the helper to drm_atomic_helper_reset_crtc()
    Split the patch available in v3 in two patches.

  - Patch 4 (patch 3 in v3):
    Take into account commit d2b8c6d549570 ("drm/bridge: ti-sn65dsi83:
    Add ti,lvds-vod-swing optional properties"), available in v6.14-rc1.
    Disable irq when a fault is detected and re-enable it after the pipe
    reset.
    Remove state duplication and use bridge.encoder->crtc directly

Changes v2 -> v3
  v2: https://lore.kernel.org/lkml/20241217143216.658461-1-herve.codina@bootlin.com/

  - Patch 1:
    No changes

  - Patch 2 (new in v3)
    Move reset_pipe() from VC4 HDMI driver to a new atomic helper

  - Patch 3
    Use the new drm_atomic_helper_reset_pipe()

  Patch removed in v3
    - Patch 2 in v2
      No more needed

Changes v1 -> v2
  v1: https://lore.kernel.org/lkml/20241024095539.1637280-1-herve.codina@bootlin.com/

  - Patch 1:
    Add 'Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>'
    Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'

  - Patch 2 (new patch in v2)
    Introduce drm_atomic_helper_disable_connector()

  - Patch 3 (patch 2 in v1)
    Reset the output path instead of the full pipeline.
    Update and add more information related to the bridge in commit log.

Herve Codina (4):
  dt-bindings: display: bridge: sn65dsi83: Add interrupt
  drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
  drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
  drm: bridge: ti-sn65dsi83: Add error recovery mechanism

 .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 142 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  41 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  30 +---
 include/drm/drm_atomic_helper.h               |   2 +
 5 files changed, 189 insertions(+), 29 deletions(-)

-- 
2.48.1

