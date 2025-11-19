Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDAC7182D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6DD10E6BA;
	Thu, 20 Nov 2025 00:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="Qewk2moV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB5110E583
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:56:31 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 1D227240101
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1763535081; bh=vsxrHDXrR0hlNrOfBkegK6AEbQHfAd1IlItoosvRt2Y=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=Qewk2moVrAhmisUw4id+gzcdIQZAzFBlZhw0YfUBHWjxR/JaHLZcFaoA0mEhD/HOu
 StJpr+9W5WIohIvq1Ro34oQw1Q/Ov0pX/clBklYanBGl2KTeK+HmPDH6Lz4yBFJCMp
 6oRZeAv/1WmgjeutpSpqwH6NSQBpI022AGax7UeESvPJjdMaM175Xi9Hz8xqJOE6Ze
 acJVUgti6n7qjk3GSI8JLCEAkJGp3XiNtnZwVx0gph2O64tJ8NDqN+zJBgYzr0l9dg
 P0cCD9d4wvRcJ1cwMIyaur5Z4h2Tdb01W1JCpDMdaBTle8gZ2Nb3HcxkFAwD1DIdTO
 W2DEzSq5eYSVw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4dBBw75zwgz6v1Z;
 Wed, 19 Nov 2025 07:51:19 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [RFC 3/4] hack: Input: edt-ft5x06: hackery to probe after panel
Date: Wed, 19 Nov 2025 06:51:20 +0000
Message-ID: <20251119065109.910251-4-martink@posteo.de>
In-Reply-To: <20251119065109.910251-1-martink@posteo.de>
References: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

From: Guido Günther <agx@sigxcpu.org>

With other probing issues out of the way (by marking LCD_1V8 always on)
it turns out we can't use either touch or DSI until we pulled both RESX
and TP_RSTN¹ so instead of guessing wait until the panel is up.

This replaces one hack (probe defers) by another (more reliable) one.

¹) This appeared to be otherwise since even a failed probe of the touch
controller (happening way too early before avdd/avee are up) is enough
and thaat only became appearend when not loading the touch controller
module at all.

Signed-off-by: Guido Günther <agx@sigxcpu.org>

When the (temporary) DT property "purism,panel-touchscreen-workaround"
is found, wait for the mantix panel to be prepared, before continuing
in probe().
---
 drivers/input/touchscreen/edt-ft5x06.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2a27750c76444..3084ae5fc320a 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -14,6 +14,8 @@
  *    http://www.glyn.com/Products/Displays
  */
 
+#define DEBUG
+
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -964,6 +966,9 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 			snprintf(model_name, EDT_NAME_LEN,
 				 "EVERVISION-FT5726NEi");
 			break;
+		case 0x02:   /* FT 8506 */
+			snprintf(model_name, EDT_NAME_LEN, "Focaltec FT8006P");
+			break;
 		default:
 			snprintf(model_name, EDT_NAME_LEN,
 				 "generic ft5x06 (%02x)",
@@ -1136,6 +1141,8 @@ static void edt_ft5x06_disable_regulators(void *arg)
 	regulator_disable(data->iovcc);
 }
 
+bool mantix_panel_prepared(void);
+
 static int edt_ft5x06_ts_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -1147,6 +1154,18 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	int error;
 	u32 report_rate;
 
+	if (device_property_read_bool(&client->dev,
+				      "purism,panel-librem5-workaround")) {
+		/*
+		 * Since the Librem 5's panel handles the reset via gpio we
+		 * need to wait until the panel is up.
+		 */
+		if (!mantix_panel_prepared()) {
+			dev_dbg(&client->dev, "Panel not yet ready\n");
+			return -EPROBE_DEFER;
+		}
+	}
+
 	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
 
 	tsdata = devm_kzalloc(&client->dev, sizeof(*tsdata), GFP_KERNEL);
-- 
2.47.3

