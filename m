Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333EBC36943
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500F010E759;
	Wed,  5 Nov 2025 16:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ce5U6YSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A198A10E2D8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 16:09:48 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-292fd52d527so70109205ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762358988; x=1762963788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onKFYxz3qx1mgItW1GE5HTsCNQVbyGrPrKl8Wr6AIZk=;
 b=ce5U6YSG2tqIHeiL7itNkITQi4CV+V5za4qScu3JHNNeawg5GP08oAW06HBmKpKPg0
 BharTr+ij7WMRU2E+edtejKBQpKk/lHrfjN6Ynvv/ZAen0ZcvBVxd6gTAquHRV05mGEo
 nSmov9G+QVDXc1Jltj/vxzx3ndIrpFmW3A1ULAsRC2oizD8KGfGMVX0QHr/9ZcpiKFqe
 8vs/PuXkMbP3nklGgpA6zKVP1hKtd5oK2qRU+iMGP28a9ALXN/9V6I777F6m4YmgEXr0
 9TttImqINleR8sikObO5lxiUmvFpEQUvl2ToWJngjfGy1TcobYOgs1Ka6FAGTo6Xgx++
 yn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762358988; x=1762963788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onKFYxz3qx1mgItW1GE5HTsCNQVbyGrPrKl8Wr6AIZk=;
 b=Jj5l9aYlRqcptQVDm11p3XUwIWUtHQogvKV9j1Yo31OhQo6tmsPY4Q6hch3Jqd4BIR
 7zEYhTQVdTHWb/gEHJdat/4AjBJRFk6PdvY8lcviaTLW0o3V+02I6MaCm18tfsMXiTRU
 tjxN0VHfToASpsMwP8aPf1qL/+NgCt9tR5bBZjxoBhPwsKc4/Rmb0hwB7ql1K2FJhzzL
 S14/fMmOGqug7hfSrZEspONqBNuuWyjOuW6G9eIpdJaeoBAE3LztHlj5DN4GE9C7BRP6
 zjnZEqxMDcQNFN3C6fWORb6TpRs3RTrhzKox86gcyJZK5oCdJYxQHcYHSUURcOHn6rvb
 FGGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjpQLGF+Ft0HUYa0spHstn8WlCch8viZpvq1unsFFsbDYwHLF0n6tBCxzyVeD6bqu/PlaKpB4Hp7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx21CxFRT9oA9pf5BdKXZeZxzzuzbfUahBbc/lBFXBb34h5JEu
 iIu3Ev9nsTDHn+RiimZemKVyKEwrVJdyeY/Wz+58D9Pc1qk4cSszElaN
X-Gm-Gg: ASbGncu42M0vqBeorTOFFsuFhicqH3zsB6ZcgLy33cTbTJo3TawdzhaiRnS3KRkd8Cv
 OgP2yN90Zvka6Ry8tbpuKRYgXD2iZRAhotlndetHmilm4G30nSpIZqmqcLs4kYKBgl7xCgwjG+n
 15YM0zbDEqSr5MMz/m0kV/3nojJYv18I/Npeef7B0chQ5sPgUZZnuwNqPhrMkEyvdgXB0S83t+E
 q1dRWxavrVFcZbLRna0abLxVmzWgTDrduTUqmwbzqXHYxduGMW5HtKoiax1YxIJMjjcY6YDSBkt
 ESErJGkPmUVl5pFtBXrJqsXq6dzi6Ov/AoqZJLfAQFv9hDw78qPHS3k66CD4eaYVN2YNfN9beLd
 tGd39NnFx1D+b+ZKwHsYKuA5fDewFaBKgwFm8cwyjah9p6CmwAW1A4tEWrA2lTQFhy32Rj9+4Zn
 KWoQ==
X-Google-Smtp-Source: AGHT+IFWoDv0xrc92js3LrPGZwOO07MytOUirYTiZ8qgebRNd+iZk6XliDM2euyp4xDmvx2GbYt9Sg==
X-Received: by 2002:a17:903:240e:b0:295:3a79:e7e5 with SMTP id
 d9443c01a7336-2962ad88638mr48773485ad.34.1762358988099; 
 Wed, 05 Nov 2025 08:09:48 -0800 (PST)
Received: from archlinux ([36.255.84.59]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601a3a941sm64888105ad.57.2025.11.05.08.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:09:47 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: yongqin.liu@linaro.org
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 sumit.semwal@linaro.org, tiantao6@hisilicon.com, tzimmermann@suse.de,
 xinliang.liu@linaro.org, Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH RESEND] drm/hisilicon: kirin: Convert to
 drmm_mode_config_init() and drop manual cleanup
Date: Wed,  5 Nov 2025 21:39:31 +0530
Message-ID: <20251105160931.466664-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251022114438.1096382-1-madhurkumar004@gmail.com>
References: <20251022114438.1096382-1-madhurkumar004@gmail.com>
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

switch mode_config initialization to drmm_mode_config_init() so that the
lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
from error and cleanup path since cleanup is now managed by DRM.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 1e1c87be1204..47f682097615 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -160,7 +160,10 @@ static int kirin_drm_kms_init(struct drm_device *dev,
 	int ret;
 
 	/* dev->mode_config initialization */
-	drm_mode_config_init(dev);
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+	
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.max_width = driver_data->config_max_width;
@@ -170,8 +173,7 @@ static int kirin_drm_kms_init(struct drm_device *dev,
 	/* display controller init */
 	ret = kirin_drm_private_init(dev, driver_data);
 	if (ret)
-		goto err_mode_config_cleanup;
-
+		return ret;
 	/* bind and init sub drivers */
 	ret = component_bind_all(dev->dev, dev);
 	if (ret) {
@@ -198,8 +200,6 @@ static int kirin_drm_kms_init(struct drm_device *dev,
 	component_unbind_all(dev->dev, dev);
 err_private_cleanup:
 	kirin_drm_private_cleanup(dev);
-err_mode_config_cleanup:
-	drm_mode_config_cleanup(dev);
 	return ret;
 }
 
@@ -208,7 +208,6 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
 	drm_kms_helper_poll_fini(dev);
 	drm_atomic_helper_shutdown(dev);
 	kirin_drm_private_cleanup(dev);
-	drm_mode_config_cleanup(dev);
 
 	return 0;
 }
-- 
2.51.1.dirty

