Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD620CF0E33
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 13:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091C210E118;
	Sun,  4 Jan 2026 12:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gg/ZcgHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5D010E042
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 11:07:16 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-bc29d64b39dso7032382a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767524836; x=1768129636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCTGHTVVHMA6vyGR0yyFOy75tys/0KRwLLM6G8GarUU=;
 b=Gg/ZcgHte5koKTCgOuzxU3WcHEjl5u/uI3NM89RX18Ggojbu57L08lqgGR7qG5SFu1
 /mpYvF4lkncx4P0shzqdYvxAL2OjRaj2+t2CEa34uWzPqWlLImA01KpTiOSmfkUe6rSb
 Twra1LAQT7iyz+vU7MoXD1pyBTM4Ra+D/QeoJS/wV2w/zmtlLC0ICRl+pQCKxBQoOs7J
 VF4NfY5FBD7j97JJha86w/UXep/3nzLjGwsXplPB3i8dOM+zKveBcAF6EFGybIrB2fyu
 pYUz+jKRrmHAMjd4bxEOYGqqydXGNnkE5VtAztvIR752+wWKUBqJQgH1KX4tC0uIqqec
 s4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767524836; x=1768129636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KCTGHTVVHMA6vyGR0yyFOy75tys/0KRwLLM6G8GarUU=;
 b=oyzZKbhwdkV0sVWizldSmSHE7X++5wASE/JuOT6umSTgXrWb+oJcArS0FwIEzE204Y
 4InsnKDLuy6jG+nk3F5OVd9eP/fablE+owFy6cI5zjPWJ+xGUZxg+eaPNz+PgeoKG8m4
 5EEqZT0xmBGhLmEuwqQtEKPQVE8rLijRyiJIRqsZB1ZdhwyaCUIfoO6X9qKJcIBC+F4v
 7MxtWRrfTL7iHoxTN1bucCGCA5HaF8CCGirKiNH6X7BhYWaURUIQBrSa1EdAA/6l7pXl
 YvjP9jnQC01Ar4+fWFwwJCIGKWcX6hAy8L6lqGAhumtxXe1bMwG//6idV2rTiqyXsvRJ
 ch5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+4BkV3I3VF7g8W9mYqZ72Nyk4wFo/UlJ5KmVI/APkZrc0C4D0Hxk9V0m2nflHne6J5pb+fFaHEm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydIeWOX8XHqxiBPNM5ZvGCZWsw3iHVo6eu3qY72h81KKSl6Y8X
 /GmpNFP4zR/TIKmOmRuQCNi4MFHEcEP6f5toZG3WNb3NWNrVh5GhYpJf
X-Gm-Gg: AY/fxX4QOVqZBgYCsO/ol2YUSYUbmzrb0cBD3CtYRCABmnp970J6SZc4yt6ZMnQWyoh
 dEVmQtyU4Vo7Kcb+KDxlObWSNbu5/H00aEV80SsZv6I4LsxZDlZLhAzwu1qUV0y4ydTrcxtyi4B
 cwp3Fef77hxx8vVvE3z4mKjyYe9xNLr30fAig3f1E8+hL+oDwMRqcgOzgqwNJu6oU8a997l1kcG
 jsKf0eENPCaE5fSa/KUtgxayxNVO7oejP9WaLzXuJ/U16k2M8YHlqp0SWPJkvCh4AveAn04inLp
 Ol/XQdieFLKFfs5fE+6vKQoYhn2B/01i86aMBzEM3DnyKM5DaCTBsTxMPdQ5SlGvfT56M6FdqJY
 cakRN7iQCky1dqgTB7gLfWyv7CD18Zfi14Oxz7M5yroFqKw2I+l8Xcuvhp2rsS5SRrfksCd16Jt
 ITsBzjrYvtgdJ/OmSNoKA6d03uvZWFPIdqsBd1JRBnFSVrd7df/zkVnvRKc6JO1GTUgyv6iZGl1
 vmGGeX33uOkdn7FxWkHKQ==
X-Google-Smtp-Source: AGHT+IEBlQin3DED6U3ZrS/y7L3/YC7dD4Soy4OYJVCu+hhgs+CK06RDqttmL3s2kWznHZII3HLCUw==
X-Received: by 2002:a05:7300:4fa7:b0:2b0:507d:c2e4 with SMTP id
 5a478bee46e88-2b05ec85832mr28474488eec.39.1767524835534; 
 Sun, 04 Jan 2026 03:07:15 -0800 (PST)
Received: from ubuntu-linux-2404..
 (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 03:07:15 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 4/4] staging: fbtft: hx8353d: send LUT via buffer to reduce
 stack usage
Date: Sun,  4 Jan 2026 19:06:38 +0800
Message-ID: <20260104110638.532615-5-sun.jian.kdev@gmail.com>
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

Clang reports a large stack frame in init_display()
 (-Wframe-larger-than=1024) due to the very large
 write_reg(MIPI_DCS_WRITE_LUT, ...) call.

Send MIPI_DCS_WRITE_LUT followed by the LUT payload using
fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fb_hx8353d.c | 38 ++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fb_hx8353d.c b/drivers/staging/fbtft/fb_hx8353d.c
index 3e73b69b6a27..7e667d60792f 100644
--- a/drivers/staging/fbtft/fb_hx8353d.c
+++ b/drivers/staging/fbtft/fb_hx8353d.c
@@ -17,6 +17,21 @@
 #define DRVNAME "fb_hx8353d"
 #define DEFAULT_GAMMA "50 77 40 08 BF 00 03 0F 00 01 73 00 72 03 B0 0F 08 00 0F"
 
+static const u8 lut[] = {
+			  0,  2,  4,  6,  8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
+			 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62,
+			  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
+			 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+			 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+			 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+			  0,  2,  4,  6,  8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
+			 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62,
+			  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
+			 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+			 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+			 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+		};
+
 static int init_display(struct fbtft_par *par)
 {
 	par->fbtftops.reset(par);
@@ -48,18 +63,21 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	/* RGBSET */
-	write_reg(par, MIPI_DCS_WRITE_LUT,
-		  0,  2,  4,  6,  8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
-		32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62,
-		 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
-		16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
-		32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
-		48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
-		 0,  2,  4,  6,  8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
-		32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62);
+	{
+		u8 cmd = MIPI_DCS_WRITE_LUT;
+		int ret;
+
+		ret = fbtft_write_buf_dc(par, &cmd, 1, 0);
+		if (ret < 0)
+			return ret;
+
+		ret = fbtft_write_buf_dc(par, (void *)lut, sizeof(lut), 1);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
-};
+}
 
 static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
 {
-- 
2.43.0

