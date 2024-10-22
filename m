Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0429ABA0E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 01:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1710E703;
	Tue, 22 Oct 2024 23:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="U+FJoJOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2726610E331
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=a+8B/W4nG6OVt83hHSuwJrLKhvYzazktOCgXNngg1nM=; b=U+FJoJOHQBa9nRMK
 DzALhTBUhFAFmpvg8P8B236pJJ8rU3jux/O+0G33KHQFZJbnhlPOC1SJATJt6+95U6QVKUJwfGSKo
 nxh0QS4W7C/ize28lIduJPBFLybQV9er78QYrVvkUEShf3ycFd9Wl5/UOw0+RgkRlUCfTHgpKct+C
 oUWHAjxIN45F8h+c8B+bUPNqzEMj23r9NVP3hhGchh/9IURou9DXbVdRA9jGDAcecbjijNsXO0F/w
 2/kM4PW8W3+NhPz/1UJ8T44CIFZaQpJoPhNEvWR54eHwc7QZSVCvz7SupukWTOk1SMFx6U/2ogLn3
 92dDz5R6A4FYt+qOuw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t3OJm-00CtGr-2D;
 Tue, 22 Oct 2024 23:29:38 +0000
From: linux@treblig.org
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/5] drm/sysfs: Remove unused drm_class_device_(un)register
Date: Wed, 23 Oct 2024 00:29:31 +0100
Message-ID: <20241022232934.238124-3-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022232934.238124-1-linux@treblig.org>
References: <20241022232934.238124-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

drm_class_device_register() and drm_class_device_unregister() have been
unused since
commit ed89fff97382 ("drm/ttm: drop sysfs directory")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/drm_sysfs.c | 32 --------------------------------
 include/drm/drm_sysfs.h     |  4 ----
 2 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6adcd1..3bc90fe5cea3 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -548,35 +548,3 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 	put_device(kdev);
 	return ERR_PTR(r);
 }
-
-/**
- * drm_class_device_register - register new device with the DRM sysfs class
- * @dev: device to register
- *
- * Registers a new &struct device within the DRM sysfs class. Essentially only
- * used by ttm to have a place for its global settings. Drivers should never use
- * this.
- */
-int drm_class_device_register(struct device *dev)
-{
-	if (!drm_class || IS_ERR(drm_class))
-		return -ENOENT;
-
-	dev->class = drm_class;
-	return device_register(dev);
-}
-EXPORT_SYMBOL_GPL(drm_class_device_register);
-
-/**
- * drm_class_device_unregister - unregister device with the DRM sysfs class
- * @dev: device to unregister
- *
- * Unregisters a &struct device from the DRM sysfs class. Essentially only used
- * by ttm to have a place for its global settings. Drivers should never use
- * this.
- */
-void drm_class_device_unregister(struct device *dev)
-{
-	return device_unregister(dev);
-}
-EXPORT_SYMBOL_GPL(drm_class_device_unregister);
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index 96a5d858404b..7695873a9456 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -3,13 +3,9 @@
 #define _DRM_SYSFS_H_
 
 struct drm_device;
-struct device;
 struct drm_connector;
 struct drm_property;
 
-int drm_class_device_register(struct device *dev);
-void drm_class_device_unregister(struct device *dev);
-
 void drm_sysfs_hotplug_event(struct drm_device *dev);
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
 void drm_sysfs_connector_property_event(struct drm_connector *connector,
-- 
2.47.0

