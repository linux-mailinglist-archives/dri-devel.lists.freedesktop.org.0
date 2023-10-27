Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81057D9732
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DEB10E0C4;
	Fri, 27 Oct 2023 12:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDA810E0C4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:05:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a98517f3so2743681e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698408347; x=1699013147; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rtys4OVP5ZzVlnIPSorJGpGjoOL2VcdIqIpp51DIOc0=;
 b=z3JnjTwMfrcqEfHdB6i+JRHFYNUbpExKMP8RLPQdnxVfSz5a68ds2g0/GjulfLj4dC
 TduLvkej3ULhtArLtzW04U819lDVy+YMaoMpYJSAKTMK0OnXkMyh/zF9veQR3lhG0G3m
 XHW/2rX7DnyUNrJLlg5V87TFwXcNnLvS1EEjqMKhFaV6R63njenty2z2zA3AIkoDv1aG
 0Bx0RNglquMdFJJqa9WU91vrgDexYaEFdI5/o2fWfPZNtRL9nkwqTl5RDm06K1MOIggA
 rUz22KLM8I77tELZc4lJkN//m8MJE00BRnNeqqePOsTwYHeeIREYpk5dyJZ6GFQz7QKo
 ULQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698408347; x=1699013147;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rtys4OVP5ZzVlnIPSorJGpGjoOL2VcdIqIpp51DIOc0=;
 b=PhUsiuV8m2dq3R331VO6N8G65J0emjFdOvfdfq6WbltUBcmg3ETb8MfEV7dqeNQmJu
 u1uQBW2Li2jA5ABfPSCn3dbEaAm+AwUdtLfNsVloX2JfVbJjCARu1by5kUS3rC4aXrzn
 4NTPaE9Y1fbea8f/OvGapvbf0igk+7I4AjcLzyp80KFu3O+Ut4Of/RII8fat0FlIjurV
 deTrUwT28ed0jkWe3JvRMXdLKqsgKbLOu0Qgr2F6dx0+ydzA1ceur456T4O/2QuZMlXc
 4M2ripJXytIgQQjwORCkbCw7NlAaiN4vnHBlfWfZE0Hu2VP8qzWGaEEwkGVdLIy8gHlT
 Ts/w==
X-Gm-Message-State: AOJu0Yxm5S7NIYrolZtz+cg7+4HmzYWq755dkrRZ2PQNnQ9pmfhRMtE+
 f7ZnihYW28WeSt1koBDCrkEZRNMov/GFs1ing+M=
X-Google-Smtp-Source: AGHT+IEwMLdMiT1DpGl66JFRaW3Jkd9s7CFvWo0aNUOb8/tWmvL7FTmnMQJ10tzgk46/kJ10FHVi5Q==
X-Received: by 2002:a05:6512:48d1:b0:500:bf33:3add with SMTP id
 er17-20020a05651248d100b00500bf333addmr1543741lfb.47.1698408347447; 
 Fri, 27 Oct 2023 05:05:47 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t20-20020a0560001a5400b0032ddc3b88e9sm1663138wry.0.2023.10.27.05.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 05:05:47 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:05:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH 2/2] fbdev/imsttfb: fix a resource leak in probe
Message-ID: <71f55328-2275-4e53-98f2-f8a88cbd3399@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <014c0272-0d53-4625-8517-e8b4aa68f4dd@moroto.mountain>
X-Mailer: git-send-email haha only kidding
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've re-written the error handling but the bug is that if init_imstt()
fails we need to call iounmap(par->cmap_regs).

Fixes: c75f5a550610 ("fbdev: imsttfb: Fix use after free bug in imsttfb_probe")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/imsttfb.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index acb943f85700..660499260f46 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1496,8 +1496,8 @@ static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (!request_mem_region(addr, size, "imsttfb")) {
 		printk(KERN_ERR "imsttfb: Can't reserve memory region\n");
-		framebuffer_release(info);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto release_info;
 	}
 
 	switch (pdev->device) {
@@ -1514,36 +1514,39 @@ static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			printk(KERN_INFO "imsttfb: Device 0x%x unknown, "
 					 "contact maintainer.\n", pdev->device);
 			ret = -ENODEV;
-			goto error;
+			goto release_mem_region;
 	}
 
 	info->fix.smem_start = addr;
 	info->screen_base = (__u8 *)ioremap(addr, par->ramdac == IBM ?
 					    0x400000 : 0x800000);
 	if (!info->screen_base)
-		goto error;
+		goto release_mem_region;
 	info->fix.mmio_start = addr + 0x800000;
 	par->dc_regs = ioremap(addr + 0x800000, 0x1000);
 	if (!par->dc_regs)
-		goto error;
+		goto unmap_screen_base;
 	par->cmap_regs_phys = addr + 0x840000;
 	par->cmap_regs = (__u8 *)ioremap(addr + 0x840000, 0x1000);
 	if (!par->cmap_regs)
-		goto error;
+		goto unmap_dc_regs;
 	info->pseudo_palette = par->palette;
 	ret = init_imstt(info);
 	if (ret)
-		goto error;
+		goto unmap_cmap_regs;
 
 	pci_set_drvdata(pdev, info);
-	return ret;
+	return 0;
 
-error:
-	if (par->dc_regs)
-		iounmap(par->dc_regs);
-	if (info->screen_base)
-		iounmap(info->screen_base);
+unmap_cmap_regs:
+	iounmap(par->cmap_regs);
+unmap_dc_regs:
+	iounmap(par->dc_regs);
+unmap_screen_base:
+	iounmap(info->screen_base);
+release_mem_region:
 	release_mem_region(addr, size);
+release_info:
 	framebuffer_release(info);
 	return ret;
 }
-- 
2.42.0

