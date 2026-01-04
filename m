Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765B4CF0E39
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 13:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0010E2AC;
	Sun,  4 Jan 2026 12:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e2/SiSZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E185E10E042
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 11:07:09 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c026e074373so12688316a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 03:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767524829; x=1768129629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQ+bmRezJcYlWiXwjZzWnf7vKwJcfmfzRPaQmAd80kQ=;
 b=e2/SiSZbtK8FmBl9YbxblqLs59xywZY38b642xH3nHuPSEU9M1tvPvcb6A8eH7c48Z
 vd5V+PWttOQD1JAdYtcd+9STKV4TsY914VCnoHSeo4ioJHFt4QHc0jfkzZbvpPB5ofQW
 61JQUsquWp4UwfBUG/usIOWeXJ04dRW/3W1NKOZYtgoH4KFvV6valKN7Z85GlcXKb0On
 9gKfEwwNwmnDRLHZk1vSFWXgw1u2YSkW/qvhSsonwGDV5O0/a8noUrISe6qhL6tGuqQq
 MUo1DHcuSQRrH3rABgQ0J223NbScnVsTV1VAqc3wRXOoWauCjpPfqXrNdN1xC/wCJ39D
 TZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767524829; x=1768129629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cQ+bmRezJcYlWiXwjZzWnf7vKwJcfmfzRPaQmAd80kQ=;
 b=xTRQmBEH/Kv34++MDbFrWS2B73Pwkkx+Yw/gFb483JmtWdKaaI64iRQBL3MoPjRSYq
 9yO2fRpcXjLNsWWgoPEJ0kZpFbU20RphwOgH5V/HHMkVFlVj3pcYSWkQloCXaxmMsebu
 ciVv5HdkTgPLSkyPed8/KAAZ1NUGOAMzowKfOOoHjJoEGJ9Vj7OSoSQXW12himSyuKJv
 RPTGIMn1bk/6iQIQ0JiJ1o2I40ZAh5h0n1TwXXEvRC8chYdiS6ZNCic9vZcvjpu8ilkH
 NHQ7UC483AHjE7MfhoobZgeYbWtBZ7bFeyZD4oRgjrnuqoqCwcJUihXEy56vFGjHyLNt
 GDyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8+zBrCzJ7QTjKHNEgD24k4Tg6pu8t4XY5jcvvIHJfz+MvFO8TybNaEpda23YAD8GtA6fuC6MNPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyba30XI9T4V5tUUe78d1Lja+r7f/hCtWpIFCRGy1UlCzZyyYDj
 MMmAUQL4cPvrLM6e2ZddUbEjV6LVDwMfD3a/c3r3oew10KVCypz3CBFy
X-Gm-Gg: AY/fxX4ThO6v4YvR7rgCXg1Uap0cLHcnNW8CrJIdG3K8g0yNcPUDyM7s7G3OHVeQZ/0
 MWSdqTB+TajrSkTsHjlKY3Ebt0ZNTE06tnQYwcv/Ar52PNd32ZwkoVu1RRH9XE9nDhOxng7ND/8
 NwQMBIAlkQrTDqZWpYQLpbxb/hZNBoD0RZz17xfYG4V40SYWVPTpNmUmgqGuzdR0VELVFWh+sKI
 b8NizU6WJdlQCiTzP4QtjAAlva14gxrtYJaI7ttDtwgDd3MolsAWRTdndZbIDpmAaMvEyQgbgsn
 E3VjotMiRDoJef4Z4JRau52TS0abDcRpYqwgurKGj/zeS+JgIef05/urqNzanl8eoantOHNFSds
 oAdnOTztZ2t+/lCBXWys38nocbdrZA4HhIzT6HaWs9ziy6SF6To+TOvTL+DmPqJ12PajoTs2dkF
 OEGSd8EpPsg6/FCBqMrxqhl9c35hZF+YKcCSibhVpy3hovtO34UJ+UjgfqLrOLmClEOnfquRqCI
 s3rPkZKV8s=
X-Google-Smtp-Source: AGHT+IHIyNwefXI8MXb93W36SvT36uYIbrNX+u5iv7qHaTdpUR4A5CUQ4/hnB+XYTX2Eg+hORueIMw==
X-Received: by 2002:a05:7301:a2a:b0:2ab:f56e:bea6 with SMTP id
 5a478bee46e88-2b05ecb3987mr27224194eec.39.1767524829190; 
 Sun, 04 Jan 2026 03:07:09 -0800 (PST)
Received: from ubuntu-linux-2404..
 (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 03:07:08 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 3/4] staging: fbtft: ssd1331: send gamma table via
 fbtft_write_buf_dc()
Date: Sun,  4 Jan 2026 19:06:37 +0800
Message-ID: <20260104110638.532615-4-sun.jian.kdev@gmail.com>
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
because write_reg() expands into a large varargs call and triggers
NUMARGS((int[]){...}) stack allocation.

Use fbtft_write_buf_dc() to send the command byte (0xB8) and the gamma
payload as a buffer.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fb_ssd1331.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1331.c b/drivers/staging/fbtft/fb_ssd1331.c
index 06b7056d6c71..cbe10f191f5b 100644
--- a/drivers/staging/fbtft/fb_ssd1331.c
+++ b/drivers/staging/fbtft/fb_ssd1331.c
@@ -130,37 +130,38 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
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
 				"Illegal value in Grayscale Lookup Table at index %d. Must be greater than 1\n",
 				i);
 			return -EINVAL;
 		}
+
 		acc += curves[i];
-		tmp[i] = acc;
+
 		if (acc > 180) {
 			dev_err(par->info->device,
 				"Illegal value(s) in Grayscale Lookup Table. At index=%d, the accumulated value has exceeded 180\n",
 				i);
 			return -EINVAL;
 		}
+
+		data[i] = acc;
 	}
 
-	write_reg(par, 0xB8,
-		  tmp[0], tmp[1], tmp[2], tmp[3], tmp[4], tmp[5], tmp[6],
-		  tmp[7], tmp[8], tmp[9], tmp[10], tmp[11], tmp[12], tmp[13],
-		  tmp[14], tmp[15], tmp[16], tmp[17], tmp[18], tmp[19], tmp[20],
-		  tmp[21], tmp[22], tmp[23], tmp[24], tmp[25], tmp[26],	tmp[27],
-		  tmp[28], tmp[29], tmp[30], tmp[31], tmp[32], tmp[33], tmp[34],
-		  tmp[35], tmp[36], tmp[37], tmp[38], tmp[39], tmp[40], tmp[41],
-		  tmp[42], tmp[43], tmp[44], tmp[45], tmp[46], tmp[47], tmp[48],
-		  tmp[49], tmp[50], tmp[51], tmp[52], tmp[53], tmp[54], tmp[55],
-		  tmp[56], tmp[57], tmp[58], tmp[59], tmp[60], tmp[61],
-		  tmp[62]);
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

