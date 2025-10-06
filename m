Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B61BBEAEB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 18:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB00410E429;
	Mon,  6 Oct 2025 16:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3jkLius";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7B10E429
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 16:42:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so33485485e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759768920; x=1760373720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B1m3A2SK0UP4dwSyRm6Qf6w7bJhm1Ficb4+Tgp0EQaQ=;
 b=O3jkLiusEszcuAq2DWNPr33h9jEuKunUTldbZXnbsOT5STDq2qrd68er8fxFoioffp
 inrxOBLElXf7GoYBGbfaC8ZJlkrw0vIUBwKyQSUH5r7OpLrBprVu0IirLEE7P8razhWQ
 PtvRMElJQRK6e9aKxJ1czR6Dp4c4plr+ndemnIfWCiVMAKoAq00I2aTeIJKLsc63QZ6q
 UvYVygCl5D3fvLcbU6Wd++O5Mqg0ow1KwuRtiJQW4mtD83PYpX2qi113bEEeB2LiIfku
 lMG9tdeoQyrBPJwJPhnKzW4FO6GyryT5muqKLRnc9K1/rGHGGRWoI/ccySqipsK3lMKz
 tLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759768920; x=1760373720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B1m3A2SK0UP4dwSyRm6Qf6w7bJhm1Ficb4+Tgp0EQaQ=;
 b=w1lD6fGz9VFoPTE0yTU5bdJ/8x0kM5g9pynn6VNdxX1+QpVVI7i+g5Poq/4EIkHXqx
 o6SETdBOXJ+4whoJbjg92Ys1lgHtw7cOpkoEJEyvqZQVT3h36b28+tPn25C+obEJyJkQ
 Z//oLvY+vCo7NhpWC/WP7/OW4gJdzNwvpH6W3JQvIxrfJ3NAZPMNePk4nJQOIyb75+WL
 i6DDQwpDToqU88sX70lrZI/3IHdXpuMWkY0JkXqLT9nIAxlQ3kX0etyGKfFZ0uzFwqKu
 qiFkEq//BuLCAV+kOxIQxL1EYAyeu89VvPz9Bn2xiVdsQOdQ7KCjIn+b4dPl1afdSt5J
 /v7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTWXOnbuj2zsAQZxubnlNihvitksFvgGvSFCSann4tbjtc4eG2uTy7GhYDvl3e5wy3ovtA3Jw4imU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKTNI52bP1r6NGg+MGxo0+to93ks+Y0+6W7ce88nUpGraZNEc9
 o5Rwr3V2NyalR2aPZAWhGXf9xOQ5MGlV3vqbMKNizr639hYuxlNL7WsJ
X-Gm-Gg: ASbGncu6CcVVynSAZev9gc5p2X2A9wGfAx1KqbIH3VA8NRYs/bjoPgu7sPqRushNH0C
 Wi2EutG4XCDOxv+3Czdzf4J0D1/hniMR5pEfimYPeJgPh0In5fDXMJe2nuTzV5PMak/6zcyoZnG
 fOzvun4PirOmiRiM5VxDuIItw1q7x5yhRl5BSS6L/TZ0iKp/XvT81msWnUM4FcIN2u6BFGIeb4V
 QbEihuibD/GnfizmJtzALQJIH96lI6lx7/HurhhQk5hIg+AOJU1kJOcKhtT5SRKEXQceXOa0b47
 aP0bAgleNmC0LwldZU8N3BOWkRZHaJ3T3DKc7TfI+aG5ePT//KQW1ik7Z8fmExcJ0oCz+8VlCA/
 PbnzhVTygvM7FME1sGD6mZnz9REOocZlqXy+mj2knFzF3ea/9ptK12v7HrBAc4o1T5u1vJZp+V/
 79qbxEi2SAeSbIjhyHdIEsXRKl
X-Google-Smtp-Source: AGHT+IHm3Tu9iRyGiCt6V9SEZWDXWNqwJokz4bgw1HkknIkQ71kli9dOgCeRNWFNMzpZwV0p36UR6Q==
X-Received: by 2002:a05:600c:628b:b0:46e:456e:ada5 with SMTP id
 5b1f17b1804b1-46e71146994mr75585645e9.28.1759768920064; 
 Mon, 06 Oct 2025 09:42:00 -0700 (PDT)
Received: from dell (117.red-81-33-123.dynamicip.rima-tde.net. [81.33.123.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b5f3015sm151246565e9.1.2025.10.06.09.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 09:41:59 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de,
	u.kleine-koenig@baylibre.com,
	tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v2] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
Date: Mon,  6 Oct 2025 18:41:43 +0200
Message-ID: <20251006164143.1187434-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
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

This patch wraps the relevant code blocks with `IS_ENABLED(ifdef CONFIG_FB_DEVICE)`,
allowing the driver to be built and used even if CONFIG_FB_DEVICE is not selected.

The sysfs only give access to show some controller and cursor registers so
it's not needed to allow driver works correctly.

This align with Documentation/drm/todo.rst
"Remove driver dependencies on FB_DEVICE"

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v1 -> v2:
      * Fix error and improvement , thanks Uwe Kleine-Koenig.
      * v1 https://lore.kernel.org/lkml/20251005173812.1169436-1-rampxxxx@gmail.com


 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index ade88e7bc760..dc99b8c9ff0f 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include "linux/kconfig.h"
 #include <linux/pci.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -759,7 +760,7 @@ static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(dev, info);
 
-	if (device_create_file(dev, &dev_attr_dispregs))
+	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_dispregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
 	return 0;
 
@@ -801,7 +802,8 @@ static void of_platform_mb862xx_remove(struct platform_device *ofdev)
 	free_irq(par->irq, (void *)par);
 	irq_dispose_mapping(par->irq);
 
-	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
+	if(IS_ENABLED(CONFIG_FB_DEVICE))
+		device_remove_file(&ofdev->dev, &dev_attr_dispregs);
 
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
@@ -1101,7 +1103,7 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, info);
 
-	if (device_create_file(dev, &dev_attr_dispregs))
+	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_dispregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
 
 	if (par->type == BT_CARMINE)
@@ -1151,7 +1153,8 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
 
 	mb862xx_i2c_exit(par);
 
-	device_remove_file(&pdev->dev, &dev_attr_dispregs);
+	if(IS_ENABLED(CONFIG_FB_DEVICE))
+		device_remove_file(&pdev->dev, &dev_attr_dispregs);
 
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
-- 
2.50.1

