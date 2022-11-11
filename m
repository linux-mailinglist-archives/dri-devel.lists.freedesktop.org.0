Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267662589E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DBF10E7F1;
	Fri, 11 Nov 2022 10:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3A810E7DC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668163503; x=1699699503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhBrapaJ+vgi9kxPoWBSV/LQcGioxwEBpF/rBIIcwyQ=;
 b=QUDW1retk8MRiVsuC85bEKVW9aEEspZ7zvGPly1OXVqxQyCkWM4XgIw2
 1Ih8onftDg6uevg2YJkLYpt4xh4YfsPPAdR8I4gZI9lQ2i7KAkxrxpjIy
 3Gaj/KZU+L5oPOw3zJbxYiPu46DqhIoT4WH9nQS4dCMkNvYyjZAAYJjID
 rN0QF1h4LKGs0DS+WSO9MUFc9ztoahpgSwjnwlh8r4/ONlJlTlHG5esYp
 Rwb4lOEzqGuNUJrDV/VgVRy1L22Zp/Pi84AFHsBv6NydIDHvC1UoH/nzF
 QMeEsvLEdxQGCtM15S8gqIEA5cdL4NbYPo8ADc5OH5+oBx7F9vLz7wPrB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="299087590"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="299087590"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670708444"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="670708444"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:02 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 01/13] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
Date: Fri, 11 Nov 2022 10:44:23 +0000
Message-Id: <20221111104435.3152347-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
References: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Replace the deprecated macro with the per-device one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_file.c  | 21 +++++++++++----------
 drivers/gpu/drm/drm_ioc32.c | 13 +++++++------
 drivers/gpu/drm/drm_ioctl.c | 25 +++++++++++++------------
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a8b4d918e9a3..ba5041137b29 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -245,10 +245,10 @@ void drm_file_free(struct drm_file *file)
 
 	dev = file->minor->dev;
 
-	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
-		  current->comm, task_pid_nr(current),
-		  (long)old_encode_dev(file->minor->kdev->devt),
-		  atomic_read(&dev->open_count));
+	drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
+		     current->comm, task_pid_nr(current),
+		     (long)old_encode_dev(file->minor->kdev->devt),
+		     atomic_read(&dev->open_count));
 
 #ifdef CONFIG_DRM_LEGACY
 	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
@@ -340,8 +340,8 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	    dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return -EINVAL;
 
-	DRM_DEBUG("comm=\"%s\", pid=%d, minor=%d\n", current->comm,
-		  task_pid_nr(current), minor->index);
+	drm_dbg_core(dev, "comm=\"%s\", pid=%d, minor=%d\n",
+		     current->comm, task_pid_nr(current), minor->index);
 
 	priv = drm_file_alloc(minor);
 	if (IS_ERR(priv))
@@ -450,11 +450,12 @@ EXPORT_SYMBOL(drm_open);
 
 void drm_lastclose(struct drm_device * dev)
 {
-	DRM_DEBUG("\n");
+	drm_dbg_core(dev, "\n");
 
-	if (dev->driver->lastclose)
+	if (dev->driver->lastclose) {
 		dev->driver->lastclose(dev);
-	DRM_DEBUG("driver lastclose completed\n");
+		drm_dbg_core(dev, "driver lastclose completed\n");
+	}
 
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
 		drm_legacy_dev_reinit(dev);
@@ -485,7 +486,7 @@ int drm_release(struct inode *inode, struct file *filp)
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
-	DRM_DEBUG("open_count = %d\n", atomic_read(&dev->open_count));
+	drm_dbg_core(dev, "open_count = %d\n", atomic_read(&dev->open_count));
 
 	drm_close_helper(filp);
 
diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 5d82891c3222..49a743f62b4a 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -972,6 +972,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	unsigned int nr = DRM_IOCTL_NR(cmd);
 	struct drm_file *file_priv = filp->private_data;
+	struct drm_device *dev = file_priv->minor->dev;
 	drm_ioctl_compat_t *fn;
 	int ret;
 
@@ -986,14 +987,14 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (!fn)
 		return drm_ioctl(filp, cmd, arg);
 
-	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
-		  current->comm, task_pid_nr(current),
-		  (long)old_encode_dev(file_priv->minor->kdev->devt),
-		  file_priv->authenticated,
-		  drm_compat_ioctls[nr].name);
+	drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
+		     current->comm, task_pid_nr(current),
+		     (long)old_encode_dev(file_priv->minor->kdev->devt),
+		     file_priv->authenticated,
+		     drm_compat_ioctls[nr].name);
 	ret = (*fn)(filp, cmd, arg);
 	if (ret)
-		DRM_DEBUG("ret = %d\n", ret);
+		drm_dbg_core(dev, "ret = %d\n", ret);
 	return ret;
 }
 EXPORT_SYMBOL(drm_compat_ioctl);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ca2a6e6101dc..7c9d66ee917d 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -440,7 +440,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 int drm_noop(struct drm_device *dev, void *data,
 	     struct drm_file *file_priv)
 {
-	DRM_DEBUG("\n");
+	drm_dbg_core(dev, "\n");
 	return 0;
 }
 EXPORT_SYMBOL(drm_noop);
@@ -856,16 +856,16 @@ long drm_ioctl(struct file *filp,
 		out_size = 0;
 	ksize = max(max(in_size, out_size), drv_size);
 
-	DRM_DEBUG("comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
-		  current->comm, task_pid_nr(current),
-		  (long)old_encode_dev(file_priv->minor->kdev->devt),
-		  file_priv->authenticated, ioctl->name);
+	drm_dbg_core(dev, "comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
+		     current->comm, task_pid_nr(current),
+		     (long)old_encode_dev(file_priv->minor->kdev->devt),
+		     file_priv->authenticated, ioctl->name);
 
 	/* Do not trust userspace, use our own definition */
 	func = ioctl->func;
 
 	if (unlikely(!func)) {
-		DRM_DEBUG("no function\n");
+		drm_dbg_core(dev, "no function\n");
 		retcode = -EINVAL;
 		goto err_i1;
 	}
@@ -894,16 +894,17 @@ long drm_ioctl(struct file *filp,
 
       err_i1:
 	if (!ioctl)
-		DRM_DEBUG("invalid ioctl: comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
-			  current->comm, task_pid_nr(current),
-			  (long)old_encode_dev(file_priv->minor->kdev->devt),
-			  file_priv->authenticated, cmd, nr);
+		drm_dbg_core(dev,
+			     "invalid ioctl: comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
+			     current->comm, task_pid_nr(current),
+			     (long)old_encode_dev(file_priv->minor->kdev->devt),
+			     file_priv->authenticated, cmd, nr);
 
 	if (kdata != stack_kdata)
 		kfree(kdata);
 	if (retcode)
-		DRM_DEBUG("comm=\"%s\", pid=%d, ret=%d\n", current->comm,
-			  task_pid_nr(current), retcode);
+		drm_dbg_core(dev, "comm=\"%s\", pid=%d, ret=%d\n",
+			     current->comm, task_pid_nr(current), retcode);
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl);
-- 
2.34.1

