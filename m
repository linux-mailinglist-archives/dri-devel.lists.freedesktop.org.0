Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93650A4DC0C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0F910E592;
	Tue,  4 Mar 2025 11:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tNGORDCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B68910E599
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 803F7A44DC3;
 Tue,  4 Mar 2025 11:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23DEC4CEE5;
 Tue,  4 Mar 2025 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086701;
 bh=KzJc5TiXnjvtl+zcWu9wp4j+B7/vu4hUfNVTpT0Z+HQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tNGORDCW3CLB+gpz9JpOjgBbaI+rVJl5Vwf1O4D0o3272DhAVUCnqu3C1j4cvjpCL
 nV1GMy6AwT/rDi8a5HSDRznRC1tQkwqI0VhYl0NaTChNu/1rg0W8wYVvz6B/fQDbaO
 lqbnqMEbVYAZP2VpA/rT/MgcyFyp4cV5iixz3pPeUdh1utBeoyjPgLEV3NYz6M2f6j
 V6uF2AixtrzKMwonoyj2FrRF1w5xfxXaneCoIDoP3tjpxwH4bkYV3DnPXJZw2+xtK1
 avYhwflaKVK4cxZ05nGfmb4SdTFe3q7Wb1WFKMNRkGHs7Dmpq4yYAmepau2hcybEZk
 VLnz8/faYvBuw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:57 +0100
Subject: [PATCH v5 14/16] drm/bridge: tc358768: Stop disabling when failing
 to enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-14-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
In-Reply-To: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KzJc5TiXnjvtl+zcWu9wp4j+B7/vu4hUfNVTpT0Z+HQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7h/KeuvdEVSScopxlcgFyT69hvjsb1kLj1/yvCluW
 pxVJLuyYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzExpWxoWtH+ux50fY1GTK6
 R7e8Cedf0BLZ8I5N+cyJxtlneDNtHt79GLXlR3bc740us2/2yjUuZmz4LSB2PV7O/OWq71GBn8T
 fRzQ97dGw/av5LNYww2zrcsuOn72zr3qvEb/xJDgi46qMzSYA
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

