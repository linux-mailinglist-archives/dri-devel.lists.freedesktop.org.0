Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E371219E11A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 00:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999E6ECC2;
	Fri,  3 Apr 2020 22:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC16ECC0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 22:31:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j19so9455913wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xEJ+5fdwmKWhbWNGYV2Df4Wf3BUc+qjyALcX6vzrhI=;
 b=c3XlMHeatnG0bGKTIE5ROzMJQAisLvolsMGPoTlS2OCHb9SmkGvseEFIVetQU6uGjc
 0PTleZ7zS0GyqMpTcrfatPBiVSFZXh/068ZfeQcE44OSaPWQl/cg2YLdV1sRQ9+chPYo
 SPmmr2jgr4NzAtaLBH1XOTQBH5wvIjDkRDVUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xEJ+5fdwmKWhbWNGYV2Df4Wf3BUc+qjyALcX6vzrhI=;
 b=cw/jfupz1k333OkLbxCqwha2ns9JsA5c/zsjsiwbFTMFXWcHm/U8xAb9lQHbkXrIta
 dhV43c8jP81k+h3aHw6cufEXusjXYcpf5pVOXaw6i61nMKL37jZd3gbuRM0D7e17TAaC
 HT7gMoM038crlbAP5UtPcHmqbePx8cGq8u6AnuePiR4vkOh9MMPsc9PWxLKS06QnHsmZ
 7RqIzfHUfZaL9PzN47POQsyDeicxOQRtSTnLOdycijw5jm0HO+KshqgFajK5X5EeiUxu
 m7Rkn88XRn+Td010MhhbBTxB8o4OmkWSxlFZJhBLkaX6fuQ1fNlAy4d42yH1xn+amBzs
 xcfA==
X-Gm-Message-State: AGi0PuZf2QVs8DxLm7fTtpeEU0iKq5DeHbpMj3pPbbRXZWNe8IUuV4l+
 HehLI0lsx+Vfoeo1RUQDIrQR2OoHyffG3w==
X-Google-Smtp-Source: APiQypII1ztrIMUEy2w1gOLwxDOYNWRj6tGzZiPo34upHdFdMlApedPwOUUSrsShcep8+GlFHeYiTg==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr10474186wme.159.1585953104902; 
 Fri, 03 Apr 2020 15:31:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u6sm7930811wrm.65.2020.04.03.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 15:31:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/selftests: align more to real device lifetimes
Date: Sat,  4 Apr 2020 00:31:39 +0200
Message-Id: <20200403223139.2729900-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-44-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-44-daniel.vetter@ffwll.ch>
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

v2: Rebased

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 33 +++++++++----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 41afc357f4d0..1ab97fa55929 100644
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
 
@@ -221,5 +220,5 @@ struct drm_i915_private *mock_gem_device(void)
 
 void mock_destroy_device(struct drm_i915_private *i915)
 {
-	drm_dev_put(&i915->drm);
+	device_del(i915->drm.dev);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
