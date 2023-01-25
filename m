Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23F467B847
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEB710E37B;
	Wed, 25 Jan 2023 17:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB05210E37B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674667113; x=1706203113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tJbniA5qSQqfxDXyM/aH7ZbGbon/nA6uPJ4HPPllivY=;
 b=Gl5W6qthN8KFHYk/lpGPvirkIHWaMTEETvGefCL0gUymTAqHy56sSHzP
 nKSpTbDL7/c6lc8qO0Fbhel7IZNQWT6y1/Lfyx+hMlDVh5ZJXDrQ3tqjC
 z9MQBHJx9s4mfbbzG5hgFzHhnDXNVmehkOk/TXCJ/pan7iAAhC7s1aABh
 DDfp++aAwADuX+qhS4CRjRYEopWIm6SrOl8WECumkWb5NJlzYQIYry9w+
 z8MhM1Tvns1h4j5Gcc5dVjBkw844QEF9s2BUrZUjcHcYgCW6J7LkEziV0
 fE/Z1bA8/YMPSm8rbpmnEtORgrmMDR31aoJ+mkEJ2TsOi6E6WomrlTTvd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="391124137"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="391124137"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 09:17:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="693032023"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="693032023"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 09:17:19 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm: Add flag to make whole ioctl critical section for unplug
Date: Wed, 25 Jan 2023 18:16:59 +0100
Message-Id: <20230125171659.1365087-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dev_is_unplugged() check is inherently racy as unplug can happen
just after this check. Add DRM_UNPLUG_SAFE ioctl flag to keep
the whole ioctl func call within drm_dev_enter() ... drm_dev_exit().

This could be enabled by drivers for individual ioctl's .

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/gpu/drm/drm_ioctl.c | 22 +++++++++++++++-------
 include/drm/drm_ioctl.h     |  7 +++++++
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ca2a6e6101dc..9943f38c6b05 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -773,24 +773,32 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 {
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
-	int retcode;
+	const bool global_mutex = drm_core_check_feature(dev, DRIVER_LEGACY) &&
+				  !(flags & DRM_UNLOCKED);
+	const bool unplug_safe = flags & DRM_UNPLUG_SAFE;
+	int retcode, idx;
 
-	if (drm_dev_is_unplugged(dev))
+	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
+	if (!unplug_safe)
+		drm_dev_exit(idx);
 
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto out;
 
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
+	if (likely(!global_mutex)) {
 		retcode = func(dev, kdata, file_priv);
-	else {
+	} else {
 		mutex_lock(&drm_global_mutex);
 		retcode = func(dev, kdata, file_priv);
 		mutex_unlock(&drm_global_mutex);
 	}
+
+out:
+	if (unplug_safe)
+		drm_dev_exit(idx);
+
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 6ed61c371f6c..894ce775ff12 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -130,6 +130,13 @@ enum drm_ioctl_flags {
 	 * not set DRM_AUTH because they do not require authentication.
 	 */
 	DRM_RENDER_ALLOW	= BIT(5),
+	/**
+	 * @DRM_UNPUG_SAFE:
+	 *
+	 * Whether &drm_ioctl_desc.func should be called as unplug critical
+	 * section protected by drm_dev_enter() / drm_dev_exit()
+	 */
+	DRM_UNPLUG_SAFE		= BIT(6),
 };
 
 /**
-- 
2.25.1

