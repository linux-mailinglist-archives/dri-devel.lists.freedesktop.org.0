Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E017268C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3CF6ED0C;
	Thu, 27 Feb 2020 18:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155389FD4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t23so443333wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYbI5s7BD65+/qiA883iKF5X4qLtF1ODXg7rStPNbX8=;
 b=AMaIzY0jU89ZutwbSk9hl+L6Vn7TBAPEvzvAlN69KQ5VYCvKxYadU2VN3nXK+T1hBh
 YIiz6fxIPYF7oTGW77w4LH+dVl5l5YqoCkpit7M6CfsIFuvyImOH7xnwY3PpOSSGmHK0
 wn+6y4fbmOq749uz9xsiCUqjMbSDw2rd+aw9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EYbI5s7BD65+/qiA883iKF5X4qLtF1ODXg7rStPNbX8=;
 b=j3UE/4Llapw5GHZFwkstYdWduAz9CMMKBldFwPDCSdfN7G13HanR8Bke0gINFshIuU
 SLS2Nevn/YBUPHA1BN8/Xk4NhcFHcFvPRsa2ei4LTapUBnQ/rEkX1LOdjnUNjate/4ZT
 vBeSvFIcwxNUvzyhxqCVLbOU051zsqU6N7MqBLewAAGFOpiYl/je7bvY0On8CaUrL8R5
 UJpuRvFFe/9Wjb0nUOeNLY9n2x5BI590qoMNqF7oYYDCdZBUiwVSyRyI5uNiODuptxKd
 Mw3lA0lXonsxOXypHoIsB45fCPHraSt6O+EvY9Jh+tp5BsSeUr6U9UE3VvuhfIYLb8It
 T9Xw==
X-Gm-Message-State: APjAAAXHGMA8CuyQXWzvVG/EOpVqpt1xFHwo4OxxMTiNUqjNC/yHGbDa
 W1qQPhHp4Qr3uTzzBcI2e+Flm5QEAU0=
X-Google-Smtp-Source: APXvYqy+1wpskKe2IP6Aq7sCootfxdZLZgerLR26gCiuJF4MsgV8aPooQs57MYSvbgjd8k7gcDI6wQ==
X-Received: by 2002:a1c:41c3:: with SMTP id o186mr28988wma.27.1582827357456;
 Thu, 27 Feb 2020 10:15:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:56 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/51] drm: manage drm_minor cleanup with drmm_
Date: Thu, 27 Feb 2020 19:14:53 +0100
Message-Id: <20200227181522.2711142-23-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c     | 74 +++++++++++++----------------------
 drivers/gpu/drm/drm_managed.c | 28 +++++++++++++
 include/drm/drm_managed.h     |  4 ++
 3 files changed, 59 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 1f7ab88d9435..03a1fb377830 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -93,19 +93,35 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
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
 
 	minor->type = type;
 	minor->dev = dev;
 
+	r = drmm_add_action(dev, drm_minor_alloc_release, minor);
+	if (r)
+		return r;
+
 	idr_preload(GFP_KERNEL);
 	spin_lock_irqsave(&drm_minor_lock, flags);
 	r = idr_alloc(&drm_minors_idr,
@@ -116,47 +132,18 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	spin_unlock_irqrestore(&drm_minor_lock, flags);
 	idr_preload_end();
 
-	if (r < 0)
-		goto err_free;
+	if (r < 0) {
+		drmm_remove_action(dev, drm_minor_alloc_release, minor);
+		return r;
+	}
 
 	minor->index = r;
-
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
@@ -678,16 +665,16 @@ int drm_dev_init(struct drm_device *dev,
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
 
@@ -695,7 +682,7 @@ int drm_dev_init(struct drm_device *dev,
 		ret = drm_gem_init(dev);
 		if (ret) {
 			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
-			goto err_ctxbitmap;
+			goto err;
 		}
 	}
 
@@ -708,10 +695,6 @@ int drm_dev_init(struct drm_device *dev,
 err_setunique:
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_destroy(dev);
-err_ctxbitmap:
-err_minors:
-	drm_minor_free(dev, DRM_MINOR_PRIMARY);
-	drm_minor_free(dev, DRM_MINOR_RENDER);
 err:
 	drm_managed_release(dev);
 
@@ -776,9 +759,6 @@ void drm_dev_fini(struct drm_device *dev)
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_destroy(dev);
-
-	drm_minor_free(dev, DRM_MINOR_PRIMARY);
-	drm_minor_free(dev, DRM_MINOR_RENDER);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index cc917187a723..626656369f0b 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -134,6 +134,34 @@ int __drmm_add_action(struct drm_device *dev,
 }
 EXPORT_SYMBOL(__drmm_add_action);
 
+void drmm_remove_action(struct drm_device *dev,
+			drmres_release_t action,
+			void *data)
+{
+	struct drmres *dr = NULL, *tmp;
+	unsigned long flags;
+
+	if (!data)
+		return;
+
+	spin_lock_irqsave(&dev->managed.lock, flags);
+	list_for_each_entry(tmp, &dev->managed.resources, node.entry) {
+		if (tmp->node.release == action &&
+		    *(void **)&tmp->data == data) {
+			dr = tmp;
+			del_dr(dev, dr);
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&dev->managed.lock, flags);
+
+	if (WARN_ON(!dr))
+		return;
+
+	kfree(dr);
+}
+EXPORT_SYMBOL(drmm_remove_action);
+
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 {
 	struct drmres *dr;
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 89e6fce9f689..5280209dff92 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -17,6 +17,10 @@ int __must_check __drmm_add_action(struct drm_device *dev,
 				   drmres_release_t action,
 				   void *data, const char *name);
 
+void drmm_remove_action(struct drm_device *dev,
+			drmres_release_t action,
+			void *data);
+
 void drmm_add_final_kfree(struct drm_device *dev, void *parent);
 
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
