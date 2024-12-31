Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABB9FEED7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214A710E653;
	Tue, 31 Dec 2024 10:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KK+ZBFK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C0210E648
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:40:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 925E2FF806;
 Tue, 31 Dec 2024 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735641633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32FGOgMqkFd24eRdy6LzV+vdiYs/LXpL2vGROONBsso=;
 b=KK+ZBFK4Fduf5wjOvpZjiAOMyEjY0gITQhDROVMyIzrcY3DlPAiTXgfd1qvp0sc522kKxd
 fg2NtpdplM31yNw9djttbDyHRAMEtkOT8SenYYpGnrkXNYCmLAGMhg3WGNdJLXI1I2zNnH
 1Z5mX02RbBOhBYb3rkGHr6+kXvxL0kxlmXheqB3xWZK+pqsult4zXLgT0VYnymf950K8kS
 vuPY5R5ggmNq7kKIdilwStMKf+BUlDrR5JJ15Trfy3zN5zaF8LJXPVYk2H+fNQOHV6VZ5i
 eQj8ooU2mAsKJ6p7iJkhUm51apwG8vUeywrr1eP/BCJwCqqQUMWibdhC5LCfPA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:40:01 +0100
Subject: [PATCH v5 07/10] drm/bridge: panel: use dynamic lifetime
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-7-173065a1ece1@bootlin.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
In-Reply-To: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
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

Enable lifetime management of panel-bridge, so that other modules taking a
pointer to a panel bridge can refcount it and avoid use-after-free in case
the panel bridge is hot-unplugged.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 drivers/gpu/drm/bridge/panel.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6e88339dec0f5faee690b7c53e8dcd0f1ee2281c..805809778f79f4519d9e31214cc5407357264da3 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -108,6 +108,11 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 		drm_connector_cleanup(connector);
 }
 
+static void panel_bridge_destroy(struct drm_bridge *bridge)
+{
+	kfree(drm_bridge_to_panel_bridge(bridge));
+}
+
 static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
@@ -210,6 +215,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
+	.destroy = panel_bridge_destroy,
 	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
 	.atomic_enable = panel_bridge_atomic_enable,
 	.atomic_disable = panel_bridge_atomic_disable,
@@ -286,19 +292,22 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 					      u32 connector_type)
 {
 	struct panel_bridge *panel_bridge;
+	int err;
 
 	if (!panel)
 		return ERR_PTR(-EINVAL);
 
-	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
-				    GFP_KERNEL);
+	panel_bridge = kzalloc(sizeof(*panel_bridge), GFP_KERNEL);
 	if (!panel_bridge)
 		return ERR_PTR(-ENOMEM);
 
+	err = drm_bridge_init(panel->dev, &panel_bridge->bridge, &panel_bridge_bridge_funcs);
+	if (err)
+		return ERR_PTR(err);
+
 	panel_bridge->connector_type = connector_type;
 	panel_bridge->panel = panel;
 
-	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
@@ -317,18 +326,13 @@ EXPORT_SYMBOL(drm_panel_bridge_add_typed);
  */
 void drm_panel_bridge_remove(struct drm_bridge *bridge)
 {
-	struct panel_bridge *panel_bridge;
-
 	if (!bridge)
 		return;
 
 	if (bridge->funcs != &panel_bridge_bridge_funcs)
 		return;
 
-	panel_bridge = drm_bridge_to_panel_bridge(bridge);
-
 	drm_bridge_remove(bridge);
-	devm_kfree(panel_bridge->panel->dev, bridge);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 

-- 
2.34.1

