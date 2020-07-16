Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83B2235C7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1046ED3A;
	Fri, 17 Jul 2020 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AEE89B27
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1594903092; bh=QEjTMk4ZzDSZ6Jx5V1yWHh4jwwChWuP75ep9d/rMANQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=jWD2nsWAo4QoTnAKgwVif+Nqr3TV5kn/AplnCLQtSKz8rl5trI1YUH6t1AZfhdbLL
 7MjBD0eUbu0G75x3fE5Qpqq2I2G+9/0NF0Nwj5C4X284U/EarsUyAmOd8UXct61Vqq
 n2PvsVhjvcG7Zo9m9UHT/lhhEU6pNgfj0YRY2xJs=
From: Ondrej Jirman <megous@megous.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 2/2] drm/panel: st7703: Fix the power up sequence of the panel
Date: Thu, 16 Jul 2020 14:37:53 +0200
Message-Id: <20200716123753.3552425-3-megous@megous.com>
In-Reply-To: <20200716123753.3552425-1-megous@megous.com>
References: <20200716123753.3552425-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The datasheet specifies that it's better to keep reset asserted
while powering up the supplies, and that IOVCC should be enabled
first.

There also needs to be a delay after enabling the supplies and
before deasserting the reset. The datasheet specifies 1ms after
the supplies reach the required voltage. Use 10-20ms to also
give the power supplies some time to reach the required voltage,
too.

This fixes intermittent panel initialization failures and screen
corruption during resume from sleep on PinePhone.

Reported-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 22 +++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 45833e6a0f4f..48569a8688f6 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -429,12 +429,8 @@ static int st7703_prepare(struct drm_panel *panel)
 		return 0;
 
 	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
-	ret = regulator_enable(ctx->vcc);
-	if (ret < 0) {
-		DRM_DEV_ERROR(ctx->dev,
-			      "Failed to enable vcc supply: %d\n", ret);
-		return ret;
-	}
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	ret = regulator_enable(ctx->iovcc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(ctx->dev,
@@ -442,10 +438,18 @@ static int st7703_prepare(struct drm_panel *panel)
 		goto disable_vcc;
 	}
 
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-	usleep_range(20, 40);
+	ret = regulator_enable(ctx->vcc);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to enable vcc supply: %d\n", ret);
+		return ret;
+	}
+
+	/* Give power supplies time to stabilize before deasserting reset. */
+	usleep_range(10000, 20000);
+
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(20);
+	usleep_range(15000, 20000);
 
 	ctx->prepared = true;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
