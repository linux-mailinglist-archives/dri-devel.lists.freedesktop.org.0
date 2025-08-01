Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5AB1863B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 19:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752410E8D5;
	Fri,  1 Aug 2025 17:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IJlchY9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD4410E8D4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 17:05:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CD34442C7;
 Fri,  1 Aug 2025 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754067952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNrBWhh4MDjBY2LHw69O2rADHzZIUkh9utCdX0Avk0I=;
 b=IJlchY9PRhyJCUWh5AW+kb9LnbgdE6UdsDupy+Nvj5v3BlVnbEgni9N2CfIXYqbd1lX+M3
 kGPfYt6A0Qp9vl0xNTB173GKErmt6ygwiwBSBfaOtY/AYjyNE8Fu7X4ao74DqBfsYQYpNN
 e6cn9Jp/XtOSgNEuI7kKCKANcymZbLfjoroWE8hb3+R5hjCAaXeQ/VBKFzekPBdHa2580r
 AlcatWOrKwsM6J24IRz9H42O4f/H4Nto2fe9MTxiX7CMzRmph2IAwWdrjXYTLykXKXK8eC
 GCatt6wp0eal6ef10J6T2r76gHmN8Y2igNw/g/YbZnoHcrVrIo3op9Hlq7VDww==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 01 Aug 2025 19:05:30 +0200
Subject: [PATCH v2 8/9] drm/bridge: put the bridge returned by
 drm_bridge_get_next_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-8-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
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

The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put it
when done. We need to ensure it is not put before either next_bridge or
next_bridge_state is in use, thus for simplicity use a cleanup action.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2:
- use cleanup action instead of explicit drm_bridge_put(), also fixing the
  place where the ref is put
---
 drivers/gpu/drm/drm_bridge.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3bfcd735a3c426a147bf0a7427b3d2cd0df3524..ad37e27688bbfd104a95f413f6f98fecf314ade2 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1121,7 +1121,6 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
 				      struct drm_atomic_state *state)
 {
 	struct drm_bridge_state *bridge_state, *next_bridge_state;
-	struct drm_bridge *next_bridge;
 	u32 output_flags = 0;
 
 	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
@@ -1130,7 +1129,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
 	if (!bridge_state)
 		return;
 
-	next_bridge = drm_bridge_get_next_bridge(bridge);
+	struct drm_bridge *next_bridge __free(drm_bridge_put) = drm_bridge_get_next_bridge(bridge);
 
 	/*
 	 * Let's try to apply the most common case here, that is, propagate

-- 
2.50.1

