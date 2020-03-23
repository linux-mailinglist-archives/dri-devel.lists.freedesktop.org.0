Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F518F76A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC726E1F4;
	Mon, 23 Mar 2020 14:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2AC6E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m3so15133273wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/A3bDhMZWe0RB+Qujr9Czl4Smei4SWmu0ntC5QbVKg=;
 b=Cd7lnRjhpKPKjVkT30FFaZzQzg3pssfFOvNsE3s6H9BfEXE4LZXkghlbmdQBe62HEp
 OGMIcxXArfN1xr8wu8G5UxQhN7eTZCzLpt0XWy4OniiZ0zfE9gIPOk0bd80We89ABd+u
 U3MZDR7YPTxeeYgpcj7PNx5kWLA5xUBInK+zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/A3bDhMZWe0RB+Qujr9Czl4Smei4SWmu0ntC5QbVKg=;
 b=tn5MAfznzpXtV1Tq4NMVEpmj5QI1wSDWLxCA6W/UDNSBHfhOjOSmuIh4h9gcVqlvOa
 fk21MSxDakliOoPS9KyM+2dwkv7PI6BJbOF63IVsNtitzbcJr/guGT+Znu15j6C3zwiG
 Lohi/njYs1WQ/XkvPLO9lJitBq/DZaTtK8dDYQO89Cl8aCoFelasbfkfH/g38Ziccx1o
 ucNq7apfGClck+qj+LztqyNJlxOhgH0cwHsz8UEGWp3ppNsx26pFObkd1pQQUJTplxYW
 kXwly7BW6QG4V5oN4uG6AvvZ9JbcATYfUK8cXGNoSw/xWeWIAMvIp5ywrI5VmbYCRpk1
 ds/A==
X-Gm-Message-State: ANhLgQ1J/PZuj4XFutv6cydatXVMvn88Z/fxgpkZIpvB+NykPlbcDAjb
 ZhsBJ/EZsp91ZOBzcNWwbVvrZNir2GYwbw==
X-Google-Smtp-Source: ADFU+vv1uRu1m75mYRZZAZst5kvf2kEh1bIi+Hd3RgUJsxcNh5g32yS5Nkd9cjXg36xqj5KV6ges+A==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr3812173wmg.122.1584975027145; 
 Mon, 23 Mar 2020 07:50:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/51] drm: manage drm_minor cleanup with drmm_
Date: Mon, 23 Mar 2020 15:49:21 +0100
Message-Id: <20200323144950.3018436-23-daniel.vetter@ffwll.ch>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cleanup here is somewhat tricky, since we can't tell apart the
allocated minor index from 0. So register a cleanup action first, and
if the index allocation fails, unregister that cleanup action again to
avoid bad mistakes.

The kdev for the minor already handles NULL, so no problem there.

Hence add drmm_remove_action() to the drm_managed library.

v2: Make pointer math around void ** consistent with what Laurent
suggested.

v3: Use drmm_add_action_or_reset and remove drmm_remove_action. Noticed
because of some questions from Thomas. This also means we need to move
the drmm_add_action_or_reset helper earlier in the series.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c     | 70 ++++++++++++-----------------------
 drivers/gpu/drm/drm_managed.c | 14 +++++++
 include/drm/drm_managed.h     |  9 ++++-
 3 files changed, 46 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index a710c53d13a8..25fc2107057c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -93,13 +93,25 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 	}
 }
 
+static void drm_minor_alloc_release(struct drm_device *dev, void *data)
+{
+	struct drm_minor *minor = data;
+	unsigned long flags;
+
+	put_device(minor->kdev);
+
+	spin_lock_irqsave(&drm_minor_lock, flags);
+	idr_remove(&drm_minors_idr, minor->index);
+	spin_unlock_irqrestore(&drm_minor_lock, flags);
+}
+
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
 	int r;
 
-	minor = kzalloc(sizeof(*minor), GFP_KERNEL);
+	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
 		return -ENOMEM;
 
@@ -117,46 +129,19 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	idr_preload_end();
 
 	if (r < 0)
-		goto err_free;
+		return r;
 
-	minor->index = r;
+	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
+	if (r)
+		return r;
 
+	minor->index = r;
 	minor->kdev = drm_sysfs_minor_alloc(minor);
-	if (IS_ERR(minor->kdev)) {
-		r = PTR_ERR(minor->kdev);
-		goto err_index;
-	}
+	if (IS_ERR(minor->kdev))
+		return PTR_ERR(minor->kdev);
 
 	*drm_minor_get_slot(dev, type) = minor;
 	return 0;
-
-err_index:
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
-err_free:
-	kfree(minor);
-	return r;
-}
-
-static void drm_minor_free(struct drm_device *dev, unsigned int type)
-{
-	struct drm_minor **slot, *minor;
-	unsigned long flags;
-
-	slot = drm_minor_get_slot(dev, type);
-	minor = *slot;
-	if (!minor)
-		return;
-
-	put_device(minor->kdev);
-
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
-
-	kfree(minor);
-	*slot = NULL;
 }
 
 static int drm_minor_register(struct drm_device *dev, unsigned int type)
@@ -678,16 +663,16 @@ int drm_dev_init(struct drm_device *dev,
 	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
 		ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
 		if (ret)
-			goto err_minors;
+			goto err;
 	}
 
 	ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
 	if (ret)
-		goto err_minors;
+		goto err;
 
 	ret = drm_legacy_create_map_hash(dev);
 	if (ret)
-		goto err_minors;
+		goto err;
 
 	drm_legacy_ctxbitmap_init(dev);
 
@@ -695,7 +680,7 @@ int drm_dev_init(struct drm_device *dev,
 		ret = drm_gem_init(dev);
 		if (ret) {
 			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
-			goto err_ctxbitmap;
+			goto err;
 		}
 	}
 
@@ -708,10 +693,6 @@ int drm_dev_init(struct drm_device *dev,
 err_setunique:
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_destroy(dev);
-err_ctxbitmap:
-err_minors:
-	drm_minor_free(dev, DRM_MINOR_PRIMARY);
-	drm_minor_free(dev, DRM_MINOR_RENDER);
 err:
 	drm_managed_release(dev);
 
@@ -776,9 +757,6 @@ void drm_dev_fini(struct drm_device *dev)
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_destroy(dev);
-
-	drm_minor_free(dev, DRM_MINOR_PRIMARY);
-	drm_minor_free(dev, DRM_MINOR_RENDER);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index c633c2ef5269..8abf3a53aeb5 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -149,6 +149,20 @@ int __drmm_add_action(struct drm_device *dev,
 }
 EXPORT_SYMBOL(__drmm_add_action);
 
+int __drmm_add_action_or_reset(struct drm_device *dev,
+			       drmres_release_t action,
+			       void *data, const char *name)
+{
+	int ret;
+
+	ret = __drmm_add_action(dev, action, data, name);
+	if (ret)
+		action(dev, data);
+
+	return ret;
+}
+EXPORT_SYMBOL(__drmm_add_action_or_reset);
+
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 {
 	struct drmres *dr;
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 89e6fce9f689..2d1e29a2200c 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -17,7 +17,14 @@ int __must_check __drmm_add_action(struct drm_device *dev,
 				   drmres_release_t action,
 				   void *data, const char *name);
 
-void drmm_add_final_kfree(struct drm_device *dev, void *parent);
+#define drmm_add_action_or_reset(dev, action, data) \
+	__drmm_add_action_or_reset(dev, action, data, #action)
+
+int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
+					    drmres_release_t action,
+					    void *data, const char *name);
+
+void drmm_add_final_kfree(struct drm_device *dev, void *container);
 
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
 static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
