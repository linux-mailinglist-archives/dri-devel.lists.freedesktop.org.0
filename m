Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E20AFE499
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F0C10E77B;
	Wed,  9 Jul 2025 09:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WgL1AUa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9B210E77E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 09:54:15 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae0de1c378fso820515466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752054853; x=1752659653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoN0VUpKGYfuP7sFSFacY57Yy7Y1Fx9KVASbGOfFZP4=;
 b=WgL1AUa2dGTGDFMlUFDLTC2PWcnH1xNJol0qFSb+sjAmQOUiS83faB7ZCP2yllHK7Q
 w61lNZfVwneQOmDTR9JmSJoiIGcwIdFYx3c7uxKtNbP8Cs5dySCJOBZT3siCrzOgvNUL
 I69T3mhcwKM4gCaIpFO8xA4H0JfjY5WzyvmKBawnjeVmPLt24C9f3+vjJOOUIv5TITER
 PMB50RI3oZgtaxh/qZDt9BT8vpm5kp5EfbAhd+o/kuhSObW2xZxFNNgD5QuvxXK6PwLE
 pKrUugwaz9nnmBArzFVakoslxv8LfvW8tCquPEN5N17v4RpeDrZAQMsSKFodAPBjBF6M
 HpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752054853; x=1752659653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoN0VUpKGYfuP7sFSFacY57Yy7Y1Fx9KVASbGOfFZP4=;
 b=FkLcj7GlZG9u99OlUtSBvnkHgIvbHYdac1APMUdp0Sp+6LtVYT3csRD7lkK2SjdFu2
 u3QgKCY2VbEm9i+fJPj+GkPXA1SgYTMlqAnuXykUxQrEA48eiyv/6yWQEVKIRh9SVvxs
 BTF4Ws9rsxo2UeZBRYt4rGXTTCe3lrq2TYHEXoMa6bLf2uP0iw/Xa75ha9rN6bl6h+/C
 Scg2UkI3jaE+3belC+oEnGhhUJbs9xXHIM45nmGJnH1hRifxSBwDNPy/aNVvUCFza2AU
 bBxtbqyaWkQWSM2gSnV3H6B6daq+bBYq9HRMDZ7mv9l+XQQZQ+0RnFMmPEhPDcFvoHRF
 MHoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvZY+E1tyLHGuAo07zkJYTVgTRIxikC0urnDOk/r2NHX9QluEpxa/ToaxXaUjbKRZjB91T+Bd1Z5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKjXv6hPl/oU1GBwgxXJ8Nx6ccJfSAavlgjc/lkG03Joj4T/g8
 bKqbcWby5+YMJ8FnGkIzLFsZj6GPcTeONm+dt4yh/m2rRq/UzejVn7pI
X-Gm-Gg: ASbGncv+UX8Zrm8vuURNwSZF8YT0RlevOcBFfyQe1NhQcOP/rxAkJg/qgPxEqlzGuWF
 NcZfkFy2DVJIbeJHMQrhdXENKNPwtihjjgB4gWS0ye5a3Pf0C/AjNM1U6IG7uBrrYvQj7Ayd9zQ
 IFCOi2YmljA+JZrWyMmTSkOv+RSxny3e8nCrJXesMfCgblOWJM2fcWmqgFooXM/8TPE2H1A+8au
 fqZXRpPumkv9erVXustqP9z3nNMnokfT+0Q3NEN1PkuaGAWzt5uk9LbgfFC1gYdM+Pb5/rbeytY
 q14TGyYcYQmWxRadXfRpV5Ta0J7Vz3l8vC6iUWjGG8Jcnn4EJENCVd06Frc/UsUIvnBuXgqEaaa
 pe5MhL1hpPKzXSq478vhJDxvioKz5CNeF9Gr97fZyfzlRnYqXAs+SGZCBy0XCzxIm/o0qEDqfSM
 qeYA==
X-Google-Smtp-Source: AGHT+IEFFYxIMd7Lz9ID+tmxDQr5/HjZ3P78ChW4+9hdOBxyvQ8l1d4pgIb5QGWP5ddtvPtghS99uQ==
X-Received: by 2002:a17:907:6091:b0:ae0:bee7:ad7c with SMTP id
 a640c23a62f3a-ae6cf7a9237mr179523766b.46.1752054853338; 
 Wed, 09 Jul 2025 02:54:13 -0700 (PDT)
Received: from kubuntu-e14.homenet.telecomitalia.it
 (host-87-21-242-88.retail.telecomitalia.it. [87.21.242.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6949cb2sm1074172266b.67.2025.07.09.02.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 02:54:12 -0700 (PDT)
From: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
To: tzimmermann@suse.de,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
Subject: [PATCH v3 2/3] fbdev: kyro: Use devm_ioremap() for mmio registers
Date: Wed,  9 Jul 2025 11:53:53 +0200
Message-ID: <20250709095354.931589-3-giovanni.disanti.lkl@gmail.com>
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

Replace the manual ioremap() call for the MMIO registers with the
device-managed devm_ioremap() variant.

This simplifies the driver's resource management by ensuring the memory is
automatically unmapped when the driver detaches from the device.

Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 86e5d60ed0ff..ddc241f508b1 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -701,13 +701,14 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	kyro_fix.mmio_len   = pci_resource_len(pdev, 1);
 
 	currentpar->regbase = deviceInfo.pSTGReg =
-		ioremap(kyro_fix.mmio_start, kyro_fix.mmio_len);
+		devm_ioremap(&pdev->dev, kyro_fix.mmio_start,
+			     kyro_fix.mmio_len);
 	if (!currentpar->regbase)
 		goto out_free_fb;
 
 	info->screen_base = pci_ioremap_wc_bar(pdev, 0);
 	if (!info->screen_base)
-		goto out_unmap_regs;
+		goto out_free_fb;
 
 	if (!nomtrr)
 		currentpar->wc_cookie = arch_phys_wc_add(kyro_fix.smem_start,
@@ -755,8 +756,6 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 out_unmap:
 	iounmap(info->screen_base);
-out_unmap_regs:
-	iounmap(currentpar->regbase);
 out_free_fb:
 	framebuffer_release(info);
 
@@ -779,7 +778,6 @@ static void kyrofb_remove(struct pci_dev *pdev)
 	deviceInfo.ulOverlayOffset = 0;
 
 	iounmap(info->screen_base);
-	iounmap(par->regbase);
 
 	arch_phys_wc_del(par->wc_cookie);
 
-- 
2.43.0

