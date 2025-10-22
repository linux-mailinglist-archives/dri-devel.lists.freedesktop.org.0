Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B6BFBB43
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E910E761;
	Wed, 22 Oct 2025 11:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jJ2Shbss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F45C10E761
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:44:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-79ef9d1805fso6178627b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761133489; x=1761738289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=onKFYxz3qx1mgItW1GE5HTsCNQVbyGrPrKl8Wr6AIZk=;
 b=jJ2Shbss0IRM3tmVs7d9WwfTA6cAM7jgkPR/BCLqU2VQHU4zWArqXwitomCKhLe/v2
 9E2EDfpR5zGSjyekXX5pZu/FvxksVTMHH6G2h3FTKtv30iXK9WgAf62S5U/J6OXAWB4p
 DT1pSMBCOw+ToGgNw4LXnC5S0c+7JpqgyP5R6Wzc3JKk/WpA6DFDdRDh02WAUzohOPw/
 uov5JJXNFNn4x9DtKgZpl8/x818t2p1jKjldT7ZALZ4PhrnfpraWZn8NXQxyIfpNRGYx
 hzoRp3/8UWdyk6woZ0vma5xmlEkNlmuJzQ9JCApDjmOLW9VGoVMwTIss1X+KSSPbALKI
 RtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761133489; x=1761738289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=onKFYxz3qx1mgItW1GE5HTsCNQVbyGrPrKl8Wr6AIZk=;
 b=EiI+bkQLEjVR7aCaid0qBzNLZKnmxYAttDuuoSMMS1OYZYVAGRaMZ0LQaKr5wuLw0C
 BnXBXWvrkeOz1WWA6a0is1Mq3c7Qgwl7E/73ERBU4eJeOE8WEuLvaWLvrOCRPJWziA0d
 ZI6Qu7ek4gEIoO0cUJ81KQO/P4Tyn0TRDyoSl0skrKCYwCsVTKATyEJHCAvj9l/oRvYq
 qL95+O3VQY5E2o1P63XjtF8Y0zHRlQBmzMMvRoFs8SxL6aOEJOI8WOq9xcb7HMMxgzZH
 lOc+PVJ937hFvoYMG2o5qbIgXMJxWfmn2gosjLIMMagCEI1DezrnF5gnICIkBoeRmYlc
 KmrA==
X-Gm-Message-State: AOJu0YxqLYEH8qgFbzAXGJWKwY7tnCfvULPJYFSq/5KbtrMO1EgG1c8Q
 dfN+yI9MzGWwe5gy17Mg/JQHiHrQg4Zz/iDi+r8+19oohegIJdrdKk7d
X-Gm-Gg: ASbGncsiPm1GM/8Gwz45ooQ7zuHWDIzL6WAamsPpALoDJspU8HrfsEQTSzaT+ZPAtfH
 OuQ2wkRiI3UzUYNiJc7LhsfsouV9KL+Q+OsdwqsLAxN9nBHdxN1Rho6gWdnnU3FEVKfnPSf+ve/
 P4dDv6CBfYjwFSQb8f4IZoT8vtV5bi8Ib6iMrvscHLbkFYBshBkJW7uLS9eDEe28/PJ3OtEBbqN
 Yjo7bkfBEk2fa8+oJr4osOv3ZfiLr3c9zlKdgTxmuYkh+IV3Z9/d/81IEbzE5XCb8colwswrwlg
 DI4/wcSWtlRxDbSY8dT3tbqoRHD9JkpofcfHdm/Tc0DUYILe/u2I6TKnDJbtqOhcWkaa7vaBdAn
 uHSCzs0CZEekZ8DWLr6nRHs3VTUwSgN/ltUcCVWNi0wyZLEG72Xwt+6j+v7i/zWRi+IubcBA4GA
 1LZRQDcs5RQ0MV
X-Google-Smtp-Source: AGHT+IF05o6So4ZzLzR4++1urqrBHzEM10If/mZEe/mvCz5HnKnXUFhx0Yvvtsc2+Pd9ilWbyJSVrg==
X-Received: by 2002:a05:6a20:1611:b0:334:7aae:c43b with SMTP id
 adf61e73a8af0-334a853985emr25489520637.20.1761133489450; 
 Wed, 22 Oct 2025 04:44:49 -0700 (PDT)
Received: from archlinux ([36.255.84.56]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33dfb67f151sm2525521a91.2.2025.10.22.04.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:44:49 -0700 (PDT)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 kong.kongxinwei@hisilicon.com, sumit.semwal@linaro.org,
 yongqin.liu@linaro.org, jstultz@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/hisilicon: kirin: Convert to drmm_mode_config_init() and
 drop manual cleanup
Date: Wed, 22 Oct 2025 17:14:38 +0530
Message-ID: <20251022114438.1096382-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
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

