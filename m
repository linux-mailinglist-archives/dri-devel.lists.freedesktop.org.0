Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF619225C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3721489E23;
	Wed, 25 Mar 2020 08:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879456E161
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:24:01 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b72so9257983pfb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J59vOQButIA7wOzAY9wmajFYSXUMpXsPzQxaHYbQv0o=;
 b=duqJNACteTZSXSWcZF+gw1gKTJ4q1aUrfnAY8rwv1olCQqbbh2Ieil2rGE28zWqW3N
 jGzY6h6Xgd0f/k30hX8o57PFadqh2jKETuPVzX8vwAssZlz5pPGqwJiuzZSM3aR4swVU
 FxmlGfJLVFvEMBi0/LJjGqquKL866NuDSzfVlWxpAuXd/1BWw/1+mXcJ0mVVVIUSKKWz
 y+BKGvYDHary7SK/O5BJ3X/8vmBQy0a6K+GmIYS96bRriWhDd85terlO2mrXxQ8xdu52
 U52SS2J29H1F4dqDlA4XfVa/KRcJ/u7GKgELhyNTAUFciHaVFdDDX5Kd5eWqg2UG3r5X
 1Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J59vOQButIA7wOzAY9wmajFYSXUMpXsPzQxaHYbQv0o=;
 b=cJkyhnhMObp+u2RUOb1iriwIBsY2DbFqH7qtP4tkfoKbdUvJNKebnG8nDendkbo5je
 DDMHJU5coSWHNTowvSToZ177VVtihuc0ig+qIpUCW3h0syxdpH2gGF/gCkdxne/V9C8u
 tqjso18G6t9aXxbAfQugQPHFLpnT8hfgiyY6F4FALk9zhXpURUo523tMDrZYZ4lpbjeF
 GAMC+VkUrAGIE+NwfZOE60rN3mLmglAuntILFwmEVajshvj7Tz6+/slJr+c7JzX4tMxk
 2L5WzX3e13N4auCzxDVm8kneq1brya5cmU2JQLd/cImp1QljaEWlWqufw9VkIWH33+IJ
 Oq/Q==
X-Gm-Message-State: ANhLgQ0zBWjQxaxvSCqLDUu6a7Pvb9jPbBO3P5Qn6JyfglRKQyE7w0oC
 s014zGa/0RZmHsMuOQYtvio=
X-Google-Smtp-Source: ADFU+vuGRwIJvFbAqb+kj/0gocMW4ppLpIEgYm9sWVVBwJaPcIjDZns5zlU0AC9H0zhDUZoQKzK5OQ==
X-Received: by 2002:a65:6910:: with SMTP id s16mr1545967pgq.426.1585056241100; 
 Tue, 24 Mar 2020 06:24:01 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id g11sm15874883pfm.4.2020.03.24.06.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 06:24:00 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v4] video: fbdev: arcfb: add missed free_irq and fix the order
 of request_irq
Date: Tue, 24 Mar 2020 21:23:53 +0800
Message-Id: <20200324132353.21785-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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

The driver forgets to free irq in remove which is requested in
probe.
Add the missed call to fix it.
Also, the position of request_irq() in probe should be put before
register_framebuffer().

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v4:
  - Use info->par->irq instead of par->irq to avoid dereferencing NULL pointer.

 drivers/video/fbdev/arcfb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 314ab82e01c0..6f7838979f0a 100644
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
+			free_irq(((struct arcfb_par *)(info->par))->irq, info);
 		vfree((void __force *)info->screen_base);
 		framebuffer_release(info);
 	}
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
