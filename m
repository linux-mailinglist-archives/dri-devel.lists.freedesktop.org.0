Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B938AFCFCD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBC310E6A5;
	Tue,  8 Jul 2025 15:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRmpISIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1410E675
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 14:48:26 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so8004960a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751986105; x=1752590905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cZemC5M/f+XMzPt6vXwq1Cy6fTiGZG5DlF15jcMv3ts=;
 b=cRmpISICZbHV4VAMyAhyQyOijIpP2kE9fIG6+U4F4ZxrjydfCMBynbj43iZglJY+/l
 0d4rGiOTvvTNB7auUzmhnr56KXLOwTDBZ1JpW5dAFbP2RrPquLeJxjVxfyOXI2Ppkpgv
 NtU8VfEZXVn3bAGpuiWQyHJn2Bn5Do4A9eTm6m+0zcXiiyHnWbX4tzbgeiH3JEIqhI3M
 5/tn6zhNPy9+kmolp10cSbCIiQiZ0hqWlDXWP6GRlTJft5onvTk8dDVZuVrNGQDF7XZq
 hj35iziI4P/HsSCJD0p4zRFeL8925H/RS4mJ9gY5vQmxl8jQYZRUw8s+httRLf6g/lxe
 EKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751986105; x=1752590905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZemC5M/f+XMzPt6vXwq1Cy6fTiGZG5DlF15jcMv3ts=;
 b=Xm8vY8X59CGEt6cufq7k+/KCsPrZzge54KfdFDVgbB7b6E9EhCXZVJx7NTkf5vKq/D
 JqHkgmbUz53kaoXGZVtEYK7hZg32v4aVDVovaYgpbGONH8M1cDtP0WAXhGv2v1E7cSMV
 ZKnc3yrlyAenYdZt1nZ6SVG1k/n6rDYcMzKblGYOyYlfuHpuDqMzKVdiTDWfIGZFlmPi
 jH8c28YSrkc63rgiV/6PxPjKNTecmXLy5cjB9dc/jXRaCztiOASRMLt8Zszj4/2eOr4j
 g0qfooZQStxsTAbLUJrdp8Sycd1sOea4iU383zI2CAG2H+Jdr5xXSPrA9LsW+2aRIOWY
 7rNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr3+btUV7Yrlaejp+G78fv4csmD8OY1UH9tkLvhZjtOsPYgO/qes4RtOTm03HDdpZ5K5POilgF3as=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEYTARslSMkHuYB+1jEgYUzkarkxpbFla9BpFh5T2zeErympNr
 uindQcS0F1hRHvGZ9o9kjwECwsqWvSoakEgutx1DEh8NG46RebR4PbVN
X-Gm-Gg: ASbGncsE2lpWZ32zJO+3kHfngtimE+56GiTX9AA1nOT1wJ9IbiDAqwVMkpQvE7ScSx5
 4EA5FAEKp4vdPzRkEIBlAzx2Yio7you6wpL1K7oJgtxHnkENhlaLPwrja+n08YmUs+clZrj49Ms
 l673sdNEPp9xz0DnyEkJBpl5yFo3FpJyuUQ+KOSBlmEEk0CZDg+6nTnqxP4io4oe9anKFznuS0P
 npjkrwkEskGg5UgRA4AgqkcoFy/fSa/DTT4gyumj64bEFaiqFSybDJBzuNOeqsF04fkyJOZGRGv
 lACWpw4qZIdUPktXBR7Kxg08+ebWJ6K+9HokkbhJjUoyGNbIG8w6mkx5vf718AKGDDoyob1sVIE
 2kRpQKyKdF7n50hFKHAFYk+cokQBR8IQqvlYaBSfK/TtBS7LxdmdaEym1ny8RL80f2wXbAzBL+s
 9MtA==
X-Google-Smtp-Source: AGHT+IFsuIaKI0izTH3oNbXTJfvb1BnkMXqq0i8PV+xLu7L0gkffGVaywqrJjFHAjd9/+hN5OUwLZQ==
X-Received: by 2002:a17:906:af89:b0:ae3:635c:53c1 with SMTP id
 a640c23a62f3a-ae6b025962fmr330465066b.54.1751986104383; 
 Tue, 08 Jul 2025 07:48:24 -0700 (PDT)
Received: from kubuntu-e14.homenet.telecomitalia.it
 (host-87-21-242-88.retail.telecomitalia.it. [87.21.242.88])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb0c892csm7367056a12.38.2025.07.08.07.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 07:48:24 -0700 (PDT)
From: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
To: deller@gmx.de
Cc: tzimmermann@suse.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
Subject: [PATCH] fbdev: kyro: Add missing PCI memory region request
Date: Tue,  8 Jul 2025 16:46:59 +0200
Message-ID: <20250708144659.787676-1-giovanni.disanti.lkl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Jul 2025 15:54:34 +0000
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

The kyro framebuffer driver did not request its PCI memory regions,
which could lead to conflicts with other drivers.  This change
addresses the task "Request memory regions in all fbdev drivers"
from the file Documentation/gpu/todo.rst.

pci_request_regions() is now called during probe. To ensure proper
cleanup, the corresponding pci_release_regions() and a missing
pci_disable_device() call are added to both the driver's remove
function and the probe's error handling path.

Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 08ee8baa79f8..80ac17337c1b 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -685,8 +685,14 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	info = framebuffer_alloc(sizeof(struct kyrofb_info), &pdev->dev);
-	if (!info)
-		return -ENOMEM;
+	if (!info) {
+		err = -ENOMEM;
+		goto out_disable;
+	}
+
+	err = pci_request_regions(pdev, "kyrofb");
+	if (err)
+		goto out_free_fb;
 
 	currentpar = info->par;
 
@@ -695,10 +701,11 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	kyro_fix.mmio_start = pci_resource_start(pdev, 1);
 	kyro_fix.mmio_len   = pci_resource_len(pdev, 1);
 
+	err = -EINVAL;
 	currentpar->regbase = deviceInfo.pSTGReg =
 		ioremap(kyro_fix.mmio_start, kyro_fix.mmio_len);
 	if (!currentpar->regbase)
-		goto out_free_fb;
+		goto out_release;
 
 	info->screen_base = pci_ioremap_wc_bar(pdev, 0);
 	if (!info->screen_base)
@@ -752,10 +759,13 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	iounmap(info->screen_base);
 out_unmap_regs:
 	iounmap(currentpar->regbase);
+out_release:
+	pci_release_regions(pdev);
 out_free_fb:
 	framebuffer_release(info);
-
-	return -EINVAL;
+out_disable:
+	pci_disable_device(pdev);
+	return err;
 }
 
 static void kyrofb_remove(struct pci_dev *pdev)
@@ -780,6 +790,9 @@ static void kyrofb_remove(struct pci_dev *pdev)
 
 	unregister_framebuffer(info);
 	framebuffer_release(info);
+
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
 }
 
 static int __init kyrofb_init(void)
-- 
2.43.0

