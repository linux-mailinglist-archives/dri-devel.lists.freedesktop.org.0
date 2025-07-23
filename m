Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E8B0EEDF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 11:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E9F10E783;
	Wed, 23 Jul 2025 09:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NyO0e86L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDE410E784
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:54:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A75CB43383;
 Wed, 23 Jul 2025 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753264485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1aT9UvQsypJ5FnvT7oFv2tdykMxUGRvv4TCDw3cO58=;
 b=NyO0e86L5Ew9FQ+ZDvPWICbl2ZELRq6JoavXwU3d8ghvpUnCGDP6t7o9f+z5p7Rg0dcnjA
 SV9eRA6ghquPknMnGniCLiapzOYVHG/kC4LJ6DI056nK+S2LkbgMETG5TFsVrP1uDG+QJw
 Qj4uXKK83ubRf//72U5nlbCCXJkjnwKn96sdm5T83gkqYI1+vuPKLrL1z+2TBpvGKal094
 4gU7D+wyWGqemkxLCAGul9JwPxq2J8cOeqIEQb6clUta60vWYIQWMeDDYFeEKwmpW4b/nU
 V0boCTBoor2r1tANrcwg+3QavKSzCdDZa0uCISkxoaQIzNDJ7xZhSo/HsWmS+Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 23 Jul 2025 11:54:14 +0200
Subject: [PATCH 7/9] drm/bridge: remove drm_for_each_bridge_in_chain()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-drm-bridge-alloc-getput-for_each_bridge-v1-7-be8f4ae006e9@bootlin.com>
References: <20250723-drm-bridge-alloc-getput-for_each_bridge-v1-0-be8f4ae006e9@bootlin.com>
In-Reply-To: <20250723-drm-bridge-alloc-getput-for_each_bridge-v1-0-be8f4ae006e9@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejjeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehth
 hhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
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

All users have been replaced by drm_for_each_bridge_in_chain_scoped().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .clang-format            |  1 -
 include/drm/drm_bridge.h | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/.clang-format b/.clang-format
index 1cac7d4976644c8f083f801e98f619782c2e23cc..d5c05db1a0d96476b711b95912d2b82b2e780397 100644
--- a/.clang-format
+++ b/.clang-format
@@ -167,7 +167,6 @@ ForEachMacros:
   - 'drm_connector_for_each_possible_encoder'
   - 'drm_exec_for_each_locked_object'
   - 'drm_exec_for_each_locked_object_reverse'
-  - 'drm_for_each_bridge_in_chain'
   - 'drm_for_each_bridge_in_chain_scoped'
   - 'drm_for_each_connector_iter'
   - 'drm_for_each_crtc'
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 990ef98011c96619b269787ebe01a2ad3b225c42..0a45ed862ca3293bd0b12dacf3ba2c5429800d00 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1351,20 +1351,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 						       struct drm_bridge, chain_node));
 }
 
-/**
- * drm_for_each_bridge_in_chain() - Iterate over all bridges present in a chain
- * @encoder: the encoder to iterate bridges on
- * @bridge: a bridge pointer updated to point to the current bridge at each
- *	    iteration
- *
- * Iterate over all bridges present in the bridge chain attached to @encoder.
- *
- * This is deprecated, do not use!
- * New drivers shall use drm_for_each_bridge_in_chain_scoped().
- */
-#define drm_for_each_bridge_in_chain(encoder, bridge)			\
-	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
-
 /**
  * drm_bridge_get_next_bridge_and_put - Get the next bridge in the chain
  *                                      and put the previous

-- 
2.50.1

