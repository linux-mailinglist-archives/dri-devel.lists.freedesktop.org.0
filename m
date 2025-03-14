Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCCA60EEB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C2710E9B0;
	Fri, 14 Mar 2025 10:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FwWfXmph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A99410E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:31:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB06243316;
 Fri, 14 Mar 2025 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741948304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IchMW5cPaVGupciOSvL/QWeDOAs3j9uz2T3WU11vBas=;
 b=FwWfXmphH0YQs4relpX07icAwCxBCsSkr6f43qURPHZIlDnKITvWbre+Gy+YLr85PUIPcG
 KFp3mgFlH8Z63SKX6ouW2Xm9icJIiCAR/be42+KfDmDyPVhP7zsiZ+nb09A11S76FcQFGZ
 TjBOn63k2hZ0aVmmu/h7UQ99fRUjVRX2deQoq3bQeqlzUykA9gd97bJwjbjaEM1S51bzOS
 fAp9qxgJzqKsxa9gfRV4wZYWKW+4drG4QB7DAtipW+LUz/gxAUIGgoZrh6XWEnJvMTsqV2
 L0/Bdicz/XyHDrYmgU8dcylxVTxWs4BUcVQnWWtlZD+kU0lHCCNx4tG9fEA6/Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 14 Mar 2025 11:31:17 +0100
Subject: [PATCH v7 04/11] drm/bridge: get/put the bridge reference in
 drm_bridge_attach/detach()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-bridge-refcount-v7-4-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
In-Reply-To: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehjvghrn
 hgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvgdrihhopdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v7:
- in v6 this was part of "drm/bridge: add support for refcounted DRM
  bridges", now split to a separate patch
---
 drivers/gpu/drm/drm_bridge.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 72fa51d4dd2337f97c2bd65cfabf9cee05b661b4..da85694e9310f1f910bc8a5aa5d95a91d9254888 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -370,11 +370,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
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
@@ -423,6 +429,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 			      "failed to attach bridge %pOF to encoder %s\n",
 			      bridge->of_node, encoder->name);
 
+err_put_bridge:
+	drm_bridge_put(bridge);
 	return ret;
 }
 EXPORT_SYMBOL(drm_bridge_attach);
@@ -443,6 +451,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 
 	list_del(&bridge->chain_node);
 	bridge->dev = NULL;
+	drm_bridge_put(bridge);
 }
 
 /**

-- 
2.48.1

