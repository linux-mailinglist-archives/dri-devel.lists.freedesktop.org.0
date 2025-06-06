Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA33ACFE73
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5D610E9AF;
	Fri,  6 Jun 2025 08:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hdEYYGSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C80C10E9AF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:41:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D73BB4333B;
 Fri,  6 Jun 2025 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749199292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m2mlV4bRCtcPWgugMXFHSpwRIhfJ+cADh4dLHAwqvhU=;
 b=hdEYYGSrFpweuGF0oVy4QduQKjrypOdu8aGOWIxU3ogRzdZhc9/Y6uAOZLBhhy8M6mOlxQ
 Fpy3PRd9kcB5eM+xA5kgZKw5kMhevE1hPM9bTMiCIZ0zoIkBbW/vY0NGR8t4exf3uAKTv5
 MLD3caWY3Cd6YsCM6c+jz//rMh1aMHzBBTT3hY/Vj7kTx0WJHGH8M+DJjmH89Qe2A+5ayK
 tkWHIZvv0xzF5fMGs3VV3lhs+IrDaGuETuUTcnN3h4r81P2OqCx3Z4GWkeksMNaKIhr9Dd
 YAyhWVzTm4opCXB3Bw6DJitMAILP6+HbnPXPSo/dgpjhsclkPdPH/yowPS1xvQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v9 0/3] drm/bridge: add kunit tests for devm_drm_bridge_alloc()
Date: Fri, 06 Jun 2025 10:41:18 +0200
Message-Id: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK+pQmgC/33NTQrCMBAF4KtI1kZi2zSpK+8hLvIzsQNtI0kIS
 undTQsibrqYxZvHfDOTCAEhksthJgEyRvRTCd3xQEyvpgdQtCWTilWcNUxSG0aqA9rSqGHwhto
 yCWKiVSusYxaclIyU+2cAh6/Nvt1L7jEmH97bqyzW7VftdtQsKKOqNqrRneCdcFftfRpwOhk/k
 tXN8mfxc7tnyWIJqHnrLJda8X9rWZYPMCXNaBABAAA=
X-Change-ID: 20250408-drm-bridge-alloc-doc-test-267df0def880
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeefjedrudeivddruddvfedrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfeejrdduiedvrdduvdefrdehvddphhgvlhhopegludelvddrudeikedrvdehvddrvdefhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
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

This small series adds a few kunit tests for the new DRM bridge allocation
flow, based on the recently introduced devm_drm_bridge_alloc() [0].

It is part of the work towards removal of bridges from a still existing DRM
pipeline without use-after-free.

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

 A. ✔ add new alloc API and refcounting -> (now in drm-misc-next)
 B. … convert all bridge drivers to new API (in progress)
 C. ➜ kunit tests (this series)
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
 E. after (B), convert accessors; this is a large work and can be done
    in chunks
 F. debugfs improvements

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v9:
- Patch 1: rename structs according to conventions
- Patch 2: swap .destroy and .detach declarations
- Patch 3: rework to not introduce a new funcs struct, rename according to
           conventions, use more appropriate kunit test macros, etc
- Link to v8: https://lore.kernel.org/r/20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com

Changes in v8:
- Remove documentation patch
- Add patch to convert existing kunit tests to use devm_drm_bridge_alloc()
- Add tests for bridge deallocation (based on adding a .destroy callback)
- Link to v7: https://lore.kernel.org/r/20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com

---
Luca Ceresoli (3):
      drm/tests: bridge: convert to devm_drm_bridge_alloc() API
      drm/bridge: add a .destroy func
      drm/tests: bridge: add KUnit tests for devm_drm_bridge_alloc()

 drivers/gpu/drm/drm_bridge.c            |   2 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 176 +++++++++++++++++++++++++-------
 include/drm/drm_bridge.h                |  10 ++
 3 files changed, 152 insertions(+), 36 deletions(-)
---
base-commit: 3671f37777589194c44bb9351568c13eee43da3c
change-id: 20250408-drm-bridge-alloc-doc-test-267df0def880

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

