Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E69998FFE4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52F10E9C8;
	Fri,  4 Oct 2024 09:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLRDiEaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA98C10E9CF;
 Fri,  4 Oct 2024 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034879; x=1759570879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSV6SFm0w3w9EfW6AtheB9fonChTpsMqSs+jbqN/wG0=;
 b=HLRDiEaBCpdyqy0BtUNPmoi0G3uZjptiBoNK4fL0wVpU9J5v6ABDSdej
 Frda7c+GVz8MmV8g3Z42DE3tgRBwNrHkNCSAgPjNkuRWVHXbPU6CaqD4K
 Dct0cu8JeLPIs6s7gHBqQool4cUWsNG3EjVKGvDRZf5Lf2o1peUUgVyMN
 iTBXOYGzbhpnokvI4IG/PfWGrDrblwoDqAADxcHSl8b+KchsSs5lZBcmQ
 5D1aZ4R7E9d3Xtzisq3nws8ncHn6L74E2GLdbftwoT0hFm9wALv5Pqt4m
 YKekTf6OfO1B+u9Q3HSwF7EEN1URccUgbLrvw2dmPo8p/7kyEqnzE4Q3F w==;
X-CSE-ConnectionGUID: qAS1PGOdRnG/JKHUGP2PrA==
X-CSE-MsgGUID: JvzA0Z0yTFGCdWhxK7GuVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856194"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:19 -0700
X-CSE-ConnectionGUID: MxHwf+16QlyXeifsa0++VQ==
X-CSE-MsgGUID: MVHqVS/eSeqizZg6ugwROQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331926"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 5B325120E8F;
 Fri,  4 Oct 2024 12:41:12 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoC-000TXD-1A;
 Fri, 04 Oct 2024 12:41:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 10/51] drm/nouveau: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:12 +0300
Message-Id: <20241004094112.113521-1-sakari.ailus@linux.intel.com>
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 10 +++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.c |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   |  8 ++++----
 drivers/gpu/drm/nouveau/nouveau_display.c   |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c       | 10 +++++-----
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++++-----
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index eed579a6c858..63710ce16ec2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1205,7 +1205,7 @@ nv50_mstc_detect(struct drm_connector *connector,
 
 	ret = pm_runtime_get_sync(connector->dev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 		return connector_status_disconnected;
 	}
 
@@ -1216,7 +1216,7 @@ nv50_mstc_detect(struct drm_connector *connector,
 
 out:
 	pm_runtime_mark_last_busy(connector->dev->dev);
-	pm_runtime_put_autosuspend(connector->dev->dev);
+	__pm_runtime_put_autosuspend(connector->dev->dev);
 	return ret;
 }
 
@@ -2405,7 +2405,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 	/* Drop the RPM ref we got from nv50_disp_atomic_commit() */
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 }
 
 static void
@@ -2426,7 +2426,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
@@ -2475,7 +2475,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	if (ret)
 		drm_atomic_helper_unprepare_planes(dev, state);
 done:
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8d5c9c74cbb9..cd42a198b658 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -582,7 +582,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	} else {
 		ret = pm_runtime_get_sync(dev->dev);
 		if (ret < 0 && ret != -EACCES) {
-			pm_runtime_put_autosuspend(dev->dev);
+			__pm_runtime_put_autosuspend(dev->dev);
 			nouveau_connector_set_edid(nv_connector, NULL);
 			return conn_status;
 		}
@@ -674,7 +674,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		drm_dp_cec_unset_edid(&nv_connector->aux);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return conn_status;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index e83db051e851..2967772b8623 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -55,7 +55,7 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 
 	ret = pm_runtime_get_sync(drm->dev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(drm->dev->dev);
+		__pm_runtime_put_autosuspend(drm->dev->dev);
 		return ret;
 	}
 
@@ -63,7 +63,7 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 		   nvif_rd32(&drm->client.device.object, 0x101000));
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
-	pm_runtime_put_autosuspend(drm->dev->dev);
+	__pm_runtime_put_autosuspend(drm->dev->dev);
 
 	return 0;
 }
@@ -184,13 +184,13 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 
 	ret = pm_runtime_get_sync(drm->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(drm->dev);
+		__pm_runtime_put_autosuspend(drm->dev);
 		return ret;
 	}
 
 	ret = nvif_mthd(&debugfs->ctrl, NVIF_CONTROL_PSTATE_USER,
 			&args, sizeof(args));
-	pm_runtime_put_autosuspend(drm->dev);
+	__pm_runtime_put_autosuspend(drm->dev);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e2fd561cd23f..8cb906684a78 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -536,7 +536,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
 noop:
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 }
 
 #ifdef CONFIG_ACPI
@@ -557,7 +557,7 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 				 * where we can't wake it up, it can handle
 				 * it's own hotplug events.
 				 */
-				pm_runtime_put_autosuspend(drm->dev->dev);
+				__pm_runtime_put_autosuspend(drm->dev->dev);
 			} else if (ret == 0 || ret == -EINPROGRESS) {
 				/* We've started resuming the GPU already, so
 				 * it will handle scheduling a full reprobe
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 84d692d68817..ecb1fc98f758 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1165,7 +1165,7 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 	/* need to bring up power immediately if opening device */
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
@@ -1197,7 +1197,7 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
@@ -1231,7 +1231,7 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 	nouveau_cli_fini(cli);
 	kfree(cli);
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	drm_dev_exit(dev_index);
 }
 
@@ -1265,7 +1265,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
@@ -1279,7 +1279,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9ae2cee1c7c5..37814e22d91f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -83,7 +83,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 
 	ret = pm_runtime_get_sync(dev);
 	if (WARN_ON(ret < 0 && ret != -EACCES)) {
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 		return;
 	}
 
@@ -93,7 +93,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 	ttm_bo_put(&nvbo->bo);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 }
 
 int
@@ -121,7 +121,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 		goto out;
 	}
 
@@ -131,7 +131,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	else
 		ret = 0;
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 out:
 	ttm_bo_unreserve(&nvbo->bo);
 	return ret;
@@ -211,7 +211,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 				nouveau_gem_object_unmap(nvbo, vma);
 				pm_runtime_mark_last_busy(dev);
 			}
-			pm_runtime_put_autosuspend(dev);
+			__pm_runtime_put_autosuspend(dev);
 		}
 	}
 	ttm_bo_unreserve(&nvbo->bo);
-- 
2.39.5

