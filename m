Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D649089E233
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12975112240;
	Tue,  9 Apr 2024 18:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GN4kkZvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5A310F9CC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:09:29 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5cfd95130c6so3923598a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712686168; x=1713290968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NVXVzzWFiRIl6q29OSH9GKi8POQIM0rOmoVWIGbW5Rw=;
 b=GN4kkZvdvFhH+SIL/KxpGAohgYwlSkVtV+ACIKvPfZz88ovH9GNwR2POm1EXPBoLVC
 39sUw9IHre9/dHl1zmGI+dVjfnC6nQ++vv+jWuQtF2nRtTmAzWM77wN87vbPL4F3hWHJ
 GB4NMfuzBThi0bp/CWNlDd6mzorROYfn/owAvzWLUwnGM+ckXQWVtnKhCzs6u3/M3waL
 lQKgP5Kz490/nCRxz+oj9eW01ESMjLcCwKXDq6lNUaNFSb+uGQAyXJwi8BTbasO8Z5GB
 VRAjdPiune0eDQ5nLiDcGLHySe7fUmsNmZvcMbMO8gWz5/rk3ZYPQNB/IesJn8NGwhOv
 ydzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712686168; x=1713290968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVXVzzWFiRIl6q29OSH9GKi8POQIM0rOmoVWIGbW5Rw=;
 b=Rg/aTW1XgtQzLCqk6S6GxxZEViubzqt9EJ9h5f/uqtaIOtiuw2YC81k3ajhuU35nVl
 6oW/n/wov4cpF2CDka1yMg9KzOnB9Sm57Qoadd/6MEamVERU5NBDPBs20bFARHNkVQwL
 unUdyHL9WdU3qBpVYKB/FOlpSSUatpmkVzqo+dT0wahAP3Ojnm34PUHD/QcNIzFf0KZE
 UN8wUZOIomJN91krDBe5rNc+12mu2CSqpzT7zuf4si8Uz6TweFvZ1wQ4TI6XTTlWt/En
 apVJqIpo1uYd2S2NMfi3NsQMKt4nG7tNpO/nh00uiHDlkMR+OFFNFLPYMmpoVH4EF9qu
 INMg==
X-Gm-Message-State: AOJu0YzmZOYG9QbUBItZssLnIyUBdCLTsoALQVe4TRbKPkaf/DC1EnxL
 1kYxeY+6KGTK+H2d2swzkQglBbrZ9+t/rs39nshqUXRPJuZGogqx
X-Google-Smtp-Source: AGHT+IFfFzJvldQjnVnnEpBO8iZdBO93LTpcMA44O3DKE0n7hsIP4ENWytzlu6xvr4g+hUv52FZokQ==
X-Received: by 2002:a05:6a21:6816:b0:1a7:6416:1465 with SMTP id
 wr22-20020a056a21681600b001a764161465mr734294pzb.32.1712686168384; 
 Tue, 09 Apr 2024 11:09:28 -0700 (PDT)
Received: from localhost.localdomain ([172.93.220.120])
 by smtp.gmail.com with ESMTPSA id
 gr6-20020a056a004d0600b006ead007a49dsm8644901pfb.49.2024.04.09.11.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 11:09:28 -0700 (PDT)
From: Yuguo Pei <purofle@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, purofle@gmail.com
Subject: [PATCH v2] staging: fbtft: fb_st7789v: support setting offset
Date: Wed, 10 Apr 2024 02:09:01 +0800
Message-ID: <20240409180900.31347-2-purofle@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For those who use screens with offset, they only need to modify the values
of size and offset, and do not need to a new set_addr_win function.

Signed-off-by: Yuguo Pei <purofle@gmail.com>
---
v2: modify Signed-off-by, fix explanation of changes

 drivers/staging/fbtft/fb_st7789v.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a154144e6..d47ab4262374 100644
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

