Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D8CF0E3C
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 13:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB9F10E2C8;
	Sun,  4 Jan 2026 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLMoJ2uI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85A610E042
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 11:06:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-29efd139227so174095355ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 03:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767524813; x=1768129613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmz/Xu0Pokn7o5jLUorKqspAjEWkFQmifBWWvvSJmmg=;
 b=nLMoJ2uItQSZDkPpYM1RltuHKDde14EM0irHFrO2v9i7g9eqABQjanqcu8G6wanY/X
 bll5S8d0CcxTM6pV2VK1HiSJxjgEEJGCFAev0I+IXcLNThQsnaZiu4bVguUWyomm/wRZ
 Zax9KeHvGX27xcofAdmjl5xhtomUSGtMBu8NiK5Z3cm3sS9+em6lqPBLDXY7pyxbAZ/5
 Cn0/mbIo8aOvx1Xi6DmYP2nanUdZ3uvqbI2FuYTyL9iVdorFi9cQPa9bjxTX/lOkeoz1
 7/Hnh6CL7hhudbyAM0iZEFRI7ckH1JthU+o59goh//XbBjCZDxPd9Bg6pzsSis9VvU8A
 oOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767524813; x=1768129613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dmz/Xu0Pokn7o5jLUorKqspAjEWkFQmifBWWvvSJmmg=;
 b=UgvANzuT36XZwgbja4pdPGBO1Vs9lkxhFGe3qW1c70stcUq6ofL1Biot8NTw9o04Yp
 cHYSkQKbkq+uq8pDya8S2O0rrun3gwMU8Q27HfmH6C7FjWfU7BagoWYy6JV6qsrbj8ga
 uPcF5swdwM4QAsIfMh9UIxIhbc+3Bu9m96bBI/hBPMlK5924606/0AYftISCHeCLrTT4
 Zh/LFQkHmmI2vb3dNxM+6pGrRXqqW8kxiMzhlKLWhdkpYfJiRVHe7pT4aMJgs0QZp+cL
 zvwsziBFxZtgfenIHqIb1ubW6KkZ/g8wY08jNqwTBiovm9JY7gl5S+Kt1gpSvxqWwmme
 0l/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS0fcfQd4T60O2EfArl9Afi4BBnBrqBCa8tAeSWvxB5fMa/bCGlQei49IBnQ51IXfpojnfQndidfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjKpZGwxaSjm6crK/4YIqNPjl2AymTO2L/iymz1XQJIP5VDowd
 m23eKvWjpniUC3pmeKbhTdr1D6GN4BBi8DT+OxqZIz5PO/sBABGjs0Nc
X-Gm-Gg: AY/fxX6XvaqdjjryMZiItQ5acNpySDGjhsgXaCbNaU/VqPe1lA25ggHCJtpXpLQmEsW
 JZMAakkutDJPIYWXgGaEGU2DIHKPx4n8XHMsaCK4wBLR54BQeNuRomKqfBwIYgG1dQQCN7TIi/H
 XxPaBm2Xod1MEJgoi6y4AqV1AALzX561uKB967kMrTj2gWN4tUDMxnmRyN6F3PdxGYphar+63Ew
 Dt+xtYWqgjevbVXHrtfCODD+FqJdKZF/zC/X9m9K4xWYQcMVgORoKOOChBaBQgspt5UniQwQbB0
 Q7b/h6dfSpFpHh1b/3vOasyEEfeW+RxUZXeDkVmi5xjjrhqdX0JCVF3c7eIHLU6UpTsgpMXVreG
 jIPLyEqAyOBd86d+cvNyVogKFGfT5tKHbRCFisqbs5C4rL60WdYh8hK6UXp9JSOaSnbbNdf5rZd
 1BvhlKOra5m8rScjvDTw9/dDTZrwsIpuej/uQqSRuDJeVQkxRhDFBXxvC1k8rJ4fczgjw4mLHVk
 WtERZXw2yo=
X-Google-Smtp-Source: AGHT+IFT57sRzchwkgo2RkVk7eqybUBx+rr0/sZgZIOeGa49uoW05Lm/8gYoJDuz8K8fM2r6MbTUtA==
X-Received: by 2002:a05:7022:6886:b0:11b:1cae:a0fa with SMTP id
 a92af1059eb24-1217213721emr48642842c88.0.1767524813143; 
 Sun, 04 Jan 2026 03:06:53 -0800 (PST)
Received: from ubuntu-linux-2404..
 (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 03:06:52 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in DT
 init parsing
Date: Sun,  4 Jan 2026 19:06:35 +0800
Message-ID: <20260104110638.532615-2-sun.jian.kdev@gmail.com>
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

Clang reports a large stack frame for fbtft_init_display_from_property()
(-Wframe-larger-than=1024) when the init sequence is emitted through a
fixed 64-argument write_register() call.

write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
varargs which inflates stack usage. Switch the DT "init" path to send the
command byte and the payload via fbtft_write_buf_dc() instead.

No functional change intended: the same register values are sent in the
same order, only the transport is changed.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 32 ++++++++++++------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..127d0de87e03 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -846,7 +846,8 @@ EXPORT_SYMBOL(fbtft_unregister_framebuffer);
 static int fbtft_init_display_from_property(struct fbtft_par *par)
 {
 	struct device *dev = par->info->device;
-	int buf[64], count, index, i, j, ret;
+	u8 buf[64];
+	int count, index, i, j, ret;
 	u32 *values;
 	u32 val;
 
@@ -881,7 +882,7 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
 					ret = -EINVAL;
 					goto out_free;
 				}
-				buf[i++] = val;
+				buf[i++] = val & 0xFF;
 				val = values[++index];
 			}
 			/* make debug message */
@@ -891,23 +892,16 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
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
+			/* buf[0] is command, buf[1..i-1] is data */
+			ret = fbtft_write_buf_dc(par, &buf[0], 1, 0);
+			if (ret < 0)
+				goto out_free;
+
+			if (i > 1) {
+				ret = fbtft_write_buf_dc(par, &buf[1], i - 1, 1);
+				if (ret < 0)
+					goto out_free;
+			}
 		} else if (val & FBTFT_OF_INIT_DELAY) {
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 				      "init: msleep(%u)\n", val & 0xFFFF);
-- 
2.43.0

