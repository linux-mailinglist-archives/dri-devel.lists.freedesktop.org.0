Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012E1FA993
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1CE6E184;
	Tue, 16 Jun 2020 07:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B3889E06
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=zy9ju7B6YlDDHE
 ooLxFkrGU+ZF5mtEjzYhXAsCLKff0=; b=ZJzgOZhC1+clVG+dYzuwHLtkuNQiVP
 8i/w8ENmpvV/PkIYUiMSd68dh45K9gwwZez+JRqlsGtwiuOBU5JQmHZ6QSeJyN5n
 voFrkUqBaQUygGoB3q3sAiJ4H98h2X9CmuN33PdjVxtzISc5SM4r00MoqHF1aF3M
 /HY0LWJP5rrHY=
Received: (qmail 989253 invoked from network); 15 Jun 2020 09:58:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 15 Jun 2020 09:58:29 +0200
X-UD-Smtp-Session: l3s3148p1@FhXZyhqoDrYgAwDPXwRdAFnN6pRlEuNX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 4/6] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Date: Mon, 15 Jun 2020 09:58:13 +0200
Message-Id: <20200615075816.2848-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

I'd like to push it via I2C for 5.8-rc2.

 drivers/video/backlight/tosa_lcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
index e8ab583e5098..113116d3585c 100644
--- a/drivers/video/backlight/tosa_lcd.c
+++ b/drivers/video/backlight/tosa_lcd.c
@@ -107,7 +107,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
 	/* TG LCD GVSS */
 	tosa_tg_send(spi, TG_PINICTL, 0x0);
 
-	if (!data->i2c) {
+	if (IS_ERR_OR_NULL(data->i2c)) {
 		/*
 		 * after the pannel is powered up the first time,
 		 * we can access the i2c bus so probe for the DAC
@@ -119,7 +119,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
 			.addr	= DAC_BASE,
 			.platform_data = data->spi,
 		};
-		data->i2c = i2c_new_device(adap, &info);
+		data->i2c = i2c_new_client_device(adap, &info);
 	}
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
