Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FD98FFE3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207310E28A;
	Fri,  4 Oct 2024 09:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ml9s8l7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30610E28A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034875; x=1759570875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6lTT+2P3JX3u/VnV1rFuyhImRRDU09jf/XX9CEWXNj0=;
 b=ml9s8l7IeOB1mtL9UUgprKI3mmOXc5wKxEQ3+IrdzPbwN6vBlsIKwp2W
 QiiAwRQrcsbH1NJiw1Vt6z3HB3yhZ/LfFWZEDF7c1EaqG7K2NBwSQ+1UH
 il65IRhlj7Sm4zknPZxsLnibAbQjTd2A/VkL42X3vp3XnKn0WnOFM+DTS
 f73eKPe/XuIfQeZpq+pi6EFBH0hXn53CmRyydvHr8OgdOQkeL46TVQN5R
 pDAKYD7AwlBsSklvyH8sYdXjyO3/6lwnOfKIASk9indgkEiULu5aN/+O2
 QKsXtww7FgviHPnPCfjYSVIA/rLiSvTCSK1nS62sosjd/tKCMZ/Qjw33S A==;
X-CSE-ConnectionGUID: 9t2joxd6RmmIuYhjaB/Gfw==
X-CSE-MsgGUID: w+aQ951uTc6nZTs8T7Tp/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856172"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856172"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:15 -0700
X-CSE-ConnectionGUID: vJGnCLCJQLyYZOrv5gr1Sw==
X-CSE-MsgGUID: 8uHWlphdQeC9x2WD7sbDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331917"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:13 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 907CF11F7E7;
 Fri,  4 Oct 2024 12:41:11 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoB-000TUk-1r;
 Fri, 04 Oct 2024 12:41:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/51] accel/ivpu: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:11 +0300
Message-Id: <20241004094111.113368-1-sakari.ailus@linux.intel.com>
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
 drivers/accel/ivpu/ivpu_drv.c | 2 +-
 drivers/accel/ivpu/ivpu_pm.c  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index c91400ecf926..4140ff55a4e6 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -104,7 +104,7 @@ static void file_priv_release(struct kref *ref)
 	mutex_lock(&vdev->context_list_lock);
 	file_priv_unbind(vdev, file_priv);
 	mutex_unlock(&vdev->context_list_lock);
-	pm_runtime_put_autosuspend(vdev->drm.dev);
+	__pm_runtime_put_autosuspend(vdev->drm.dev);
 
 	mutex_destroy(&file_priv->ms_lock);
 	mutex_destroy(&file_priv->lock);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 59d3170f5e35..643854e51fa0 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -143,7 +143,7 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
 
 	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
 	pm_runtime_mark_last_busy(vdev->drm.dev);
-	pm_runtime_put_autosuspend(vdev->drm.dev);
+	__pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
 void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
@@ -303,7 +303,7 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 void ivpu_rpm_put(struct ivpu_device *vdev)
 {
 	pm_runtime_mark_last_busy(vdev->drm.dev);
-	pm_runtime_put_autosuspend(vdev->drm.dev);
+	__pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
 void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
@@ -339,7 +339,7 @@ void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
 	ivpu_dbg(vdev, PM, "Post-reset done.\n");
 
 	pm_runtime_mark_last_busy(vdev->drm.dev);
-	pm_runtime_put_autosuspend(vdev->drm.dev);
+	__pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
 void ivpu_pm_init(struct ivpu_device *vdev)
@@ -381,7 +381,7 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_allow(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 }
 
 void ivpu_pm_disable(struct ivpu_device *vdev)
-- 
2.39.5

