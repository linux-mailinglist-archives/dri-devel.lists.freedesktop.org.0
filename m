Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBEAD34DF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65A10E4EF;
	Tue, 10 Jun 2025 11:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VJz2yXxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F4710E4EF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:24:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 44DF4A50D21;
 Tue, 10 Jun 2025 11:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D78EC4CEED;
 Tue, 10 Jun 2025 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749554642;
 bh=nN0ISiXyc8XuJnFSXPqaX/pMz8eCyow5+vzT8WEFryU=;
 h=From:To:Cc:Subject:Date:From;
 b=VJz2yXxjwhRNUFzgTWtsg1POeNxBM/YAk2daMD4qnmkQ7mfqIWudSaxcfoPoxKXnH
 G9FqXSujr+g4o+ZaAFLw8f1Z/0d9GcCIXvrhAJI4pC54I0cnHIYL1vro2CqWCjrMvc
 1Vflmq00sHkSZrnKVXLQYa9rMNZgCSAhz/G/TJ99M9aLOO4BjpG/8pXpq9fdJhAQ69
 bblWVc9/8+OWXp4WjtEW10InDgzpMxoioCp2x2YrK97tnNhO0jrBxgCRaePMHX2RPW
 kdwrmJ6qWzQQnvRPBSqsu1/R5w7b99+NOfAxJ9KPF9CO7xPR3Bpn2lpPYuXIZO7AiO
 UFhyvlDxMqPNg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Riyan Dhiman <riyandhiman14@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] staging: fbtft: reduce stack usage
Date: Tue, 10 Jun 2025 13:23:28 +0200
Message-Id: <20250610112357.3306246-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The use of vararg function pointers combined with a huge number of
arguments causes some configurations to exceed the stack size warning
limit:

drivers/staging/fbtft/fbtft-core.c:863:12: error: stack frame size (1512) exceeds limit (1280) in 'fbtft_init_display_from_property' [-Werror,-Wframe-larger-than]

drivers/staging/fbtft/fb_ssd1331.c:131:30: error: stack frame size (1392) exceeds limit (1280) in 'set_gamma' [-Werror,-Wframe-larger-than]
                  ^
drivers/staging/fbtft/fb_ssd1351.c:120:30: error: stack frame size (1392) exceeds limit (1280) in 'set_gamma' [-Werror,-Wframe-larger-than]

Move the varargs handling into a separate noinline function so each
individual function stays below the limit. A better approach might be to
replace the varargs function with one that takes an array of arguments,
but that would be a much larger rework of the other callers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use u32 types consistently, suggested by Andy Shevchenko
---
 drivers/staging/fbtft/fb_ssd1331.c | 36 ++++++++++++------
 drivers/staging/fbtft/fb_ssd1351.c | 42 +++++++++++---------
 drivers/staging/fbtft/fbtft-core.c | 61 +++++++++++++-----------------
 3 files changed, 74 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1331.c b/drivers/staging/fbtft/fb_ssd1331.c
index 06b7056d6c71..f43ee3249175 100644
--- a/drivers/staging/fbtft/fb_ssd1331.c
+++ b/drivers/staging/fbtft/fb_ssd1331.c
@@ -107,6 +107,28 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	va_end(args);
 }
 
+static noinline_for_stack void write_gamma_reg(struct fbtft_par *par,
+					       u32 gamma[63])
+{
+	write_reg(par, 0xB8,
+		  gamma[0],  gamma[1],  gamma[2],  gamma[3],
+		  gamma[4],  gamma[5],  gamma[6],  gamma[7],
+		  gamma[8],  gamma[9],  gamma[10], gamma[11],
+		  gamma[12], gamma[13], gamma[14], gamma[15],
+		  gamma[16], gamma[17], gamma[18], gamma[19],
+		  gamma[20], gamma[21], gamma[22], gamma[23],
+		  gamma[24], gamma[25], gamma[26], gamma[27],
+		  gamma[28], gamma[29], gamma[30], gamma[31],
+		  gamma[32], gamma[33], gamma[34], gamma[35],
+		  gamma[36], gamma[37], gamma[38], gamma[39],
+		  gamma[40], gamma[41], gamma[42], gamma[43],
+		  gamma[44], gamma[45], gamma[46], gamma[47],
+		  gamma[48], gamma[49], gamma[50], gamma[51],
+		  gamma[52], gamma[53], gamma[54], gamma[55],
+		  gamma[56], gamma[57], gamma[58], gamma[59],
+		  gamma[60], gamma[61], gamma[62]);
+}
+
 /*
  * Grayscale Lookup Table
  * GS1 - GS63
@@ -130,7 +152,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
  */
 static int set_gamma(struct fbtft_par *par, u32 *curves)
 {
-	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
+	u32 tmp[GAMMA_NUM * GAMMA_LEN];
 	int i, acc = 0;
 
 	for (i = 0; i < 63; i++) {
@@ -150,17 +172,7 @@ static int set_gamma(struct fbtft_par *par, u32 *curves)
 		}
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
+	write_gamma_reg(par, tmp);
 
 	return 0;
 }
diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..eb8bee6993c3 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -96,6 +96,28 @@ static int set_var(struct fbtft_par *par)
 	return 0;
 }
 
+static noinline_for_stack void write_gamma_reg(struct fbtft_par *par,
+					       u32 gamma[63])
+{
+	write_reg(par, 0xB8,
+		  gamma[0],  gamma[1],  gamma[2],  gamma[3],
+		  gamma[4],  gamma[5],  gamma[6],  gamma[7],
+		  gamma[8],  gamma[9],  gamma[10], gamma[11],
+		  gamma[12], gamma[13], gamma[14], gamma[15],
+		  gamma[16], gamma[17], gamma[18], gamma[19],
+		  gamma[20], gamma[21], gamma[22], gamma[23],
+		  gamma[24], gamma[25], gamma[26], gamma[27],
+		  gamma[28], gamma[29], gamma[30], gamma[31],
+		  gamma[32], gamma[33], gamma[34], gamma[35],
+		  gamma[36], gamma[37], gamma[38], gamma[39],
+		  gamma[40], gamma[41], gamma[42], gamma[43],
+		  gamma[44], gamma[45], gamma[46], gamma[47],
+		  gamma[48], gamma[49], gamma[50], gamma[51],
+		  gamma[52], gamma[53], gamma[54], gamma[55],
+		  gamma[56], gamma[57], gamma[58], gamma[59],
+		  gamma[60], gamma[61], gamma[62]);
+}
+
 /*
  * Grayscale Lookup Table
  * GS1 - GS63
@@ -119,7 +141,7 @@ static int set_var(struct fbtft_par *par)
  */
 static int set_gamma(struct fbtft_par *par, u32 *curves)
 {
-	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
+	u32 tmp[GAMMA_NUM * GAMMA_LEN];
 	int i, acc = 0;
 
 	for (i = 0; i < 63; i++) {
@@ -139,23 +161,7 @@ static int set_gamma(struct fbtft_par *par, u32 *curves)
 		}
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
+	write_gamma_reg(par, tmp);
 
 	return 0;
 }
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..231cc6d7343c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -833,6 +833,28 @@ int fbtft_unregister_framebuffer(struct fb_info *fb_info)
 }
 EXPORT_SYMBOL(fbtft_unregister_framebuffer);
 
+static noinline_for_stack void fbtft_write_register_64(struct fbtft_par *par,
+							int i, u32 buf[64])
+{
+	par->fbtftops.write_register(par, i,
+		buf[0], buf[1], buf[2], buf[3],
+		buf[4], buf[5], buf[6], buf[7],
+		buf[8], buf[9], buf[10], buf[11],
+		buf[12], buf[13], buf[14], buf[15],
+		buf[16], buf[17], buf[18], buf[19],
+		buf[20], buf[21], buf[22], buf[23],
+		buf[24], buf[25], buf[26], buf[27],
+		buf[28], buf[29], buf[30], buf[31],
+		buf[32], buf[33], buf[34], buf[35],
+		buf[36], buf[37], buf[38], buf[39],
+		buf[40], buf[41], buf[42], buf[43],
+		buf[44], buf[45], buf[46], buf[47],
+		buf[48], buf[49], buf[50], buf[51],
+		buf[52], buf[53], buf[54], buf[55],
+		buf[56], buf[57], buf[58], buf[59],
+		buf[60], buf[61], buf[62], buf[63]);
+}
+
 /**
  * fbtft_init_display_from_property() - Device Tree init_display() function
  * @par: Driver data
@@ -842,7 +864,7 @@ EXPORT_SYMBOL(fbtft_unregister_framebuffer);
 static int fbtft_init_display_from_property(struct fbtft_par *par)
 {
 	struct device *dev = par->info->device;
-	int buf[64], count, index, i, j, ret;
+	u32 buf[64], count, index, i, j, ret;
 	u32 *values;
 	u32 val;
 
@@ -887,23 +909,8 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
 				fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 					      "buf[%d] = %02X\n", j, buf[j]);
 
-			par->fbtftops.write_register(par, i,
-				buf[0], buf[1], buf[2], buf[3],
-				buf[4], buf[5], buf[6], buf[7],
-				buf[8], buf[9], buf[10], buf[11],
-				buf[12], buf[13], buf[14], buf[15],
-				buf[16], buf[17], buf[18], buf[19],
-				buf[20], buf[21], buf[22], buf[23],
-				buf[24], buf[25], buf[26], buf[27],
-				buf[28], buf[29], buf[30], buf[31],
-				buf[32], buf[33], buf[34], buf[35],
-				buf[36], buf[37], buf[38], buf[39],
-				buf[40], buf[41], buf[42], buf[43],
-				buf[44], buf[45], buf[46], buf[47],
-				buf[48], buf[49], buf[50], buf[51],
-				buf[52], buf[53], buf[54], buf[55],
-				buf[56], buf[57], buf[58], buf[59],
-				buf[60], buf[61], buf[62], buf[63]);
+			fbtft_write_register_64(par, i, buf);
+
 		} else if (val & FBTFT_OF_INIT_DELAY) {
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 				      "init: msleep(%u)\n", val & 0xFFFF);
@@ -996,23 +1003,7 @@ int fbtft_init_display(struct fbtft_par *par)
 				}
 				buf[j++] = par->init_sequence[i++];
 			}
-			par->fbtftops.write_register(par, j,
-				buf[0], buf[1], buf[2], buf[3],
-				buf[4], buf[5], buf[6], buf[7],
-				buf[8], buf[9], buf[10], buf[11],
-				buf[12], buf[13], buf[14], buf[15],
-				buf[16], buf[17], buf[18], buf[19],
-				buf[20], buf[21], buf[22], buf[23],
-				buf[24], buf[25], buf[26], buf[27],
-				buf[28], buf[29], buf[30], buf[31],
-				buf[32], buf[33], buf[34], buf[35],
-				buf[36], buf[37], buf[38], buf[39],
-				buf[40], buf[41], buf[42], buf[43],
-				buf[44], buf[45], buf[46], buf[47],
-				buf[48], buf[49], buf[50], buf[51],
-				buf[52], buf[53], buf[54], buf[55],
-				buf[56], buf[57], buf[58], buf[59],
-				buf[60], buf[61], buf[62], buf[63]);
+			fbtft_write_register_64(par, j, buf);
 			break;
 		case -2:
 			i++;
-- 
2.39.5

