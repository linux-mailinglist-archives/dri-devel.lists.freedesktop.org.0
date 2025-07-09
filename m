Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C88AFE498
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CA010E779;
	Wed,  9 Jul 2025 09:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ceJFMlbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544E10E77C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 09:54:11 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ae0d758c3a2so888382866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752054850; x=1752659650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHIX4DGVlMOIDoc1JDERhnuKOL/EXoTRnc9bE0E0Up4=;
 b=ceJFMlbATa1eONeastEyp6UrHm2ciiOqhUf2kgocjcJlD6C+elDxgyTX2Rc0Y+5SK1
 nR5tztLM+8EkJl9B9VaGadZqfgLJMSdnei5Ph6nnbMoTAe6XoA7bS/eqTKITqPW96CsD
 E9AsOTkqS0tSY1F3Tk87QXJmAzR2jI8OA0bLeV6EaigMMAhCR6HThzz/tW4ehCIW3RlR
 up49sRrBcS4T5vyhQm5zlaM2CI620iBVV+bxzFHcUqUIwjE9z/XzKvvyf5BGBTsrYl8L
 dX4ZpGYNca8hNk8hX00I6VmXseK70N7DfdWZdRgDMwBrCG23TaDvsqJgAGy1zVHgVQro
 duzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752054850; x=1752659650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHIX4DGVlMOIDoc1JDERhnuKOL/EXoTRnc9bE0E0Up4=;
 b=uvmdDYjqMH1mDa2v+QB3bh+iUTWM9VQhrS1jV0sWM3tdUkLd7kZzmJ7RyjruGsRU4A
 RJlNWne6z/ohPZECRopM2gnhx190bazxoe5V3VqjdCh9M4E3//PcvUmJjniH7XtTqh3p
 myeONuzscyprwZ9ZV+mHIpq0T6PxzH+ZUe9IA08Azq3zbY0MuaE30ZSsIVZRJF2ctZ9T
 l1REaXI1YeTvk/izvgSTNIdKk8KBJXa7SUfRHr47kRoYE6H8JjYcFjL4SfOAuLUMQnfS
 5k8urRIuqhf7dMUAyf6uRtFaQlH4EoaAk1/uhjUQdF7dAIYElqOCYnGrUKery/dk/w30
 w8zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1AUGD+GvhXVwbPP6DCq8SsKKh5cD9W7R5tVW0jyWsJD/Yww3mg6HDUDPGSAAT478CoaO/ubnwvKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiqJFaGvuKodQJ+DxLVJog1zZM0SwutMRpJBdMxpIUyRQQK8sS
 gh9TMhYdgdHP+MV8ipQC+zmm//iw+1QR0zhI/zhN6Cc2ZLNQRByIxlaVbaAMBhXU
X-Gm-Gg: ASbGncuGqjP6ndCoTNhrLJKutBbKbrj9XWrqLGG0DFp/Q+oMdl3mmuKCSxgnB5WfB2U
 AydTka1cEGdkC+WWT+ef3/jxzfWei7+YB1jf4FZRbgo3e+iaSD1D/2mjN8ZOxBt7XTKVvhpl1dI
 LuR9LzQOPMHWHN6XqU+PtyzlRtZVT3l5wngHPPI+8oJItv8kouRa/8w9XY2fxf7wSLdy9q8hGLN
 LPlpxUh+D5XVwzn8vrcqFObFXFn0OI4jThpWL9oHdjbWnmmRc+3XL1XJ1RU/Oh5LF86fDckm1Lq
 T1pyUQdX7/DwglLDPurft8KXw+FI2xd7pUXqZSh1oYeOLt2+RtNSyVz3CgfIgXKSv4aAycoRN0V
 xdJAMdNZQqJM2BaX8pTCyvhrHPrDtIvgzdYQbOYoiyGTrQZP7+xBwrmdHYArRYpHravXzWX20tX
 e+dQ==
X-Google-Smtp-Source: AGHT+IHfPGbgZiNeOlmBwJt5gWKvm49O2S4cDZYFHymXUMsQvbq8cqvnLJyix/nXBpDbUy6wTdP9tw==
X-Received: by 2002:a17:907:c16:b0:ae3:eed1:d018 with SMTP id
 a640c23a62f3a-ae6cf560eb6mr176692666b.9.1752054850161; 
 Wed, 09 Jul 2025 02:54:10 -0700 (PDT)
Received: from kubuntu-e14.homenet.telecomitalia.it
 (host-87-21-242-88.retail.telecomitalia.it. [87.21.242.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6949cb2sm1074172266b.67.2025.07.09.02.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 02:54:09 -0700 (PDT)
From: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
To: tzimmermann@suse.de,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
Subject: [PATCH v3 1/3] fbdev: kyro: Add missing PCI memory region request
Date: Wed,  9 Jul 2025 11:53:52 +0200
Message-ID: <20250709095354.931589-2-giovanni.disanti.lkl@gmail.com>
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

The kyro framebuffer driver did not request its PCI memory regions,
which could lead to conflicts with other drivers.  This change
addresses the task "Request memory regions in all fbdev drivers"
from the file Documentation/gpu/todo.rst.

This is addressed by using the managed device functions pcim_enable_device()
and pcim_request_all_regions(). This simplifies the code by making error
handling and driver removal cleanup automatic for these resources.

Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 08ee8baa79f8..86e5d60ed0ff 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -679,7 +679,8 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	if ((err = pci_enable_device(pdev))) {
+	err = pcim_enable_device(pdev);
+	if (err) {
 		printk(KERN_WARNING "kyrofb: Can't enable pdev: %d\n", err);
 		return err;
 	}
@@ -688,6 +689,10 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!info)
 		return -ENOMEM;
 
+	err = pcim_request_all_regions(pdev, "kyrofb");
+	if (err)
+		goto out_free_fb;
+
 	currentpar = info->par;
 
 	kyro_fix.smem_start = pci_resource_start(pdev, 0);
-- 
2.43.0

