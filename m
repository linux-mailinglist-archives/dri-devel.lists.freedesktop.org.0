Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C92BC64FB
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C34110E8C1;
	Wed,  8 Oct 2025 18:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mTpGM9hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C93A10E8B6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:36:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46f53f88e0bso1193435e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759948591; x=1760553391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXl25NV/bCKQtXQE+8UoQ32n8mgGUsnabyuLmYWSLFM=;
 b=mTpGM9hxaNAEpfBAXZeYE8yi5iK6Ddh5J5tCGFbwlvJgz5NqLhdr8ShHuaXMxr1D37
 61OR+Xays7bi97oAWto421fwS/wS2LxnONtrXeMIH94A0GGbxgBb4u2BkZbwlnK5DUD2
 rb23AgrlTMU48JpD8qiWWhNucfsLxWeuxEu5KprTGSPqnC1JhU6u3ELiBpj1PSV+lgKd
 mKKmaBY5y6JDl/csshC5KcjWESb6HUK4sGWL/esIWrM1C6W9gdspQ9HOx2kB3qUeCGsS
 KxZh9UkTsJIoK5vY94j/BwROBB9jJMROHIVzsdiRpVXIzF6A+9GbvHnLjphqR0LWdayr
 753g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759948591; x=1760553391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FXl25NV/bCKQtXQE+8UoQ32n8mgGUsnabyuLmYWSLFM=;
 b=qqupj9eu+3Kc00Hc2JZ3D6k+wMgPzrfclSxNheK2nTyWfb2U/7NuImyTOcPG6+u1bs
 ZjOnkWtiNfuUruIpTT+sfUiev8qY4d8g+U0fNvWLFq4cxDoafDLIX8piwJPpqpNCN9Sb
 hjobAelKIm/JoLt7TSHDFBpxS8UnEHTRlUwPeG5hymHlErdtiGXEuu7t/nLTUZKE5TQO
 rfLj3l842vooOzPQgJUljyxocIOqmCqzsbI+WGiOXYkLFrAiUrm08W9pb1njL5byraTW
 sPOY8la1gdl6qR2y0m7U6BsOZlrhzdMMC35WlHntuBB4Z7bmdCRFigIl+wWU849/ErZ3
 wqAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyCQ1LrNC0vYuo2CJ3CDpQJ0Vq88tfsKlxOiUW67hYvbYHc989sIpQG+qQs47a3VqG9kNyEEy5siA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAMMfQPdYky/itbbjdMWoUDoG4SIzQeSnUuM+fWj8nV6p4RNKT
 5yTbbrAGigsjz/0HPN0Q++QZyze0Rb0bjlJnMqX4zEwiWPadmyVlLah3
X-Gm-Gg: ASbGncvCVonDoE6P6R52tddimit81YS3qCCN/60xyYap5usGSn41bXFrLNEfp3p71tJ
 O2X1QsktytUSsBwaVRiRC0IB9v3y1p730dgWQZLAkyGS8mVKukBwvwjc/iymMzoKC5p5ck+VFEH
 G+mijEmDF1KaVmp2GkdBiRwxmXlm60wwdLIaAZnm75fuM4mcgfM0YYp7erjCLFAnvjD0ZvX9gFO
 DRfcTXsSP2PNmnqMlrL1fdwoBW1nNc5e7wm/n0FVJVrOnKZzXlBDyhBEnlQ/hpz7bOeJSOQ0W2D
 +0bE54ut0iPE2kdtaISuk0FU5bFPOK4z6nzGlwOxKCH7O6n46aY5nyC7staPGaFQYdHPyYJSkqf
 gMBnm/p+VYGoyuoH/UK1Bx22R8oO4qPwM7/okQzCX+ItXii/9nlTVD9sQ/5m6foKYpa0qoZBg+D
 V7mUo=
X-Google-Smtp-Source: AGHT+IHMaf049Vy0bK5HqZ7v24YZjjYWkYmfKtcVF11hqH5XCAA615OXjCUg7WY+wO3hElGgf+q6Og==
X-Received: by 2002:a05:600c:1e87:b0:46f:a95d:e9e7 with SMTP id
 5b1f17b1804b1-46fa9a22e8cmr29602565e9.0.1759948590639; 
 Wed, 08 Oct 2025 11:36:30 -0700 (PDT)
Received: from dell (117.red-81-33-123.dynamicip.rima-tde.net. [81.33.123.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab5250ddsm18839465e9.6.2025.10.08.11.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:36:30 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de,
	u.kleine-koenig@baylibre.com,
	tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v3] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
Date: Wed,  8 Oct 2025 20:36:27 +0200
Message-ID: <20251008183627.1279115-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251006164143.1187434-1-rampxxxx@gmail.com>
References: <20251006164143.1187434-1-rampxxxx@gmail.com>
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

This patch wraps the relevant code blocks with `IS_ENABLED(CONFIG_FB_DEVICE)`.

Allows the driver to be used for framebuffer text console, even if
support for the /dev/fb device isn't compiled-in (CONFIG_FB_DEVICE=n).

This align with Documentation/drm/todo.rst
"Remove driver dependencies on FB_DEVICE"

I've not the card so I was not able to test it.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v2 -> v3:
      * Change commit msg , thanks Helge Deller.
      * Delete not used include , thanks Uwe Kleine-Koenig.
      * v1 https://lore.kernel.org/lkml/20251006164143.1187434-1-rampxxxx@gmail.com/
v1 -> v2:
      * Fix error and improvement , thanks Uwe Kleine-Koenig.
      * v1 https://lore.kernel.org/lkml/20251005173812.1169436-1-rampxxxx@gmail.com

 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index ade88e7bc760..3f79dfc27a53 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -759,7 +759,7 @@ static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(dev, info);
 
-	if (device_create_file(dev, &dev_attr_dispregs))
+	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_dispregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
 	return 0;
 
@@ -801,7 +801,8 @@ static void of_platform_mb862xx_remove(struct platform_device *ofdev)
 	free_irq(par->irq, (void *)par);
 	irq_dispose_mapping(par->irq);
 
-	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
+	if (IS_ENABLED(CONFIG_FB_DEVICE))
+		device_remove_file(&ofdev->dev, &dev_attr_dispregs);
 
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
@@ -1101,7 +1102,7 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, info);
 
-	if (device_create_file(dev, &dev_attr_dispregs))
+	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_dispregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
 
 	if (par->type == BT_CARMINE)
@@ -1151,7 +1152,8 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
 
 	mb862xx_i2c_exit(par);
 
-	device_remove_file(&pdev->dev, &dev_attr_dispregs);
+	if (IS_ENABLED(CONFIG_FB_DEVICE))
+		device_remove_file(&pdev->dev, &dev_attr_dispregs);
 
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
-- 
2.50.1

