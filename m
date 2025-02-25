Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D2EA44695
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F0610E1C8;
	Tue, 25 Feb 2025 16:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vGjkMEAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E2D10E74A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 637ED5C72FB;
 Tue, 25 Feb 2025 16:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE32C4CEED;
 Tue, 25 Feb 2025 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501880;
 bh=N9o+5lkH2lEqI5Z0LkHvN3UcudIkKdRGUvoC3mBiKdc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vGjkMEAVHcGMpKRMUlafJAGrQmk61NTDZa4iS592v/SBnMo0S0gBsg5Wwl1EPzrnD
 UvHY1AqOn2IFB46+xAu6C0W4kU8Q0uNCpWRtTJpOBgKjC/s0SGFfOSj6watW/SgSmZ
 MTI4qntlN0sLtb3WVGrFC3Rpeh8sAA+6894IOegpgYcIkhBRkElvNuYwJ16O9Mog3i
 wOXfGTVg6GAjElUZ4GmobHBwrgjQVJbD2U7GVMvXfAdR633r1N3W7D5w17chz+71Yb
 okrtOCKI9Nn7jtxUvW2hVcXS45B6kcSiCWUs/i8ETcA73Z/OJlbqa9AJoHynax5oGJ
 4rrMwa1NyAtaA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 25 Feb 2025 17:44:01 +0100
Subject: [PATCH v4 13/15] drm/bridge: tc358768: Stop disabling when failing
 to enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-bridge-connector-v4-13-7ecb07b09cad@kernel.org>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
In-Reply-To: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N9o+5lkH2lEqI5Z0LkHvN3UcudIkKdRGUvoC3mBiKdc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOl7P/t/vmHzfumZU7O1LHzvfzkxV6C5vn+jULbWD6+EX
 5O/XDwS2TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmMvk9Y8M3dcNpqhVfH1k/
 +qoq0yweWxwpENVyYubmHqMrjb5nVuXXRXEEMVtsevqRNYWbZ/1ObsYqZk3Fk/uF5n5/bzO772P
 AD/uECZoSrvHy5wNfMVkLu3FKRf0+EC5eMVu84oHoXyvXZ7MA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The tc358768 bridge driver, if enabling it fails, tries to disable it.
This is pretty uncommon in bridge drivers, and also stands in the way
for further reworks.

Worse, since pre_enable and enable aren't expected to fail, disable and
post_disable might be called twice: once to handle the failure, and once
to actually disable the bridge.

Since post_disable uses regulators and clocks, this would lead to enable
count imbalances.

In order to prevent that imbalance, and to allow further reworks, let's
drop the calls to disable and post_disable, but keep the warning to let
users know about what's going on.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/tc358768.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6b65ba8aed86012bc0f464bd5ee44325dae677c6 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1075,15 +1075,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
 	val |= TC358768_DSI_CONTROL_DIS_MODE; /* DSI mode */
 	tc358768_write(priv, TC358768_DSI_CONFW, val);
 
 	ret = tc358768_clear_error(priv);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Bridge pre_enable failed: %d\n", ret);
-		tc358768_bridge_disable(bridge);
-		tc358768_bridge_post_disable(bridge);
-	}
 }
 
 static void tc358768_bridge_enable(struct drm_bridge *bridge)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
@@ -1099,15 +1096,12 @@ static void tc358768_bridge_enable(struct drm_bridge *bridge)
 
 	/* set PP_en */
 	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(6), BIT(6));
 
 	ret = tc358768_clear_error(priv);
-	if (ret) {
+	if (ret)
 		dev_err(priv->dev, "Bridge enable failed: %d\n", ret);
-		tc358768_bridge_disable(bridge);
-		tc358768_bridge_post_disable(bridge);
-	}
 }
 
 #define MAX_INPUT_SEL_FORMATS	1
 
 static u32 *

-- 
2.48.1

