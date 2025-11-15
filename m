Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B84C60543
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 13:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DE710E2A2;
	Sat, 15 Nov 2025 12:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAROe8xA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB210E2A2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 12:57:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so1900924f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763211431; x=1763816231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+wKe+4acY/h67BQeNtw3SYgKv7BLen9vezukdhy+6+w=;
 b=JAROe8xAm90h54usV7ovClBay59CXJ+z9/dnBhrYT5Fi9fBn7VpaA1tQ8crVINvEW5
 9K3p5BnMLKs356Ntw5dIGkrrVy45E/K/0LSxrCceUCCkeT7t6g914g4D14GLh8f4iOyE
 JL1R+lzRTPklr76AKocq83473FmDUPcn4STUSxQPq9tIJTW3fjrGDArpH6b3ulblQkQF
 MN3qbbmzuty/oevDz4+wEZT1LzDVVJ05kcz45b2/Boig8MwJJeXxHnyf9hEGXAeqsPXh
 KF+xPs55bZZrB5nBW9x7XS8Dm9ukVY+K72c5ASCLIROZpJ5GiucQmdcu1SnB4DKl0nYP
 va1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763211431; x=1763816231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wKe+4acY/h67BQeNtw3SYgKv7BLen9vezukdhy+6+w=;
 b=fCMPjOFnLwlqBrUzRqx8RU4o9i7xGlPl5PKl1yYElfYp/lZ9MWgPex9NIjqqDp1mxC
 zTK2JF3q/nhqwsiS4FcAvw3hQg1GCSrLSZN+EqMfFSzPb+thC1vfWMAsLIYapdNwu9XP
 AlOwR5wG/egjjGwfKozHYsPbRX14u9m3XFPJYeY8p0hHBcSpctPUUmlEEEe+yG0S80yB
 oLtDMX3ddnu/5A65qiV0h2WZIWp9SJwE/wYuL3tvEmp2mLY3ZJNdPYkGivGPh3/SZAsC
 IwE5ks8AN/JqhDwK49RVa61VUa9PCVvS0uKAwjNlR761fJQhnkkU8jnUlRrbeV3uXQQB
 LVLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQjffil9TcYnEoHgPNA6Wspqch/Y05csh1clbwkKhkPkeCsAfHXn+L+DXnDgpHkD0rOodG/5Umsfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznku8BVWiD0Jxisj9ZCLDvryOd/zFVXY9+IC8NNe3khprj2/kY
 qd6dTFL/aluuIktCuPhcN6IUCaI3zWEbsS+JXd40KymrDa3Ggk7xm9z/
X-Gm-Gg: ASbGncu0F77MSTvyau6SjhBVUa7D4I/ay55LO5Sp/z9upX/+5Pj3okzti1L2DOWA2gt
 M0CwnGnCcdcPwTFv46JXGIzbU2rZSWeJqXEj9OaJQk/nfkShe3EQT+EW1vOkoD0XAZ8g79py7io
 7Z+1yffvUOtBTvfa7G3g+71sIYM3rwN0NGvF3hHiKud13705nXUe7DObSQmM/g0KDtvo1iKuQJz
 aWrXKvO/Tqth5lmhJCm7DSILHSDWwR/zTQ9ArczHDl55mZFGK8v3wRFGmdVWj21sl7FOjdieZHQ
 CY1KVnYKY2/KGhIBvgSql7GBMDvskxd+ylOkFROxkjknEVnSzqAWMPBaUHpzE5EuqVqdsVCNzxR
 /6dQkYRnthJlLSOyMtUKxk/Gu8m/Qh7CAx6AoXSewXqNSRnieb8kyLtm9n639Krp5KsZHJ6gXf6
 pD5klAHq6loZ4Kv+5XT1ev4rD9Ri1iY/4idGQg8qAScirU/2KRF9/kDgAK3Hg=
X-Google-Smtp-Source: AGHT+IEwVoyFEpiN4NwAdMpmY/gp7f0+PyXQEZWI8peRnu5CniD4Jka1XX/hO/l3ei9QcID98HqBow==
X-Received: by 2002:a05:6000:3111:b0:42b:3661:304e with SMTP id
 ffacd0b85a97d-42b528147bbmr9775893f8f.16.1763211430692; 
 Sat, 15 Nov 2025 04:57:10 -0800 (PST)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bcfa2e9sm68119745e9.12.2025.11.15.04.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 04:57:10 -0800 (PST)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH] fbdev/tridentfb: replace printk() with dev_*() in probe
Date: Sat, 15 Nov 2025 13:57:01 +0100
Message-ID: <20251115125701.3228804-1-rampxxxx@gmail.com>
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

- Replace in `trident_pc_probe()` printk by dev_* fn's
- Delete the prefix `tridentfb:` from msg strings, not needed now.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 drivers/video/fbdev/tridentfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 516cf2a18757..17b7253b8fbe 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1631,7 +1631,7 @@ static int trident_pci_probe(struct pci_dev *dev,
 	}
 
 	if (noaccel) {
-		printk(KERN_DEBUG "disabling acceleration\n");
+		dev_dbg(&dev->dev, "disabling acceleration\n");
 		info->flags |= FBINFO_HWACCEL_DISABLED;
 		info->pixmap.scan_align = 1;
 	}
@@ -1693,7 +1693,7 @@ static int trident_pci_probe(struct pci_dev *dev,
 	info->var.activate |= FB_ACTIVATE_NOW;
 	info->device = &dev->dev;
 	if (register_framebuffer(info) < 0) {
-		printk(KERN_ERR "tridentfb: could not register framebuffer\n");
+		dev_err(&dev->dev, "could not register framebuffer\n");
 		fb_dealloc_cmap(&info->cmap);
 		err = -EINVAL;
 		goto out_unmap2;
-- 
2.50.1

