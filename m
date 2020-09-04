Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658D25DBFC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54E96EC0E;
	Fri,  4 Sep 2020 14:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC586EC10
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o5so6945945wrn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jq4FIsgEAf6IwkEvdHV5v/jDS3GimfPLgekkyZXMfmE=;
 b=ITO0GxeAA/jmyTEV255Xyy07aLjSMMvvpsDe38H3qwkalCPUpfsxdp2XFxftwlQIAC
 hsawOKEi/bCGrPDyLEBETh6bvsk2CBbHLkbnKKzZ9BfoDZ/lsVQrFp07oiymSY9NSSsI
 WJyNNgVqaHe0vCtE8754nUlDp9/AcKWbsZPew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jq4FIsgEAf6IwkEvdHV5v/jDS3GimfPLgekkyZXMfmE=;
 b=XdmBdNJRje32b2VVbx3ixw4ub8tltfMj7zzNPQCIGJiZFf6S0cMkJcPTVqsateP33X
 EnKc97B7B8JfiEs6lV6PdMeNTc9v/+HGpc1MTf6QpFwxPq0sK1/tcw0kCnXsT+4sg8EN
 HkatVgfWvcoJgygQlrW/12xGMbZNmf8g+95dM8AEGS8n6lm52dQ5QnXgkjjiLt2q39Cn
 ilQvcCVJXtDRic8PCXixquTpjTgyjoQ93G/OLrzP9gN7T7zEJJZCm8sLcwkOkETeD5Zj
 kxS7ZoOhZCXGzxyKgEPujzONuYDQrRdrym/yRhPb8Mg+DK8zxA8pFYnwjDt3FpYAmp/e
 2nIQ==
X-Gm-Message-State: AOAM530NC6xiAN5Y23uHHZYyL1uWNhUcoEL3KJQaQCFgNeGrQzGkK2R4
 yVTt+1AQp2p0kXqhTn7ALlCOF+iBBK/9+3FY
X-Google-Smtp-Source: ABdhPJwIZtjL1iqDhCuC+6N2vsnGgZnviZUtM5oTDq5D0F81ehIXsg+/+YMzIjANWi+x1AfjOf2S1g==
X-Received: by 2002:adf:9cc6:: with SMTP id h6mr7817720wre.405.1599230400525; 
 Fri, 04 Sep 2020 07:40:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/24] drm/dev: Remove drm_dev_init
Date: Fri,  4 Sep 2020 16:39:26 +0200
Message-Id: <20200904143941.110665-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can now also delete drm_dev_init, now that vkms, vgem and i915
selftests are resolved.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_drv.c      | 41 +++-------------------------------
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_managed.c  | 13 -----------
 include/drm/drm_drv.h          |  4 ----
 4 files changed, 4 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7c1689842ec0..457ac0f82be2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -573,43 +573,9 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	drm_legacy_destroy_members(dev);
 }
 
-/**
- * drm_dev_init - Initialise new DRM device
- * @dev: DRM device
- * @driver: DRM driver
- * @parent: Parent device object
- *
- * Initialize a new DRM device. No device registration is done.
- * Call drm_dev_register() to advertice the device to user space and register it
- * with other core subsystems. This should be done last in the device
- * initialization sequence to make sure userspace can't access an inconsistent
- * state.
- *
- * The initial ref-count of the object is 1. Use drm_dev_get() and
- * drm_dev_put() to take and drop further ref-counts.
- *
- * It is recommended that drivers embed &struct drm_device into their own device
- * structure.
- *
- * Drivers that do not want to allocate their own device struct
- * embedding &struct drm_device can call drm_dev_alloc() instead. For drivers
- * that do embed &struct drm_device it must be placed first in the overall
- * structure, and the overall structure must be allocated using kmalloc(): The
- * drm core's release function unconditionally calls kfree() on the @dev pointer
- * when the final reference is released. To override this behaviour, and so
- * allow embedding of the drm_device inside the driver's device struct at an
- * arbitrary offset, you must supply a &drm_driver.release callback and control
- * the finalization explicitly.
- *
- * Note that drivers must call drmm_add_final_kfree() after this function has
- * completed successfully.
- *
- * RETURNS:
- * 0 on success, or error code on failure.
- */
-int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
-		 struct device *parent)
+static int drm_dev_init(struct drm_device *dev,
+			struct drm_driver *driver,
+			struct device *parent)
 {
 	int ret;
 
@@ -689,7 +655,6 @@ int drm_dev_init(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_dev_init);
 
 static void devm_drm_dev_init_release(void *data)
 {
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8e01caaf95cc..b65865c630b0 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -95,6 +95,7 @@ void drm_minor_release(struct drm_minor *minor);
 
 /* drm_managed.c */
 void drm_managed_release(struct drm_device *dev);
+void drmm_add_final_kfree(struct drm_device *dev, void *container);
 
 /* drm_vblank.c */
 static inline bool drm_vblank_passed(u64 seq, u64 ref)
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index c36e3d98fd71..37d7db6223be 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -125,18 +125,6 @@ static void add_dr(struct drm_device *dev, struct drmres *dr)
 		       dr, dr->node.name, (unsigned long) dr->node.size);
 }
 
-/**
- * drmm_add_final_kfree - add release action for the final kfree()
- * @dev: DRM device
- * @container: pointer to the kmalloc allocation containing @dev
- *
- * Since the allocation containing the struct &drm_device must be allocated
- * before it can be initialized with drm_dev_init() there's no way to allocate
- * that memory with drmm_kmalloc(). To side-step this chicken-egg problem the
- * pointer for this final kfree() must be specified by calling this function. It
- * will be released in the final drm_dev_put() for @dev, after all other release
- * actions installed through drmm_add_action() have been processed.
- */
 void drmm_add_final_kfree(struct drm_device *dev, void *container)
 {
 	WARN_ON(dev->managed.final_kfree);
@@ -144,7 +132,6 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
 	WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));
 	dev->managed.final_kfree = container;
 }
-EXPORT_SYMBOL(drmm_add_final_kfree);
 
 int __drmm_add_action(struct drm_device *dev,
 		      drmres_release_t action,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 533c6e1a5a95..b8ce9147c9a6 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -591,10 +591,6 @@ struct drm_driver {
 	int dev_priv_size;
 };
 
-int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
-		 struct device *parent);
-
 void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
 			   size_t size, size_t offset);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
