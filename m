Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78907AE20DF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6774510EBA0;
	Fri, 20 Jun 2025 17:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WGDBxuxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8671210E23D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 17:26:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AFCD1FD32;
 Fri, 20 Jun 2025 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750440385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfEYnh3OyC6i/rFKZeaUbnAkKRZX/6Nl5XciPjQMjMQ=;
 b=WGDBxuxbMSuIh8W5cZrtzOPp+1UEQnyZg3fuDnfN9dKJQ/AI8JtoAg7T4/Z1Es5w0ZCYNW
 xg9GJlT6A4wQHyewyZwHk8mTG5gY7uprk/4LWrBFlGjKShPMlv49jkctyeoJWfHQahPMhT
 hfzewnZYCWQ372dmBy85A/toaMxM49c3MpCMHuJYGPoIUPSD1dEEJf37zc81XaPj4SdpN/
 P8av1dgVy4ii81TqI+1A6vzWHesknv0PTjymG03HS2OC0F6RkPgMKzpzSyxusguiLR/bi6
 m0I6ezljNWEgWb8IdtooA4AwX39jGamAUzmk8pnC2h3+LdlZdyXPOOym+YI6Hg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 19:26:13 +0200
Subject: [PATCH v8 1/5] drm/bridge: add a cleanup action for scope-based
 drm_bridge_put() invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-1-0321845fcafb@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhm
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

Many functions get a drm_bridge pointer, only use it in the function body
(or a smaller scope such as a loop body), and don't store it. In these
cases they always need to drm_bridge_put() it before returning (or exiting
the scope).

Some of those functions have complex code paths with multiple return points
or loop break/continue. This makes adding drm_bridge_put() in the right
places tricky, ugly and error prone in case of future code changes.

Others use the bridge pointer in the return statement and would need to
split the return line to fit the drm_bridge_put, which is a bit annoying:

  -return some_thing(bridge);
  +ret = some_thing(bridge);
  +drm_bridge_put(bridge);
  +return ret;

To make it easier for all of them to put the bridge reference correctly
without complicating code, define a scope-based cleanup action to be used
with __free().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

This patch was added in v7.
---
 include/drm/drm_bridge.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7f66f9018c1090642876ff948bbf06ca66a46bfe..b110c5bba8c0612a71f749ad51345e7a8ccdc910 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_BRIDGE_H__
 #define __DRM_BRIDGE_H__
 
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -1227,6 +1228,9 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge);
 void drm_bridge_put(struct drm_bridge *bridge);
 
+/* Cleanup action for use with __free() */
+DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(_T))
+
 void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 			      const struct drm_bridge_funcs *funcs);
 

-- 
2.49.0

