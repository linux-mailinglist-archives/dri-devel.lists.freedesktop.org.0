Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9C91D2F7
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31B410E0DA;
	Sun, 30 Jun 2024 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JH903fiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F8710E0DA;
 Sun, 30 Jun 2024 17:00:57 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-48f68565fe0so585345137.3; 
 Sun, 30 Jun 2024 10:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719766856; x=1720371656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlhaFNhfAx0+KHxeTlQ2k5JPN6j1xoSeVgNpNKUjC6k=;
 b=JH903fiInrWYVPRK4C7DsGlB2L7jK4KUtuHyLN1te2sS5eri3avZGkqZy2auuMK3n0
 rKL3PTJxPZMqjYPO68SzB1obHBk3xwMyZi/sl4/HbOjWawfAnelBTy/2tOZIzP7JdmuV
 u/bA8DlFr+qKfAUNUzMFQiOnkcpvg0Xzbk7TPeOyNmhTiNUzQMVO5yDe32XFK7LDJzqH
 yusa9z599OBZAWS+34Qhj5Zc4lnRtvsvSvaYKwct+vPIlwqZtRWo9/yB1/RcEdNurItK
 +u2/+JFTtRGTe53j9SeWghZ2zoHBkGLummX+Urn3YwlxNfyGsgp8gaaoHYBA08Yx7bwX
 m5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719766856; x=1720371656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlhaFNhfAx0+KHxeTlQ2k5JPN6j1xoSeVgNpNKUjC6k=;
 b=SHgEg2FMN6raCgqyPqJ0s00msgD6ihfMpD2/DyJ4qKHA9UD1ZGITav4QK+ylHfmbHm
 LO0uB7YyxSVr1CsySx1CsWOPJ9T2+gsmuFfshtGi66sw9rxlyz2nyuy4HFLAPIxN/VU2
 /cTZ9SgceKV1n+nyb9HG0UMAXcxaV3EYun/ucDhn6GP36EkUsCm1WzN0zbrXi58wSf59
 qyGvzKvtABiX2fLu8oJFbtaT7/All4/0nHEz/q8Go0G5atdI797bFn38f3BjnMgZP0PC
 vKIPDotZDfcRZsgxVxv7gXL1HxO5Y5uMtDRvuiqI3DTe2xwlZwJbNwiFuP7mHNB66OP0
 rkeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEN6/j2z6Z1Zv9EU0JUhbAiFarDuVrP63/P5ppFNte4xJXiJDf15kMXHrIfgvwxJcIMUD1XRwHolVt2/I4CSn4EWhW9A47uT7UktqROh7rKGM/tuEZHxG3aL3XBsYxh3tkhMGoMPag2MPuatF+tw==
X-Gm-Message-State: AOJu0Yyoa+pRASUfHu3srVMkIJ3xl31TCBTYLlz66Ng0qqvMTbtSFDxj
 meVtp2EgLKx9CK7JNlVl4I2UtsPvljZi4shp7w3Vp3ov57RtWjxr
X-Google-Smtp-Source: AGHT+IGr3xK4iR6mDCCPUhjjys3YyHdCiX4Ihwv6WPfrUP+aK8l7ib9jc6QMcFospdyQcQZlG8qHDA==
X-Received: by 2002:a05:6102:3a13:b0:48f:2afe:88f1 with SMTP id
 ada2fe7eead31-48faf0cf479mr4714159137.16.1719766855731; 
 Sun, 30 Jun 2024 10:00:55 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69295f5esm263431785a.56.2024.06.30.10.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 10:00:55 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc
Date: Sun, 30 Jun 2024 12:59:22 -0400
Message-ID: <20240630165949.117634-7-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630165949.117634-1-wuhoipok@gmail.com>
References: <20240630165949.117634-1-wuhoipok@gmail.com>
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

"drm_dev_alloc" is deprecated, in order to use the newer "devm_drm_dev_alloc",
the "drm_device" is stored inside "radeon_device", by changing "rdev_to_drm(rdev)"
other functions still gain access to the member "drm_device". Also, "devm_drm_dev_alloc"
is now allocating "radeon_device", allocation inside "radeon_driver_load_kms" has to be
removed.

In "radeon_device_init", it originally assigned "rdev->dev" etc. However it is already
done right after "devm_drm_dev_alloc" as you can see down below. It is better remove them.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon.h        |  4 ++--
 drivers/gpu/drm/radeon/radeon_device.c |  3 ---
 drivers/gpu/drm/radeon/radeon_drv.c    | 12 +++++++++---
 drivers/gpu/drm/radeon/radeon_kms.c    |  8 +-------
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index ae35c102a487..fd8a4513025f 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_device*, uint32_t, uint32_t);
 
 struct radeon_device {
 	struct device			*dev;
-	struct drm_device		*ddev;
+	struct drm_device		ddev;
 	struct pci_dev			*pdev;
 #ifdef __alpha__
 	struct pci_controller		*hose;
@@ -2478,7 +2478,7 @@ void cik_mm_wdoorbell(struct radeon_device *rdev, u32 index, u32 v);
 
 static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
 {
-	return rdev->ddev;
+	return &rdev->ddev;
 }
 
 /*
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 32851632643d..554b236c2328 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1285,9 +1285,6 @@ int radeon_device_init(struct radeon_device *rdev,
 	bool runtime = false;
 
 	rdev->shutdown = false;
-	rdev->dev = &pdev->dev;
-	rdev->ddev = ddev;
-	rdev->pdev = pdev;
 	rdev->flags = flags;
 	rdev->family = flags & RADEON_FAMILY_MASK;
 	rdev->is_atom_bios = false;
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7b8aa8406751..f36aa71c57c7 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -260,6 +260,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 {
 	unsigned long flags = 0;
 	struct drm_device *ddev;
+	struct radeon_device *rdev;
 	int ret;
 
 	if (!ent)
@@ -300,9 +301,14 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ddev = drm_dev_alloc(&kms_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
+	rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
+	if (IS_ERR(rdev))
+		return PTR_ERR(rdev);
+
+	rdev->dev = &pdev->dev;
+	rdev->pdev = pdev;
+	ddev = rdev_to_drm(rdev);
+	ddev->dev_private = rdev;
 
 	ret = pci_enable_device(pdev);
 	if (ret)
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index a16590c6247f..645e33bf7947 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -104,15 +104,9 @@ void radeon_driver_unload_kms(struct drm_device *dev)
 int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct radeon_device *rdev;
+	struct radeon_device *rdev = dev->dev_private;
 	int r, acpi_status;
 
-	rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
-	if (rdev == NULL) {
-		return -ENOMEM;
-	}
-	dev->dev_private = (void *)rdev;
-
 #ifdef __alpha__
 	rdev->hose = pdev->sysdata;
 #endif
-- 
2.45.2

