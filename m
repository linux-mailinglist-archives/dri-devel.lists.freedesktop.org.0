Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A998FFE6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A009F10E9C6;
	Fri,  4 Oct 2024 09:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RotWumEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3E310E9C9;
 Fri,  4 Oct 2024 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034879; x=1759570879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=opkEn8fF7zfWp9qZu6xZSkE5K0XQ7Loqw3FtWiM4MKg=;
 b=RotWumEo/njq1RnHbo8V0fV+6QMBo12sYLY3gvnuI0TV07inokYkWHlM
 cFSdockrSsosmtIYAX5qD9/oSzs/bIFgr9WprOR2ZP2phX52Y468/LF5N
 XFXXXZS7xqK1vlzh3lPCtG77kInK+NaDNFtKd+ZRC+lUpWmHJlZmUf3om
 VWirb78hJ+upTKjlLKvbGju2z012TOh0gy3Vby/ivcOtyttQInkaePTR8
 jJRk9UugUelYjFiwNXxA0oX36WtFTNTuUlzG+QTIv/NB4F4eYhf6ZAcCQ
 5Lrjurl0uFun5PWfPoANlQc60fYfJRIe5PYxDJGImDfGHr6tFEk+SKisY Q==;
X-CSE-ConnectionGUID: qlv01cT8S7K6+7HlaeXDTg==
X-CSE-MsgGUID: jSsQnMFjR5uazg8DVrN54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856201"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:19 -0700
X-CSE-ConnectionGUID: TxfR2o+sRXuh0r4F13wasg==
X-CSE-MsgGUID: byQfcOEhRbmbPuMMg3bZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331925"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 4792C120E62;
 Fri,  4 Oct 2024 12:41:12 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoC-000TWw-0t;
 Fri, 04 Oct 2024 12:41:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/51] drm/amd: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:12 +0300
Message-Id: <20241004094112.113504-1-sakari.ailus@linux.intel.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 120 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_securedisplay.c |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 178 +++++++++---------
 14 files changed, 177 insertions(+), 177 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index f85ace0384d2..1027873da5ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -495,7 +495,7 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 				/* Just fire off a uevent and let userspace tell us what to do */
 				drm_helper_hpd_irq_event(adev_to_drm(adev));
 				pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-				pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+				__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			}
 		}
 		/* TODO: check other events */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 344e0a9ee08a..c31969f5c6ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -714,7 +714,7 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -739,7 +739,7 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -865,7 +865,7 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -924,7 +924,7 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -1025,7 +1025,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1151,7 +1151,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 exit:
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	return ret;
@@ -1375,7 +1375,7 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			__pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1451,7 +1451,7 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
 		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		__pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 37d8657f0776..045c7e9a47eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -116,13 +116,13 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -130,7 +130,7 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 		if ((sh_bank != 0xFFFFFFFF && sh_bank >= adev->gfx.config.max_sh_per_se) ||
 		    (se_bank != 0xFFFFFFFF && se_bank >= adev->gfx.config.max_shader_engines)) {
 			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+			__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return -EINVAL;
 		}
@@ -180,7 +180,7 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 		mutex_unlock(&adev->pm.mutex);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -240,13 +240,13 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -256,7 +256,7 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 		if ((rd->id.grbm.sh != 0xFFFFFFFF && rd->id.grbm.sh >= adev->gfx.config.max_sh_per_se) ||
 		    (rd->id.grbm.se != 0xFFFFFFFF && rd->id.grbm.se >= adev->gfx.config.max_shader_engines)) {
 			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+			__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			mutex_unlock(&rd->lock);
 			return -EINVAL;
@@ -311,7 +311,7 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 	mutex_unlock(&rd->lock);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -407,19 +407,19 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, siz
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	data = kcalloc(1024, sizeof(*data), GFP_KERNEL);
 	if (!data) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		amdgpu_virt_disable_access_debugfs(adev);
 		return -ENOMEM;
 	}
@@ -447,7 +447,7 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, siz
 	mutex_unlock(&adev->grbm_idx_mutex);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
 		result = -EINVAL;
@@ -527,13 +527,13 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -558,7 +558,7 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
 }
@@ -587,13 +587,13 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -618,7 +618,7 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
 }
@@ -650,13 +650,13 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -677,7 +677,7 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
 }
@@ -709,13 +709,13 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -737,7 +737,7 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
 }
@@ -769,13 +769,13 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -796,7 +796,7 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
 }
@@ -828,13 +828,13 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -856,7 +856,7 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
 }
@@ -991,20 +991,20 @@ static ssize_t amdgpu_debugfs_sensor_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_dpm_read_sensor(adev, idx, &values[0], &valuesize);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r) {
 		amdgpu_virt_disable_access_debugfs(adev);
@@ -1073,13 +1073,13 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1095,7 +1095,7 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 	mutex_unlock(&adev->grbm_idx_mutex);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
 		amdgpu_virt_disable_access_debugfs(adev);
@@ -1193,7 +1193,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	mutex_unlock(&adev->grbm_idx_mutex);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	while (size) {
 		uint32_t value;
@@ -1215,7 +1215,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	return result;
 
 err:
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	kfree(data);
 	return r;
 }
@@ -1243,7 +1243,7 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_read(struct file *f, char __user
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1267,7 +1267,7 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_read(struct file *f, char __user
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1294,7 +1294,7 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_write(struct file *f, const char
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1316,7 +1316,7 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_write(struct file *f, const char
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1342,7 +1342,7 @@ static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1366,7 +1366,7 @@ static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1393,7 +1393,7 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1415,7 +1415,7 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1441,7 +1441,7 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1461,7 +1461,7 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1478,7 +1478,7 @@ static ssize_t amdgpu_debugfs_gfxoff_status_read(struct file *f, char __user *bu
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1502,7 +1502,7 @@ static ssize_t amdgpu_debugfs_gfxoff_status_read(struct file *f, char __user *bu
 	r = result;
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1665,7 +1665,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return r;
 	}
 
@@ -1702,7 +1702,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	up_write(&adev->reset_domain->sem);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 }
@@ -1715,14 +1715,14 @@ static int amdgpu_debugfs_evict_vram(void *data, u64 *val)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return r;
 	}
 
 	*val = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 }
@@ -1736,14 +1736,14 @@ static int amdgpu_debugfs_evict_gtt(void *data, u64 *val)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return r;
 	}
 
 	*val = amdgpu_ttm_evict_resources(adev, TTM_PL_TT);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 }
@@ -1756,14 +1756,14 @@ static int amdgpu_debugfs_benchmark(void *data, u64 val)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return r;
 	}
 
 	r = amdgpu_benchmark(adev, val);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return r;
 }
@@ -1995,7 +1995,7 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 
 	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
@@ -2015,7 +2015,7 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b119d27271c1..b2bd0cfaacbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -348,7 +348,7 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 		adev->have_disp_power_ref = false;
 out:
 	/* drop the power reference we got coming in here */
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bb06cb20041c..57dce06b246a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2182,7 +2182,7 @@ static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
 		if (p) {
 			pm_runtime_get_sync(&p->dev);
 			pm_runtime_mark_last_busy(&p->dev);
-			pm_runtime_put_autosuspend(&p->dev);
+			__pm_runtime_put_autosuspend(&p->dev);
 			pci_dev_put(p);
 		}
 	}
@@ -2391,7 +2391,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 		pm_runtime_allow(ddev->dev);
 
 		pm_runtime_mark_last_busy(ddev->dev);
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 
 		pci_wake_from_d3(pdev, TRUE);
 
@@ -2810,7 +2810,7 @@ long amdgpu_drm_ioctl(struct file *filp,
 
 	pm_runtime_mark_last_busy(dev->dev);
 out:
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 2f24a6aa13bf..cf555ec0f816 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -307,7 +307,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 		dma_fence_signal(fence);
 		dma_fence_put(fence);
 		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	} while (last_seq != seq);
 
 	return true;
@@ -948,7 +948,7 @@ static int gpu_recover_get(void *data, u64 *val)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return 0;
 	}
 
@@ -958,7 +958,7 @@ static int gpu_recover_get(void *data, u64 *val)
 	*val = atomic_read(&adev->reset_domain->reset_res);
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 2fe75c920a73..278527cdddef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -1495,14 +1495,14 @@ static ssize_t amdgpu_gfx_set_run_cleaner_shader(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	ret = amdgpu_gfx_run_cleaner_shader(adev, value);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 016a6f6c4267..2d0e9bebaafd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1383,7 +1383,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 out_suspend:
 	pm_runtime_mark_last_busy(dev->dev);
 pm_put:
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return r;
 }
@@ -1450,7 +1450,7 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	file_priv->driver_priv = NULL;
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 }
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
index 123bcf5c2bb1..5f85cb9102a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
@@ -60,7 +60,7 @@ static ssize_t amdgpu_rap_debugfs_write(struct file *f, const char __user *buf,
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
@@ -102,7 +102,7 @@ static ssize_t amdgpu_rap_debugfs_write(struct file *f, const char __user *buf,
 
 	amdgpu_gfx_off_ctrl(adev, true);
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return size;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 1d9eda883bb8..00f270a604b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -3511,7 +3511,7 @@ static void amdgpu_ras_counte_dw(struct work_struct *work)
 
 	pm_runtime_mark_last_busy(dev->dev);
 Out:
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 }
 
 static int amdgpu_get_ras_schema(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
index 41ebe690eeff..d461181e10f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -110,7 +110,7 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
@@ -160,7 +160,7 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return size;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d07acf1b2f93..3011fe9927f4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1081,7 +1081,7 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		 */
 		if (pdd->runtime_inuse) {
 			pm_runtime_mark_last_busy(adev_to_drm(pdd->dev->adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(pdd->dev->adev)->dev);
+			__pm_runtime_put_autosuspend(adev_to_drm(pdd->dev->adev)->dev);
 			pdd->runtime_inuse = false;
 		}
 
@@ -1766,7 +1766,7 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_node *dev,
 	if (!pdd->runtime_inuse) {
 		err = pm_runtime_get_sync(adev_to_drm(dev->adev)->dev);
 		if (err < 0) {
-			pm_runtime_put_autosuspend(adev_to_drm(dev->adev)->dev);
+			__pm_runtime_put_autosuspend(adev_to_drm(dev->adev)->dev);
 			return ERR_PTR(err);
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d1ca9e709946..a7be15e8c06e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10102,7 +10102,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	 * displays anymore
 	 */
 	for (i = 0; i < crtc_disable_count; i++)
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 	pm_runtime_mark_last_busy(dev->dev);
 }
 
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index d5d6ab484e5a..dce775edc1cd 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -147,14 +147,14 @@ static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	amdgpu_dpm_get_current_power_state(adev, &pm);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return sysfs_emit(buf, "%s\n",
 			  (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
@@ -187,14 +187,14 @@ static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	amdgpu_dpm_set_power_state(adev, state);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 }
@@ -275,14 +275,14 @@ static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	level = amdgpu_dpm_get_performance_level(adev);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return sysfs_emit(buf, "%s\n",
 			  (level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
@@ -338,14 +338,14 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	mutex_lock(&adev->pm.stable_pstate_ctx_lock);
 	if (amdgpu_dpm_force_performance_level(adev, level)) {
 		pm_runtime_mark_last_busy(ddev->dev);
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		mutex_unlock(&adev->pm.stable_pstate_ctx_lock);
 		return -EINVAL;
 	}
@@ -354,7 +354,7 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
 	mutex_unlock(&adev->pm.stable_pstate_ctx_lock);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 }
@@ -376,7 +376,7 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -384,7 +384,7 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
 		memset(&data, 0, sizeof(data));
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	buf_len = sysfs_emit(buf, "states: %d\n", data.nums);
 	for (i = 0; i < data.nums; i++)
@@ -414,7 +414,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -423,7 +423,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 	ret = amdgpu_dpm_get_pp_num_states(adev, &data);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
 		return ret;
@@ -487,7 +487,7 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -509,13 +509,13 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
 	}
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 
 err_out:
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 	return ret;
 }
 
@@ -546,14 +546,14 @@ static ssize_t amdgpu_get_pp_table(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	size = amdgpu_dpm_get_pp_table(adev, &table);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (size <= 0)
 		return size;
@@ -582,14 +582,14 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_set_pp_table(adev, buf, count);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
 		return ret;
@@ -810,7 +810,7 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -832,13 +832,13 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
 	}
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 
 err_out:
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 	return -EINVAL;
 }
 
@@ -867,7 +867,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -889,7 +889,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
 		size = sysfs_emit(buf, "\n");
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -931,14 +931,14 @@ static ssize_t amdgpu_set_pp_features(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_set_ppfeature_status(adev, featuremask);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
 		return -EINVAL;
@@ -962,7 +962,7 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -971,7 +971,7 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
 		size = sysfs_emit(buf, "\n");
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -1031,7 +1031,7 @@ static ssize_t amdgpu_get_pp_dpm_clock(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -1043,7 +1043,7 @@ static ssize_t amdgpu_get_pp_dpm_clock(struct device *dev,
 		size = sysfs_emit(buf, "\n");
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -1104,14 +1104,14 @@ static ssize_t amdgpu_set_pp_dpm_clock(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_force_clock_level(adev, type, mask);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
 		return -EINVAL;
@@ -1285,14 +1285,14 @@ static ssize_t amdgpu_get_pp_sclk_od(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	value = amdgpu_dpm_get_sclk_od(adev);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return sysfs_emit(buf, "%d\n", value);
 }
@@ -1319,14 +1319,14 @@ static ssize_t amdgpu_set_pp_sclk_od(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	amdgpu_dpm_set_sclk_od(adev, (uint32_t)value);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 }
@@ -1347,14 +1347,14 @@ static ssize_t amdgpu_get_pp_mclk_od(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	value = amdgpu_dpm_get_mclk_od(adev);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return sysfs_emit(buf, "%d\n", value);
 }
@@ -1381,14 +1381,14 @@ static ssize_t amdgpu_set_pp_mclk_od(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	amdgpu_dpm_set_mclk_od(adev, (uint32_t)value);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 }
@@ -1429,7 +1429,7 @@ static ssize_t amdgpu_get_pp_power_profile_mode(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -1438,7 +1438,7 @@ static ssize_t amdgpu_get_pp_power_profile_mode(struct device *dev,
 		size = sysfs_emit(buf, "\n");
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -1494,14 +1494,14 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_set_power_profile_mode(adev, parameter, parameter_size);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (!ret)
 		return count;
@@ -1522,7 +1522,7 @@ static int amdgpu_hwmon_get_sensor_generic(struct amdgpu_device *adev,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1530,7 +1530,7 @@ static int amdgpu_hwmon_get_sensor_generic(struct amdgpu_device *adev,
 	r = amdgpu_dpm_read_sensor(adev, sensor, query, &size);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
 }
@@ -1641,14 +1641,14 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	amdgpu_asic_get_pcie_usage(adev, &count0, &count1);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return sysfs_emit(buf, "%llu %llu %i\n",
 			  count0, count1, pcie_get_mps(adev->pdev));
@@ -1772,7 +1772,7 @@ static ssize_t amdgpu_get_apu_thermal_cap(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -1783,7 +1783,7 @@ static ssize_t amdgpu_get_apu_thermal_cap(struct device *dev,
 		size = sysfs_emit(buf, "failed to get thermal limit\n");
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -1809,7 +1809,7 @@ static ssize_t amdgpu_set_apu_thermal_cap(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -1820,7 +1820,7 @@ static ssize_t amdgpu_set_apu_thermal_cap(struct device *dev,
 	}
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return count;
 }
@@ -1851,14 +1851,14 @@ static ssize_t amdgpu_get_pm_metrics(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	size = amdgpu_dpm_get_pm_metrics(adev, buf, PAGE_SIZE);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -1892,7 +1892,7 @@ static ssize_t amdgpu_get_gpu_metrics(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
@@ -1907,7 +1907,7 @@ static ssize_t amdgpu_get_gpu_metrics(struct device *dev,
 
 out:
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	return size;
 }
@@ -2010,7 +2010,7 @@ static ssize_t amdgpu_set_smartshift_bias(struct device *dev,
 
 	r = pm_runtime_get_sync(ddev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return r;
 	}
 
@@ -2030,7 +2030,7 @@ static ssize_t amdgpu_set_smartshift_bias(struct device *dev,
 
 out:
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 	return r;
 }
 
@@ -2337,14 +2337,14 @@ static ssize_t amdgpu_set_pm_policy_attr(struct device *dev,
 
 	ret = pm_runtime_get_sync(ddev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(ddev->dev);
+		__pm_runtime_put_autosuspend(ddev->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_set_pm_policy(adev, policy_attr->id, val);
 
 	pm_runtime_mark_last_busy(ddev->dev);
-	pm_runtime_put_autosuspend(ddev->dev);
+	__pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
 		return ret;
@@ -2774,14 +2774,14 @@ static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
 
 	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_get_fan_control_mode(adev, &pwm_mode);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (ret)
 		return -EINVAL;
@@ -2819,14 +2819,14 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct device *dev,
 
 	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (ret)
 		return -EINVAL;
@@ -2868,7 +2868,7 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2886,7 +2886,7 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
 
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2909,14 +2909,14 @@ static ssize_t amdgpu_hwmon_get_pwm1(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
 	err = amdgpu_dpm_get_fan_speed_pwm(adev, &speed);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2939,14 +2939,14 @@ static ssize_t amdgpu_hwmon_get_fan1_input(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
 	err = amdgpu_dpm_get_fan_speed_rpm(adev, &speed);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -3003,14 +3003,14 @@ static ssize_t amdgpu_hwmon_get_fan1_target(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
 	err = amdgpu_dpm_get_fan_speed_rpm(adev, &rpm);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -3038,7 +3038,7 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -3055,7 +3055,7 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
 
 out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -3078,14 +3078,14 @@ static ssize_t amdgpu_hwmon_get_fan1_enable(struct device *dev,
 
 	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
 	ret = amdgpu_dpm_get_fan_control_mode(adev, &pwm_mode);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (ret)
 		return -EINVAL;
@@ -3121,14 +3121,14 @@ static ssize_t amdgpu_hwmon_set_fan1_enable(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
 	err = amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return -EINVAL;
@@ -3250,7 +3250,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_generic(struct device *dev,
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -3263,7 +3263,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_generic(struct device *dev,
 		size = sysfs_emit(buf, "\n");
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return size;
 }
@@ -3341,14 +3341,14 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
 
 	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
 	err = amdgpu_dpm_set_power_limit(adev, value);
 
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+	__pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -3789,7 +3789,7 @@ static int amdgpu_retrieve_od_settings(struct amdgpu_device *adev,
 
 	ret = pm_runtime_get_sync(adev->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev->dev);
+		__pm_runtime_put_autosuspend(adev->dev);
 		return ret;
 	}
 
@@ -3798,7 +3798,7 @@ static int amdgpu_retrieve_od_settings(struct amdgpu_device *adev,
 		size = sysfs_emit(buf, "\n");
 
 	pm_runtime_mark_last_busy(adev->dev);
-	pm_runtime_put_autosuspend(adev->dev);
+	__pm_runtime_put_autosuspend(adev->dev);
 
 	return size;
 }
@@ -3899,14 +3899,14 @@ amdgpu_distribute_custom_od_settings(struct amdgpu_device *adev,
 	}
 
 	pm_runtime_mark_last_busy(adev->dev);
-	pm_runtime_put_autosuspend(adev->dev);
+	__pm_runtime_put_autosuspend(adev->dev);
 
 	return count;
 
 err_out1:
 	pm_runtime_mark_last_busy(adev->dev);
 err_out0:
-	pm_runtime_put_autosuspend(adev->dev);
+	__pm_runtime_put_autosuspend(adev->dev);
 
 	return ret;
 }
@@ -4760,7 +4760,7 @@ static int amdgpu_debugfs_pm_info_show(struct seq_file *m, void *unused)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(dev->dev);
+		__pm_runtime_put_autosuspend(dev->dev);
 		return r;
 	}
 
@@ -4778,7 +4778,7 @@ static int amdgpu_debugfs_pm_info_show(struct seq_file *m, void *unused)
 
 out:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return r;
 }
-- 
2.39.5

