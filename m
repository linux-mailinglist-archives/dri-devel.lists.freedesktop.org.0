Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCDAF8A16
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A610E96A;
	Fri,  4 Jul 2025 07:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJ4E0OOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE0E10E96A;
 Fri,  4 Jul 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615656; x=1783151656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KVlSDc0mZPkCLINDGK1BM9jwOUm48xtGzbIHTXiVMqM=;
 b=BJ4E0OOUoVjzJkZq2dipMReFVAsuj3c9zStNayPn+QcX9qr57CAkvXym
 NBl0F5bbJZRgjmAbbnuZQF2VOj4Tj8D+oKyyJPit2EdjOfRB1suAg9r7b
 9b6/GWIDEVyUzeZB4vWfOHY0H3Fx83d2kV+j4yFVBNR2oo8X71o1MsqzE
 XID9u5cTSZBZyjyaqMa7Huo0KYMMadUUSl6bKT0uXChaIBBH+CLmZx/WY
 DH1RIFXw4FzpMorOhOQc22KKPwPdBrlenPgPYnEtfXuXhjSRmjKT/vHjt
 V6RBmrMq+Po9LdqWg0AKkHO69zvMEaX0cneFfMeOSYe6BGGQT7fEliY1G g==;
X-CSE-ConnectionGUID: 9+YL3adWTx+q4xIeso1fzw==
X-CSE-MsgGUID: 91FkYTilTyCnEgmpGmWl9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494548"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:15 -0700
X-CSE-ConnectionGUID: 9R57z0ToQ9etEVLaTP/fQw==
X-CSE-MsgGUID: hbP5tAbuSxCIwTiN0b6otg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924210"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:13 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id 3E67544843;
 Fri,  4 Jul 2025 10:54:11 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 18/80] drm/radeon: Remove redundant
 pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:11 +0300
Message-Id: <20250704075411.3218009-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpu/drm/radeon/radeon_acpi.c       | 1 -
 drivers/gpu/drm/radeon/radeon_connectors.c | 5 -----
 drivers/gpu/drm/radeon/radeon_display.c    | 2 --
 drivers/gpu/drm/radeon/radeon_drv.c        | 2 --
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 2 --
 drivers/gpu/drm/radeon/radeon_kms.c        | 4 ----
 6 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 22ce61bdfc06..08f8ba4fd148 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -408,7 +408,6 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 			pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
 			/* Just fire off a uevent and let userspace tell us what to do */
 			drm_helper_hpd_irq_event(rdev_to_drm(rdev));
-			pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
 			pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 		}
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 9f6a3df951ba..7a4f05dbd6f7 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -876,7 +876,6 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 	radeon_connector_update_scratch_regs(connector, ret);
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -1067,7 +1066,6 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -1155,7 +1153,6 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 	radeon_connector_update_scratch_regs(connector, ret);
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -1403,7 +1400,6 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 
 exit:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -1715,7 +1711,6 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8f5f8abcb1b4..89c3f83561d6 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -644,8 +644,6 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 		if (crtc->enabled)
 			active = true;
 
-	pm_runtime_mark_last_busy(dev->dev);
-
 	rdev = dev->dev_private;
 	/* if we have active crtcs and we don't have a power ref,
 	   take the current one */
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 88e821d67af7..d0af0cef178a 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -477,7 +477,6 @@ static int radeon_pmops_runtime_idle(struct device *dev)
 		}
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	/* we don't want the main rpm_idle to call suspend - we want to autosuspend */
 	return 1;
@@ -499,7 +498,6 @@ long radeon_drm_ioctl(struct file *filp,
 
 	ret = drm_ioctl(filp, cmd, arg);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index d4a58bd679db..419fcad8d283 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -155,7 +155,6 @@ static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 	return 0;
 
 err_pm_runtime_mark_last_busy:
-	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
 	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 	return ret;
 }
@@ -165,7 +164,6 @@ static int radeon_fbdev_fb_release(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 
-	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
 	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 645e33bf7947..3144890b6007 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -170,7 +170,6 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
 		pm_runtime_set_active(dev->dev);
 		pm_runtime_allow(dev->dev);
-		pm_runtime_mark_last_busy(dev->dev);
 		pm_runtime_put_autosuspend(dev->dev);
 	}
 
@@ -677,7 +676,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 		file_priv->driver_priv = fpriv;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return 0;
 
@@ -687,7 +685,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	kfree(fpriv);
 
 err_suspend:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return r;
 }
@@ -737,7 +734,6 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
 		kfree(fpriv);
 		file_priv->driver_priv = NULL;
 	}
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
-- 
2.39.5

