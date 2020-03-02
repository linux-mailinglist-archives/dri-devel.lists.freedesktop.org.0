Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD01766F8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04026E87A;
	Mon,  2 Mar 2020 22:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAA36E871
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x7so1914550wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btZp9SLtrE+Gl7gy0M0t2uzJh/CXeP/Xz2rbrnBWIP8=;
 b=Qv7+EB0+qa3gos22z1p6io66qvYJNVWdGaTHjePBJayKe4vgqrBiuySVV/YL95gUuS
 uWVxi2168zTYXo4J5mRC5L3ma5f2AxgoW1S7k3qlbXC4LRO/eucdIuI/7sM1PXx5Gjcc
 sPeaWIAmZ9kr0wYWNrBA7P3Ce4N2Sqj9rZs8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btZp9SLtrE+Gl7gy0M0t2uzJh/CXeP/Xz2rbrnBWIP8=;
 b=HX/Eu8YyB19pwAU+EccgTiIUBL/5hiurPgRhoDkWz8s8EQfCq1r3SwwyUD36wLgewk
 1XAGcEqEnNoDXM9mYtE4FzbZKio8a5y0C79bTmd6g5lc9kGkUypjg7/OLorY4kUZ/LES
 gdNgZcqgKXT3Verpo/NvS+uaF0DdGPbIFf8+BBxEAakP3THBJwc/njyPl0MkjkGpEIOX
 xDcyuefSIN+IoS02ODe0+xnySlDnCMcouaxz+5hn5+fnK1UtyaUVnyrTuPtCQRosHSAy
 EVERQd6OCLJRT+mx08YPSjEFUwjHlT0JdFipz4hFDK9507sjTvBGICUUsrHVVlDlEAuI
 xIhg==
X-Gm-Message-State: ANhLgQ2cPqGjxGxWaAn/NNn6cgiajiJQxDFl86Y+4b5J2ZDWsTOjWJEZ
 hrspMxDweY8hOH8KVM16Hw7ZHe+iOOI=
X-Google-Smtp-Source: ADFU+vsfnrYSiXDYb9xtz+9EarCIXaF8WxAZ++RTkqUNBe7qrVD5Cf+5XtGjO09iRnrP1fgQtJj+dQ==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr1604378wrp.344.1583188011626; 
 Mon, 02 Mar 2020 14:26:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:51 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/51] drm/i915: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:48 +0100
Message-Id: <20200302222631.3861340-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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

v3: Fix i915_drm pointer wrangling in mock_gem_device. Also switch
over to start using drm_dev_put() to clean up even on the error path.
Aside I think the current error path is leaking the allocation.

v4: more fixes for intel-gfx-ci, some if it damage from v3 :-/

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
 drivers/gpu/drm/i915/i915_drv.c               | 10 ++++++-
 drivers/gpu/drm/i915/i915_drv.h               |  3 ++
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 30 ++++++++++++++-----
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 5997b4507f29..bb14209beeed 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "display/intel_acpi.h"
@@ -895,6 +896,8 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return ERR_PTR(err);
 	}
 
+	drmm_add_final_kfree(&i915->drm, i915);
+
 	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
 
@@ -913,7 +916,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 	struct pci_dev *pdev = i915->drm.pdev;
 
 	drm_dev_fini(&i915->drm);
-	kfree(i915);
 }
 
 /**
@@ -997,6 +999,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_welcome_messages(i915);
 
+	i915->do_release = true;
+
 	return 0;
 
 out_cleanup_irq:
@@ -1017,6 +1021,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
 	i915_driver_destroy(i915);
+	drm_dev_put(&i915->drm);
 	return ret;
 }
 
@@ -1056,6 +1061,9 @@ static void i915_driver_release(struct drm_device *dev)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 
+	if (!dev_priv->do_release)
+		return;
+
 	disable_rpm_wakeref_asserts(rpm);
 
 	i915_gem_driver_release(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b621df933212..865865ca3b42 100644
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
index 754d0eb6beaa..acf889e4b993 100644
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
+		goto out;
+
 	mock_device_flush(i915);
 	intel_gt_driver_remove(&i915->gt);
 
@@ -72,7 +77,9 @@ static void mock_device_release(struct drm_device *dev)
 	drm_mode_config_cleanup(&i915->drm);
 
 	drm_dev_fini(&i915->drm);
+out:
 	put_device(&i915->drm.pdev->dev);
+	i915->drm.pdev = NULL;
 }
 
 static struct drm_driver mock_driver = {
@@ -114,9 +121,14 @@ struct drm_i915_private *mock_gem_device(void)
 	struct pci_dev *pdev;
 	int err;
 
-	pdev = kzalloc(sizeof(*pdev) + sizeof(*i915), GFP_KERNEL);
+	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
 	if (!pdev)
-		goto err;
+		return NULL;
+	i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
+	if (!i915) {
+		kfree(pdev);
+		return NULL;
+	}
 
 	device_initialize(&pdev->dev);
 	pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
@@ -129,7 +141,6 @@ struct drm_i915_private *mock_gem_device(void)
 	pdev->dev.archdata.iommu = (void *)-1;
 #endif
 
-	i915 = (struct drm_i915_private *)(pdev + 1);
 	pci_set_drvdata(pdev, i915);
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
@@ -141,9 +152,13 @@ struct drm_i915_private *mock_gem_device(void)
 	err = drm_dev_init(&i915->drm, &mock_driver, &pdev->dev);
 	if (err) {
 		pr_err("Failed to initialise mock GEM device: err=%d\n", err);
-		goto put_device;
+		put_device(&pdev->dev);
+		kfree(i915);
+
+		return NULL;
 	}
 	i915->drm.pdev = pdev;
+	drmm_add_final_kfree(&i915->drm, i915);
 
 	intel_runtime_pm_init_early(&i915->runtime_pm);
 
@@ -188,6 +203,8 @@ struct drm_i915_private *mock_gem_device(void)
 	__clear_bit(I915_WEDGED, &i915->gt.reset.flags);
 	intel_engines_driver_register(i915);
 
+	i915->do_release = true;
+
 	return i915;
 
 err_context:
@@ -199,8 +216,7 @@ struct drm_i915_private *mock_gem_device(void)
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
 	drm_dev_fini(&i915->drm);
-put_device:
-	put_device(&pdev->dev);
-err:
+	drm_dev_put(&i915->drm);
+
 	return NULL;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
