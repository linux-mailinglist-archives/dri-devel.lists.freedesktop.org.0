Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C4618F777
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4826E201;
	Mon, 23 Mar 2020 14:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C546E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a9so12075337wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEBy8/H/eidVOhnhyaIMAequoqhr6vmcXPyRtkUOe1A=;
 b=gBtbZrJWMXyikGky4DYnJ4RRndveuDzY3Mj5jsOAH8ZLIB73DIqf5PQvU4hRvgPV9W
 vY9jsFGJvcqav5NKxja7Q/o6w00Q45NzRl5f6JRTMexZflakhxXhvfGQhWgTRrpevU9g
 OCRmBonEhd3tfIUOmZ0bYEC2bDPBu5FwLE4u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEBy8/H/eidVOhnhyaIMAequoqhr6vmcXPyRtkUOe1A=;
 b=iEH3PTL3tSvEpyysx2cKqz7SlzevgpRXrvbQLYHJNYH0WpYvznyP9N1xaOsatXZNf1
 08USBr/OjQsgBM25mugu9/9kX7JD704dLvWeNI70cwTTHTcZ2+gjKoSUkOcYkNF6P18J
 pdRIwFMz7gW9dW17nqIFQTki8L4KiI/0eCDle/UjQmtjSztKSvW27YWK1s5gbxxiWvEE
 jVYKbwT5MBwE0ECudabWHHdqqYyejU0+UdefXiceYLg235bDL5/+PAja7lJtN0H4u7hl
 1uFlitlYnFXPMFvHWLYewNSZvHzA7aqo6Qc2Z/1sHsT0QMmmzYUIxNunyJ7PJSpBPWME
 zDFw==
X-Gm-Message-State: ANhLgQ1oOmxTqZyDUrSRXObI3ser4NQbRqaLB/k+LpvHDFXQ4pkkDkW/
 /RfOXgt1HZFYL8V9AOTcCMtEhKP4j7D9cg==
X-Google-Smtp-Source: ADFU+vuiYkffH8p8PjF7vhKRar2p/jre6yTiMNTHiDzisO9xLRXuQJqFcDiamcxFBraPx18oAtwQcQ==
X-Received: by 2002:a1c:41d4:: with SMTP id o203mr26839516wma.1.1584975031047; 
 Mon, 23 Mar 2020 07:50:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/51] drm: Garbage collect drm_dev_fini
Date: Mon, 23 Mar 2020 15:49:24 +0100
Message-Id: <20200323144950.3018436-26-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It has become empty. Given the few users I figured not much point
splitting this up.

v2: Rebase over i915 changes.

v3: Rebase over patch split fix.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/cirrus/cirrus.c               |  1 -
 drivers/gpu/drm/drm_drv.c                     | 20 -------------------
 drivers/gpu/drm/drm_mipi_dbi.c                |  1 -
 drivers/gpu/drm/i915/i915_drv.c               |  9 ---------
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
 include/drm/drm_drv.h                         |  5 +----
 15 files changed, 1 insertion(+), 48 deletions(-)

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
index 3516b16cd33d..03f5cb829957 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -281,7 +281,6 @@ void drm_minor_release(struct drm_minor *minor)
  *		struct driver_device *priv = container_of(...);
  *
  *		drm_mode_config_cleanup(drm);
- *		drm_dev_fini(drm);
  *	}
  *
  *	static struct drm_driver driver_drm_driver = {
@@ -736,23 +735,6 @@ int devm_drm_dev_init(struct device *parent,
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
@@ -803,8 +785,6 @@ static void drm_dev_release(struct kref *ref)
 
 	if (dev->driver->release)
 		dev->driver->release(dev);
-	else
-		drm_dev_fini(dev);
 
 	drm_managed_release(dev);
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 98d0af8376fd..44de8502a472 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -592,7 +592,6 @@ void mipi_dbi_release(struct drm_device *drm)
 	DRM_DEBUG_DRIVER("\n");
 
 	drm_mode_config_cleanup(drm);
-	drm_dev_fini(drm);
 }
 EXPORT_SYMBOL(mipi_dbi_release);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 481313536b5a..a7a3b4b98572 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -906,13 +906,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
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
@@ -1015,7 +1008,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_disable_device(pdev);
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
-	i915_driver_destroy(i915);
 	drm_dev_put(&i915->drm);
 	return ret;
 }
@@ -1072,7 +1064,6 @@ static void i915_driver_release(struct drm_device *dev)
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
index fa643202e893..5a05c2010873 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
