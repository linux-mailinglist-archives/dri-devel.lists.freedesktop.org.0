Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1986517267A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195056ECEF;
	Thu, 27 Feb 2020 18:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539456ECD9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z12so411049wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3MudnHwslQcv7L1AeA3nZ3vHFKZHFkyWQhBFq4SS1iU=;
 b=kq3KFZzLQtYOYkxj1LcfbcSiIALW5gvpfMRJr7ZjsmC/LyKMc3s1je1/8yJR9q7rWa
 y02Fm2dGY5PG9QZ/clmfLE8uoeSRgAiLYFrPJzUjYkWxqvI3bphpNF/gspyjKo3cdX2X
 eDFHEnwpFvUIn7DKtheeFjJG1UoHJNf7DV+jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3MudnHwslQcv7L1AeA3nZ3vHFKZHFkyWQhBFq4SS1iU=;
 b=MJoJ5yBWNk4bQeEWTDRrSug3xHxb07VJFCUhy0A6D949GJHqctFR4NfMfhe2ll3cTu
 9ocqnMCxUhUOTY1fJf4nFkQ90M9euC3OvJnbOaVVxTaeU75SvMSAZy6tQYtxK2FcqNCn
 bwXcDadDMQ5gG5PW1kRNtQgkSFkXA3CWATmI+aGK9kb0/KMV4ZKP6IOYYllMQPIxxWbI
 ioSRFTmu+Fjl0dxcS1gDyVt8egO6q/tmlyap/PVdR8q0cPDREaJ5YatJQZuG5+RSa4xP
 GDObDP8vFWBa7CDtF8LXb0n4u7tPyqAtf/xuO+XX/P5JMz67eVVzt9o9dY5EuG/egLuC
 9BXQ==
X-Gm-Message-State: APjAAAX2Ow3QeOE9VOYKffvT4o7KD0KsMVWPHYthHiWOqkn7A5ILtWap
 fYnejfvFFMU3n0NU9bqfkWVYH/Ml5eE=
X-Google-Smtp-Source: APXvYqzdwHTDc5ZUw0eSu4fwgFo8wHbGYI2OJHmV1CjCT4ei77jDd/38w0D9lKeE9a40SSbt+ejkpQ==
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr23635wmb.33.1582827339667;
 Thu, 27 Feb 2020 10:15:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/51] drm/i915: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:39 +0100
Message-Id: <20200227181522.2711142-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de,
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
 drivers/gpu/drm/i915/i915_drv.c               | 10 +++++-
 drivers/gpu/drm/i915/i915_drv.h               |  3 ++
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 31 ++++++++++++++-----
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 0b59a9bd2581..4119e57b0c5b 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "display/intel_acpi.h"
@@ -894,6 +895,8 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return ERR_PTR(err);
 	}
 
+	drmm_add_final_kfree(&i915->drm, i915);
+
 	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
 
@@ -912,7 +915,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 	struct pci_dev *pdev = i915->drm.pdev;
 
 	drm_dev_fini(&i915->drm);
-	kfree(i915);
 }
 
 /**
@@ -996,6 +998,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_welcome_messages(i915);
 
+	i915->do_release = true;
+
 	return 0;
 
 out_cleanup_irq:
@@ -1016,6 +1020,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
 	i915_driver_destroy(i915);
+	drm_dev_put(&i915->drm);
 	return ret;
 }
 
@@ -1055,6 +1060,9 @@ static void i915_driver_release(struct drm_device *dev)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 
+	if (!dev_priv->do_release)
+		return;
+
 	disable_rpm_wakeref_asserts(rpm);
 
 	i915_gem_driver_release(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ea13fc0b409b..31c40e35f497 100644
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
index 754d0eb6beaa..c85bbc88f504 100644
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
+	kfree(i915->drm.pdev);
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
@@ -141,9 +152,14 @@ struct drm_i915_private *mock_gem_device(void)
 	err = drm_dev_init(&i915->drm, &mock_driver, &pdev->dev);
 	if (err) {
 		pr_err("Failed to initialise mock GEM device: err=%d\n", err);
-		goto put_device;
+		put_device(&pdev->dev);
+		kfree(pdev);
+		kfree(i915);
+
+		return NULL;
 	}
 	i915->drm.pdev = pdev;
+	drmm_add_final_kfree(&i915->drm, i915);
 
 	intel_runtime_pm_init_early(&i915->runtime_pm);
 
@@ -188,6 +204,8 @@ struct drm_i915_private *mock_gem_device(void)
 	__clear_bit(I915_WEDGED, &i915->gt.reset.flags);
 	intel_engines_driver_register(i915);
 
+	i915->do_release = true;
+
 	return i915;
 
 err_context:
@@ -199,8 +217,7 @@ struct drm_i915_private *mock_gem_device(void)
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
