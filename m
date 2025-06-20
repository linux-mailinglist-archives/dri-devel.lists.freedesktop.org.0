Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BACAE1791
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 11:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6571A10EB12;
	Fri, 20 Jun 2025 09:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jWmJXNyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F64010EB25
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 09:32:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D677A4330F;
 Fri, 20 Jun 2025 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750411957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrSpgORb7l30m7J0bgJ3mrlYbojDB6bJ1lPqGSeyWRU=;
 b=jWmJXNyiGOXUGcO3HE28SF+lVXoX3ZmdhfmQrgIwGoZb90V+PZY6EjzD8QeiZSmhqBwDUm
 HVW9Mi1rEq+9RuU+GlkK+kr8aKJxtr7S1QJFGFsnfQHxdeMRvLCuRqb/3jTlG6wCwXMnDE
 EiyJSeaRoRNpHwNVYhDxucs+9kTBIy5Dp44xlpWWvPHuq/YZfgmYy+Is0durBg1ilrG3er
 CExbCfTpOo5wJHDJjQ/m0KfBFz8ZpGQt/iYA5roqwg9xx/TaSOz2PjrjbZf8mr3v830T6P
 MrqBp5a8vattncBjHvttUbnL3cE79olJ68wBB6UfDvAmY83xNSkFHfT496Wh8Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 11:32:07 +0200
Subject: [PATCH 2/3] drm/bridge: get/put the bridge reference in
 drm_bridge_attach/detach()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-2-bad7eba5d117@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdektdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrr
 hhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
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

drm_bridge_attach() adds the bridge to the encoder chain, so take a
reference for that. Vice versa in drm_bridge_detach().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v8: none

Changes in v7:
- in v6 this was part of "drm/bridge: add support for refcounted DRM
  bridges", now split to a separate patch
---
 drivers/gpu/drm/drm_bridge.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index fa2b2457b16e145e3ace70c53984937096d310d0..f001bbe95559aabf0aac9f25f89250ad4e1ad9c8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -411,11 +411,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
 
-	if (previous && (!previous->dev || previous->encoder != encoder))
-		return -EINVAL;
+	drm_bridge_get(bridge);
 
-	if (bridge->dev)
-		return -EBUSY;
+	if (previous && (!previous->dev || previous->encoder != encoder)) {
+		ret = -EINVAL;
+		goto err_put_bridge;
+	}
+
+	if (bridge->dev) {
+		ret = -EBUSY;
+		goto err_put_bridge;
+	}
 
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
@@ -464,6 +470,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 			      "failed to attach bridge %pOF to encoder %s\n",
 			      bridge->of_node, encoder->name);
 
+err_put_bridge:
+	drm_bridge_put(bridge);
 	return ret;
 }
 EXPORT_SYMBOL(drm_bridge_attach);
@@ -484,6 +492,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 
 	list_del(&bridge->chain_node);
 	bridge->dev = NULL;
+	drm_bridge_put(bridge);
 }
 
 /**

-- 
2.49.0

