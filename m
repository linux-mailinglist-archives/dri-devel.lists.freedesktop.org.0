Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36508A71D9D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 18:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843310E74F;
	Wed, 26 Mar 2025 17:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UnkWmqIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357B610E162
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 17:47:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F416E4443E;
 Wed, 26 Mar 2025 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1743011276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZBLEondICNX76+GWcBh7Pwovu0flUSeCsLISBKtY2ck=;
 b=UnkWmqIBFhzqtIL2x2Wx/VrHCoJBrZYvibGBi3Ef6Rxb4sP/Swn9zmY7W1EIFnuIzlZunA
 ygHiELr3Lh/r85odAzEep4YQCSnfVcp1srHJw0L7W9fzy5nEFrdNbslyETWZtbK9f1CdW8
 ivpPbFFuBXCDgewdYNJXDr+9gkvnbVqYxzGPtZl0ubUVu8ZAVDIFAOWlHPlDaowhquegr3
 fPCB9J/N3MkQIgdiUTnYNqkPf+GaG08BdzVKdeqyUyjOxRQIc+5H0jPFmi7ECoHmACtmwK
 /0WaxDeP+0LKMO9UNhH+SBDb5g2T/B/sA8beKXzr7q7OhtJHQvM3ADSOi5Tofw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v9 0/5] drm/bridge: add devm_drm_bridge_alloc() with bridge
 refcount
Date: Wed, 26 Mar 2025 18:47:34 +0100
Message-Id: <20250326-drm-bridge-refcount-v9-0-5e0661fe1f84@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALY95GcC/33NTQrCMBAF4KtI1kaStGkTV95DXLT5sQM2kaQGp
 fTuTrtSEGE2bx7zzUyyS+AyOe5mklyBDDFg0PsdMUMXro6CxUwEE5JVvKY2jbRPYLFJzpv4CBO
 VympscXxD8PKODTw39XzBPECeYnptT0q7bv97paWMcilky70yja5PfYzTDcLBxJGsYlEfimC/F
 YVKX1nbddrzqlHfyrIsb9s133L+AAAA
X-Change-ID: 20250314-drm-bridge-refcount-58d9503503f6
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeiudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgieetkeekgfdtudevueffueffveekheeiudfhfedvhfeukeeuhffhtddtvdekfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehimhigsehlihhst
 hhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhm
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

This series improves the way DRM bridges are allocated and initialized and
makes them reference-counted. The goal of reference counting is to avoid
use-after-free by drivers which got a pointer to a bridge and keep it
stored and used even after the bridge has been deallocated.

The overall goal is supporting Linux devices with a DRM pipeline whose
final components can be hot-plugged and hot-unplugged, including one or
more bridges. For more details see the big picture [0].

DRM bridge drivers will have to be adapted to the new API -- the change is
trivial for most cases. This series converts two of them to serve as an
example. The remaining ones will be done as a follow-up after this first
part is merged.

After that, refcounting will have to be added on the two sides: all
functions returning a bridge pointer and all code obtaining such a
pointer. A few examples have been sent in v7 (link below), they are OK, but
I removed them since v8 because they must be merged only after converting
all bridges.

Here's the grand plan:

 A. add new alloc API and refcounting (this series, at least patches 1-3)
 B. after (A), convert all bridge drivers to new API
 C. after (A), add documentation and kunit tests
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
    (patches 3-4 in the v7 series)
 E. after (B), convert accessors (including patches 5-9 in the v7 series
    which convert drm_bridge_chain_get_first_bridge() and its users);
    this is a large work and can be done in chunks
 F. after (A), debugfs: show refcount, show removed bridges
 
Layout of this:

 1. Add the new API and refcounting:

    drm/bridge: add devm_drm_bridge_alloc()
    drm/bridge: add support for refcounting
    drm/bridge: deprecate old-style bridge allocation

 2. convert a few bridge drivers (bridge providers) to the new API:

    drm/bridge: ti-sn65dsi83: use dynamic lifetime management
    drm/bridge: samsung-dsim: use dynamic lifetime management

[0] https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v9 (only patches 2 and 3 have changes):
- Made drm_bridge_put() return void
- Added debugfs improvements to the grand plan (item F)
- Reworded comment in patch 3
- Link to v8: https://lore.kernel.org/r/20250320-drm-bridge-refcount-v8-0-b3ddaa9f1368@bootlin.com

Changes in v8:
- Applied requested changes to patch 2
- Add R-by to other patches
- Removed v7 patches 3-9: they are OK but must wait until all bridge
  drivers are converted to the new API
- Added patch to deprecate old-style bridge allocation
- Link to v7: https://lore.kernel.org/r/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com

---
Luca Ceresoli (5):
      drm/bridge: add devm_drm_bridge_alloc()
      drm/bridge: add support for refcounting
      drm/bridge: make devm_drm_bridge_alloc() mandatory for bridge allocation
      drm/bridge: ti-sn65dsi83: use dynamic lifetime management
      drm/bridge: samsung-dsim: use dynamic lifetime management

 drivers/gpu/drm/bridge/samsung-dsim.c |  7 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c |  7 ++-
 drivers/gpu/drm/drm_bridge.c          | 86 +++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h              | 36 +++++++++++++++
 4 files changed, 128 insertions(+), 8 deletions(-)
---
base-commit: 8224bc33fdec82533a68486612e6fd78197b95b5
change-id: 20250314-drm-bridge-refcount-58d9503503f6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

