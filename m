Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72508693945
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB05810E412;
	Sun, 12 Feb 2023 18:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Sat, 11 Feb 2023 17:25:24 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5712610E345
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 17:25:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4PDckT72HJz9sTR;
 Sat, 11 Feb 2023 18:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676135890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmPdZlycIN75f7vuovHWz+/2BHjIn41XrnOla1taexs=;
 b=GYrpv1AUe7sTIk2cvOrNsK752yR8v7HrvOlN92yTHSCSc4EWa5UIJD34xk7rbZRrW8bfIY
 yuBpn1D1QwG3+CAzHienzwaJa7T0GbfQ4WDub7xedHFxOqDO+ROJbhIT3JBzozZSK1TcCQ
 7uhgTQaMqcdq3Fs5E8JuR0wzTzR6owIkT3di5jZU6WFH+YnWQDC3JBRsa1v1R0EsJ3pe+H
 FE14BzPb4sesD1iZDRXNiUwxlWTin5aeyDQic6aEu+NJ6GDR0FwPZfoZWHG/bgbg9doNZm
 YmjL2ZjU75t12b5UgiYz8zxSPPshHHoh0U3L2ct4lC2iF1nToBb2M/sDMNJ0bw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] drm/panel: st7703: Pick different reset sequence
Date: Sat, 11 Feb 2023 18:17:48 +0100
Message-Id: <20230211171748.36692-2-frank@oltmanns.dev>
In-Reply-To: <20230211171748.36692-1-frank@oltmanns.dev>
References: <20230211171748.36692-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PDckT72HJz9sTR
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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
Cc: Ondrej Jirman <megi@xff.cz>, Frank Oltmanns <frank@oltmanns.dev>,
 Samuel Holland <samuel@sholland.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ondrej Jirman <megi@xff.cz>

Switching to a different reset sequence, enabling IOVCC before enabling
VCC.

There also needs to be a delay after enabling the supplies and before
deasserting the reset. The datasheet specifies 1ms after the supplies
reach the required voltage. Use 10-20ms to also give the power supplies
some time to reach the required voltage, too.

This fixes intermittent panel initialization failures and screen
corruption during resume from sleep on panel xingbangda,xbd599 (e.g.
used in PinePhone).

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
Reported-by: Samuel Holland <samuel@sholland.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..45695aa51f62 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -411,29 +411,30 @@ static int st7703_prepare(struct drm_panel *panel)
 		return 0;
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
-	ret = regulator_enable(ctx->vcc);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	ret = regulator_enable(ctx->iovcc);
 	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
+		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
 		return ret;
 	}
-	ret = regulator_enable(ctx->iovcc);
+
+	ret = regulator_enable(ctx->vcc);
 	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
-		goto disable_vcc;
+		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
+		regulator_disable(ctx->iovcc);
+		return ret;
 	}
 
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-	usleep_range(20, 40);
+	/* Give power supplies time to stabilize before deasserting reset. */
+	usleep_range(10000, 20000);
+
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(20);
+	usleep_range(15000, 20000);
 
 	ctx->prepared = true;
 
 	return 0;
-
-disable_vcc:
-	regulator_disable(ctx->vcc);
-	return ret;
 }
 
 static const u32 mantix_bus_formats[] = {
-- 
2.39.1

