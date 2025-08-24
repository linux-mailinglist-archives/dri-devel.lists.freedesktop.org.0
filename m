Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E5B32F4C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 13:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7AE10E20F;
	Sun, 24 Aug 2025 11:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="H2i8/Z/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9A210E210
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 11:17:39 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1756034258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LQfg9PNf1t19zyYrXBmiGz0nsA2Dze/kpHpdB04NEk=;
 b=H2i8/Z/Dd1ccwRMT9pJ1dDvczogVNknNpVKIPH+yIOaCXJ0RXTH7CxZSpOIgHE4TTUCWwW
 HAYJ2hLpn3fv//7tvFdJPxtc+r8loU3c81eH+foi3ugmnfB0obszMw6+sRK4WTuMLdtYiU
 Vd1LPVyrlSJAmqmqs3iCKg6rIilBQk8=
From: Henrik Grimler <henrik@grimler.se>
Date: Sun, 24 Aug 2025 13:16:55 +0200
Subject: [PATCH v3 2/3] drm/bridge: sii9234: use dev_err_probe where applicable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250824-exynos4-sii9234-driver-v3-2-80849e716a37@grimler.se>
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
In-Reply-To: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=henrik@grimler.se;
 h=from:subject:message-id; bh=2hbU/JPpq+X+b93KBMazUAOoDOg6/IpPSJiqUcoJRj4=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBoqvS+8R0f1PRorqdnd9Bp/G8CpitQqnizIhgBO
 6TJxHtFKCaJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaKr0vgAKCRCwB25JC3Fh
 a/uUCADJbaz5IGQA8slIHDswHP0HZIyepT57uXh/hoeTc8qmBEJkit1tipXPSocIiEs2ZPugLD9
 YEMpGZ4bjcGwiHZ3OJX1+yqxFJefu9LL80PnhGqKQTcXAYjKHnIAlcJ+PE37NyNh5VjtuBWiHY7
 dOCn4GdxWKpg/n3u16sGHtoPfl1V1G05WnJrGjjPckGYOlqqlZXow18hTaWVIGH+voXRl1xwbkU
 ZnFzUwzEqwyTi3xfeprymY3TAjyHzTN7iuUVp6Q61SpcVmDZKtnNyft2pQkNG+rjO6uo69mFAJq
 oICte8FFQsQtDJaJ1iOJcufc+c1R8jRmyrQ+hoW1UdavFLpW
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
v3: add missing return in error path, spotted by Dmitry
v2: no changes
---
 drivers/gpu/drm/bridge/sii9234.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 930117bbba87285e62107389606897740516eb0a..e43248e515b3dcdde043997288d61f738417b8f0 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -825,21 +825,17 @@ static int sii9234_init_resources(struct sii9234 *ctx,
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
 	ctx->supplies[2].supply = "iovcc18";
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(ctx->dev, "regulator_bulk failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
 
 	ctx->client[I2C_MHL] = client;
 
@@ -911,10 +907,9 @@ static int sii9234_probe(struct i2c_client *client)
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

