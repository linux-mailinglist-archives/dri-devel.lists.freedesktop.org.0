Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F576C68A37
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 10:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4411810E129;
	Tue, 18 Nov 2025 09:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H00t4DUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5390410E129
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 09:49:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-29586626fbeso55998735ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763459378; x=1764064178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wB7GKKfp5hNWKas7zrDPnmb8wSgvfF3RD0g/s/fBfK8=;
 b=H00t4DUzzSkzuvRHgIT/0EF2oBgfY+eRwI2KtRnJhAIONqayIBFqqFycAVgCURfXeG
 6yEEdTUvbjsdbD7yw97mt2EdjfRfrvhFWJEuKlQhkId148Jd9Q3VwCOYVH6hi87p7Fs0
 ULY2xDvbhBnBvY2Gtyo0WMIYV0ck0rVTxexU7FSUCky2zI/XgfvcX7wfNVgp24mYZEV/
 ol5gklkxeNwpePAqK2m3V0qzZnHy7UONGRwby/ECLa0dpEybkw3QU60tnbCjtaPhnHcz
 eCqGsKX3yjWNS1Rd1kWH4VBkED4Xw3lLgwR/EFoU4eBFLNNmeSP2jDsj9MsoHY7lIc6O
 /klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763459378; x=1764064178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wB7GKKfp5hNWKas7zrDPnmb8wSgvfF3RD0g/s/fBfK8=;
 b=HBcxzGYg+JV34rmkSqHSHemJm6RnsGGcfvDNGJHmHVDvhCdp3WsMzVNOiTzYGEPvZv
 4hKrw0hDaX3H6JWRmlF3W/CYWKIAVB/qZh1mVALfDpT4myGgV9vpHDqVVDlBt47GFMsc
 Y1yUmymq1nwlLvRecbir+lhy+TkSO7Y0GnDPo2cTr7eV8eapH76vTiecMQ5bzLT+HLCz
 KO/FkJwYmxF3jlJRXW1t/1OiGtpW84ONnqOreMLCq/7oOzffGuxZOvWtXtcd0FQh5Z1B
 jPyNJYJun6i7ljjleq5B+ARKOogAknkVyXyojlobwtumGyIFHVrqxhKGT9ajaoCvGAkc
 5L0Q==
X-Gm-Message-State: AOJu0YyHFHGoIL1Zzmxx7+ffSKEAidQKNKmLjNKImVlw0EJuT1Z3dIIg
 qpiYA4yy3uxdAo9y8HIWu6tv9x8gpm5N8Ua9XyVcSEecd0ZfAy2ZcZmx
X-Gm-Gg: ASbGncuFt70IeYtJZzZfB9XPzyGIyRgysc/pfPmta7EaCtfGJSmhdQfo7TSp2SBY5VG
 FWmVzYEwm/Xby3bU8CCUs1/ZtM/2eWhJArpApSjWhwCi6SlXlu5BNsj83I99XNi0uAS7lJFrGmU
 EjpLUywXg9MinQLUmTmbE6Culaz9Stnr+r4tzcAZk450tGrNGxgnqLQoA3nAy5nryyC/HiO/CSn
 V8RAKZg7CgB7tXUKDxLXFXeJE5upukSzvvS4k++eYcRh8cklD8E8Hj9uNzX272OdLqE1jO8ksvj
 vKkLUhbdYrZNFgeBl2DPYRvBxWFMGV0p4xtRgFTW0NzMRW4Nvvi806zPOCwTyMiNp5DJWm78fHw
 biRV0iYd/4XmySZD/OOei7KWFPlyjMLQHKNCvroaRxitlv1F6gxDX6BxMjNuyZWilvi/FpUIQPU
 xx1xd0kIiPJ3+SPKX4ieS2RfqSFywA
X-Google-Smtp-Source: AGHT+IFiWL3LqQmkeS44K9ymL4p8riBvyXWKhkcVBYbURfrJxjWXHSAwE7EJgyDR8KHKEo5KjBRLWg==
X-Received: by 2002:a17:902:c951:b0:295:8da5:c631 with SMTP id
 d9443c01a7336-2986a751b79mr164171495ad.42.1763459377740; 
 Tue, 18 Nov 2025 01:49:37 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2346f3sm168815565ad.18.2025.11.18.01.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 01:49:37 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, alexander.deucher@amd.com,
 jeff.hugo@oss.qualcomm.com, jani.nikula@intel.com, contact@emersion.fr,
 lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhiraj21put@gmail.com
Subject: [PATCH] drm/tiny: ili9163: Use dev_err_probe() instead of
 DRM_DEV_ERROR() during probing
Date: Tue, 18 Nov 2025 15:18:15 +0530
Message-ID: <20251118094815.243962-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The DRM_DEV_ERROR() macro has been deprecated, and using
dev_err_probe() is preferred. In addition, dev_err_probe() helps
avoid unexpected repeated error logs during deferred probing.

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>

diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 62cadf5e033d..22028c7a1ea1 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -155,16 +155,14 @@ static int ili9163_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, drm);
 
 	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(dbi->reset)) {
-		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
-		return PTR_ERR(dbi->reset);
-	}
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset),
+				"Failed to get gpio 'reset'\n");
 
 	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
-	if (IS_ERR(dc)) {
-		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
-		return PTR_ERR(dc);
-	}
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc),
+				"Failed to get gpio 'dc'\n");
 
 	dbidev->backlight = devm_of_find_backlight(dev);
 	if (IS_ERR(dbidev->backlight))
-- 
2.34.1

