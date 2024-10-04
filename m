Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D7C98FFED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298B710E9C2;
	Fri,  4 Oct 2024 09:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdPP5X4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C776910E9CC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034887; x=1759570887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j7sPlG4N95eUNYngpMoe8l5ATZ3EuQND1WAujk61OGA=;
 b=gdPP5X4+GYviqONkRfTWTyrWCydnSuSFjH9sfgY3PNzsXbzoxmh6dRaW
 QtXoebreF0hgrcxRsZQCXRTlpeu1/0ZE/vn3ghCUZJn3nwI08i9E+aCdB
 +rrkGvRinHPLv1ZoR4Rq00vmILanXDMSqOOsqR8G0cE3GsrONZDD2ACxV
 pN/5Omukp/v63y8Sg/IrZnvNQzoRR1+o5anQkLTE/s4NUioBDkusrHzUQ
 q4ilyzYJahimu9AGMu48fAbo9XnsiXgQgAB9GaMP+G4zn2hRChBxuwc/d
 0+zOrA6TTfeCG2zIgW6HqUK0lBbnDkU3lb1ZeLk4VGAkxiRyTGBkH/AsA g==;
X-CSE-ConnectionGUID: yedaZQslReGjgGd3Dvj4oA==
X-CSE-MsgGUID: ETBiZ5C1T0mPyElbPyzIYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856238"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:26 -0700
X-CSE-ConnectionGUID: 2+qRRZU0QKG653iOQhZkWA==
X-CSE-MsgGUID: eM0ZWME1T5S7B6yj3OiT0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331933"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:24 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 6FF3F11F7E7;
 Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoM-000TXj-1Q;
 Fri, 04 Oct 2024 12:41:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/51] drm/panfrost: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:12 +0300
Message-Id: <20241004094112.113555-1-sakari.ailus@linux.intel.com>
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
 drivers/gpu/drm/panfrost/panfrost_job.c     | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 9b8e82fb8bc4..c15ded70a4a3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -474,7 +474,7 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 	if (signal_fence)
 		dma_fence_signal_locked(job->done_fence);
 
-	pm_runtime_put_autosuspend(pfdev->dev);
+	__pm_runtime_put_autosuspend(pfdev->dev);
 
 	if (panfrost_exception_needs_reset(pfdev, js_status)) {
 		atomic_set(&pfdev->reset.pending, 1);
@@ -493,7 +493,7 @@ static void panfrost_job_handle_done(struct panfrost_device *pfdev,
 	panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 
 	dma_fence_signal_locked(job->done_fence);
-	pm_runtime_put_autosuspend(pfdev->dev);
+	__pm_runtime_put_autosuspend(pfdev->dev);
 }
 
 static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b91019cd5acb..4c73abb65a1d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -284,7 +284,7 @@ static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
 	if (pm_runtime_active(pfdev->dev))
 		mmu_hw_do_operation(pfdev, mmu, iova, size, AS_COMMAND_FLUSH_PT);
 
-	pm_runtime_put_autosuspend(pfdev->dev);
+	__pm_runtime_put_autosuspend(pfdev->dev);
 }
 
 static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
@@ -562,7 +562,7 @@ static void panfrost_mmu_release_ctx(struct kref *kref)
 		pm_runtime_get_noresume(pfdev->dev);
 		if (pm_runtime_active(pfdev->dev))
 			panfrost_mmu_disable(pfdev, mmu->as);
-		pm_runtime_put_autosuspend(pfdev->dev);
+		__pm_runtime_put_autosuspend(pfdev->dev);
 
 		clear_bit(mmu->as, &pfdev->as_alloc_mask);
 		clear_bit(mmu->as, &pfdev->as_in_use_mask);
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index ba9b6e2b2636..9d91cf537b2b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -202,7 +202,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 	panfrost_gem_mapping_put(perfcnt->mapping);
 	perfcnt->mapping = NULL;
 	pm_runtime_mark_last_busy(pfdev->dev);
-	pm_runtime_put_autosuspend(pfdev->dev);
+	__pm_runtime_put_autosuspend(pfdev->dev);
 
 	return 0;
 }
@@ -278,7 +278,7 @@ void panfrost_perfcnt_close(struct drm_file *file_priv)
 		panfrost_perfcnt_disable_locked(pfdev, file_priv);
 	mutex_unlock(&perfcnt->lock);
 	pm_runtime_mark_last_busy(pfdev->dev);
-	pm_runtime_put_autosuspend(pfdev->dev);
+	__pm_runtime_put_autosuspend(pfdev->dev);
 }
 
 int panfrost_perfcnt_init(struct panfrost_device *pfdev)
-- 
2.39.5

