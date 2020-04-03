Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39C19D877
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166756EBF9;
	Fri,  3 Apr 2020 13:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1426EBEF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so7791619wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDjYN5F4pqljQeTjrzaM9vKPOIexc9jxnHCDJfkzYeg=;
 b=bUWIlnw4Zdbs4HeUiyORh8sSzWY7FLeX1iZYYjw3xl3T0mQ/t0+pyQTHWRJxbeQ9cQ
 OcdJMPUFQ4sH5mTNA3MTwaJGyLS+iA+hjirfA6AevWJA5YvIPRW4g9oAQ2gvepwgry8X
 k6CkGmOkIHXeSNWMGhOP7JaIpB2A3b12Btrro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDjYN5F4pqljQeTjrzaM9vKPOIexc9jxnHCDJfkzYeg=;
 b=lKYgkNX1v99AjaGFHQlKj3s3YJlxpgNr6xb0xe8dbCfky+bW/tWnXrMNEOnMM7WHvO
 eD1WuUDy4d/ISuXyNWA1YVH3qM3VU1XyC0qofi8adejtbra0qA9OCyq4GOOeiLHl4+8k
 GZSFcIZS496LwU5UQHa2X9Qri4ZHU3kt62TsY9TdW6xyXiwu2UKXgic9KdUdL75Ku2lp
 qsxR43PKAOdlq+y6cd3MHy3z0XK6RrOKDmW5U9tU+s4utginx+XqFA09Z7Q/bsaBjN36
 Np/mcaP38GtHhBa2qIO85Al5KlpmD2Zii/QH1poE9qMSRL0x+vZDgYIN/Qp7+7hOqMFW
 xvng==
X-Gm-Message-State: AGi0PuYmp7Tvb92GqyI3+oI5ENwrrs19OnxFDbgDdvSryUoxUyJ31yQc
 dcW9BbgyNMapqKiUQY3FMSbiu9pGeThBJw==
X-Google-Smtp-Source: APiQypIX3Fz8QBGCHucX1RVHc6MjTaN3ByRB0MlduLVSd27+W4Q7xON+Lhjwwc9Axgv6Q60q1UpiRg==
X-Received: by 2002:a1c:7e11:: with SMTP id z17mr9258744wmc.151.1585922363363; 
 Fri, 03 Apr 2020 06:59:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 43/44] drm/i915/selftests: align more to real device lifetimes
Date: Fri,  3 Apr 2020 15:58:27 +0200
Message-Id: <20200403135828.2542770-44-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The big change is device_add so that device_del can auto-cleanup
devres resources. This allows us to use devm_drm_dev_alloc, which
removes the last user of drm_dev_init.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 31 +++++++++----------
 .../gpu/drm/i915/selftests/mock_gem_device.h  |  2 +-
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 03607647cdeb..ea73d1f7cf12 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -123,12 +123,6 @@ struct drm_i915_private *mock_gem_device(void)
 	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
 	if (!pdev)
 		return NULL;
-	i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
-	if (!i915) {
-		kfree(pdev);
-		return NULL;
-	}
-
 	device_initialize(&pdev->dev);
 	pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
 	pdev->dev.release = release_dev;
@@ -139,8 +133,23 @@ struct drm_i915_private *mock_gem_device(void)
 	/* hack to disable iommu for the fake device; force identity mapping */
 	pdev->dev.archdata.iommu = (void *)-1;
 #endif
+	err = device_add(&pdev->dev);
+	if (err) {
+		kfree(pdev);
+		return NULL;
+	}
+
+	i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
+				  struct drm_i915_private, drm);
+	if (err) {
+		pr_err("Failed to allocate mock GEM device: err=%d\n", err);
+		put_device(&pdev->dev);
+
+		return NULL;
+	}
 
 	pci_set_drvdata(pdev, i915);
+	i915->drm.pdev = pdev;
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
@@ -148,16 +157,6 @@ struct drm_i915_private *mock_gem_device(void)
 	if (pm_runtime_enabled(&pdev->dev))
 		WARN_ON(pm_runtime_get_sync(&pdev->dev));
 
-	err = drm_dev_init(&i915->drm, &mock_driver, &pdev->dev);
-	if (err) {
-		pr_err("Failed to initialise mock GEM device: err=%d\n", err);
-		put_device(&pdev->dev);
-		kfree(i915);
-
-		return NULL;
-	}
-	i915->drm.pdev = pdev;
-	drmm_add_final_kfree(&i915->drm, i915);
 
 	intel_runtime_pm_init_early(&i915->runtime_pm);
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.h b/drivers/gpu/drm/i915/selftests/mock_gem_device.h
index 2e3c7585a7bb..4f309a05c85a 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.h
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.h
@@ -9,7 +9,7 @@ void mock_device_flush(struct drm_i915_private *i915);
 
 static inline void mock_destroy_device(struct drm_i915_private *i915)
 {
-	drm_dev_put(&i915->drm);
+	device_del(i915->drm.dev);
 }
 
 #endif /* !__MOCK_GEM_DEVICE_H__ */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
