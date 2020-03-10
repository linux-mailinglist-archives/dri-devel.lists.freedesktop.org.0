Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9917F1B9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C763E6E833;
	Tue, 10 Mar 2020 08:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3736E513
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 02:35:45 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l41so45969pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 19:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weiT/gNMaT98DNcrVoArqN1n8qFeWFcO2aQcNrwiOqg=;
 b=uxXytDB3DRQOxrf6pVlKVlOQH0reGS/RA0mfsP2HFwvi0wllV2YKlIc6k7vHehz7/6
 1gSRXObd3WUwmpYBMiflWSSOTPFZOZZCUH+FjuKa+U+MOv7noMKdyhzJ7cgnqveEIaPG
 ZwZEEjoQnFIR57tphVcc4UE9MLyQXd9qUVxMAFIvEDNZxhoe4atpBb6WTV2MF83yvv6P
 q2kGNu3xBAMQUZZ6Uvn0abfyYWgqJcYOM9L1O8G5J2ntuY/u6b/TP7Ldg9mX8kOBPGla
 Z6lKmLItIFm1rieh7LRe7UUUtOkuw78CLJ0he6t8cSeTDIlxFR91rsQSt/iBxwOagnY+
 qPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weiT/gNMaT98DNcrVoArqN1n8qFeWFcO2aQcNrwiOqg=;
 b=nan/Cbxz8qipuOHqvndcCL8zZzQqGGYTNi1qUG9/5P6cTYANdnzQvw6T1//XWwTj//
 ElfpQ9BB98wdG4SS531QX2OJZZF5ZZAh0x6RQ6qB3GEfgo5+FDVziSfA7hxEf36eNd8R
 dNZ4bVEK6uRCv0NJ8D74MecELYvtVqjNW8TXpd3SRr0OvkRm3uciSu/amufj6rOxGmgb
 NR+iVbIC5YrzGHkl7r5amu2EpJdc5jgfSLWX9ZmA5qjn6UwaUhucEdSqaNFRmF0aJV/B
 5FRoU+q2/rB6ipezNw5wp4uSKR/qyGc0VfL+LNBhy37hQp2P3PYEu/U5F+pjpr0XcDKd
 BhnA==
X-Gm-Message-State: ANhLgQ2RzcFLIuCQeW7uwLQlE3OXpi/qLENazUoA70K6f7yCd/AQCDne
 phFqGiDeMO2c42kHu7g6xpQ=
X-Google-Smtp-Source: ADFU+vuZFLuZ7dndLbqKaQsp8rEK6RvoNsgepHsiTu02j9X4XFtDo/9FRU6R4aQmSDiH3nLE2/pjvg==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id
 h7mr2487827pjs.107.1583807745548; 
 Mon, 09 Mar 2020 19:35:45 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id u11sm816627pjn.2.2020.03.09.19.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 19:35:44 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v3] video: fbdev: vesafb: add missed release_region
Date: Tue, 10 Mar 2020 10:35:36 +0800
Message-Id: <20200310023536.13622-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: linux-fbdev@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver forgets to free the I/O region in remove and probe
failure.
Add the missed calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v3:
  - Revise the commit message.
  - Add an error handler to suit the "goto error" before request_region().
  - Revise the order of operations in remove.
  
 drivers/video/fbdev/vesafb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index a1fe24ea869b..c7bc9ace47d4 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -439,7 +439,7 @@ static int vesafb_probe(struct platform_device *dev)
 		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
 			vesafb_fix.smem_len, vesafb_fix.smem_start);
 		err = -EIO;
-		goto err;
+		goto err_release_region;
 	}
 
 	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
@@ -458,15 +458,17 @@ static int vesafb_probe(struct platform_device *dev)
 
 	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
 		err = -ENOMEM;
-		goto err;
+		goto err_release_region;
 	}
 	if (register_framebuffer(info)<0) {
 		err = -EINVAL;
 		fb_dealloc_cmap(&info->cmap);
-		goto err;
+		goto err_release_region;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
 	return 0;
+err_release_region:
+	release_region(0x3c0, 32);
 err:
 	arch_phys_wc_del(par->wc_cookie);
 	if (info->screen_base)
@@ -481,6 +483,7 @@ static int vesafb_remove(struct platform_device *pdev)
 	struct fb_info *info = platform_get_drvdata(pdev);
 
 	unregister_framebuffer(info);
+	release_region(0x3c0, 32);
 	framebuffer_release(info);
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
