Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A494BAED
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346F210E6C1;
	Thu,  8 Aug 2024 10:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="knX2YFbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914A10E6C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:28:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F2E1CC6B38
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:26:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43328C0008;
 Thu,  8 Aug 2024 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723112779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VKqPc2zvztu8ZjTTtHQ7KbDNfyDn+rWRkCx6dA0D/as=;
 b=knX2YFbF0IkUaVgtfA7NITlpMDxKAXD+0Dcpwpzg2lmoZi/VUqS8S0Ztg+y2bFoFdD3afk
 6M2DoTG3UbOxyWDWB1uCT5iRJbjE6vl+iu97LAGIBVXACkdTWYXKWuBvu6vCABxP2FOfAW
 2PiLr4QvfcpqPVxEQk6aCutL2z/FsBq1TM9jWpEKxRwrDnXqHBqQ71tpsMqAauWb34/CWd
 6MEAXUmtvB20zo98owfxLdkyOAtV88a70kXSoMTY9gkLhmBVWPb4u3BH1DdL6ysMabIxLc
 YPXHiCjU3Tj61gLaLU1DXVBqUzMqZ1bcZUFoZCOqokM72h2IVfq7oDUW3w7zEg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 08 Aug 2024 12:26:14 +0200
Subject: [PATCH] drm/bridge: ti-sn65dsi83: use dev_err_probe when failing
 to get panel bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240808-ti-sn65dsi83-dev_err_probe-v1-1-72417aa275ab@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEWdtGYC/x3MzQpAUBBA4VfRrE1dv11eRRJmMJtLM5KSd3ezO
 fVtzgPGKmzQJg8oX2Kyh4gsTWDexrAyCkVD7vLSeefxFLRQV2TiCyS+BlYdDt0nxsbTuDiKmTK
 Ig0N5kfufd/37ft+746tsAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
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

When devm_drm_of_get_bridge() fails, the probe fails silently. Use
dev_err_probe() instead to log an error or report the deferral reason,
whichever is applicable.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 57a7ed13f996..60b9f14d769a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -606,7 +606,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 
 	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
 	if (IS_ERR(panel_bridge))
-		return PTR_ERR(panel_bridge);
+		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");
 
 	ctx->panel_bridge = panel_bridge;
 

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240808-ti-sn65dsi83-dev_err_probe-98daf0ddafb1

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

