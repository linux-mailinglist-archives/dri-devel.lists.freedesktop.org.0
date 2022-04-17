Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E352B50484E
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 18:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDAF10E0B6;
	Sun, 17 Apr 2022 16:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Sun, 17 Apr 2022 16:25:41 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B2B10E0B6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 16:25:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 107)
 id 2E5C668D06; Sun, 17 Apr 2022 18:16:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on verein.lst.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_50
 autolearn=disabled version=3.3.1
Received: from blackhole (p5b0d8d05.dip0.t-ipconnect.de [91.13.141.5])
 by verein.lst.de (Postfix) with ESMTPSA id 6412A67373;
 Sun, 17 Apr 2022 18:15:43 +0200 (CEST)
Date: Sun, 17 Apr 2022 18:15:38 +0200
From: Torsten Duwe <duwe@lst.de>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: fix anx6345 power up sequence
Message-ID: <20220417181538.57fa1303@blackhole>
Organization: LST e.V.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 stable@vger.kernel.org, Harald Geyer <harald@ccbib.org>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Align the power-up sequence with the known-good procedure documented in [1]:
un-swap dvdd12 and dvdd25, and allow a little extra time for them to settle
before de-asserting reset.
Fixes: 6aa192698089b ("drm/bridge: Add Analogix anx6345 support")

[1] https://github.com/OLIMEX/DIY-LAPTOP/blob/master/
HARDWARE/A64-TERES/TERES-PCB1-A64-MAIN/Rev.C/TERES_PCB1-A64-MAIN_Rev.C.pdf
(page 5, blue comment down left)

Reported-by: Harald Geyer <harald@ccbib.org>
Signed-off-by: Torsten Duwe <duwe@lst.de>
Cc: stable@vger.kernel.org

---

This fixes the problem that e.g. X screensaver turns the screen black,
and it stays black until the next reboot; definitely on the Teres-I,
probably on the pinebook64, too.

--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -309,27 +309,27 @@ static void anx6345_poweron(struct anx63
 	gpiod_set_value_cansleep(anx6345->gpiod_reset, 1);
 	usleep_range(1000, 2000);
 
-	err = regulator_enable(anx6345->dvdd12);
+	err = regulator_enable(anx6345->dvdd25);
 	if (err) {
-		DRM_ERROR("Failed to enable dvdd12 regulator: %d\n",
+		DRM_ERROR("Failed to enable dvdd25 regulator: %d\n",
 			  err);
 		return;
 	}
 
-	/* T1 - delay between VDD12 and VDD25 should be 0-2ms */
+	/* T1 - delay between VDD25 and VDD12 should be 0-2ms */
 	usleep_range(1000, 2000);
 
-	err = regulator_enable(anx6345->dvdd25);
+	err = regulator_enable(anx6345->dvdd12);
 	if (err) {
-		DRM_ERROR("Failed to enable dvdd25 regulator: %d\n",
+		DRM_ERROR("Failed to enable dvdd12 regulator: %d\n",
 			  err);
 		return;
 	}
 
 	/* T2 - delay between RESETN and all power rail stable,
-	 * should be 2-5ms
+	 * should be at least 2-5ms, 10ms to be safe.
 	 */
-	usleep_range(2000, 5000);
+	usleep_range(9000, 11000);
 
 	gpiod_set_value_cansleep(anx6345->gpiod_reset, 0);
 
