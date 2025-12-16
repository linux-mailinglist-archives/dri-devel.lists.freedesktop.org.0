Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F10CC4C5D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 19:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E8410E844;
	Tue, 16 Dec 2025 18:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ojZexras";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A9C10E870
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 18:00:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CC204E419EA;
 Tue, 16 Dec 2025 18:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EC856071C;
 Tue, 16 Dec 2025 18:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDC65119A97F8; Tue, 16 Dec 2025 19:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765908004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=K/EnK3Kc3qT8kjcCEbC4eskMJJiJRpvZhnnPzJbqBGw=;
 b=ojZexrascPc7stKrWSbLf9kMhrJ5re8TioIXXOAZsDVUrNKjFdSux3LNEBMkv6gBflDfKj
 ga2ZLh2B8afm3HZDlOOinRc+Ae/pXP2ahcVKQmhuzWMnVg+A7F+wKSQ/pm57ZNipBEhcO4
 xOKlWSpf8PKr97PAB/TizXvrP6dAXG4sBBNfjTCP6bD+Ba2t3E0duwcMsaXHNOyqjK0aRA
 MXajHelu+NDZDgfGa8BG/Uncen5QPfxpXkPJUueiOeP0gqJKLuMuFfOIKNoeJBwN234wag
 jzq9OzJXvQtUSmQI/PmwCGAuC+F9T7bXxFAgR4nLppV27XnFIXwkBdBJsTQpKQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:43 +0100
Subject: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index dc374bfc5951..41071d6e05e5 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -33,7 +33,6 @@
 struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
 	struct drm_bridge	bridge;
-	struct drm_bridge	*next_bridge;
 	struct meson_drm	*priv;
 };
 
@@ -89,7 +88,7 @@ static int meson_encoder_cvbs_attach(struct drm_bridge *bridge,
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
 					bridge_to_meson_encoder_cvbs(bridge);
 
-	return drm_bridge_attach(encoder, meson_encoder_cvbs->next_bridge,
+	return drm_bridge_attach(encoder, meson_encoder_cvbs->bridge.next_bridge,
 				 &meson_encoder_cvbs->bridge, flags);
 }
 
@@ -241,9 +240,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	meson_encoder_cvbs->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
-	if (!meson_encoder_cvbs->next_bridge)
+	if (!meson_encoder_cvbs->bridge.next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find CVBS Connector bridge\n");
 

-- 
2.52.0

