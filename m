Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D681688A6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112E6F532;
	Fri, 21 Feb 2020 21:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3FA6F521
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so3521534wrd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9nD53yPZX4v8vgtD8EOoZEhsSHssxTCZRe0/MkLpBlw=;
 b=gLJtX00Vg5JU3ArhBwZKhK9Z4vjUUjZc1J5dX/GjnIc218ure4A0dywCW0bnmLuoGd
 DqCMW5ecji2gG3xhy6PRd4cpKC6qWVaGvyD5FExu2SZfOlCM41YWxVnqCl2HRAmmk0b7
 Ign9ymlUh9DVMa5b7En+CDvav7dY4t3PXaWKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9nD53yPZX4v8vgtD8EOoZEhsSHssxTCZRe0/MkLpBlw=;
 b=kHbRWlENpG+DrHViYAznCOlceBp/MuX8Kyv9ZwksYEM77RfHhFr/wotRVuATxOaghk
 Y1TzC98ybswm6VPeOy8pdklcUb5VLdkYYDUSdcCP0KuZXPmat9UZUwoxH2TVZcuqVCgM
 PaALH5QHCrMb88BbzlbppIXVshWAuoyVrFPN0PHn0pm0mVm/eFI6pbOC9XJUCvFPbbnx
 bRkO6QbI5djDDj+KkGqdxXRDD5odfgOb3PXEmvm1AIIyMdCN1OdJyhE27NvnSdpCPgLk
 sYugW8D/qARYvXsnz3LEP9vybepgJwrFr60NTpGjYLtr102/aP21Vc2N8akDxVYuJDp2
 TkWg==
X-Gm-Message-State: APjAAAWkKFzO1ikKR2ex0BazOcxaIrsz3uzrI+F50hZvQkA3Q9dZO5qX
 7A1Uh2y9JTcrIh4pmzyt6jy38tCAK+c=
X-Google-Smtp-Source: APXvYqx609MWlI8G3v84wpPj7NcyO73xwNe4/Ay37NwKGM5VVP8qHe7AHiyPqpp+BQ5RitSQrEMb0A==
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr52987783wrn.124.1582319018705; 
 Fri, 21 Feb 2020 13:03:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/51] drm/i915: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:36 +0100
Message-Id: <20200221210319.2245170-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
index 8b8a9c9a9b2a..ae81c74d0136 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/i915_drm.h>
 
@@ -1371,6 +1372,7 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	i915->drm.dev_private = i915;
+	drmm_add_final_kfree(&i915->drm, i915);
 
 	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
@@ -1390,7 +1392,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 	struct pci_dev *pdev = i915->drm.pdev;
 
 	drm_dev_fini(&i915->drm);
-	kfree(i915);
 }
 
 /**
@@ -1466,6 +1467,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_welcome_messages(i915);
 
+	i915->do_release = true;
+
 	return 0;
 
 out_cleanup_hw:
@@ -1482,6 +1485,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
 	i915_driver_destroy(i915);
+	drm_dev_put(&i915->drm);
 	return ret;
 }
 
@@ -1528,6 +1532,9 @@ static void i915_driver_release(struct drm_device *dev)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 
+	if (!dev_priv->do_release)
+		return;
+
 	disable_rpm_wakeref_asserts(rpm);
 
 	i915_gem_driver_release(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 4305ccc4c683..6e88eae40a87 100644
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
