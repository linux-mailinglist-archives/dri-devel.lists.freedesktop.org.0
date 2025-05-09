Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB9AB1606
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A0610EA57;
	Fri,  9 May 2025 13:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X12y8CMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986D10EA5D;
 Fri,  9 May 2025 13:56:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 645E543B50;
 Fri,  9 May 2025 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746798989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sdjyy/Ev4PLgIYELv/HS1BsALPVAX1GCL70odC456BI=;
 b=X12y8CMdnAeTj8yaAEWRHEou++ZTW1wmkZzM4GJHBJJTH9bKDl7iH/G29dP6Hcik92uxpd
 X4MiOzT/YndyT62drkF/qM7ibUoazthCxft2QzeLliP0FFs+R5z3Ip8VQxf/TuZa6GDiRf
 ptyMwhTrz3ygzeFCt3x1e+SiIkHRLRZ3XleM6VxCWwtGjzwrEDMGl5wc7BEAzCc1JeIC2/
 VaPLuwbEqnJMpNwqa6wDMnyRAJhJTVESrGqYj+wfDvBV92mKbnhTwbvn5FGB67w4lJZlrj
 kGqDRP9GoVsBlsbb5pgVjaP7xfe6x7zRfHnZEB2zh5Yh30VAZiZX9HTVf4Cl0w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:31 +0200
Subject: [PATCH v3 05/22] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Peter Senna Tschudin <peter.senna@gmail.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhug
 idqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehirghnrdhrrgihsehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
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

This is the new API for allocating DRM bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Ian Ray <ian.ray@gehealthcare.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>

Changed in v3:
- updated Ian Ray's e-mail (old one is bouncing

Changed in v2: none
---
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 15a5a1f644fc10182c55bc9e489ccb81d4f924f9..81dde9ed7bcf7cacae000d9da31a3a5c347ce037 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -225,13 +225,11 @@ static int ge_b850v3_lvds_init(struct device *dev)
 	if (ge_b850v3_lvds_ptr)
 		goto success;
 
-	ge_b850v3_lvds_ptr = devm_kzalloc(dev,
-					  sizeof(*ge_b850v3_lvds_ptr),
-					  GFP_KERNEL);
-
-	if (!ge_b850v3_lvds_ptr) {
+	ge_b850v3_lvds_ptr = devm_drm_bridge_alloc(dev, struct ge_b850v3_lvds, bridge,
+						   &ge_b850v3_lvds_funcs);
+	if (IS_ERR(ge_b850v3_lvds_ptr)) {
 		mutex_unlock(&ge_b850v3_lvds_dev_mutex);
-		return -ENOMEM;
+		return PTR_ERR(ge_b850v3_lvds_ptr);
 	}
 
 success:
@@ -264,7 +262,6 @@ static int ge_b850v3_register(void)
 	struct device *dev = &stdp4028_i2c->dev;
 
 	/* drm bridge initialization */
-	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
 	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
 					 DRM_BRIDGE_OP_EDID;
 	ge_b850v3_lvds_ptr->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;

-- 
2.49.0

