Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA68BCF13
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7810FAF3;
	Mon,  6 May 2024 13:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ikbmr446";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A554710FAF3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58A4BCE0E64;
 Mon,  6 May 2024 13:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC444C116B1;
 Mon,  6 May 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002542;
 bh=On4XVAth8phH/tpwuPnVAjW8rZ3xEljXuSTJvjxVCxA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ikbmr446+4FNMnf+X2Ixk0yrmfaW3BrQGq12yjTcqCoCnSMkfSMw79qQvU1rgZfqu
 JcZnBDtaLaFpqmQqg4UdyeA5sK5j3exP0iGyduTW+eyccA9s4j2R2u7Lm954PYjFJ1
 Q+l9MRMFtFOtcpDQ8ztJ8OYkO3Ce1eEN/UUkyu6VIt2vdXkRs8dxE10Y7teetNDRns
 cdh+7BrTVQUTngjQ2ZR5sArhQPeeXTR/doaIIdckPjZqmAcuvwIr3bYhciLCreXU9j
 6zdG+E+/fBgrr4+SEsziVEUOj+pHa3QSTlHgUxUB4CL6ONgrBQh8PAJVMZlOYWzcoi
 BbhbiM5RK5trg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:37 +0200
Subject: [PATCH 08/20] drm/bridge: tc358775: remove error message if
 regulator is missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-8-545dcf00b8dd@kernel.org>
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

A missing regulator node will automatically be replaced by a dummy. Thus
regulators are optional anyway. Remove the error message.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index b7f15164e655..54aea58a3406 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -675,18 +675,12 @@ static int tc_probe(struct i2c_client *client)
 		return ret;
 
 	tc->vddio = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(tc->vddio)) {
-		ret = PTR_ERR(tc->vddio);
-		dev_err(dev, "vddio-supply not found\n");
-		return ret;
-	}
+	if (IS_ERR(tc->vddio))
+		return PTR_ERR(tc->vddio);
 
 	tc->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(tc->vdd)) {
-		ret = PTR_ERR(tc->vdd);
-		dev_err(dev, "vdd-supply not found\n");
-		return ret;
-	}
+	if (IS_ERR(tc->vdd))
+		return PTR_ERR(tc->vdd);
 
 	tc->stby_gpio = devm_gpiod_get_optional(dev, "stby", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->stby_gpio))

-- 
2.39.2

