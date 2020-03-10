Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DFF17F199
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B826E808;
	Tue, 10 Mar 2020 08:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638506E513
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 03:43:54 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t3so2608422plz.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 20:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJRaRZ4naX3Vnv5pmVF9pvGr8T/5dEuyNUhM/Hub+PE=;
 b=r3daWSPEY9Uv+21e3FeeuaaVrZl1TLEKPbfhYSAW/PKUS5xWLkTJn6KOxSn82D/MTI
 LNF2vHRgY8rH7HSn098uS6WuDkE7lXkCWCPy/Vuzk505jHF8XZ/NzTtLI4qrhFYG/5aI
 dm+Lym2eERwjXSoQ1AHaU8twICmCsfj6ZvaYoVerKsCEy53VU8E1jCphrQh7kLCb5C1J
 8+GbwanjoeDJZehn1bknUAPH8T8X2bVg6uPnmJZDNPvex+RCT1CbT0CoahE4nylZK+fV
 vsXNKazNbIq/KbU/m4KWIdiVMjDSH3EZod+exPnTVT/UaX/5vuXHyj9M3oQLPTFwp/0d
 O64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJRaRZ4naX3Vnv5pmVF9pvGr8T/5dEuyNUhM/Hub+PE=;
 b=S1BqAU2zQe02gXN/huM8X2YjoEbAuL16My8tRHBnCR0A8Fyj64vFs7St2O3CMYkv3p
 ROtRjqErg1lMw37ZgrMK03HZl5W9lyBFwWPZnYujgPIolGEs/ZM2pAymo+mEJ0WUKjCe
 cGsFVW15P9U7aH/rOslQr6EiKjIskYDVXGfj5mNdHFHPQtjuuwZjWUJiCQ+tYZpDVetV
 gzV4W9PrIQBqe14NV3JrKzIzQDCS75hKXT1xjAWcJWhtO58+woIqqmUbHPwph/U1vzhU
 TZwgvnL1VFLx6BAQ8vHs+qjS5myW8sM71U+4e1cYkMovemdtfJF2J1yQNpZysJFZckGg
 dlog==
X-Gm-Message-State: ANhLgQ2GeUkkLbBR/QtqdbygMC8LQGa6YWYEKoE3vk5cA1qbKkr8cfD6
 p37yOqtbqfKx1nsH1zsXbNcjcpri5P0=
X-Google-Smtp-Source: ADFU+vv4G89H+vV2DiLZrhX6m7BY78nga1L/yVPTRxdMuCHNWhODFybtIruHBzBlmP9I2Mg0T+t/hA==
X-Received: by 2002:a17:90a:778a:: with SMTP id
 v10mr2550213pjk.135.1583811833984; 
 Mon, 09 Mar 2020 20:43:53 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id q7sm31499354pfs.17.2020.03.09.20.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 20:43:53 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] video: fbdev: arcfb: add missed free_irq and fix the order
 of request_irq
Date: Tue, 10 Mar 2020 11:41:05 +0800
Message-Id: <20200310034105.14379-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:04 +0000
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
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver forgets to free irq in remove which is requested in
probe.
Add the missed call to fix it.
Also, the position of request_irq() in probe should be put before
register_framebuffer().

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Modify the commit message.
  - Adjust the order of operations in probe and remove.

 drivers/video/fbdev/arcfb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 314ab82e01c0..ab553f940f9f 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -544,10 +544,6 @@ static int arcfb_probe(struct platform_device *dev)
 	par->cslut[1] = 0x06;
 	info->flags = FBINFO_FLAG_DEFAULT;
 	spin_lock_init(&par->lock);
-	retval = register_framebuffer(info);
-	if (retval < 0)
-		goto err1;
-	platform_set_drvdata(dev, info);
 	if (irq) {
 		par->irq = irq;
 		if (request_irq(par->irq, &arcfb_interrupt, IRQF_SHARED,
@@ -558,6 +554,10 @@ static int arcfb_probe(struct platform_device *dev)
 			goto err1;
 		}
 	}
+	retval = register_framebuffer(info);
+	if (retval < 0)
+		goto err1;
+	platform_set_drvdata(dev, info);
 	fb_info(info, "Arc frame buffer device, using %dK of video memory\n",
 		videomemorysize >> 10);
 
@@ -593,6 +593,8 @@ static int arcfb_remove(struct platform_device *dev)
 
 	if (info) {
 		unregister_framebuffer(info);
+		if (irq)
+			free_irq(par->irq, info);
 		vfree((void __force *)info->screen_base);
 		framebuffer_release(info);
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
