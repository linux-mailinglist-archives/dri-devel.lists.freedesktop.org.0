Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16EAFE49B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B4D10E77E;
	Wed,  9 Jul 2025 09:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UeonGgPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C310E77C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 09:54:18 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so11111771a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752054857; x=1752659657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/xA8RBMxt3BQS7+pWU6O20VRxuNRUsOkplI0dlKzd4=;
 b=UeonGgPRcWcJtJ+zAa+Yu0cGcwYuv6aaICTihIVb+kBRXeUWuqA1zU40PyBU3vNr0c
 mRr4W9T3F7rImd4KU0OabdYd+SgLZyOr4zogrjOHKNEECs0ccwzrCL1VZ2qpqIfYB0GZ
 EbQtjuZToHOQ50N8ftJdfwGFxATuFmxvk/gIRzAfFtDAgin5pJtAf6r1xMgTH+7NW5GO
 a+9ijRxu/uyBrK0fOsgDMz288K3TNK6ipk9GB5dWK0UPIbZY92r9rxgY0ZlPeXhJJlZI
 oFKuPqxdHaedp5jF7r64rJY18zk/XIz6V4Rvn2VvxscS6B3PY3FUK30ELUl4t1Bq07ui
 AkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752054857; x=1752659657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/xA8RBMxt3BQS7+pWU6O20VRxuNRUsOkplI0dlKzd4=;
 b=d5SxxXKGhHAMmQu+plp+9Sl5tpDs/CK6zqo05qHMp4zbl888GCVP6XBm6IVLcF17+T
 KNuX7mkYYzyMZyjQJPZYZlOiuv4TQK9HScGgCMNv+hSVUIXjNOc+E9ACo27RzwMcA6mc
 xuLrsWz0oG+B1dULZgA2U7fBXPv4+vtqUEjGbYo2moxCT5hMTXBDbSYRqAPRz4SboFJH
 QKPZCTnaYOgNZRmpkk7GoGUNsn/g9tiGRTEs3jGeNo/bw7mYRydpUKRPs9zaMk+/fHbf
 XtQBIpQFtK8kOaJIjruLcaKtU8tiWCL6DxzFQNWoXN4RhSOSfyrgGrfy0eIiqtSTbDt1
 OH0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU20q094AhP06a/tVESpRV6rCo05HX51NgFllTBZJmvuza8Tq2irBL5VinDNFjJAGN07xxslRdAJcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR7MMg5Roucq89LiP6M2mcxvIGkRYHJXABtRzywoISxxmPHbks
 wYeD4zFZw0EY+ZQ4zyhEXAozzitJoC9keI2w4DSQLrtWsgWV/N1jOKW6
X-Gm-Gg: ASbGncvJKswqWNnbSAS6MHsY4rb+8ZTL6yLOhdK7KuSm2386+xt9ZX0+9HVbdnhPw5r
 iuOL96t5SoCLMvwAE9iY3/x+45YHzOvLaynzzbVOG8zhmKdYDBdIo6NZ3KVS9trvCSo3MXl44L0
 cDYM3cxK3f242tqGCDXjqT8VOtd/f4YafzM32KngXd/8SzqfnDyKWIoIDadnSeAVfX/3VDlwvjz
 AthraDreSsHJZNkNtG4r7zynD3ney7xpRvfA5//6qykWg2TrwPZIzPTe2CgGFttT6HCzuNKhEJO
 FGolWKmHBnC5OGrX/IXDMtTqFwX9Cp5ZaZENVyXdI+Ht/b1rLe2dP8GTcLuaFIkP9ctiEh9KJYU
 t+X2mSin6iPMiXLu3aamDt734XdN3vmd+RzBSKesQf3RTGkZf78VK3x8r/FLLNW5JU++wxR5WTC
 5Vkg==
X-Google-Smtp-Source: AGHT+IHL8xKvtzSGhMBpsn0NwBZB7qQ7UJ2fZ6LEEU4qkuyxDrV1Z4wSVwIi7Pi8zmbRHLIkbKU4wQ==
X-Received: by 2002:a17:907:728c:b0:ae0:a590:bc64 with SMTP id
 a640c23a62f3a-ae6cf685479mr214095666b.18.1752054856747; 
 Wed, 09 Jul 2025 02:54:16 -0700 (PDT)
Received: from kubuntu-e14.homenet.telecomitalia.it
 (host-87-21-242-88.retail.telecomitalia.it. [87.21.242.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6949cb2sm1074172266b.67.2025.07.09.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 02:54:16 -0700 (PDT)
From: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
To: tzimmermann@suse.de,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
Subject: [PATCH v3 3/3] fbdev: kyro: Use devm_ioremap_wc() for screen mem
Date: Wed,  9 Jul 2025 11:53:54 +0200
Message-ID: <20250709095354.931589-4-giovanni.disanti.lkl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709095354.931589-1-giovanni.disanti.lkl@gmail.com>
References: <20250709095354.931589-1-giovanni.disanti.lkl@gmail.com>
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

Replace the manual pci_ioremap_wc() call for mapping screen memory with the
device-managed devm_ioremap_wc() variant.

This simplifies the driver's resource management by ensuring the memory is
automatically unmapped when the driver detaches from the device.

Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index ddc241f508b1..c8b1dfa456a3 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -706,7 +706,8 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!currentpar->regbase)
 		goto out_free_fb;
 
-	info->screen_base = pci_ioremap_wc_bar(pdev, 0);
+	info->screen_base = devm_ioremap_wc(&pdev->dev, kyro_fix.smem_start,
+					    kyro_fix.smem_len);
 	if (!info->screen_base)
 		goto out_free_fb;
 
@@ -743,7 +744,7 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	fb_memset_io(info->screen_base, 0, size);
 
 	if (register_framebuffer(info) < 0)
-		goto out_unmap;
+		goto out_free_fb;
 
 	fb_info(info, "%s frame buffer device, at %dx%d@%d using %ldk/%ldk of VRAM\n",
 		info->fix.id,
@@ -754,8 +755,6 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 
-out_unmap:
-	iounmap(info->screen_base);
 out_free_fb:
 	framebuffer_release(info);
 
@@ -777,8 +776,6 @@ static void kyrofb_remove(struct pci_dev *pdev)
 	deviceInfo.ulNextFreeVidMem = 0;
 	deviceInfo.ulOverlayOffset = 0;
 
-	iounmap(info->screen_base);
-
 	arch_phys_wc_del(par->wc_cookie);
 
 	unregister_framebuffer(info);
-- 
2.43.0

