Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491D70AF50
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6375F10E1EC;
	Sun, 21 May 2023 17:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB9A10E1EC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:34:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f3ba703b67so1092746e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684690452; x=1687282452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dx5VtIdw4xz9+p4ACct80X9rQk3FASEXkqwK53EC+yo=;
 b=AtBDHn5XfXMiUU5UN1Jr0wMa5AitUJS7oNCQbWgXYj6b17DwNSYd7FlfQJqP9Pd5t7
 5ecw4m8JovTnJ4keUcJSfJZ55XtVsXvu1Hr5Nmn2Cyj21ByTVWeFzDfyxjvMLS6n51U6
 A9TbcRkBs1JFOpEskvZ3XarkWstkvjYwXSIS/M/DgAhL2znelzZ0OtI05Vg114u4hSST
 2eyIqS5CmByYsg4ctLXHBPZPK8br8nXT6Cs6V4dMlA4hbk88lDSjtQCBpVGZscooXt7I
 8aM12dwHWX+aBd+v0pzI1LexnWkT1DGinPnTCg3OGQ/KEVRNCwe53l3SS7ndQ7TezMLs
 0lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684690452; x=1687282452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dx5VtIdw4xz9+p4ACct80X9rQk3FASEXkqwK53EC+yo=;
 b=LmosztFwKZsxCdHaQNx1MWsYSrIEY0G6vOqLSd4kL8H9S1CTMRlDsEMWwHjisgNy74
 ffkxQEYNyq8ihvNak/ke7QtfEKfuu0J9UDwjll9KACXRaxOE4wMyGPzbtScLRw+lh3Ls
 KZztomZ7aHbsPaXnyr1CjvMV8eSqcnT53dZJy9QDnInAgJfZvRWy+f9SInoNZ63Ge7cc
 E9Yg5a29E6sCx9Pt/4CETQMKlvMlJqFbUVkuAdwu/ggxODC+F+2LKuZ+EAR/QKm7VGO6
 Cgu5rWFvmAkWqEBrszVKgAitD1b+nphOfzKLuJcKCk0HiRRqGM3qavwax5m0t7HXrN/v
 +hpw==
X-Gm-Message-State: AC+VfDxDdb0eizPkll63QSLQbGCKm/DUwSoo2kd4HN9PCmDsZfzZH77T
 E4kMOCp4yYFR5Ur6OSRzN6G9Dg==
X-Google-Smtp-Source: ACHHUZ6g7QQ7TPLvDpyS+uB2oszYUZsRFTc/Mnt5MXrj/JkMn1R6HTDwVfS0/VSsVVpi1/942/BoxQ==
X-Received: by 2002:a05:6512:2182:b0:4f1:42ea:c242 with SMTP id
 b2-20020a056512218200b004f142eac242mr2307991lft.3.1684690451788; 
 Sun, 21 May 2023 10:34:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v28-20020ac2593c000000b004f13eff5375sm690908lfi.45.2023.05.21.10.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:34:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/drv: propagate errors from drm_modeset_register_all()
Date: Sun, 21 May 2023 20:34:10 +0300
Message-Id: <20230521173410.4163983-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the drm_modeset_register_all() function fails, its error code
will be ignored. Instead make the drm_dev_register() bail out in case of
such an error.

Fixes: 79190ea2658a ("drm: Add callbacks for late registering")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c6eb8972451a..dc4a496795ee 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -938,8 +938,11 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 			goto err_minors;
 	}
 
-	if (drm_core_check_feature(dev, DRIVER_MODESET))
-		drm_modeset_register_all(dev);
+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
+		ret = drm_modeset_register_all(dev);
+		if (ret)
+			goto err_unload;
+	}
 
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
@@ -949,6 +952,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	goto out_unlock;
 
+err_unload:
+	if (dev->driver->unload)
+		dev->driver->unload(dev);
 err_minors:
 	remove_compat_control_link(dev);
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
-- 
2.39.2

