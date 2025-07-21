Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A23B0C0A8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC2410E4CB;
	Mon, 21 Jul 2025 09:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="YBw89Lf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDBA10E4C5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:49:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1753091027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLEv1F8si+d4JJJEfku+IvjEsa+DjKyQC0EuZ/oVHD0=;
 b=YBw89Lf4y0J81omtVXFiErCy7x7GCqvBn9kRHUywYFrPxpgnwB8GnQ1oWSMqF3dK6auKZd
 TIVzr17F0DAzQsdoZzgMIVze8Nx24Y6tlvowId9/BdMVItXdl7O700OyBHnfh1Man7gGiQ
 egQLEfykp0Sglpzko5rNyXEaHVOBFS8=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 21 Jul 2025 11:43:18 +0200
Subject: [PATCH 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-exynos4-sii9234-driver-v1-2-2e47ed02f677@grimler.se>
References: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
In-Reply-To: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maciej Purski <m.purski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=henrik@grimler.se;
 h=from:subject:message-id; bh=fA7kCw/btmE/Kdd4JfUiEBidHB1Txrk8ejW2zzBXunM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBofgvIS7HDC0DrDRkeyFvc9LW0I1rTyNgAnlKfU
 bM4zIXwgQqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaH4LyAAKCRCwB25JC3Fh
 a3XoB/9G40Lv0JikNKi9Ia8QkocQfYruM/z/b25jkjcvIMg5emz1qVhp4+y6a/lOb8wxDwSronb
 r0DcGzDRu+uBkuNJJTqPDSUT8OdWNrabTLHQb0g0lRMkzdGvqEthoZh7b77uFB2FYcJy0667FxY
 fmB0SCpJPWuhfF6o5lJY1W3qjcl40tpPjdgUrlNSeSdgfa5YSvxsylKke/698b3U87mZAjq/mVF
 wZAg7ppIU+1baeyu0De6hog7wGH0+prm1c9/n/yfAZbfWcQbg4bJzuBzmrlFHkv5HywIcjZxpgp
 3eJeWA74HahKR5PMQx4q1bvXXon1/RICH7CYjs0Eususlxhb
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
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

In case of error during resource acquisition the driver should print
an error message only if it is not deferred probe. Use dev_err_probe
helper to handle this, which will also record defer probe reason for
debugging.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 drivers/gpu/drm/bridge/sii9234.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 930117bbba87285e62107389606897740516eb0a..0e0bb1bf71fdcef788715cfd6fa158a6992def33 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -825,10 +825,9 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	}
 
 	ctx->gpio_reset = devm_gpiod_get(ctx->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->gpio_reset)) {
-		dev_err(ctx->dev, "failed to get reset gpio from DT\n");
-		return PTR_ERR(ctx->gpio_reset);
-	}
+	if (IS_ERR(ctx->gpio_reset))
+		return dev_err_probe(ctx->dev, PTR_ERR(ctx->gpio_reset),
+				     "failed to get reset gpio from DT\n");
 
 	ctx->supplies[0].supply = "avcc12";
 	ctx->supplies[1].supply = "avcc33";
@@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(ctx->dev, "regulator_bulk failed\n");
-		return ret;
+		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
 	}
 
 	ctx->client[I2C_MHL] = client;
@@ -911,10 +908,9 @@ static int sii9234_probe(struct i2c_client *client)
 					sii9234_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"sii9234", ctx);
-	if (ret < 0) {
-		dev_err(dev, "failed to install IRQ handler\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to install IRQ handler\n");
 
 	ret = sii9234_init_resources(ctx, client);
 	if (ret < 0)

-- 
2.50.1

