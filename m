Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEF58895B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 11:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EED11A514;
	Wed,  3 Aug 2022 09:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2037111AF4C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 09:24:29 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id w10so15899453plq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=TyPYU7JAMWQWl+WhPsqBxHvEkTIS/4JLI5sbDwhItOY=;
 b=dJNn1nWWaL2AuEuXjimOgDz7y+wxBEIUdAmLlrH1FBuhkjWabFM25S6WDPDHkO9LZ+
 L+DwulUjkptr87COHH9c5aE39No2pGoysHi7SoWczDZxsJS4hbtArJANpEQXMCYEZJ3i
 xaC9A9Cxi+dN8mpE8Ny53wPSUcnHvF7xBFnuCeI5qsLbClRGLg7a9AqauJk7jWXbQPA9
 0jdlv2/6DPSFb7W2JWiDJrF0bk2D6/5i9MawrYOKIs+Q7ph/rOLT0sp13bnWQxcSUGqL
 vV2SZkU/I7jPtsrFcvd33JtXtrRZwS51SR6adRWu58/p+nPSVN92xia98UGOLVxFQmWE
 HHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=TyPYU7JAMWQWl+WhPsqBxHvEkTIS/4JLI5sbDwhItOY=;
 b=0Ie+mw2YiP9IV71HFMNVupwA/uelnB4gnmF7eLGZngoMldgCsgmPwy/Wesb7Jf9JL7
 OPhckMJ0nO2nH3UenCTdAmXJK4Rl9ldVMV6Reo90aNiC0yjUvLata6VjgujRY5j2B1sn
 T1k1c+I4Lmkq1t4E4NjaKAB7E3Vpv6KCiiD/4Pf4AA4OvlN7YGGlEuUSHGmTVoFy4auX
 P2aM3YYfGr21YA9L7adB2Tj/kjzc91fMZYbm2Kr7rsR1h28D98wepIesEFFwxtdzaCE0
 zPORB20ocaZRPqdkbYj/LiPlRV15ca9AV9M2JuM75f6ixWmVUZfF/z5OExzQuynjO5Fj
 p3mg==
X-Gm-Message-State: ACgBeo01vgCuS6CrnldPXkVvHkTqu338dAyY1u1oy48s/7Sckbt/Vcdi
 4lwHk8DYsJZ2IelkDm1ubw==
X-Google-Smtp-Source: AA6agR7AGuv1JhwCpiEw7Mov0djrXjR7uRpZo/ejIF30ks+zTdgKibiEd8aWFGtvsoKPh1vdUGtHcw==
X-Received: by 2002:a17:90b:180f:b0:1f5:160c:a656 with SMTP id
 lw15-20020a17090b180f00b001f5160ca656mr4000341pjb.193.1659518668515; 
 Wed, 03 Aug 2022 02:24:28 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a1709027e4400b0016c9e5f291bsm1377194pln.111.2022.08.03.02.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 02:24:28 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: i740fb: Check the argument of i740_calc_vclk()
Date: Wed,  3 Aug 2022 17:24:19 +0800
Message-Id: <20220803092419.2821723-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the user can control the arguments of the ioctl() from the user
space, under special arguments that may result in a divide-by-zero bug.

If the user provides an improper 'pixclock' value that makes the argumet
of i740_calc_vclk() less than 'I740_RFREQ_FIX', it will cause a
divide-by-zero bug in:
    drivers/video/fbdev/i740fb.c:353 p_best = min(15, ilog2(I740_MAX_VCO_FREQ / (freq / I740_RFREQ_FIX)));

The following log can reveal it:

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
RIP: 0010:i740_calc_vclk drivers/video/fbdev/i740fb.c:353 [inline]
RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:646 [inline]
RIP: 0010:i740fb_set_par+0x163f/0x3b70 drivers/video/fbdev/i740fb.c:742
Call Trace:
 fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1034
 do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1110
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1189

Fix this by checking the argument of i740_calc_vclk() first.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/i740fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 09dd85553d4f..7f09a0daaaa2 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -400,7 +400,7 @@ static int i740fb_decode_var(const struct fb_var_screeninfo *var,
 	u32 xres, right, hslen, left, xtotal;
 	u32 yres, lower, vslen, upper, ytotal;
 	u32 vxres, xoffset, vyres, yoffset;
-	u32 bpp, base, dacspeed24, mem;
+	u32 bpp, base, dacspeed24, mem, freq;
 	u8 r7;
 	int i;
 
@@ -643,7 +643,12 @@ static int i740fb_decode_var(const struct fb_var_screeninfo *var,
 	par->atc[VGA_ATC_OVERSCAN] = 0;
 
 	/* Calculate VCLK that most closely matches the requested dot clock */
-	i740_calc_vclk((((u32)1e9) / var->pixclock) * (u32)(1e3), par);
+	freq = (((u32)1e9) / var->pixclock) * (u32)(1e3);
+	if (freq < I740_RFREQ_FIX) {
+		fb_dbg(info, "invalid pixclock\n");
+		freq = I740_RFREQ_FIX;
+	}
+	i740_calc_vclk(freq, par);
 
 	/* Since we program the clocks ourselves, always use VCLK2. */
 	par->misc |= 0x0C;
-- 
2.25.1

