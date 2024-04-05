Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE589ACE0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 22:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1788210F3E9;
	Sat,  6 Apr 2024 20:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JzIkAHPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36EA10E72C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 16:58:04 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6ecee5c08e6so2101812b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712336284; x=1712941084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VxOrpUcgWV1BIbN70ZBNYzAG96ZmcBy16Bx9JpTxO+Y=;
 b=JzIkAHPzAfS0wALxVQ+jGBntkDS0anTjiNlarXVElbGiW6TBuaWMWyYOZQoUjWs1F+
 IoUib4+TI0pk91IAA+yBtxwfF4Vs/rLa2V4Zxh9O7MUoNfKqiyAGWh/LksqWabNYArjP
 XC1Lth857A0FDHlpxyhwyTMnArObaewKPmR5BeKN+l8FdGtBY2ZP09HVjmhWHSUpwpO3
 aXZ3NhckzDkg0TYsSDPx2yHOIK8ZZkaCm5l01Jhks3kYwKoistS1jVsqQdzTAhXbjHZJ
 YCGx+reV+Q1nZ+FGj1OwKGCQGTm9o6BiYYHR1Sgxsfpibt0+o+YtynlCXfNmJBOkzBkL
 ipqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712336284; x=1712941084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxOrpUcgWV1BIbN70ZBNYzAG96ZmcBy16Bx9JpTxO+Y=;
 b=QD2IpeazqXE984g+rAxS9EcadNbQlLEpaofxsGlzKr8OEr4VszVmcwNp+3tIODpzRt
 zWV2VkqVh8rkC3OKcHgbiDccqAx4ByhNcuByX45Abkah7rIk4pFLznXIFeuHUk4rjc2n
 sVcdC2PIQq3JngnoBCHmGFSkYtTo/S+TfGg4hUQeMfuJxKxE0sz3ARe8fp1eClVxaU3N
 0+jDL6n18ezDENaigzUNDjTn6KV6SfcKw5CFLOfdea530RUvt1y/aJLUGqJ3IiLkhbTf
 uTyMABK3ZKC91XG7oBm8/6F9fI4RlHjudyNG+ZRqfiB6sVkFzEDVlThLXaAF74l3keCF
 +pMg==
X-Gm-Message-State: AOJu0YxbsrjP654lym69OTctXDvMD+8XqFKTYL6XWDGlZb8DKjX1CA2q
 UP16kcNfK8biu6egrWW8L/tQ588nSojEJt9uaylkryAKjlidldre
X-Google-Smtp-Source: AGHT+IF8+QcgSzXuJgKfFeVtRFmbVoLvx0pIjuAHQZQ5xpIO1ad1rxcl4fMvBNa0DNG870OGXhAphg==
X-Received: by 2002:a05:6a00:6508:b0:6ec:d950:fd59 with SMTP id
 hc8-20020a056a00650800b006ecd950fd59mr1796570pfb.29.1712336283914; 
 Fri, 05 Apr 2024 09:58:03 -0700 (PDT)
Received: from localhost.localdomain ([168.138.41.106])
 by smtp.gmail.com with ESMTPSA id
 c17-20020aa78c11000000b006ed0199bd57sm1447393pfd.177.2024.04.05.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 09:58:03 -0700 (PDT)
From: purofle <purofle@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org, purofle <purofle@gmail.com>
Subject: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Date: Sat,  6 Apr 2024 00:57:47 +0800
Message-ID: <20240405165747.93377-1-purofle@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Apr 2024 20:24:51 +0000
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

Some screen sizes using st7789v chips are different from 240x320,
and offsets need to be set to display all images properly.

Signed-off-by: purofle <purofle@gmail.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a15414..d47ab4262 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -30,6 +30,12 @@
 
 #define HSD20_IPS 1
 
+#define WIDTH 240
+#define HEIGHT 320
+
+#define LEFT_OFFSET 0
+#define TOP_OFFSET 0
+
 /**
  * enum st7789v_command - ST7789V display controller commands
  *
@@ -349,6 +355,21 @@ static int set_gamma(struct fbtft_par *par, u32 *curves)
 	return 0;
 }
 
+static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
+{
+	unsigned int x = xs + TOP_OFFSET, y = xe + TOP_OFFSET;
+
+	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS, (x >> 8) & 0xFF, xs & 0xFF,
+		  (y >> 8) & 0xFF, xe & 0xFF);
+
+	x = ys + LEFT_OFFSET, y = ye + LEFT_OFFSET;
+
+	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS, (x >> 8) & 0xFF, ys & 0xFF,
+		  (y >> 8) & 0xFF, ye & 0xFF);
+
+	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
+}
+
 /**
  * blank() - blank the display
  *
@@ -379,6 +400,7 @@ static struct fbtft_display display = {
 		.set_var = set_var,
 		.set_gamma = set_gamma,
 		.blank = blank,
+		.set_addr_win = set_addr_win,
 	},
 };
 
-- 
2.44.0

