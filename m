Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E229BC27
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AED89A56;
	Tue, 27 Oct 2020 16:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CB89A56
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:35:00 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id x10so1023493plm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JV1M0R7sWTwTaaTkoEKbUlOKfWUaHbnqWovJ8v04zgY=;
 b=LMHjd1bXvxd/bYn3jQmks6hvgVo+OtZFs74VifFB5zMBrW+G/m/37gxW7gqHKfxrA6
 yJQFgwF3eaRElSOAhthTo03OanMfOHiQX6RCpVdy4LwPxz3EnKAa31DFa34SusBi2aI0
 zy5ZT8WGKaQXKMOlKyU8tRXdAJwufN0MV769En/puhxsBvBlMNlDe5Lb8vA6a7SaPJOm
 ih7jNr24tlWHAmEPmtlih78gA2UwFBuPazJ2PNLSB2vgvVyyUtbAG3Ud4QdmGuBal8XV
 9w5ZRbyEbYuuUBoIqQJK3PIpihE05h8VB/KbWAkYLOJeODft1YNz5wnUR/BkOUHIQrnS
 WbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JV1M0R7sWTwTaaTkoEKbUlOKfWUaHbnqWovJ8v04zgY=;
 b=uNYYD4l1Vw+p9pV0gXRXtLICifP1ETCMKa3ix0jfjHOPPyjBG4yNn4ZqQ4p7hqG/cr
 d4fZ7r+RUpEpuE54SofetVpoWLBWChE8wjy3mscz8Fz6VXUOmrBuc9kskg1HwNSlyHyt
 o9qdkOgOm0xoLH3hdttBNYpeZvIxm4IEpaJ/vwgqM/jyKQllORCbpbEf7QohfC4jLCmI
 bVi+BDlN2uDTBLk2fv6EY3bo/InPgSYeQvekjdTc0cjL4vlIVE8BsH/2pSXvtFhVpOL0
 gvrxNLefd5/H1i4PMiLYPMwNr3tQkU8Bo2J7ywmZ1fZo35ax28KM2b6nE0CDztxvETO4
 LQBQ==
X-Gm-Message-State: AOAM5313f7tO7DFdkQtiBfG5kSDj/IlOqnmcXNYujb0DHbwQW7YXd6gY
 XRSCNVZDPGBM47plzo8mFw==
X-Google-Smtp-Source: ABdhPJyEjq05U32jyEROhfVB6XyfMyFibm4+eFMt9raWj+UiSFhzYCjPwf3NticHJ73BlYSftN0rqw==
X-Received: by 2002:a17:902:c254:b029:d4:c2d4:15f with SMTP id
 20-20020a170902c254b02900d4c2d4015fmr3428064plg.18.1603816500347; 
 Tue, 27 Oct 2020 09:35:00 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id 20sm2785308pfh.219.2020.10.27.09.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:34:59 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/5] Fonts: Add charcount field to font_desc
Date: Tue, 27 Oct 2020 12:34:26 -0400
Message-Id: <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subsystems are assuming the number of characters of our built-in fonts.
Include that information in our kernel font descriptor, `struct
font_desc`.

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 include/linux/font.h       | 1 +
 lib/fonts/font_10x18.c     | 1 +
 lib/fonts/font_6x10.c      | 1 +
 lib/fonts/font_6x11.c      | 1 +
 lib/fonts/font_6x8.c       | 1 +
 lib/fonts/font_7x14.c      | 1 +
 lib/fonts/font_8x16.c      | 1 +
 lib/fonts/font_8x8.c       | 1 +
 lib/fonts/font_acorn_8x8.c | 1 +
 lib/fonts/font_mini_4x6.c  | 1 +
 lib/fonts/font_pearl_8x8.c | 1 +
 lib/fonts/font_sun12x22.c  | 1 +
 lib/fonts/font_sun8x16.c   | 1 +
 lib/fonts/font_ter16x32.c  | 1 +
 14 files changed, 14 insertions(+)

diff --git a/include/linux/font.h b/include/linux/font.h
index 4f50d736ea72..abf1442ce719 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -17,6 +17,7 @@ struct font_desc {
     int idx;
     const char *name;
     unsigned int width, height;
+    unsigned int charcount;
     const void *data;
     int pref;
 };
diff --git a/lib/fonts/font_10x18.c b/lib/fonts/font_10x18.c
index 0e2deac97da0..4096c6562494 100644
--- a/lib/fonts/font_10x18.c
+++ b/lib/fonts/font_10x18.c
@@ -5137,6 +5137,7 @@ const struct font_desc font_10x18 = {
 	.name	= "10x18",
 	.width	= 10,
 	.height	= 18,
+	.charcount = 256,
 	.data	= fontdata_10x18.data,
 #ifdef __sparc__
 	.pref	= 5,
diff --git a/lib/fonts/font_6x10.c b/lib/fonts/font_6x10.c
index 87da8acd07db..32786674cf65 100644
--- a/lib/fonts/font_6x10.c
+++ b/lib/fonts/font_6x10.c
@@ -3083,6 +3083,7 @@ const struct font_desc font_6x10 = {
 	.name	= "6x10",
 	.width	= 6,
 	.height	= 10,
+	.charcount = 256,
 	.data	= fontdata_6x10.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_6x11.c b/lib/fonts/font_6x11.c
index 5e975dfa10a5..81e4a3aed44a 100644
--- a/lib/fonts/font_6x11.c
+++ b/lib/fonts/font_6x11.c
@@ -3346,6 +3346,7 @@ const struct font_desc font_vga_6x11 = {
 	.name	= "ProFont6x11",
 	.width	= 6,
 	.height	= 11,
+	.charcount = 256,
 	.data	= fontdata_6x11.data,
 	/* Try avoiding this font if possible unless on MAC */
 	.pref	= -2000,
diff --git a/lib/fonts/font_6x8.c b/lib/fonts/font_6x8.c
index 700039a9ceae..5618ae7ef9fa 100644
--- a/lib/fonts/font_6x8.c
+++ b/lib/fonts/font_6x8.c
@@ -2571,6 +2571,7 @@ const struct font_desc font_6x8 = {
 	.name	= "6x8",
 	.width	= 6,
 	.height	= 8,
+	.charcount = 256,
 	.data	= fontdata_6x8.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_7x14.c b/lib/fonts/font_7x14.c
index 86d298f38505..7708e73d491f 100644
--- a/lib/fonts/font_7x14.c
+++ b/lib/fonts/font_7x14.c
@@ -4113,6 +4113,7 @@ const struct font_desc font_7x14 = {
 	.name	= "7x14",
 	.width	= 7,
 	.height	= 14,
+	.charcount = 256,
 	.data	= fontdata_7x14.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_8x16.c b/lib/fonts/font_8x16.c
index 37cedd36ca5e..74125d3570cf 100644
--- a/lib/fonts/font_8x16.c
+++ b/lib/fonts/font_8x16.c
@@ -4627,6 +4627,7 @@ const struct font_desc font_vga_8x16 = {
 	.name	= "VGA8x16",
 	.width	= 8,
 	.height	= 16,
+	.charcount = 256,
 	.data	= fontdata_8x16.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_8x8.c b/lib/fonts/font_8x8.c
index 8ab695538395..96da4bb31ae4 100644
--- a/lib/fonts/font_8x8.c
+++ b/lib/fonts/font_8x8.c
@@ -2578,6 +2578,7 @@ const struct font_desc font_vga_8x8 = {
 	.name	= "VGA8x8",
 	.width	= 8,
 	.height	= 8,
+	.charcount = 256,
 	.data	= fontdata_8x8.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index 069b3e80c434..ba74053fec7b 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -270,6 +270,7 @@ const struct font_desc font_acorn_8x8 = {
 	.name	= "Acorn8x8",
 	.width	= 8,
 	.height	= 8,
+	.charcount = 256,
 	.data	= acorndata_8x8.data,
 #ifdef CONFIG_ARCH_ACORN
 	.pref	= 20,
diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
index 1449876c6a27..637708e8c67e 100644
--- a/lib/fonts/font_mini_4x6.c
+++ b/lib/fonts/font_mini_4x6.c
@@ -2152,6 +2152,7 @@ const struct font_desc font_mini_4x6 = {
 	.name	= "MINI4x6",
 	.width	= 4,
 	.height	= 6,
+	.charcount = 256,
 	.data	= fontdata_mini_4x6.data,
 	.pref	= 3,
 };
diff --git a/lib/fonts/font_pearl_8x8.c b/lib/fonts/font_pearl_8x8.c
index 32d65551e7ed..06cde43c7bd2 100644
--- a/lib/fonts/font_pearl_8x8.c
+++ b/lib/fonts/font_pearl_8x8.c
@@ -2582,6 +2582,7 @@ const struct font_desc font_pearl_8x8 = {
 	.name	= "PEARL8x8",
 	.width	= 8,
 	.height	= 8,
+	.charcount = 256,
 	.data	= fontdata_pearl8x8.data,
 	.pref	= 2,
 };
diff --git a/lib/fonts/font_sun12x22.c b/lib/fonts/font_sun12x22.c
index 641a6b4dca42..d0290d79df2c 100644
--- a/lib/fonts/font_sun12x22.c
+++ b/lib/fonts/font_sun12x22.c
@@ -6156,6 +6156,7 @@ const struct font_desc font_sun_12x22 = {
 	.name	= "SUN12x22",
 	.width	= 12,
 	.height	= 22,
+	.charcount = 256,
 	.data	= fontdata_sun12x22.data,
 #ifdef __sparc__
 	.pref	= 5,
diff --git a/lib/fonts/font_sun8x16.c b/lib/fonts/font_sun8x16.c
index 193fe6d988e0..7d83760354a6 100644
--- a/lib/fonts/font_sun8x16.c
+++ b/lib/fonts/font_sun8x16.c
@@ -268,6 +268,7 @@ const struct font_desc font_sun_8x16 = {
 	.name	= "SUN8x16",
 	.width	= 8,
 	.height	= 16,
+	.charcount = 256,
 	.data	= fontdata_sun8x16.data,
 #ifdef __sparc__
 	.pref	= 10,
diff --git a/lib/fonts/font_ter16x32.c b/lib/fonts/font_ter16x32.c
index 91b9c283bd9c..a2cc25b9f8e3 100644
--- a/lib/fonts/font_ter16x32.c
+++ b/lib/fonts/font_ter16x32.c
@@ -2062,6 +2062,7 @@ const struct font_desc font_ter_16x32 = {
 	.name	= "TER16x32",
 	.width	= 16,
 	.height = 32,
+	.charcount = 256,
 	.data	= fontdata_ter16x32.data,
 #ifdef __sparc__
 	.pref	= 5,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
