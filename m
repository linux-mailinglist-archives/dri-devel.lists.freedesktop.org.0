Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37B14E88B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 06:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E736E940;
	Fri, 31 Jan 2020 05:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADA46E941
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 05:58:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so6527865wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 21:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqIZZmpuF/Iqn88PNa0TK7uvBgm0UXW1Kn70C/na+ZI=;
 b=CC9nVW8OEddk39PZPL/yAkb2KL0r1Jqa0V01vqJAhut3qwuxBiaX0rqF9LCTHVaXT4
 zaDyWM0PDTJHWoM1ry+FAyZ3WBiJKyKyAEeGZ4ltu6L+T8W8tFKoorFszSDXCX3Kzh/4
 A9mCJxvDviiGRTPbOg4wbHLKmzlQQP9Po8su0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqIZZmpuF/Iqn88PNa0TK7uvBgm0UXW1Kn70C/na+ZI=;
 b=hCd8uY8o6augpe26meQN6fYr3vF7eZK6u2012n3WKZASLKuL3bwg2qVe6wAD1i6wmz
 ujbfENoVn9/0Yfh/G4XiI8340AbSujSEjd7WDmoUC+heCpJ8i9epCn1TxMi+tHdkKOW6
 Xm6X/Fn31fwYgxMDcybVqKfAVpjbDi3c9caSVJT92p5fbbnqXu9Y8qS5ETG0mFPMXkwB
 xeyUtwWdLLfV9QPrYdt6T9tfKrHhGSvP4bsrb/pd4bMiB9TjdY/04OfCahDiQhX36Nu4
 WCI2OkcPSkg2X1iJ2IejLnVP7M9MUXhEE2Uc7N78wybqqI0V118DCoUXMfNn1IT7YnS9
 /c3A==
X-Gm-Message-State: APjAAAUs4VwtdrdTB2eER7gSZLAYYgTDNbGGY/3zUndPmw3nfQlizMr+
 hsKhoZ3DzDlhwS435rEem4WwGOsfjhPO8w==
X-Google-Smtp-Source: APXvYqw+d+irR/SKJ5qY5toATzXjOM8cJtDKrUEOCW7FRulDTWEHJNnljoh2eWswFsGsXyRsZlO9Hg==
X-Received: by 2002:a1c:a5c5:: with SMTP id o188mr10262046wme.73.1580450291233; 
 Thu, 30 Jan 2020 21:58:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v8sm10527318wrw.2.2020.01.30.21.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 21:58:10 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Nerf drm_global_mutex BKL for good drivers
Date: Fri, 31 Jan 2020 06:58:03 +0100
Message-Id: <20200131055804.1820865-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129082410.1691996-6-daniel.vetter@ffwll.ch>
References: <20200129082410.1691996-6-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This catches the majority of drivers (unfortunately not if we take
users into account, because all the big drivers have at least a
lastclose hook).

With the prep patches out of the way all drm state is fully protected
and either prevents or can deal with the races from dropping the BKL
around open/close. The only thing left to audit are the various driver
hooks - by keeping the BKL around if any of them are set we have a
very simple cop-out!

Note that one of the biggest prep pieces to get here was making
dev->open_count atomic, which was done in

commit 7e13ad896484a0165a68197a2e64091ea28c9602
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Jan 24 13:01:07 2020 +0000

    drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count

v2:
- Rebase and fix locking in drm_open() (Chris)
- Indentation fix in drm_release
- Typo fix in the commit message (Sam)

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c      |  6 +++--
 drivers/gpu/drm/drm_file.c     | 48 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/drm_internal.h |  1 +
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 05bdf0b9d2b3..9fcd6ab3c154 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -946,7 +946,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	struct drm_driver *driver = dev->driver;
 	int ret;
 
-	mutex_lock(&drm_global_mutex);
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_lock(&drm_global_mutex);
 
 	if (dev->driver->load) {
 		if (!drm_core_check_feature(dev, DRIVER_LEGACY))
@@ -992,7 +993,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
 out_unlock:
-	mutex_unlock(&drm_global_mutex);
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_unlock(&drm_global_mutex);
 	return ret;
 }
 EXPORT_SYMBOL(drm_dev_register);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 80d556402ab4..c4c704e01961 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -51,6 +51,37 @@
 /* from BKL pushdown */
 DEFINE_MUTEX(drm_global_mutex);
 
+bool drm_dev_needs_global_mutex(struct drm_device *dev)
+{
+	/*
+	 * Legacy drivers rely on all kinds of BKL locking semantics, don't
+	 * bother. They also still need BKL locking for their ioctls, so better
+	 * safe than sorry.
+	 */
+	if (drm_core_check_feature(dev, DRIVER_LEGACY))
+		return true;
+
+	/*
+	 * The deprecated ->load callback must be called after the driver is
+	 * already registered. This means such drivers rely on the BKL to make
+	 * sure an open can't proceed until the driver is actually fully set up.
+	 * Similar hilarity holds for the unload callback.
+	 */
+	if (dev->driver->load || dev->driver->unload)
+		return true;
+
+	/*
+	 * Drivers with the lastclose callback assume that it's synchronized
+	 * against concurrent opens, which again needs the BKL. The proper fix
+	 * is to use the drm_client infrastructure with proper locking for each
+	 * client.
+	 */
+	if (dev->driver->lastclose)
+		return true;
+
+	return false;
+}
+
 /**
  * DOC: file operations
  *
@@ -378,9 +409,10 @@ int drm_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
-	mutex_lock(&drm_global_mutex);
-
 	dev = minor->dev;
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_lock(&drm_global_mutex);
+
 	if (!atomic_fetch_inc(&dev->open_count))
 		need_setup = 1;
 
@@ -398,13 +430,15 @@ int drm_open(struct inode *inode, struct file *filp)
 		}
 	}
 
-	mutex_unlock(&drm_global_mutex);
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_unlock(&drm_global_mutex);
 
 	return 0;
 
 err_undo:
 	atomic_dec(&dev->open_count);
-	mutex_unlock(&drm_global_mutex);
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_unlock(&drm_global_mutex);
 	drm_minor_release(minor);
 	return retcode;
 }
@@ -444,7 +478,8 @@ int drm_release(struct inode *inode, struct file *filp)
 	struct drm_minor *minor = file_priv->minor;
 	struct drm_device *dev = minor->dev;
 
-	mutex_lock(&drm_global_mutex);
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_lock(&drm_global_mutex);
 
 	DRM_DEBUG("open_count = %d\n", atomic_read(&dev->open_count));
 
@@ -453,7 +488,8 @@ int drm_release(struct inode *inode, struct file *filp)
 	if (atomic_dec_and_test(&dev->open_count))
 		drm_lastclose(dev);
 
-	mutex_unlock(&drm_global_mutex);
+	if (drm_dev_needs_global_mutex(dev))
+		mutex_unlock(&drm_global_mutex);
 
 	drm_minor_release(minor);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 6937bf923f05..aeec2e68d772 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -41,6 +41,7 @@ struct drm_printer;
 
 /* drm_file.c */
 extern struct mutex drm_global_mutex;
+bool drm_dev_needs_global_mutex(struct drm_device *dev);
 struct drm_file *drm_file_alloc(struct drm_minor *minor);
 void drm_file_free(struct drm_file *file);
 void drm_lastclose(struct drm_device *dev);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
