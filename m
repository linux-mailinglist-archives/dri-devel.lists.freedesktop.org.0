Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9055E176726
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4D6E8A5;
	Mon,  2 Mar 2020 22:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A206E89B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so843939wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2jMzsWBU+Z/p0fU3te26LTHrNFQlw/eiwPOByu+9FQ=;
 b=SDdN2j+8mEYGhEJrQprq+rVv/t2t/UGcDbVnzc7uY9ureovOclLEgU/H2od6yFcmgD
 v8uaUnjgHRwfvwVQ11K9EkMf+uudTZg/yWkqLbMbvVRANzt/BpxEPsYP3aQqAiWzh1Es
 mPs846DDY3kv1ud06iYb7ZzZElXPovf6LqYNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w2jMzsWBU+Z/p0fU3te26LTHrNFQlw/eiwPOByu+9FQ=;
 b=jYQCiD77oapaqbarAW3BSb2S1jHG8NcOPIoxm5H1h1tfqLS6BEMkJ+uUxoimg2w4uc
 f6hfuxFMg1lRfXdpDQCIMmK8QLcMJYgrlcppxZd71VwcYq6udyNPx4Xo3JUH0KAzrT/I
 nahjokYAKWqrYstsNn4AF7AJAZoutf7L7A7+aDYi/LwhXr2YIO1G2EGmpko+E5n29BOZ
 Y1Pb+8PybTIXfIz8P4DtZNJ/VKDBzwdySVKbpLSCIV87fbpi7JQiJTOKduJGcHB5CON1
 BZXObAPuxksePupSUahAVSMcx6HjsmcHebQtYnNHKIZHZ1fUMN1kseBOXdjfJqZVxz/t
 X+9g==
X-Gm-Message-State: ANhLgQ2EuZ6akE6MonbCn5O+Dh9mW43zsPtY17n9VlVjm6LEeqL4OW6p
 kFAPunN0NBOU5qgvJ95BMsyiDSKHTfQ=
X-Google-Smtp-Source: ADFU+vvzoXsqqVEzdf7IRbDo/15LE3QTKgJ8kUs9AoPkdF5LZZU2to0c7rA/rEviI7X7Pb942k+W7g==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr536732wmi.54.1583188031847;
 Mon, 02 Mar 2020 14:27:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:11 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/51] drm: Garbage collect drm_dev_fini
Date: Mon,  2 Mar 2020 23:26:05 +0100
Message-Id: <20200302222631.3861340-26-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It has become empty. Given the few users I figured not much point
splitting this up.

v2: Rebase over i915 changes.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/cirrus/cirrus.c               |  1 -
 drivers/gpu/drm/drm_drv.c                     | 23 +------------------
 drivers/gpu/drm/drm_mipi_dbi.c                |  1 -
 drivers/gpu/drm/i915/i915_drv.c               |  9 --------
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  2 --
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  1 -
 drivers/gpu/drm/mcde/mcde_drv.c               |  1 -
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 --
 drivers/gpu/drm/tiny/gm12u320.c               |  1 -
 drivers/gpu/drm/tiny/repaper.c                |  1 -
 drivers/gpu/drm/udl/udl_drv.c                 |  1 -
 drivers/gpu/drm/vgem/vgem_drv.c               |  1 -
 drivers/gpu/drm/vkms/vkms_drv.c               |  1 -
 drivers/gpu/drm/xen/xen_drm_front.c           |  2 --
 include/drm/drm_drv.h                         |  5 +---
 15 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
index 2232556ce34c..a9d789a56536 100644
--- a/drivers/gpu/drm/cirrus/cirrus.c
+++ b/drivers/gpu/drm/cirrus/cirrus.c
@@ -529,7 +529,6 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
 static void cirrus_release(struct drm_device *dev)
 {
 	drm_mode_config_cleanup(dev);
-	drm_dev_fini(dev);
 }
 
 DEFINE_DRM_GEM_FOPS(cirrus_fops);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 90b6ae81d431..c709a0ce018c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -283,7 +283,6 @@ void drm_minor_release(struct drm_minor *minor)
  *		struct driver_device *priv = container_of(...);
  *
  *		drm_mode_config_cleanup(drm);
- *		drm_dev_fini(drm);
  *	}
  *
  *	static struct drm_driver driver_drm_driver = {
@@ -738,23 +737,6 @@ int devm_drm_dev_init(struct device *parent,
 }
 EXPORT_SYMBOL(devm_drm_dev_init);
 
-/**
- * drm_dev_fini - Finalize a dead DRM device
- * @dev: DRM device
- *
- * Finalize a dead DRM device. This is the converse to drm_dev_init() and
- * frees up all data allocated by it. All driver private data should be
- * finalized first. Note that this function does not free the @dev, that is
- * left to the caller.
- *
- * The ref-count of @dev must be zero, and drm_dev_fini() should only be called
- * from a &drm_driver.release callback.
- */
-void drm_dev_fini(struct drm_device *dev)
-{
-}
-EXPORT_SYMBOL(drm_dev_fini);
-
 /**
  * drm_dev_alloc - Allocate new DRM device
  * @driver: DRM driver to allocate device for
@@ -803,11 +785,8 @@ static void drm_dev_release(struct kref *ref)
 {
 	struct drm_device *dev = container_of(ref, struct drm_device, ref);
 
-	if (dev->driver->release) {
+	if (dev->driver->release)
 		dev->driver->release(dev);
-	} else {
-		drm_dev_fini(dev);
-	}
 
 	drm_managed_release(dev);
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 069603dfcd10..a678e07508d4 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -591,7 +591,6 @@ void mipi_dbi_release(struct drm_device *drm)
 	DRM_DEBUG_DRIVER("\n");
 
 	drm_mode_config_cleanup(drm);
-	drm_dev_fini(drm);
 }
 EXPORT_SYMBOL(mipi_dbi_release);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index bb14209beeed..ff24ca5df7ed 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -911,13 +911,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return i915;
 }
 
-static void i915_driver_destroy(struct drm_i915_private *i915)
-{
-	struct pci_dev *pdev = i915->drm.pdev;
-
-	drm_dev_fini(&i915->drm);
-}
-
 /**
  * i915_driver_probe - setup chip and create an initial config
  * @pdev: PCI device
@@ -1020,7 +1013,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_disable_device(pdev);
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
-	i915_driver_destroy(i915);
 	drm_dev_put(&i915->drm);
 	return ret;
 }
@@ -1077,7 +1069,6 @@ static void i915_driver_release(struct drm_device *dev)
 	intel_runtime_pm_driver_release(rpm);
 
 	i915_driver_late_release(dev_priv);
-	i915_driver_destroy(dev_priv);
 }
 
 static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index acf889e4b993..2b4407ac26de 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -76,7 +76,6 @@ static void mock_device_release(struct drm_device *dev)
 
 	drm_mode_config_cleanup(&i915->drm);
 
-	drm_dev_fini(&i915->drm);
 out:
 	put_device(&i915->drm.pdev->dev);
 	i915->drm.pdev = NULL;
@@ -215,7 +214,6 @@ struct drm_i915_private *mock_gem_device(void)
 	intel_gt_driver_late_release(&i915->gt);
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
-	drm_dev_fini(&i915->drm);
 	drm_dev_put(&i915->drm);
 
 	return NULL;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index e2c832eb4e9a..192aaa4421a3 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -492,7 +492,6 @@ static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 static void ingenic_drm_release(struct drm_device *drm)
 {
 	drm_mode_config_cleanup(drm);
-	drm_dev_fini(drm);
 }
 
 static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 7474481503a1..a543ebf3d541 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -223,7 +223,6 @@ static void mcde_release(struct drm_device *drm)
 	struct mcde *mcde = drm->dev_private;
 
 	drm_mode_config_cleanup(drm);
-	drm_dev_fini(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 32a85628dbec..460d5e9d0cf4 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -108,8 +108,6 @@ static void tidss_release(struct drm_device *ddev)
 	drm_kms_helper_poll_fini(ddev);
 
 	tidss_modeset_cleanup(tidss);
-
-	drm_dev_fini(ddev);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(tidss_fops);
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 524ca0941cf9..3928f69bbd3d 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -637,7 +637,6 @@ static void gm12u320_driver_release(struct drm_device *dev)
 
 	gm12u320_usb_free(gm12u320);
 	drm_mode_config_cleanup(dev);
-	drm_dev_fini(dev);
 }
 
 DEFINE_DRM_GEM_FOPS(gm12u320_fops);
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index df5654ef53ee..4741ff670ec9 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -914,7 +914,6 @@ static void repaper_release(struct drm_device *drm)
 	DRM_DEBUG_DRIVER("\n");
 
 	drm_mode_config_cleanup(drm);
-	drm_dev_fini(drm);
 }
 
 static const uint32_t repaper_formats[] = {
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 6a5594946096..8b78c356beb5 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -38,7 +38,6 @@ static void udl_driver_release(struct drm_device *dev)
 {
 	udl_fini(dev);
 	udl_modeset_cleanup(dev);
-	drm_dev_fini(dev);
 }
 
 static struct drm_driver driver = {
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 7486014e9149..ec1a8ebb6f1b 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -432,7 +432,6 @@ static void vgem_release(struct drm_device *dev)
 	struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
 
 	platform_device_unregister(vgem->platform);
-	drm_dev_fini(&vgem->drm);
 }
 
 static struct drm_driver vgem_driver = {
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2f35fe789343..eef85f1a0ce5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -64,7 +64,6 @@ static void vkms_release(struct drm_device *dev)
 	platform_device_unregister(vkms->platform);
 	drm_atomic_helper_shutdown(&vkms->drm);
 	drm_mode_config_cleanup(&vkms->drm);
-	drm_dev_fini(&vkms->drm);
 	destroy_workqueue(vkms->output.composer_workq);
 }
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index d22b5da38935..b91d23b5f3ae 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -460,8 +460,6 @@ static void xen_drm_drv_release(struct drm_device *dev)
 	drm_atomic_helper_shutdown(dev);
 	drm_mode_config_cleanup(dev);
 
-	drm_dev_fini(dev);
-
 	if (front_info->cfg.be_alloc)
 		xenbus_switch_state(front_info->xb_dev,
 				    XenbusStateInitialising);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cbd050419ab8..edee40e31e4b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -265,9 +265,7 @@ struct drm_driver {
 	 * @release:
 	 *
 	 * Optional callback for destroying device data after the final
-	 * reference is released, i.e. the device is being destroyed. Drivers
-	 * using this callback are responsible for calling drm_dev_fini()
-	 * to finalize the device and then freeing the struct themselves.
+	 * reference is released, i.e. the device is being destroyed.
 	 */
 	void (*release) (struct drm_device *);
 
@@ -623,7 +621,6 @@ int drm_dev_init(struct drm_device *dev,
 int devm_drm_dev_init(struct device *parent,
 		      struct drm_device *dev,
 		      struct drm_driver *driver);
-void drm_dev_fini(struct drm_device *dev);
 
 struct drm_device *drm_dev_alloc(struct drm_driver *driver,
 				 struct device *parent);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
