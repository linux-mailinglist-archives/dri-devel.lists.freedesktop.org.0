Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1EA99EC3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781310E707;
	Thu, 24 Apr 2025 02:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Wm2R2PUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C06D10E70B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745461321; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EbsNCH3cKFxrSfecvmPM+wQp8kiq1RmwELXqLYKdWcanhB5sGaWb8elSCWck7DeIhHWtAL0cd2QaAafQOkyccsjRX6nyof4CwXDfAxYtbsrBWp1JCm9y2mu5BGnGyGkyjYLo9No+MgXHY3W8TuVDxhlbxen82XqfVHxS1yAAzG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745461321;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4610HNpAr8lhhyh/YAuy/GQk/fTN2NlOR5POOrLX4So=; 
 b=Tx2rsTSwr1tioYls2Xg1UpHU6gfQgMX2Y4C/oBoXJNEEDP/eHy1EdOw6XrBb8kiJcqybIIG8X8/377cuROP5GFcAEatIA+NGEZsFVLzQNUFA3yYl9jIZIuk1ZW2QoXCs28m4/2KkuJn+nkshgwdB26THWyIRK+k8U6S7CBDUjXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745461321; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4610HNpAr8lhhyh/YAuy/GQk/fTN2NlOR5POOrLX4So=;
 b=Wm2R2PUm1TIF5aZxs/4yPB1DADgaVyfvt8jW2Ur8QfA0Ytlhhv+wMPGTrxzVFqty
 b5bZrUUpm/He54oF14s0cIa4gbD+WTU9TcUBBR7VK5wkTUnLvPU6u2OO2XDaHrLPJsK
 fs2KlIJoFihxfxeJZfCl79vHIb+kA3HbwU8eZ6Go=
Received: by mx.zohomail.com with SMTPS id 1745461320158285.2215441334389;
 Wed, 23 Apr 2025 19:22:00 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/3] drm/panfrost: show device-wide list of DRM GEM objects
 over DebugFS
Date: Thu, 24 Apr 2025 03:21:32 +0100
Message-ID: <20250424022138.709303-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424022138.709303-1-adrian.larumbe@collabora.com>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This change is essentially a Panfrost port of commit a3707f53eb3f
("drm/panthor: show device-wide list of DRM GEM objects over DebugFS").

The DebugFS file is almost the same as in Panthor, minus the GEM object
usage flags, since Panfrost has no kernel-only BO's.

Two additional GEM state flags which are displayed but aren't relevant
to Panthor are 'Purged' and 'Purgeable', since Panfrost implements an
explicit shrinker and a madvise ioctl to flag objects as reclaimable.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |   4 +
 drivers/gpu/drm/panfrost/panfrost_device.h |  11 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  37 ++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 137 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  58 +++++++++
 5 files changed, 247 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a45e4addcc19..7ba140aaf59d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -209,6 +209,10 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->cycle_counter.lock);
 
+#ifdef CONFIG_DEBUG_FS
+	mutex_init(&pfdev->gems.lock);
+	INIT_LIST_HEAD(&pfdev->gems.node);
+#endif
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index ad95f2ed31d9..395272a79306 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -161,6 +161,17 @@ struct panfrost_device {
 		atomic_t use_count;
 		spinlock_t lock;
 	} cycle_counter;
+
+	#ifdef CONFIG_DEBUG_FS
+	/** @gems: Device-wide list of GEM objects owned by at least one file. */
+	struct {
+		/** @gems.lock: Protects the device-wide list of GEM objects. */
+		struct mutex lock;
+
+		/** @node: Used to keep track of all the device's DRM objects */
+		struct list_head node;
+	} gems;
+#endif
 };
 
 struct panfrost_mmu {
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b0ab76d67e96..12dd9f311984 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <drm/panfrost_drm.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_syncobj.h>
@@ -153,6 +154,8 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		ret = -EINVAL;
 	}
 
+	panfrost_gem_debugfs_init_bo(bo);
+
 out:
 	drm_gem_object_put(&bo->base.base);
 	return ret;
@@ -659,6 +662,37 @@ static const struct file_operations panfrost_drm_driver_fops = {
 	.show_fdinfo = drm_show_fdinfo,
 };
 
+#ifdef CONFIG_DEBUG_FS
+static int panthor_gems_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct panfrost_device *pfdev = dev->dev_private;
+
+	panfrost_gem_debugfs_print_bos(pfdev, m);
+
+	return 0;
+}
+
+static struct drm_info_list panthor_debugfs_list[] = {
+	{"gems", panthor_gems_show, 0, NULL},
+};
+
+static int panthor_gems_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(panthor_debugfs_list,
+				 ARRAY_SIZE(panthor_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	return 0;
+}
+
+static void panfrost_debugfs_init(struct drm_minor *minor)
+{
+	panthor_gems_debugfs_init(minor);
+}
+#endif
+
 /*
  * Panfrost driver version:
  * - 1.0 - initial interface
@@ -683,6 +717,9 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init = panfrost_debugfs_init,
+#endif
 };
 
 static int panfrost_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index a7a29974d8b1..8a0fd1abd05c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -12,6 +12,38 @@
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
+#ifdef CONFIG_DEBUG_FS
+static void panfrost_gem_debugfs_bo_add(struct panfrost_device *ptdev,
+					struct panfrost_gem_object *bo)
+{
+	INIT_LIST_HEAD(&bo->debugfs.node);
+
+	bo->debugfs.creator.tgid = current->group_leader->pid;
+	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
+
+	mutex_lock(&ptdev->gems.lock);
+	list_add_tail(&bo->debugfs.node, &ptdev->gems.node);
+	mutex_unlock(&ptdev->gems.lock);
+}
+
+static void panfrost_gem_debugfs_bo_rm(struct panfrost_gem_object *bo)
+{
+	struct panfrost_device *ptdev = bo->base.base.dev->dev_private;
+
+	if (list_empty(&bo->debugfs.node))
+		return;
+
+	mutex_lock(&ptdev->gems.lock);
+	list_del_init(&bo->debugfs.node);
+	mutex_unlock(&ptdev->gems.lock);
+}
+#else
+static void panfrost_gem_debugfs_bo_add(struct panfrost_device *ptdev,
+					struct panfrost_gem_object *bo)
+{}
+static void panfrost_gem_debugfs_bo_rm(struct panfrost_gem_object *bo) {}
+#endif
+
 /* Called DRM core on the last userspace/kernel unreference of the
  * BO.
  */
@@ -36,6 +68,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	 */
 	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
 
+	panfrost_gem_debugfs_bo_rm(bo);
 	kfree(bo->label.str);
 	mutex_destroy(&bo->label.lock);
 
@@ -266,6 +299,8 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	obj->base.map_wc = !pfdev->coherent;
 	mutex_init(&obj->label.lock);
 
+	panfrost_gem_debugfs_bo_add(pfdev, obj);
+
 	return &obj->base.base;
 }
 
@@ -321,3 +356,105 @@ panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
 
 	kfree(old_label);
 }
+
+#ifdef CONFIG_DEBUG_FS
+struct gem_size_totals {
+	size_t size;
+	size_t resident;
+	size_t reclaimable;
+};
+
+struct flag_def {
+	u32 flag;
+	const char *name;
+};
+
+static void panfrost_gem_debugfs_print_flag_names(struct seq_file *m)
+{
+	int len;
+	int i;
+
+	static const struct flag_def gem_state_flags_names[] = {
+		{PANFROST_DEBUGFS_GEM_STATE_FLAG_IMPORTED, "imported"},
+		{PANFROST_DEBUGFS_GEM_STATE_FLAG_EXPORTED, "exported"},
+		{PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGED, "purged"},
+		{PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGEABLE, "purgeable"},
+	};
+
+	seq_puts(m, "GEM state flags: ");
+	for (i = 0, len = ARRAY_SIZE(gem_state_flags_names); i < len; i++) {
+		seq_printf(m, "%s (0x%x)%s", gem_state_flags_names[i].name,
+			   gem_state_flags_names[i].flag, (i < len - 1) ? ", " : "\n\n");
+	}
+}
+
+static void panfrost_gem_debugfs_bo_print(struct panfrost_gem_object *bo,
+					  struct seq_file *m,
+					  struct gem_size_totals *totals)
+{
+	unsigned int refcount = kref_read(&bo->base.base.refcount);
+	char creator_info[32] = {};
+	size_t resident_size;
+	u32 gem_state_flags = 0;
+
+	/* Skip BOs being destroyed. */
+	if (!refcount)
+		return;
+
+	resident_size = bo->base.pages ? bo->base.base.size : 0;
+
+	snprintf(creator_info, sizeof(creator_info),
+		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
+	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd0x%-16lx",
+		   creator_info,
+		   bo->base.base.name,
+		   refcount,
+		   bo->base.base.size,
+		   resident_size,
+		   drm_vma_node_start(&bo->base.base.vma_node));
+
+	if (bo->base.base.import_attach)
+		gem_state_flags |= PANFROST_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
+	if (bo->base.base.dma_buf)
+		gem_state_flags |= PANFROST_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
+
+	if (bo->base.madv < 0)
+		gem_state_flags |= PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGED;
+	else if (bo->base.madv > 0)
+		gem_state_flags |= PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGEABLE;
+
+	seq_printf(m, "0x%-10x", gem_state_flags);
+
+	scoped_guard(mutex, &bo->label.lock) {
+		seq_printf(m, "%s\n", bo->label.str ? : "");
+	}
+
+	totals->size += bo->base.base.size;
+	totals->resident += resident_size;
+	if (bo->base.madv > 0)
+		totals->reclaimable += resident_size;
+}
+
+void panfrost_gem_debugfs_print_bos(struct panfrost_device *ptdev,
+				    struct seq_file *m)
+{
+	struct gem_size_totals totals = {0};
+	struct panfrost_gem_object *bo;
+
+	panfrost_gem_debugfs_print_flag_names(m);
+
+	seq_puts(m, "created-by                      global-name     refcount        size            resident-size   file-offset       state       label\n");
+	seq_puts(m, "-----------------------------------------------------------------------------------------------------------------------------------\n");
+
+	scoped_guard(mutex, &ptdev->gems.lock) {
+		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
+			if (bo->debugfs.initialised)
+				panfrost_gem_debugfs_bo_print(bo, m, &totals);
+		}
+	}
+
+	seq_puts(m, "===================================================================================================================================\n");
+	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
+		   totals.size, totals.resident, totals.reclaimable);
+}
+#endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 842e025b9bdc..bc60e0d74da9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -8,9 +8,50 @@
 #include <drm/drm_mm.h>
 
 struct panfrost_mmu;
+struct panfrost_device;
 
 #define PANFROST_BO_LABEL_MAXLEN	4096
 
+enum panfrost_debugfs_gem_state_flags {
+	/** @PANFROST_DEBUGFS_GEM_STATE_FLAG_IMPORTED: GEM BO is PRIME imported. */
+	PANFROST_DEBUGFS_GEM_STATE_FLAG_IMPORTED = BIT(0),
+
+	/** @PANFROST_DEBUGFS_GEM_STATE_FLAG_EXPORTED: GEM BO is PRIME exported. */
+	PANFROST_DEBUGFS_GEM_STATE_FLAG_EXPORTED = BIT(1),
+
+	/** @PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGED: GEM BO was reclaimed by the shrinker. */
+	PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGED = BIT(2),
+
+	/**
+	 * @PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGEABLE: GEM BO pages were marked as no longer
+	 * needed by UM and can be reclaimed by the shrinker.
+	 */
+	PANFROST_DEBUGFS_GEM_STATE_FLAG_PURGEABLE = BIT(3),
+};
+
+/**
+ * struct panfrost_gem_debugfs - GEM object's DebugFS list information
+ */
+struct panfrost_gem_debugfs {
+	/**
+	 * @node: Node used to insert the object in the device-wide list of
+	 * GEM objects, to display information about it through a DebugFS file.
+	 */
+	struct list_head node;
+
+	/** @creator: Information about the UM process which created the GEM. */
+	struct {
+		/** @creator.process_name: Group leader name in owning thread's process */
+		char process_name[TASK_COMM_LEN];
+
+		/** @creator.tgid: PID of the thread's group leader within its process */
+		pid_t tgid;
+	} creator;
+
+	/** @initialised: GEM object is ready to be displayed in DebugFS file. */
+	bool initialised;
+};
+
 struct panfrost_gem_object {
 	struct drm_gem_shmem_object base;
 	struct sg_table *sgts;
@@ -59,6 +100,10 @@ struct panfrost_gem_object {
 
 	bool noexec		:1;
 	bool is_heap		:1;
+
+#ifdef CONFIG_DEBUG_FS
+	struct panfrost_gem_debugfs debugfs;
+#endif
 };
 
 struct panfrost_gem_mapping {
@@ -107,4 +152,17 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
 void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
 
+#ifdef CONFIG_DEBUG_FS
+void panfrost_gem_debugfs_print_bos(struct panfrost_device *pfdev,
+				    struct seq_file *m);
+static inline void
+panfrost_gem_debugfs_init_bo(struct panfrost_gem_object *bo)
+{
+	bo->debugfs.initialised = true;
+}
+#else
+static inline void
+panfrost_gem_debugfs_init_bo(struct panfrost_gem_object *bo) {};
+#endif
+
 #endif /* __PANFROST_GEM_H__ */
-- 
2.48.1

