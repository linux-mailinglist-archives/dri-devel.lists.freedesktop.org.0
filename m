Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E297F2705E4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 22:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44F6ED84;
	Fri, 18 Sep 2020 20:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989516ED80
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 20:00:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d4so6395772wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 13:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQjfx1dlb8AV3hvmklM8AXojRWEWsKETVPO8LS2leI8=;
 b=SYldkyYd1CBCqWWNOGAgru1KRufRNnCSgvmff391HiV2gNn4mEltKpr7B23Z+WAfpe
 3jcaSEkkAWL0kYfmmjtg0tKYRAXuGeJFLQs1l0ynYYsWnWPNcpURAqtVTL5BuXxs6s+H
 divv0bcIgal0TMAzpcr+a9AMX9QchoZcUfQFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQjfx1dlb8AV3hvmklM8AXojRWEWsKETVPO8LS2leI8=;
 b=mhOfKhg0Uf0NZAgQrS6nOG/mM/hc9O/4JxJ+D96hf5KwaM/GLL5YqwI/G8qSSgJ2nu
 WrrvPAH97zjy3r3ZKmI2df7ckqUVqdljSU5Jd2ax5caAdDJe5XA4jMz2rN1m89zG2q9u
 CqrpI1Tlx8ZUD3e6BiLrtUcnwcTFEBs8/Ivw0SKBWRKZe9RT88XwjqEDD+rYW+denkGK
 9eX4ItB9XCOQFN/BHluw1TiZaxaU4mSgTbFHlpeUcUtYIBtxev0zv4oHSLCvyANYbURi
 LqnUBLTiJJLBJeUVgzE44qTNOd+G4OeNBfCwLvAHEgQS+G+y4ttZyd+VDbT1Z2xQB2hw
 +2Gw==
X-Gm-Message-State: AOAM530kqyhmsgQKakm4wQ8bVzDqgL0jkFLTWF8FyU/VZVETVXksgzgR
 L0Jfgdh4yczfoWIC4TeeYugEhhA2xSqxzm9T
X-Google-Smtp-Source: ABdhPJzSiplAkUIwO3Yl7gtgMxbtAxYnYHNrI3sm7sIjYgyAKSL2NgU6kO9Z44Lc3Sr1AoRryrv1Zw==
X-Received: by 2002:a1c:7e90:: with SMTP id
 z138mr16974535wmc.122.1600459229923; 
 Fri, 18 Sep 2020 13:00:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e18sm7492006wra.36.2020.09.18.13.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 13:00:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/selftests: align more to real device lifetimes
Date: Fri, 18 Sep 2020 22:00:24 +0200
Message-Id: <20200918200024.2414549-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
References: <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
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
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid having to create all the device and driver scaffolding we
just manually create and destroy a devres_group.

v2: Rebased

v3: use devres_open/release_group so we can use devm without real
hacks in the driver core or having to create an entire fake bus for
testing drivers. Might want to extract this into helpers eventually,
maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.

v4:
- Fix IS_ERR handling (Matt)
- Delete surplus put_device() in mock_device_release (intel-gfx-ci)

v5:
- do not switch to device_add - it breaks runtime pm in the tests and
  with the devres_group_add/release no longer needed for automatic
  cleanup (CI). Update commit message to match.
- print correct error in pr_err (Matt)

Cc: Matthew Auld <matthew.william.auld@gmail.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (v3)
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.william.auld@gmail.com> (v4)
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index ac600d395c8f..3b574597cd7f 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -79,8 +79,6 @@ static void mock_device_release(struct drm_device *dev)
 
 out:
 	i915_params_free(&i915->params);
-	put_device(&i915->drm.pdev->dev);
-	i915->drm.pdev = NULL;
 }
 
 static struct drm_driver mock_driver = {
@@ -128,12 +126,6 @@ struct drm_i915_private *mock_gem_device(void)
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
@@ -144,8 +136,23 @@ struct drm_i915_private *mock_gem_device(void)
 	/* HACK to disable iommu for the fake device; force identity mapping */
 	pdev->dev.iommu = &fake_iommu;
 #endif
+	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+		put_device(&pdev->dev);
+		return NULL;
+	}
+
+	i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
+				  struct drm_i915_private, drm);
+	if (IS_ERR(i915)) {
+		pr_err("Failed to allocate mock GEM device: err=%d\n", PTR_ERR(i915));
+		devres_release_group(&pdev->dev, NULL);
+		put_device(&pdev->dev);
+
+		return NULL;
+	}
 
 	pci_set_drvdata(pdev, i915);
+	i915->drm.pdev = pdev;
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
@@ -153,16 +160,6 @@ struct drm_i915_private *mock_gem_device(void)
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
 
 	i915_params_copy(&i915->params, &i915_modparams);
 
@@ -229,5 +226,8 @@ struct drm_i915_private *mock_gem_device(void)
 
 void mock_destroy_device(struct drm_i915_private *i915)
 {
-	drm_dev_put(&i915->drm);
+	struct device *dev = i915->drm.dev;
+
+	devres_release_group(dev, NULL);
+	put_device(dev);
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
