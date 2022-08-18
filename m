Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6155599535
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 08:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C3210E757;
	Fri, 19 Aug 2022 06:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22705CCD18
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 10:44:33 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo4309595pjd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zfVmtS6KYvfWod3rab4fz6qOWga4E5X5CB2HKYlhhHQ=;
 b=jEGIS+8SyNLsj44iJPWD2f6FwCHwEq/YUUlEAN64vyrvH8958MyzjjRJy7Xs5wV5r6
 yL+mLLihw3u8AirH32WN4aHlfqLvLeR0pkGRQUSV0+Og3cmWs56c4IAPLZqG3k2Uzc7s
 /PTEahfh3u7jQfr5N6adgTjW91FkhXlwBN9Y09Dv3pT+SYxff16KvZ2mw52NkiOB1kc7
 IwWBuTak94mPXTbgsjSB7TRIED/Ouc5GJNUphLIarEj7dqYLKNah/poNTPj8TIJ89h0a
 pydqUVEtW5VYZWrDd12y+X5WFZCuPx27553kmBvnHqQvoVZ1XU1y6S0g1MkKX2z6TkId
 QnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zfVmtS6KYvfWod3rab4fz6qOWga4E5X5CB2HKYlhhHQ=;
 b=QJ/aVR4TDmbHhBhz+nvQMOFDnTKtUdfDjAbRyD3eVkLPHSolCuLAMcdsHAuzK+oQMH
 y3ImuJY6BwGSr+gPJes+AboKc/gKF3JKZAbfaXruQBmpwSU763+sjlBkqqqRU/h8aqCE
 bCudK+UOEhvgs7H3TWESNbAtIOS/dcJVks++UACMFB8qJdGDz1Yy0GdVoIzjTL20f6bz
 ESnHr9x4EwavVUCW10E0fOEXLRyS4hy20PhEc4ItLtJ7v8/dZc1nh0s3euyNdxyrOy6m
 sAhFzpgXZbA19dg/Cx7G2fkh3+djrCwUEZsr6NgJcFF8df+DkRvfLM43CkUuKKiIMvbm
 iKWw==
X-Gm-Message-State: ACgBeo1K512EzRhckYSdp2PnqFv5ZKNQI3UHXK+WvmwRNn/UcbGQRanz
 M7bz09hqbGGLtPdRMN4eDbrepM5pYlXFjsgw
X-Google-Smtp-Source: AA6agR7lHZ3823Lmmh7dr6wvftnHHB2dspDf/ds2s8lvMtBRMBOEv42heUT6coknD3MT4cHhYH7hyQ==
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr2194918plk.16.1660819472611; 
 Thu, 18 Aug 2022 03:44:32 -0700 (PDT)
Received: from fanta-arch.localdomain
 (ec2-35-78-114-158.ap-northeast-1.compute.amazonaws.com. [35.78.114.158])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa7990c000000b0052d36feb7fcsm1263220pff.198.2022.08.18.03.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:44:32 -0700 (PDT)
From: Letu Ren <fantasquex@gmail.com>
To: deller@gmx.de,
	baihaowen@meizu.com
Subject: [PATCH] fb_pm2: Add a check to avoid potential divide by zero error
Date: Thu, 18 Aug 2022 18:44:24 +0800
Message-Id: <20220818104425.35573-1-fantasquex@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Aug 2022 06:20:23 +0000
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
Cc: zheyuma97@gmail.com, linux-fbdev@vger.kernel.org, fantasquex@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In `do_fb_ioctl()` of fbmem.c, if cmd is FBIOPUT_VSCREENINFO, var will be
copied from user, then go through `fb_set_var()` and
`info->fbops->fb_check_var()` which could may be `pm2fb_check_var()`.
Along the path, `var->pixclock` won't be modified. This function checks
whether reciprocal of `var->pixclock` is too high. If `var->pixclock` is
zero, there will be a divide by zero error. So, it is necessary to check
whether denominator is zero to avoid crash. As this bug is found by
Syzkaller, logs are listed below.

divide error in pm2fb_check_var
Call Trace:
 <TASK>
 fb_set_var+0x367/0xeb0 drivers/video/fbdev/core/fbmem.c:1015
 do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1110
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1189

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Letu Ren <fantasquex@gmail.com>
---
 drivers/video/fbdev/pm2fb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index d3be2c64f1c0..8fd79deb1e2a 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -617,6 +617,11 @@ static int pm2fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 		return -EINVAL;
 	}
 
+	if (!var->pixclock) {
+		DPRINTK("pixclock is zero\n");
+		return -EINVAL;
+	}
+
 	if (PICOS2KHZ(var->pixclock) > PM2_MAX_PIXCLOCK) {
 		DPRINTK("pixclock too high (%ldKHz)\n",
 			PICOS2KHZ(var->pixclock));
-- 
2.37.2

