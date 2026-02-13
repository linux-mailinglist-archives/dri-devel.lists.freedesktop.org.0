Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ISkKgrojmkDFwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 09:59:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FE134438
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 09:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D721610E7B1;
	Fri, 13 Feb 2026 08:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="D0bLBkfG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lkNFznFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D091110E0A6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 08:59:48 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1770973186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4brwSYakET9Bm4Iocm0LcclnipEpthhqMy3QtgSzwGQ=;
 b=D0bLBkfG9AQCkvHNphSGXD5o+m+M8PD+ugR95wY1nQ17jn8XJ8gT6hKCUBRWB+86aWUaLI
 bsrkEEbXgfAUVgKOQWUssQiDF+7RRSbho7D8iG7TLDax9vc95CGc+8K1pPs05Ll5ba76T4
 HCUSNmr79XSW+NK0QUtFKbH1XZWj6xY/GToOz0LJIdTISuwhL/uvc1ix8VuxqOB4QIeTq4
 1u10dgCMTQUoftO3pQ2NRDqhyUQlaKHY8UI5PMR1Z1FBeN1MPE3RTx8a7YPW3Nu2iPW/Hj
 LGl9kAj/DJZNbmH6342zKY5AAEvGSVbt0pAXFK5PDpSEMX1FDzmim6qVVIu7IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1770973186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4brwSYakET9Bm4Iocm0LcclnipEpthhqMy3QtgSzwGQ=;
 b=lkNFznFqzyj7vCQ0gtWCZWB+s0h2Hbyd0cNvXhcDU+pNj/TATW/5GAEfihmjd9t2PsBzgy
 Tz1OfKzg8RvX86Bw==
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nam Cao <namcao@linutronix.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Remove duplications of fbtft_set_addr_win()
Date: Fri, 13 Feb 2026 09:59:27 +0100
Message-ID: <20260213085927.3673653-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:namcao@linutronix.de,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 135FE134438
X-Rspamd-Action: no action

Lots of drivers duplicate the default fbtft_set_addr_win(). Just use the
default instead.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/staging/fbtft/fb_hx8340bn.c |  8 --------
 drivers/staging/fbtft/fb_hx8353d.c  | 13 -------------
 drivers/staging/fbtft/fb_hx8357d.c  | 14 --------------
 drivers/staging/fbtft/fb_ili9340.c  | 12 ------------
 drivers/staging/fbtft/fb_ili9341.c  | 12 ------------
 drivers/staging/fbtft/fb_ili9481.c  | 12 ------------
 drivers/staging/fbtft/fb_ili9486.c  | 12 ------------
 drivers/staging/fbtft/fb_s6d02a1.c  | 12 ------------
 drivers/staging/fbtft/fb_st7735r.c  | 12 ------------
 drivers/staging/fbtft/fb_tinylcd.c  | 12 ------------
 10 files changed, 119 deletions(-)

diff --git a/drivers/staging/fbtft/fb_hx8340bn.c b/drivers/staging/fbtft/fb=
_hx8340bn.c
index 2fd7b87ea0ce..ca27914f1412 100644
--- a/drivers/staging/fbtft/fb_hx8340bn.c
+++ b/drivers/staging/fbtft/fb_hx8340bn.c
@@ -106,13 +106,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, xs, 0x00, xe);
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, ys, 0x00, ye);
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 static int set_var(struct fbtft_par *par)
 {
 	/* MADCTL - Memory data access control */
@@ -207,7 +200,6 @@ static struct fbtft_display display =3D {
 	.gamma =3D DEFAULT_GAMMA,
 	.fbtftops =3D {
 		.init_display =3D init_display,
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 		.set_gamma =3D set_gamma,
 	},
diff --git a/drivers/staging/fbtft/fb_hx8353d.c b/drivers/staging/fbtft/fb_=
hx8353d.c
index 3e73b69b6a27..f6cd82df4da6 100644
--- a/drivers/staging/fbtft/fb_hx8353d.c
+++ b/drivers/staging/fbtft/fb_hx8353d.c
@@ -61,18 +61,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 };
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	/* column address */
-	write_reg(par, 0x2a, xs >> 8, xs & 0xff, xe >> 8, xe & 0xff);
-
-	/* Row address */
-	write_reg(par, 0x2b, ys >> 8, ys & 0xff, ye >> 8, ye & 0xff);
-
-	/* memory write */
-	write_reg(par, 0x2c);
-}
-
 #define my BIT(7)
 #define mx BIT(6)
 #define mv BIT(5)
@@ -130,7 +118,6 @@ static struct fbtft_display display =3D {
 	.gamma =3D DEFAULT_GAMMA,
 	.fbtftops =3D {
 		.init_display =3D init_display,
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 		.set_gamma =3D set_gamma,
 	},
diff --git a/drivers/staging/fbtft/fb_hx8357d.c b/drivers/staging/fbtft/fb_=
hx8357d.c
index 94a357e8fdf6..7b9f020a956f 100644
--- a/drivers/staging/fbtft/fb_hx8357d.c
+++ b/drivers/staging/fbtft/fb_hx8357d.c
@@ -129,19 +129,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xff,  /* XSTART */
-		  xe >> 8, xe & 0xff); /* XEND */
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xff,  /* YSTART */
-		  ye >> 8, ye & 0xff); /* YEND */
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 #define HX8357D_MADCTL_MY  0x80
 #define HX8357D_MADCTL_MX  0x40
 #define HX8357D_MADCTL_MV  0x20
@@ -184,7 +171,6 @@ static struct fbtft_display display =3D {
 	.gamma_len =3D 14,
 	.fbtftops =3D {
 		.init_display =3D init_display,
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 	},
 };
diff --git a/drivers/staging/fbtft/fb_ili9340.c b/drivers/staging/fbtft/fb_=
ili9340.c
index 704236bcaf3f..023d8cb96f95 100644
--- a/drivers/staging/fbtft/fb_ili9340.c
+++ b/drivers/staging/fbtft/fb_ili9340.c
@@ -78,17 +78,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xFF, xe >> 8, xe & 0xFF);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xFF, ye >> 8, ye & 0xFF);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 #define ILI9340_MADCTL_MV  0x20
 #define ILI9340_MADCTL_MX  0x40
 #define ILI9340_MADCTL_MY  0x80
@@ -122,7 +111,6 @@ static struct fbtft_display display =3D {
 	.height =3D HEIGHT,
 	.fbtftops =3D {
 		.init_display =3D init_display,
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 	},
 };
diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_=
ili9341.c
index 47e72b87d76d..428922dee9f9 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -65,17 +65,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 #define MEM_Y   BIT(7) /* MY row address order */
 #define MEM_X   BIT(6) /* MX column address order */
 #define MEM_V   BIT(5) /* MV row / column exchange */
@@ -139,7 +128,6 @@ static struct fbtft_display display =3D {
 	.gamma =3D DEFAULT_GAMMA,
 	.fbtftops =3D {
 		.init_display =3D init_display,
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 		.set_gamma =3D set_gamma,
 	},
diff --git a/drivers/staging/fbtft/fb_ili9481.c b/drivers/staging/fbtft/fb_=
ili9481.c
index 19eba085ea53..5f31b5d5590f 100644
--- a/drivers/staging/fbtft/fb_ili9481.c
+++ b/drivers/staging/fbtft/fb_ili9481.c
@@ -42,17 +42,6 @@ static const s16 default_init_sequence[] =3D {
 	-3
 };
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xff, xe >> 8, xe & 0xff);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xff, ye >> 8, ye & 0xff);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 #define HFLIP 0x01
 #define VFLIP 0x02
 #define ROW_X_COL 0x20
@@ -86,7 +75,6 @@ static struct fbtft_display display =3D {
 	.height =3D HEIGHT,
 	.init_sequence =3D default_init_sequence,
 	.fbtftops =3D {
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 	},
 };
diff --git a/drivers/staging/fbtft/fb_ili9486.c b/drivers/staging/fbtft/fb_=
ili9486.c
index 66210a7137fc..a4d699ef57e4 100644
--- a/drivers/staging/fbtft/fb_ili9486.c
+++ b/drivers/staging/fbtft/fb_ili9486.c
@@ -43,17 +43,6 @@ static const s16 default_init_sequence[] =3D {
 	-3
 };
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xFF, xe >> 8, xe & 0xFF);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xFF, ye >> 8, ye & 0xFF);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 static int set_var(struct fbtft_par *par)
 {
 	switch (par->info->var.rotate) {
@@ -86,7 +75,6 @@ static struct fbtft_display display =3D {
 	.height =3D HEIGHT,
 	.init_sequence =3D default_init_sequence,
 	.fbtftops =3D {
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 	},
 };
diff --git a/drivers/staging/fbtft/fb_s6d02a1.c b/drivers/staging/fbtft/fb_=
s6d02a1.c
index d3d6871d8c47..d8ddc804d626 100644
--- a/drivers/staging/fbtft/fb_s6d02a1.c
+++ b/drivers/staging/fbtft/fb_s6d02a1.c
@@ -97,17 +97,6 @@ static const s16 default_init_sequence[] =3D {
=20
 };
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xFF, xe >> 8, xe & 0xFF);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xFF, ye >> 8, ye & 0xFF);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 #define MY BIT(7)
 #define MX BIT(6)
 #define MV BIT(5)
@@ -149,7 +138,6 @@ static struct fbtft_display display =3D {
 	.height =3D 160,
 	.init_sequence =3D default_init_sequence,
 	.fbtftops =3D {
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 	},
 };
diff --git a/drivers/staging/fbtft/fb_st7735r.c b/drivers/staging/fbtft/fb_=
st7735r.c
index 9670a8989b91..6d9735fa2332 100644
--- a/drivers/staging/fbtft/fb_st7735r.c
+++ b/drivers/staging/fbtft/fb_st7735r.c
@@ -83,17 +83,6 @@ static const s16 default_init_sequence[] =3D {
 	-3
 };
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xFF, xe >> 8, xe & 0xFF);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xFF, ye >> 8, ye & 0xFF);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 #define MY BIT(7)
 #define MX BIT(6)
 #define MV BIT(5)
@@ -168,7 +157,6 @@ static struct fbtft_display display =3D {
 	.gamma_len =3D 16,
 	.gamma =3D DEFAULT_GAMMA,
 	.fbtftops =3D {
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 		.set_gamma =3D set_gamma,
 	},
diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_=
tinylcd.c
index 9469248f2c50..fc17e3c687fb 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -47,17 +47,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
=20
-static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, in=
t ye)
-{
-	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS,
-		  xs >> 8, xs & 0xFF, xe >> 8, xe & 0xFF);
-
-	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS,
-		  ys >> 8, ys & 0xFF, ye >> 8, ye & 0xFF);
-
-	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
-}
-
 static int set_var(struct fbtft_par *par)
 {
 	switch (par->info->var.rotate) {
@@ -88,7 +77,6 @@ static struct fbtft_display display =3D {
 	.height =3D HEIGHT,
 	.fbtftops =3D {
 		.init_display =3D init_display,
-		.set_addr_win =3D set_addr_win,
 		.set_var =3D set_var,
 	},
 };
--=20
2.47.3

