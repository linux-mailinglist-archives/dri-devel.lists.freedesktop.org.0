Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84858A8803
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 17:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F86113642;
	Wed, 17 Apr 2024 15:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="VdFQaN+T";
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="YcFckcCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Wed, 17 Apr 2024 15:46:20 UTC
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C5F113644
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 15:46:20 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rx7Fh-g2w585-0L
 for dri-devel@lists.freedesktop.org; Wed, 17 Apr 2024 15:31:13 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Wed, 17 Apr 2024 17:31:10 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1 1/1] backlight: mp3309c: fix leds flickering in pwm mode
Date: Wed, 17 Apr 2024 17:31:05 +0200
Message-Id: <20240417153105.1794134-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417153105.1794134-1-f.suligoi@asem.it>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Apr 2024 15:31:10.0483 (UTC)
 FILETIME=[46242630:01DA90DC]
X-smtpcorp-track: 1rx7Fhg2w5850L.HztjDgdvMCLY2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713367877; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=Mli724MJChjXz9R7/aUL8LJ/Vf3NE+VV4VaVeAU9T0g=;
 b=VdFQaN+TgMFBMRANektYvO0NeR1HCAus5Z+QK02StJcOYJ5iMSeg2p/PFnrcqNO8sSQ9B
 K0Es3k+QJnFZDzS+F9Ji0yB62719EdTqzj2RLiynTnvQWRF00AybRKXMy8DqXuU+KhpraNb
 L+X9FJQCzehXJq5KUwFy5EDN2HtUoyzSsuzy/vYxl6goLjew6E4oviIJgjVteX30zMrph7f
 oZq0rJQtUk68Qsk0/ZXEvXJFv2mTC5uQjj4eMREbSPDxsh2nZVNcx98bSxqlUumfiLdBTbz
 MpFr1dpbnwVMGefsJNJXoXTT1UPxWZ53QWytDAKvRypqdHD4wdiIWVIcIJwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713367877; h=from : subject : to
 : message-id : date; bh=Mli724MJChjXz9R7/aUL8LJ/Vf3NE+VV4VaVeAU9T0g=;
 b=YcFckcCs/sNSjjWNaOnsfKei2wuVdC2vEBlcTJz6PnOn76ugnXHtOsLDgi42Msk1beUVu
 kHYEROa+ccdg8h3wEYsmRMcFn0w/N0Tx/n7w5S+qM1svCGfcvTQYE84JVkdsMSt4C6MyjdU
 +XQaFF8p5TZEJSBD0R9e2JM8fodfqtnGZTCohtc/TqbmVUQkPg6JnpJEiJKsmJiAYRt9bXY
 u6ZvpRi/GLYXtXUV3lZ9t8enzlPBehPBsAVVMheAQWw4BY4UKB7iK+kiyaKiCdNEhqPN4n1
 LYyuYewSZs/6WKHLSyp6oCgbFPoC0/IxKsIhHCTNWksfUP4gz24+XfmdphLg==
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

The mp3309 has two configuration registers, named according to their
address (0x00 and 0x01).
In the second register (0x01), the bit DIMS (Dimming Mode Select) must
be always 0 (zero), in both analog (via i2c commands) and pwm dimming
mode.

In the initial driver version, the DIMS bit was set in pwm mode and
reset in analog mode.
But if the DIMS bit is set in pwm dimming mode and other devices are
connected on the same i2c bus, every i2c commands on the bus generates a
flickering on the LEDs powered by the mp3309c.

This change concerns the chip initialization and does not impact any
existing device-tree configuration.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/video/backlight/mp3309c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 016c1296841c..a28036c964af 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -97,15 +97,10 @@ static int mp3309c_enable_device(struct mp3309c_chip *chip)
 
 	/*
 	 * I2C register #1 - Set working mode:
-	 *  - set one of the two dimming mode:
-	 *    - PWM dimming using an external PWM dimming signal
-	 *    - analog dimming using I2C commands
 	 *  - enable/disable synchronous mode
 	 *  - set overvoltage protection (OVP)
 	 */
 	reg_val = 0x00;
-	if (chip->pdata->dimming_mode == DIMMING_PWM)
-		reg_val |= REG_I2C_1_DIMS;
 	if (chip->pdata->sync_mode)
 		reg_val |= REG_I2C_1_SYNC;
 	reg_val |= chip->pdata->over_voltage_protection;
-- 
2.34.1

