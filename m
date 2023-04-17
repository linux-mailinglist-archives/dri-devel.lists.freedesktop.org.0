Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05616E4DC6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE0610E417;
	Mon, 17 Apr 2023 15:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4663910E1B1;
 Mon, 17 Apr 2023 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681746998; x=1713282998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atDvmZyUtCQfHIE+ErRNt7jlzXViu3axN8KeAcTKy6o=;
 b=AhNs0O6kfZig3bJBiD1sPuSx+CQnH62g/2o37r0xOzkaD17eHKLZHr3V
 JORfzY0mpchRWuXIAOZmb1IGh1qlvUbLPSKFmivFaopyCr2TqWy2P6mYv
 BDp4JpcMO9C4F1x2BjqqyPLmelFuq8P95pBcjQ+HbbbnYfT9BHMTAVFFn
 MGXMHv/eMK+sRLEw29gZLOWNdHgBdukFZKYNToSNMAChL0S5K2cpb6FB+
 aRo3AgcDPhBp1CVqtBc7NyvoL3Sgz6xP6/4CapuMpBLnXjNuuGd77mvyv
 s6zhGR4CVLfkPyx31tUtFxGmYgrChsLkC4KQ7ZPDC4E7FVm+s7ecZyuuw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="372804617"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="372804617"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690718268"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="690718268"
Received: from gtohallo-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.232.210])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:25 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 1/6] drm: Add common fdinfo helper
Date: Mon, 17 Apr 2023 16:56:08 +0100
Message-Id: <20230417155613.4143258-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Handle a bit of the boiler-plate in a single case, and make it easier to
add some core tracked stats.

v2: Update drm-usage-stats.rst, 64b client-id, rename drm_show_fdinfo

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 10 +++++++-
 drivers/gpu/drm/drm_file.c            | 35 +++++++++++++++++++++++++++
 include/drm/drm_drv.h                 |  7 ++++++
 include/drm/drm_file.h                |  4 +++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index b46327356e80..2ab32c40e93c 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -126,7 +126,15 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
+Implementation Details
+======================
+
+Drivers should use drm_show_fdinfo() in their `struct file_operations`, and
+implement &drm_driver.show_fdinfo if they wish to provide any stats which
+are not provided by drm_show_fdinfo().  But even driver specific stats should
+be documented above and where possible, aligned with other drivers.
+
 Driver specific implementations
-===============================
+-------------------------------
 
 :ref:`i915-usage-stats`
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c1018c470047..37b4f76a5191 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -148,6 +148,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
  */
 struct drm_file *drm_file_alloc(struct drm_minor *minor)
 {
+	static atomic64_t ident = ATOMIC_INIT(0);
 	struct drm_device *dev = minor->dev;
 	struct drm_file *file;
 	int ret;
@@ -156,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	if (!file)
 		return ERR_PTR(-ENOMEM);
 
+	/* Get a unique identifier for fdinfo: */
+	file->client_id = atomic64_inc_return(&ident);
 	file->pid = get_pid(task_tgid(current));
 	file->minor = minor;
 
@@ -868,6 +871,38 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+/**
+ * drm_show_fdinfo - helper for drm file fops
+ * @seq_file: output stream
+ * @f: the device file instance
+ *
+ * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
+ * process using the GPU.  See also &drm_driver.show_fdinfo.
+ *
+ * For text output format description please see Documentation/gpu/drm-usage-stats.rst
+ */
+void drm_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
+	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
+
+	if (dev_is_pci(dev->dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
+			   pci_domain_nr(pdev->bus), pdev->bus->number,
+			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+	}
+
+	if (dev->driver->show_fdinfo)
+		dev->driver->show_fdinfo(&p, file);
+}
+EXPORT_SYMBOL(drm_show_fdinfo);
+
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b419c59c4bef..89e2706cac56 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -401,6 +401,13 @@ struct drm_driver {
 			       struct drm_device *dev, uint32_t handle,
 			       uint64_t *offset);
 
+	/**
+	 * @show_fdinfo:
+	 *
+	 * Print device specific fdinfo.  See Documentation/gpu/drm-usage-stats.rst.
+	 */
+	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
+
 	/** @major: driver major number */
 	int major;
 	/** @minor: driver minor number */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ecffe24e2b1b..7d9b3c65cbc1 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -258,6 +258,9 @@ struct drm_file {
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
+	/** @client_id: A unique id for fdinfo */
+	u64 client_id;
+
 	/** @magic: Authentication magic, see @authenticated. */
 	drm_magic_t magic;
 
@@ -438,6 +441,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event_timestamp_locked(struct drm_device *dev,
 				     struct drm_pending_event *e,
 				     ktime_t timestamp);
+void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
-- 
2.37.2

