Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3FAC0551
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0BB10EF6C;
	Thu, 22 May 2025 07:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EjlVSen/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EEB10F8EE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:13:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2025A43A59;
 Thu, 22 May 2025 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747897984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vpUILtSYAH2sXWWKFYrv/0f+hDKiWRqqvwW165y3kL0=;
 b=EjlVSen/cEbDVeaJcw5WCzKVVxn5txFTdpxiks7bkfo1UEi7ylEzp+2n5fJiTNB7uhMLnW
 JpeZM0fvehi4M+bz+0Vsp1RU4VkdLqY0s/ZbPuY/BaGChC5/zMZm/r0bOCfm0Xqy+jn9+r
 lG8CS1BR6p8vCHVqe1OOMNpSQYzIj0HGEXBOhVFXXpKa5cLA3x28hhcPeBDYwnpeFAVj5N
 lXggT6vdYqhP4bud9Iuw18H0gN8dLelNnCQlTARG0SIVu5KPe+6wBboe6uz1GhIvvaQe4P
 VdcsXQ+jX3bMmVp/6cI7NMl/HdeCx7fWH1/MmzS4xUYfsZe5cYwf/sezEFf4DA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 22 May 2025 09:12:58 +0200
Subject: [PATCH] drm/bridge: fix build with CONFIG_OF=n
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250522-devm_drm_put_bridge-fix-non-of-build-v1-1-a05234dea046@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHnOLmgC/x2NWwqDQAwAryL5bsAG7esqRZauybaBuivZKgXx7
 g39HBhmNqhiKhVuzQYmq1Yt2eF4aGB8PfJTUNkZqKW+7YmQZZ0C2xTm5ROiKbuS9Iu5ZCwJ46J
 vxhTj6cx06a7dCJ6aTdz5b+7Dvv8Al5xmmnYAAAA=
X-Change-ID: 20250522-devm_drm_put_bridge-fix-non-of-build-fbb67d28494c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehfeefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdevuddtleevueefhfdtvdevteefvdfgteejhfdvvdevtefhleffhfehueeigfenucffohhmrghinheptggrthhirhgtlhhoghhsrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhilhhlvgdrshihrhhjrghlrgeslhhinhhugidrihhnthgvlhdrtghom
 hdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
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

Commit 5164553d739e ("drm/bridge: add devm_drm_put_bridge()") adds two
declarations for devm_drm_put_bridge():

 1) an inline declaration in the #else branch of
    '#if defined(CONFIG_OF)...'
 2) one outside of the same #if

This results in a build failure with CONFIG_OF=n:

  ../drivers/gpu/drm/drm_bridge.c:1406:6: error: redefinition of ‘devm_drm_put_bridge’

The function has nothing to do with OF, thus fix by removing declaration 1.

Fixes: 5164553d739e ("drm/bridge: add devm_drm_put_bridge()")
Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
Closes: https://oftc.catirclogs.org/dri-devel/2025-05-21#34288266;
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_bridge.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 464da28f9134f0fcece5c72a8c5fe7f3e42c7e3d..0af5db244db8580ea0c9af1d9a373b7bf62ee699 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1311,8 +1311,6 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
-
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,

---
base-commit: a3436f63aa4f93b043a970cc72a196a501191ecc
change-id: 20250522-devm_drm_put_bridge-fix-non-of-build-fbb67d28494c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

