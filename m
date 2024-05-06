Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7D8BCF21
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991910FE64;
	Mon,  6 May 2024 13:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MQlzbcin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4889410FDE5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:36:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2CD60CE0E74;
 Mon,  6 May 2024 13:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062EAC116B1;
 Mon,  6 May 2024 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002591;
 bh=CdCWrZhe83V0sESOJK7U77pyux4Xw5LMdp8ycoT3WUE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MQlzbcin9J88aETS0zLDb0nvobS3wtLI2Y4BBLQYro4df7gUI0X62eehQlcKCMs9K
 WzNcODU+CgRa7rRgSlZR2PuZy/juDvvKr2lyV7KBnids0vcCKxinOR55C1pha6uQZy
 pqhtmhvqQ3aNOvtmJLcr7CO0vbwcd9m5eT1d1rccugbqf89CHBIJmAdTtGhnqwrCSC
 gxtn3C9GumjieD7KwgVLmf/H/GEYj6kGebzI6Dt52QbdqE8wyjHv8AwnQ4QdFdcdhg
 Gai+zjxlTch4LRJBulxLPBOxb6dED1DZOygysJFpsJ5sS4d0sWRi8dBJl54Mw7abqd
 pUu86gTg+hSrg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:47 +0200
Subject: [PATCH 18/20] drm/bridge: tc358775: fix the power-up/down delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-18-545dcf00b8dd@kernel.org>
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

Implement the delays according to Figure 8-10 and 8-11 of the datasheet.
In particular, the datasheet states that the *maximum* time between
enabling the VDDIO and VDD is 10ms. Currently, as implemented this is
always violated. Of course, this is only a best effort because we cannot
be sure enabling of the two regulators will be that fast.
The time between releasing the stby GPIO and releasing the reset GPIO
must be at least 10us and not 10ms as it was before this patch. After
reset is released, there must be at least a delay of 200us until the
first HS clock is received.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index d5b3d691d2c1..99dbbb1fee78 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -242,18 +242,16 @@ static void tc358775_power_up(struct tc_data *tc)
 	ret = regulator_enable(tc->vddio);
 	if (ret < 0)
 		dev_err(dev, "regulator vddio enable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 
 	ret = regulator_enable(tc->vdd);
 	if (ret < 0)
 		dev_err(dev, "regulator vdd enable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 
 	gpiod_set_value(tc->stby_gpio, 0);
-	usleep_range(10000, 11000);
+	usleep_range(10, 20);
 
 	gpiod_set_value(tc->reset_gpio, 0);
-	usleep_range(10, 20);
+	usleep_range(200, 250);
 }
 
 static void tc358775_power_down(struct tc_data *tc)
@@ -265,17 +263,14 @@ static void tc358775_power_down(struct tc_data *tc)
 	usleep_range(10, 20);
 
 	gpiod_set_value(tc->stby_gpio, 1);
-	usleep_range(10000, 11000);
 
 	ret = regulator_disable(tc->vdd);
 	if (ret < 0)
 		dev_err(dev, "regulator vdd disable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 
 	ret = regulator_disable(tc->vddio);
 	if (ret < 0)
 		dev_err(dev, "regulator vddio disable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 }
 
 static void tc_bridge_pre_enable(struct drm_bridge *bridge)

-- 
2.39.2

