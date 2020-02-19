Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0016419F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED146EB50;
	Wed, 19 Feb 2020 10:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822B6EB37
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a9so6138831wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDMnlIdOy1ss1fVsxDwba9opTsaxjETDeiZQ6dZU5ZU=;
 b=DvYPbhu7GSj7ukjDlkEDOzPHuhTDEM23+obBmINs6EFz7wEc3hWe9VJN9JlCAUM2L7
 FsByW9MtH2LOa3QEoi7aVxvljdk1w0B1k2rGJEIO9BQqMBi5GKiwnwF4h68zy/HvPMv9
 pW3Q1JQRzMQClCzqZpK0wksOskkVwhOgcOn5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDMnlIdOy1ss1fVsxDwba9opTsaxjETDeiZQ6dZU5ZU=;
 b=uZrmpng9h0mRqPOSmN8JDv77XczXHuBBj5jef/EPgptcH7mnZqImIkhMVH4kbDmntG
 GsCbb/lNDwlP/ObsKhERF5B8zOKjE24bVcsnI9uSrZECZsvsTcV6xZOyKGEjN6ecYAzQ
 PvhfO9xccxF+0kAUFYj7rLodYZIwKoikxuWG5xpyHoHkqlObVuwi6NZerwo57klRBz4B
 rAa8uanrr2fdXaKQ5X0utDlzr7hWzHDz4Td5j80pk9nphZAFjIMYgaHF/YKUsWPxIOo1
 ZnercbLBm3B0TxPcP6Jig1FI2EDuYvfwFWWCtTaaYhd88w6WxhVnqU6Tdm2m5QLR573v
 Jf9A==
X-Gm-Message-State: APjAAAUeuWPSfLU2Ik/e4FAfHvKdjyKWi+lk1IJAXhrBgwIdfsNX6STE
 Y9f6SBQGMIj3+Y/ZQR4jxFGdN0wrUPs=
X-Google-Smtp-Source: APXvYqwGOVoWCHj/UAohb2EubqRjpYgyetdcU+h6z6LpxtK82nIMTYFEPImP7QpUcMxCJ/lWGcWX6Q==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr8938750wmf.40.1582107702283; 
 Wed, 19 Feb 2020 02:21:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:41 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/52] drm/i915: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:39 +0100
Message-Id: <20200219102122.1607365-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

The mock device in the selftests needed it's pci_device split
up from the drm_device. In the future we could simplify this again
by allocating the pci_device as a managed allocation too.

v2: I overlooked that i915_driver_destroy is also called in the
unwind code of the error path. There we need a drm_dev_put.
Similar for the mock object.

Now the problem with that is that the drm_driver->release callbacks
for both the real driver and the mock one assume everything has been
set up. Hence going through that path for a partially set up driver
will result in issues. Quickest fix is to disable the ->release() hook
until the driver is fully initialized, and keep the onion unwinding.
Long term would be cleanest to move everything over to drmm_ release
actions, but that's a lot of work for a big driver like i915. Plus
more core work needed first anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/i915_drv.c                |  9 ++++++++-
 drivers/gpu/drm/i915/i915_drv.h                |  3 +++
 .../gpu/drm/i915/selftests/mock_gem_device.c   | 18 +++++++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 050e4d7c6723..61d874b61cb3 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/i915_drm.h>
 
@@ -1363,6 +1364,7 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	i915->drm.dev_private = i915;
+	drmm_add_final_kfree(&i915->drm, i915);
 
 	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
@@ -1382,7 +1384,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 	struct pci_dev *pdev = i915->drm.pdev;
 
 	drm_dev_fini(&i915->drm);
-	kfree(i915);
 }
 
 /**
@@ -1458,6 +1459,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_welcome_messages(i915);
 
+	i915->do_release = true;
+
 	return 0;
 
 out_cleanup_hw:
@@ -1474,6 +1477,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
 	i915_driver_destroy(i915);
+	drm_dev_put(&i915->drm);
 	return ret;
 }
 
@@ -1516,6 +1520,9 @@ static void i915_driver_release(struct drm_device *dev)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 
+	if (!dev_priv->do_release)
+		return;
+
 	disable_rpm_wakeref_asserts(rpm);
 
 	i915_gem_driver_release(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3330b538d379..6e984fd7ae77 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -884,6 +884,9 @@ struct i915_selftest_stash {
 struct drm_i915_private {
 	struct drm_device drm;
 
+	/* FIXME: Device release actions should all be moved to drmm_ */
+	bool do_release;
+
 	const struct intel_device_info __info; /* Use INTEL_INFO() to access. */
 	struct intel_runtime_info __runtime; /* Use RUNTIME_INFO() to access. */
 	struct intel_driver_caps caps;
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 3b8986983afc..9b06d5ec889a 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -25,6 +25,8 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_managed.h>
+
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
 #include "gt/mock_engine.h"
@@ -55,6 +57,9 @@ static void mock_device_release(struct drm_device *dev)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 
+	if (!i915->do_release)
+		return;
+
 	mock_device_flush(i915);
 	intel_gt_driver_remove(&i915->gt);
 
@@ -114,9 +119,14 @@ struct drm_i915_private *mock_gem_device(void)
 	struct pci_dev *pdev;
 	int err;
 
-	pdev = kzalloc(sizeof(*pdev) + sizeof(*i915), GFP_KERNEL);
+	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
 	if (!pdev)
 		goto err;
+	i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
+	if (!i915) {
+		kfree(pdev);
+		goto err;
+	}
 
 	device_initialize(&pdev->dev);
 	pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
@@ -141,10 +151,13 @@ struct drm_i915_private *mock_gem_device(void)
 	err = drm_dev_init(&i915->drm, &mock_driver, &pdev->dev);
 	if (err) {
 		pr_err("Failed to initialise mock GEM device: err=%d\n", err);
+		kfree(i915);
+
 		goto put_device;
 	}
 	i915->drm.pdev = pdev;
 	i915->drm.dev_private = i915;
+	drmm_add_final_kfree(&i915->drm, i915);
 
 	intel_runtime_pm_init_early(&i915->runtime_pm);
 
@@ -189,6 +202,8 @@ struct drm_i915_private *mock_gem_device(void)
 	__clear_bit(I915_WEDGED, &i915->gt.reset.flags);
 	intel_engines_driver_register(i915);
 
+	i915->do_release = true;
+
 	return i915;
 
 err_context:
@@ -200,6 +215,7 @@ struct drm_i915_private *mock_gem_device(void)
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
 	drm_dev_fini(&i915->drm);
+	drm_dev_put(&i915->drm);
 put_device:
 	put_device(&pdev->dev);
 err:
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
