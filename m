Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFB58143F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58BF90C11;
	Tue, 26 Jul 2022 13:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2772911A64D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 08:23:07 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id b11so5588495qvo.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamunlimited.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6czwj1HzPSVht5LKBHhjYm6MovKhK084JbpR2sXNUxE=;
 b=PaanFb9C2onSyyBOzQuSewIeVp/JBcVJ6X2rfbbWQIfn89XDfLM+X2YNKzqdJolbxD
 sLAzF1ykNA08gre0tABu2WPkSCctDo3MQ1aGfZd7dLvtTyQ/+LaHV3mWP+DYrnK50ScQ
 ljQqIVT+LmzG3jQEX/dfAn0wHqLNAXV3noJmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6czwj1HzPSVht5LKBHhjYm6MovKhK084JbpR2sXNUxE=;
 b=DK7V9intnDWRArzu2bCwL0C7qbauxIvPTf9nMBp3zEVLlW9pQ7ymst0B8cDqE4JB9p
 iymaHd0wX4pDpEjrHdKG8so93dwJNUtlFc1rfg/hN5J8NzdZF4pul7GjoW6772mpQH9p
 FJG9mbEThBZskghn60j3jziaxRywoDLn33KlY0kqBShJ2x/fCRsFw2lYSf4PUeW7MpFV
 wq2m4UUpIr71kSTX2TDy+2cTimXI0qWTfCaFj4dlY2cpwvjR3l/Waoup4lDvID6idU0l
 sVbf1XWuDmZRF5JBjmS4WLdTpwowyfwMi7i+0M8x94BX06SQ6Fp0Swfeo4j/RKWM36W9
 a+1g==
X-Gm-Message-State: AJIora9CSdJS4va1MrsZOxOJxcvoPfv7trooZUp45Plc41CtQ/mI/ZhL
 PhHFa0qUMEjgehKrOLlnpc1yjA==
X-Google-Smtp-Source: AGRyM1voH2NwourXXNbOEJ/tLf9qotPbGThefm/NyTg7N/0KBHbFjT5XFPrO8DhdO3E3qZhWHOJvoA==
X-Received: by 2002:a05:6214:2342:b0:473:bcd6:a3b7 with SMTP id
 hu2-20020a056214234200b00473bcd6a3b7mr13676393qvb.88.1658823786755; 
 Tue, 26 Jul 2022 01:23:06 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a12ae00b006b53fe19c41sm10004461qki.14.2022.07.26.01.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 01:23:06 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: fbtft: core: set smem_len before fb_deferred_io_init
 call
Date: Tue, 26 Jul 2022 10:21:13 +0200
Message-Id: <20220726082114.891853-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Jul 2022 13:35:02 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Suti <peter.suti@streamunlimited.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fb_deferred_io_init depends on smem_len being filled
to be able to initialize the virtual page lists since
commit 856082f021a2 ("fbdev: defio: fix the pagelist corruption")

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9c4d797e7ae4..4137c1a51e1b 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -656,7 +656,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbdefio->delay =           HZ / fps;
 	fbdefio->sort_pagelist =   true;
 	fbdefio->deferred_io =     fbtft_deferred_io;
-	fb_deferred_io_init(info);
 
 	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
 	info->fix.type =           FB_TYPE_PACKED_PIXELS;
@@ -667,6 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.line_length =    width * bpp / 8;
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
+	fb_deferred_io_init(info);
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
-- 
2.25.1

