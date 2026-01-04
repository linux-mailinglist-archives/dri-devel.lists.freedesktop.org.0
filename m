Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49DCF0E36
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 13:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161F910E28A;
	Sun,  4 Jan 2026 12:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c7XL3UAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D339A10E042
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 11:07:00 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c075ec1a58aso7550517a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 03:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767524820; x=1768129620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8buk09gLSh11LVEaXhuV14UfJjZO5sV2eu2MPf5Bj8=;
 b=c7XL3UAiyIUPGw1qUFnjl6ep0/6Fekexak5CVWnnU/w3AYcjazRf6hdasWjwA5xPZJ
 z0Fo9YgTtaBDEv9vGB21AK5zckv2yimXg5iSZGT++qpiwj5esiZtZug0qePEJfGAhI/T
 bRDT96/Lq9H6q92YoYB/jz8X9T1QqsgQcQh/r0qT7O7VbaBYSaVPMnU1HDtwUI4tl+Df
 lQk21NynQFRxce/0RQ5hXN7r8E80aagzGD5SY42O9aKvOJ48Cx/9ha3G7cxxrj5ZOPKB
 E92NeBNUpca20qp5XJ+iMtPblJ3+E+zvrmyJVYaLmqoem/yBlazb6ay8i0CVDlTh9j9u
 qiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767524820; x=1768129620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a8buk09gLSh11LVEaXhuV14UfJjZO5sV2eu2MPf5Bj8=;
 b=Tzd1RzLp0D0LvaWYMa/XOKlvPBUpHYyg+tz2C9kDxroseKTyZSDEwsXLBXNSkhY4YN
 8+qOcMEhRyJtwDBKkZaTKIuRk0zdVL4D+H3P7pH2P3v0d7eC7zznQPPzPetE9l6+jW0B
 i8ficsOsqiwyHIRtyL2Z0C03CisrSnfLKnJIpM+P+NFsLOoXFZ6zMkMQ8HBzQpz+U4rv
 vg0zXtl7J/ucr+mrtRF+MslCZQqAeg2mUNiETUtKfxLRLx5RwywB7ajhqW7seYQk9xjN
 OXCK4Hjg9BU7QvMKHW7oFId0BRw8W2InNJmj/wD+OI1h8v4cW8UlUwe29WE/1g4JfTjj
 GfGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCW2CCsRwczS4rgR8bTvmCvMfBbetiy/wNvVAAgsV9W8wvxP2yu8AtSBdhCtsZ85HHFXJyiqckxAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJfVX/SQPKrw368IdXwQ/LIfOZcblkCC+6di3HgKOqJgk3r+5S
 Xnf++ihvJIMhvq+HjocpDFNPKvc20DiM2G8bjrFb6xsgZcGKlNZQ+Bcr
X-Gm-Gg: AY/fxX6KGm8XiiZkcaXgPA8awn0e8Q5aaRTFftLuabMFU3q1P2nN2+QNLZ2itpbRmbG
 OwJLfcgKZFHxZb50cS+Jvo0WWLJRAFB3cExLdw7RREuJLWs1MzLI5Z82xpy/+emHVaOFc8JmM5z
 F9EZFHjfvZJzor4ApWficeCjtlEEO8BW1TmPC2sTUAQmmxmaq/AChIbRGlcYgAMHm2ECjwptjSn
 dY2k989aG60Kk8WXE6AhgoOYnlP5G0cj67VBBEmflXZ0Gzf6BtYRqIDEMCkKBx1mMf+RaYsUUn5
 /u2V8LoKwGj69twIDrvtFvY1/D4DH5x7d9VZXCkSV0qQxHD9qSSTzWOhzNa8ievK13HgsHWbQjE
 aHY3VIjNU+kI1Q19m4aoN4rGxeRb2OogIUxhiU9e/RzfyiwpSsyKc1uK1u96dC7SvGBRLLiaMYG
 V3LOJMp+xeQ7NP758gCCHEu64zKiHWGkjpGXuuSlhWV6gfnuFjaSVf9503dIBkaIESXLTD1ekRn
 wVevbQfj7Q=
X-Google-Smtp-Source: AGHT+IEG7AhWv3k0U6Uxjf929Ja2jLSdUI1edkCr+Jls8BEFxccZF/h5EZO5GMeycslKnhnu+WhPSA==
X-Received: by 2002:a05:7300:de07:b0:2ae:51ae:5cf3 with SMTP id
 5a478bee46e88-2b05ebd0d80mr34290611eec.6.1767524820215; 
 Sun, 04 Jan 2026 03:07:00 -0800 (PST)
Received: from ubuntu-linux-2404..
 (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 03:06:59 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 2/4] staging: fbtft: ssd1351: send gamma table via
 fbtft_write_buf_dc()
Date: Sun,  4 Jan 2026 19:06:36 +0800
Message-ID: <20260104110638.532615-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 04 Jan 2026 12:11:35 +0000
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

Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=1024)
due to the large write_reg() call emitting 63 gamma bytes via varargs.

Send the command byte (0xB8) and the gamma payload using
fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fb_ssd1351.c | 35 +++++++++++++-----------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..b4ab2c81e528 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -119,43 +119,38 @@ static int set_var(struct fbtft_par *par)
  */
 static int set_gamma(struct fbtft_par *par, u32 *curves)
 {
-	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
+	u8 data[GAMMA_LEN];
+	u8 cmd = 0xB8;
 	int i, acc = 0;
+	int ret;
 
-	for (i = 0; i < 63; i++) {
+	for (i = 0; i < GAMMA_LEN; i++) {
 		if (i > 0 && curves[i] < 2) {
 			dev_err(par->info->device,
 				"Illegal value in Grayscale Lookup Table at index %d : %d. Must be greater than 1\n",
 				i, curves[i]);
 			return -EINVAL;
 		}
+
 		acc += curves[i];
-		tmp[i] = acc;
+
 		if (acc > 180) {
 			dev_err(par->info->device,
 				"Illegal value(s) in Grayscale Lookup Table. At index=%d : %d, the accumulated value has exceeded 180\n",
 				i, acc);
 			return -EINVAL;
 		}
+
+		data[i] = acc;
 	}
 
-	write_reg(par, 0xB8,
-		  tmp[0],  tmp[1],  tmp[2],  tmp[3],
-		  tmp[4],  tmp[5],  tmp[6],  tmp[7],
-		  tmp[8],  tmp[9],  tmp[10], tmp[11],
-		  tmp[12], tmp[13], tmp[14], tmp[15],
-		  tmp[16], tmp[17], tmp[18], tmp[19],
-		  tmp[20], tmp[21], tmp[22], tmp[23],
-		  tmp[24], tmp[25], tmp[26], tmp[27],
-		  tmp[28], tmp[29], tmp[30], tmp[31],
-		  tmp[32], tmp[33], tmp[34], tmp[35],
-		  tmp[36], tmp[37], tmp[38], tmp[39],
-		  tmp[40], tmp[41], tmp[42], tmp[43],
-		  tmp[44], tmp[45], tmp[46], tmp[47],
-		  tmp[48], tmp[49], tmp[50], tmp[51],
-		  tmp[52], tmp[53], tmp[54], tmp[55],
-		  tmp[56], tmp[57], tmp[58], tmp[59],
-		  tmp[60], tmp[61], tmp[62]);
+	ret = fbtft_write_buf_dc(par, &cmd, 1, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = fbtft_write_buf_dc(par, data, sizeof(data), 1);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

