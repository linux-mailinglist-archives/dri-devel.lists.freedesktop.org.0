Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110008BCF1E
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B710FCBC;
	Mon,  6 May 2024 13:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c9s/WUkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2D210FCBC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:36:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9A8E612B8;
 Mon,  6 May 2024 13:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C2BC4AF68;
 Mon,  6 May 2024 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002586;
 bh=Hm8IbzH7o86qGsPyzm5DKDFy+pWLYyONwjVqfO4C4rg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c9s/WUkzLe0/Gv60ykQuMYisA+qfLshxmw/LYojmokJi/IFRzXPXz3p7WTjXqTUcu
 9cO9wxDiJJ7V/gNHD316aargzM6HJ5kQz5tLFxy4b09QtHmY9CGScsnCBH9raaqgg1
 ovFY1Lzdq3L8wtWXvB9u6txLzMzgSj7OAApgNpQ7MjR4Q+gv5VBsFB0jo/myaNQ5ep
 yyg8txlfAv6PT6aHaUh56acPXe/OiSPLwqS6+rv6rmUM7jbdnhK1aCssHYK1R/wfF7
 AhMejO6EnmKXCMlB3MpkvgKwRNXoZhDi9d52bnu5PEsjffWVTT3Bf5rKI+RhyPmL8P
 iWTPegQ6Oqw3g==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:46 +0200
Subject: [PATCH 17/20] drm/bridge: tc358775: move bridge power up/down into
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-17-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

Move the bridge power-up and power-down handling into own functions.
This is a preparation patch to fix the power-up sequencing of the
bridge. No functional change.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index c50554ec4b28..d5b3d691d2c1 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -215,6 +215,7 @@ struct tc_data {
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*stby_gpio;
 	bool			lvds_dual_link;
+	bool			powered;
 	u8			bpc;
 
 	enum tc3587x5_type	type;
@@ -233,9 +234,8 @@ static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
 	return container_of(b, struct tc_data, bridge);
 }
 
-static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+static void tc358775_power_up(struct tc_data *tc)
 {
-	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -256,9 +256,8 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
 	usleep_range(10, 20);
 }
 
-static void tc_bridge_post_disable(struct drm_bridge *bridge)
+static void tc358775_power_down(struct tc_data *tc)
 {
-	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -279,6 +278,20 @@ static void tc_bridge_post_disable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
+static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	tc358775_power_up(tc);
+}
+
+static void tc_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	tc358775_power_down(tc);
+}
+
 /* helper function to access bus_formats */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {

-- 
2.39.2

