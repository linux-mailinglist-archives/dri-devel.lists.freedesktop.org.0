Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69C5A34339
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1A310EAF2;
	Thu, 13 Feb 2025 14:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fbO4ePyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C3310EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9D0CA41E1A;
 Thu, 13 Feb 2025 14:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507E0C4CED1;
 Thu, 13 Feb 2025 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457930;
 bh=HxWPASJqhCk8HMacRro/P3QhUnH5LdloQZZEdGS2Fto=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fbO4ePyFLlQOnJjYv/oMMoP45ikG7CSyCVRAe/7vZFIC2wNAdgY5/akwRyx/VFzfQ
 R1ofgNZfXf/gIzVCvIr8tXLumkLAmprn57JhS30R1wXZUVt/mlgXyX1Pho8ulcJ+YP
 Bu43nle3E8HRDoCPLFpyPNc5qsXf6IL0+z9BtstoJ5VKeRHKbg6w5Q8+BU/bLA5YpE
 lYlY9VwOfP6wCDRm2s1EIrZyyrX43Sy0gNnbTk1V/CjJxqHbzarGVd8qiZr44P50Ro
 c30u3fNewv+HCY6wU9kXlOG+i9ZSjJExjF8DED6OXEfgCoKvj4QlK5GnxcuC/xiBK/
 wbl83orW0ItHQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:54 +0100
Subject: [PATCH v3 35/37] drm/bridge: tc358768: Stop disabling when failing
 to enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-35-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HxWPASJqhCk8HMacRro/P3QhUnH5LdloQZZEdGS2Fto=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWFUDv+ytSprq/t4jh8HndAXP46awCQzFrge/53oLL
 ZuYIn+8YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk+QnG+vo7fYx3p1nE7sw1
 jJ8q8fLzSv0kttOG9Yk+B8qe6mVcVlx6SvGTxq64hce+uksZuiXvZ6z3PSm8bOG7V7tiLr1tPrh
 30WJ7ZmWu8GjTm/Or2eRvillf+vdUae/vmW1+kaZ7fpTP6FoFAA==
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
2.48.0

