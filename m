Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A2C0DF0C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36010E490;
	Mon, 27 Oct 2025 13:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbbLkbCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BC010E48B;
 Mon, 27 Oct 2025 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761570904; x=1793106904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KV+S7DQVMRgQhXR5566C5VHaHELI2KQeRBROKhQ7meQ=;
 b=cbbLkbCrB9LdPvJzL0jcFhvKC+SOcQVAoBEJsOAGz2zdXORKBR5D45ym
 A0aicULNcgQYCsFWccxxS88TQdjdxsf1lHXqN5LuGtG6Po1dOsGsDcWG1
 UQaJzGjAd4yf9lAnwNEqVI/G6F1HpM660ZDuKrXq4Ws6tr5uBRMZnHt8g
 P9d/adrpiIJgVWsZKWR6ZrQojWgV9fQhpSGWl0uDKLzi2SeOoaab/i3CB
 hgXTgGlidFkRDXkUpOugvyQ0Yvu2WyEvQR/jSdWAKkzr2UURTNGi81yg3
 7jXQaBNWBCuw5NMcHS5moLsXJP3COq95GeipwbgADytgVaKYMXnL82AQs Q==;
X-CSE-ConnectionGUID: 1D2OanYbSZ6vTLpSEv7Vdw==
X-CSE-MsgGUID: 11oe72+4Rs6ot1X/FPwEhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63553388"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63553388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:15:03 -0700
X-CSE-ConnectionGUID: tBvuOvuHRTWN96M4eYAokw==
X-CSE-MsgGUID: wF9Uh/6aQBSfcuYXSvkYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="208654471"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:14:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id BA9D111FADA;
 Mon, 27 Oct 2025 15:14:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDN3Y-00000001dzg-2ri4; Mon, 27 Oct 2025 15:14:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Antonio Quartulli <antonio@mandelbit.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Liao Yuanhong <liaoyuanhong@vivo.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Prike Liang <Prike.Liang@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 ganglxie <ganglxie@amd.com>, Xiang Liu <xiang.liu@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, Ce Sun <cesun102@amd.com>,
 Dave Airlie <airlied@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Imre Deak <imre.deak@intel.com>, Ben Skeggs <bskeggs@nvidia.com>,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amd: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Mon, 27 Oct 2025 15:14:38 +0200
Message-ID: <20251027131440.392052-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  1 -
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 16 +++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 25 -------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  1 -
 .../gpu/drm/amd/amdgpu/amdgpu_securedisplay.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  1 -
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  1 -
 14 files changed, 4 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 6c62e27b9800..d31460a9e958 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -507,7 +507,6 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 				pm_runtime_get_sync(adev_to_drm(adev)->dev);
 				/* Just fire off a uevent and let userspace tell us what to do */
 				drm_helper_hpd_irq_event(adev_to_drm(adev));
-				pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 				pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 47e9bfba0642..9f96d568acf2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -734,10 +734,8 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 
 	amdgpu_connector_update_scratch_regs(connector, ret);
 
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -919,10 +917,8 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 	amdgpu_connector_update_scratch_regs(connector, ret);
 
 out:
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -1146,10 +1142,8 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 	amdgpu_connector_update_scratch_regs(connector, ret);
 
 exit:
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -1486,10 +1480,8 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 
 	amdgpu_connector_update_scratch_regs(connector, ret);
 out:
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_eDP)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index d3a5189bd512..62d43b8cbe58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -129,7 +129,6 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 	if (use_bank) {
 		if ((sh_bank != 0xFFFFFFFF && sh_bank >= adev->gfx.config.max_sh_per_se) ||
 		    (se_bank != 0xFFFFFFFF && se_bank >= adev->gfx.config.max_shader_engines)) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return -EINVAL;
@@ -179,7 +178,6 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 	if (pm_pg_lock)
 		mutex_unlock(&adev->pm.mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
@@ -255,7 +253,6 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 	if (rd->id.use_grbm) {
 		if ((rd->id.grbm.sh != 0xFFFFFFFF && rd->id.grbm.sh >= adev->gfx.config.max_sh_per_se) ||
 		    (rd->id.grbm.se != 0xFFFFFFFF && rd->id.grbm.se >= adev->gfx.config.max_shader_engines)) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			mutex_unlock(&rd->lock);
@@ -310,7 +307,6 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 
 	mutex_unlock(&rd->lock);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
@@ -446,7 +442,6 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, siz
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, rd->id.xcc_id);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
@@ -557,7 +552,6 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -617,7 +611,6 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -676,7 +669,6 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -736,7 +728,6 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -795,7 +786,6 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -855,7 +845,6 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -1003,7 +992,6 @@ static ssize_t amdgpu_debugfs_sensor_read(struct file *f, char __user *buf,
 
 	r = amdgpu_dpm_read_sensor(adev, idx, &values[0], &valuesize);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r) {
@@ -1094,7 +1082,6 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
@@ -1192,7 +1179,6 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	while (size) {
@@ -1266,7 +1252,6 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_read(struct file *f, char __user
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1315,7 +1300,6 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_write(struct file *f, const char
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1365,7 +1349,6 @@ static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1414,7 +1397,6 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1460,7 +1442,6 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1501,7 +1482,6 @@ static ssize_t amdgpu_debugfs_gfxoff_status_read(struct file *f, char __user *bu
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1701,7 +1681,6 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 	up_write(&adev->reset_domain->sem);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
@@ -1721,7 +1700,6 @@ static int amdgpu_debugfs_evict_vram(void *data, u64 *val)
 
 	*val = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
@@ -1742,7 +1720,6 @@ static int amdgpu_debugfs_evict_gtt(void *data, u64 *val)
 
 	*val = amdgpu_ttm_evict_resources(adev, TTM_PL_TT);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
@@ -1762,7 +1739,6 @@ static int amdgpu_debugfs_benchmark(void *data, u64 val)
 
 	r = amdgpu_benchmark(adev, val);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return r;
@@ -2014,7 +1990,6 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 		ret = -EINVAL;
 
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 51bab32fd8c6..eca8443d9256 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -332,8 +332,6 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 		if (crtc->enabled)
 			active = true;
 
-	pm_runtime_mark_last_busy(dev->dev);
-
 	adev = drm_to_adev(dev);
 	/* if we have active crtcs and we don't have a power ref,
 	 * take the current one
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index a36e15beafeb..f159515b7d95 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2228,7 +2228,6 @@ static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
 						adev->pdev->bus->number, i);
 		if (p) {
 			pm_runtime_get_sync(&p->dev);
-			pm_runtime_mark_last_busy(&p->dev);
 			pm_runtime_put_autosuspend(&p->dev);
 			pci_dev_put(p);
 		}
@@ -2474,7 +2473,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 
 		pm_runtime_allow(ddev->dev);
 
-		pm_runtime_mark_last_busy(ddev->dev);
 		pm_runtime_put_autosuspend(ddev->dev);
 
 		pci_wake_from_d3(pdev, TRUE);
@@ -2934,7 +2932,6 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 
 	ret = amdgpu_runtime_idle_check_userq(dev);
 done:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	return ret;
 }
@@ -2970,7 +2967,6 @@ long amdgpu_drm_ioctl(struct file *filp,
 
 	ret = drm_ioctl(filp, cmd, arg);
 
-	pm_runtime_mark_last_busy(dev->dev);
 out:
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 1fe31d2f2706..c7843e336310 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -250,7 +250,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 		drv->signalled_wptr = am_fence->wptr;
 		dma_fence_signal(fence);
 		dma_fence_put(fence);
-		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	} while (last_seq != seq);
 
@@ -928,7 +927,6 @@ static int gpu_recover_get(void *data, u64 *val)
 
 	*val = atomic_read(&adev->reset_domain->reset_res);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 29c927f4d6df..8b118c53f351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -1670,7 +1670,6 @@ static ssize_t amdgpu_gfx_set_run_cleaner_shader(struct device *dev,
 
 	ret = amdgpu_gfx_run_cleaner_shader(adev, value);
 
-	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index b3e6b3fcdf2c..6ee77f431d56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1471,7 +1471,6 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	kfree(fpriv);
 
 out_suspend:
-	pm_runtime_mark_last_busy(dev->dev);
 pm_put:
 	pm_runtime_put_autosuspend(dev->dev);
 
@@ -1539,7 +1538,6 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	kfree(fpriv);
 	file_priv->driver_priv = NULL;
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
index 123bcf5c2bb1..bacf888735db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
@@ -101,7 +101,6 @@ static ssize_t amdgpu_rap_debugfs_write(struct file *f, const char __user *buf,
 	}
 
 	amdgpu_gfx_off_ctrl(adev, true);
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return size;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index ff34e1c0d9e2..c806d4af8c05 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -4099,7 +4099,6 @@ static void amdgpu_ras_counte_dw(struct work_struct *work)
 		atomic_set(&con->ras_ue_count, ue_count);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 Out:
 	pm_runtime_put_autosuspend(dev->dev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
index 41ebe690eeff..3739be1b71e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -159,7 +159,6 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
 		dev_err(adev->dev, "Invalid input: %s\n", str);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return size;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 9d4751a39c20..3f75d5daa5a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -479,7 +479,6 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
 	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
 	mutex_unlock(&uq_mgr->userq_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..9e30b9df6d53 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1083,7 +1083,6 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		 * for auto suspend
 		 */
 		if (pdd->runtime_inuse) {
-			pm_runtime_mark_last_busy(adev_to_drm(pdd->dev->adev)->dev);
 			pm_runtime_put_autosuspend(adev_to_drm(pdd->dev->adev)->dev);
 			pdd->runtime_inuse = false;
 		}
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index c83d69994380..c88a76cce401 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -174,7 +174,6 @@ static int amdgpu_pm_get_access_if_active(struct amdgpu_device *adev)
  */
 static inline void amdgpu_pm_put_access(struct amdgpu_device *adev)
 {
-	pm_runtime_mark_last_busy(adev->dev);
 	pm_runtime_put_autosuspend(adev->dev);
 }
 
-- 
2.47.3

