Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98998FFF0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B88110E9C9;
	Fri,  4 Oct 2024 09:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6Kir43M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFC910E9CC;
 Fri,  4 Oct 2024 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034886; x=1759570886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6StNSwM35mQOJbtexHIyrpLz7dSJF2qUthmLq1Chdb8=;
 b=A6Kir43MMDb2Piw8v8siwqvk5bNW8HwB/BahA8AcYwXbOqtNL3Dow9sB
 T/BE91jtxH+qeyZbxrwoLP2NksnnyxQatqIGY5RhW1LFeAllKWUDLjg+2
 ZPabEKwIWtNwugBHc8gyrxrUvNLZ81ivdm1siKBrJDISW3yE6ybnoVVZ6
 adJJ9BsNyN66Fd1M39zuF3beFkKBYca9aLybul3nB4cqrqK3VnQXjN4K9
 fveG2vEkrtmoUnlpx2OxQR9gF8mwCBxY4sMJmXcRgedP/1zLnZbOgzlzo
 f22nk6AAo3L+V6jD0OvL9VbpmjUZFCO6hU8NErv/1Yfxx19n4xNTpUtXO w==;
X-CSE-ConnectionGUID: 4cuYTv+NSwGQPUZ6Pqnouw==
X-CSE-MsgGUID: zNlNgLAPTE6PDf7p8QMicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856232"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:26 -0700
X-CSE-ConnectionGUID: F8yrWQk5SIKhs2vb8g2dhg==
X-CSE-MsgGUID: +ax1NQV+TXqDlTFdovZukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331932"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:24 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 6D8F711F727;
 Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoC-000TXU-1P;
 Fri, 04 Oct 2024 12:41:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/51] drm/radeon: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:12 +0300
Message-Id: <20241004094112.113538-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
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

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpu/drm/radeon/radeon_acpi.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c | 20 ++++++++++----------
 drivers/gpu/drm/radeon/radeon_display.c    |  6 +++---
 drivers/gpu/drm/radeon/radeon_drv.c        |  4 ++--
 drivers/gpu/drm/radeon/radeon_fbdev.c      |  4 ++--
 drivers/gpu/drm/radeon/radeon_kms.c        | 10 +++++-----
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 22ce61bdfc06..92721df2e43c 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -409,7 +409,7 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 			/* Just fire off a uevent and let userspace tell us what to do */
 			drm_helper_hpd_irq_event(rdev_to_drm(rdev));
 			pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
-			pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
+			__pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 		}
 	}
 	/* TODO: check other events */
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 528a8f3677c2..d6c58af369e5 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -848,7 +848,7 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -877,7 +877,7 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -996,7 +996,7 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1068,7 +1068,7 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -1138,7 +1138,7 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1156,7 +1156,7 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -1224,7 +1224,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1414,7 +1414,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 exit:
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -1643,7 +1643,7 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1726,7 +1726,7 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8f5f8abcb1b4..3fe641bad5bc 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -634,7 +634,7 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
@@ -656,12 +656,12 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 	/* if we have no active crtcs, then drop the power ref
 	   we got before */
 	if (!active && rdev->have_disp_power_ref) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		rdev->have_disp_power_ref = false;
 	}
 
 	/* drop the power reference we got coming in here */
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 900b05d8aa5c..ad4431a60508 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -494,14 +494,14 @@ long radeon_drm_ioctl(struct file *filp,
 	dev = file_priv->minor->dev;
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
 	ret = drm_ioctl(filp, cmd, arg);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 0aa20c8df546..a302cd3dc8a3 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -156,7 +156,7 @@ static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 
 err_pm_runtime_mark_last_busy:
 	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
-	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
+	__pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 	return ret;
 }
 
@@ -166,7 +166,7 @@ static int radeon_fbdev_fb_release(struct fb_info *info, int user)
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 
 	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
-	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
+	__pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 645e33bf7947..265912c96232 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -171,7 +171,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 		pm_runtime_set_active(dev->dev);
 		pm_runtime_allow(dev->dev);
 		pm_runtime_mark_last_busy(dev->dev);
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 	}
 
 out:
@@ -635,7 +635,7 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return r;
 	}
 
@@ -678,7 +678,7 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return 0;
 
 err_vm_fini:
@@ -688,7 +688,7 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 err_suspend:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return r;
 }
 
@@ -738,7 +738,7 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
 		file_priv->driver_priv = NULL;
 	}
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 }
 
 /*
-- 
2.39.5

