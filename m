Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EA180C73
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEB86E8E8;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5066E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 14:30:58 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z12so6382999pgl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MacYADCTD8qyc7WRcNZs8kAJcizBx9dQZtfdy9R4RNE=;
 b=KttrUyVNMJm4tVYsndEJewihA/Fnj3N2ZrjYXIrDKeGl8u/WNjT48KZrE5gagQlRGw
 NsMbdCIkZCKNQ9PqKTuT6DOghaGLkm6UW7HV2ruq5QGTJfIBEw1k3T8+NDHpBWC2FvGm
 GFuEtFUCuPXElbvO+Bt8GVG9txDegpQ7HBGqNL86qPmCGmC8/pmKM2VCCtl9gcZlEaKF
 Sqk7gHJNqdfImZj4Tnq8kPoqYQtJOzyS+KFCV1P9sXrSEsYdNSJzBUxzbwJYwT9iFFq+
 +HCsss44iRlGKPmrcylrkKGSpHUyGX4EKEPerBxQ8IrBOqRHSih0RLo1b1i5TRsWs+LX
 erIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MacYADCTD8qyc7WRcNZs8kAJcizBx9dQZtfdy9R4RNE=;
 b=dP9mXAuQVZKCwzUs4+EZQ35MMJM7LtKeS5sMb7qscGQxczjskwb4tjAY52aEkiC+dV
 w7UxzNO5+bOvFIbZpJVtO3BsQ+ZSaBJlIPMcXwz7f/0L9eGP/SMn0GDK8y3tperzBtog
 KJXnwKCZ/eLGjfZLvU6g7IwqE0HGd/hIPywhA0Ba6rvjHQqyk0djjC8gQ81CQKuoDjY1
 RoJEPZhYrJjJYZRdcjLuy0WXL5sEuNbvYVRRqWmqDPJZiFkqd1AuSaoQFMaWxwsreY5q
 nn7/SZv6tbdrDfAQjrLiFd/szygInBDGPiH+QrRuU2bSBFIoWVYA30z99qijNhMFgTEm
 zRgA==
X-Gm-Message-State: ANhLgQ3FOELC6y+h/GRHGQBdMl/ETkllupk9sYqrwUwrenUe4KVdwLoW
 5wnoq3mH77NQpfZ+HA+YrnU=
X-Google-Smtp-Source: ADFU+vtOz7EqaVGESIcXkflwV06RHK6js+BsrPdEsZ/CtPuy/i+I8NN2JdKWWajI6r7UnUNzTZwOCQ==
X-Received: by 2002:aa7:9af8:: with SMTP id y24mr6740721pfp.91.1583850658299; 
 Tue, 10 Mar 2020 07:30:58 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id j21sm2537919pji.13.2020.03.10.07.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 07:30:57 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v3] video: fbdev: arcfb: add missed free_irq and fix the order
 of request_irq
Date: Tue, 10 Mar 2020 22:30:50 +0800
Message-Id: <20200310143050.5154-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Changes in v3:
  - Add missed variable par in remove.

 drivers/video/fbdev/arcfb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 314ab82e01c0..9a720c14056c 100644
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
 
@@ -590,9 +590,12 @@ static int arcfb_probe(struct platform_device *dev)
 static int arcfb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
+	struct arcfb_par *par = info->par;
 
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
