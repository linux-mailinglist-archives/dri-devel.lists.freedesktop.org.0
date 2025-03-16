Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD434A63796
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 22:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B4A89A4E;
	Sun, 16 Mar 2025 21:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="aHcavloA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8989A4E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 21:52:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742161956; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IBhKQusJCyYFMIbyo0UvgwMZueCbIHumHc8l46typRLWx3OYngfNFYLJaf2WdZJwEqLXBXsMncmCUWVnzYYsAJ6/10flwz1wsDcrKTBqtxhvFEfJhcaGUf52KENVa5RlWWPskcd3Z+Hpi7FasyVFA7Ei7NnRWNrKqNWXktEQy8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742161956;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Qm2UxLfoV5PNiY9Z3GApayTxMBBuEQAgubjftymaWs4=; 
 b=KfgrLrw6r0oYw3vOGUVimrwLHXpM5+5gEARuAsEryZ6j/kQ6xPqA2FSRt80lyuYBZ6Sk1DwG1h3eUE1U/f37jiOnw4UP2UzS8Q0blcCZawKAd/y20hTrVjx1DXytY3xq9CAjtMinmNznp8LOfX+FzQVz4mRGF8Omn/06JyOxyBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742161956; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Qm2UxLfoV5PNiY9Z3GApayTxMBBuEQAgubjftymaWs4=;
 b=aHcavloA4wftaTOlYKYPm+lLB0/5srOTANaII/6GIDgIroOOtwSBr4ct0TGWpkJm
 XnBziqZxvS6Ht4U8/Zqx1LnzfWgWlgySad7Xo1dwIfvOPM74LxZ0pCh95/T9gBYZGTe
 Cif5ZRZgfbJ98t8SFqH5A3hZ4YGdzjhCEKXbkTRo=
Received: by mx.zohomail.com with SMTPS id 174216195508081.23983201201634;
 Sun, 16 Mar 2025 14:52:35 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/4] drm/panthor: show device-wide list of DRM GEM objects
 over DebugFS
Date: Sun, 16 Mar 2025 21:51:34 +0000
Message-ID: <20250316215139.3940623-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
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

Add a device DebugFS file that displays a complete list of all the DRM GEM
objects that are exposed to UM through a DRM handle.

Since leaking object identifiers that might belong to a different NS is
inadmissible, this functionality is only made available in debug builds
with DEBUGFS support enabled.

File format is that of a table, with each entry displaying a variety of
fields with information about each GEM object.

Each GEM object entry in the file displays the following information
fields: Client PID, BO's global name, reference count, BO virtual size, BO
resize size, VM address in its DRM-managed range, BO label and a flag
bitmask.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   5 ++
 drivers/gpu/drm/panthor/panthor_device.h |   8 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 101 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  22 +++++
 5 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb70..7df12eefc39f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -263,6 +263,11 @@ int panthor_device_init(struct panthor_device *ptdev)
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
 
+#ifdef CONFIG_DEBUG_FS
+	drmm_mutex_init(&ptdev->base, &ptdev->gems_lock);
+	INIT_LIST_HEAD(&ptdev->gems);
+#endif
+
 	ret = drm_dev_register(&ptdev->base, 0);
 	if (ret)
 		goto err_disable_autosuspend;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..6c030978cdc3 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -205,6 +205,14 @@ struct panthor_device {
 
 	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
 	unsigned long fast_rate;
+
+#ifdef CONFIG_DEBUG_FS
+	/** @gems_lock: Protects the device-wide list of GEM objects. */
+	struct mutex gems_lock;
+
+	/** @gems: Device-wide list of GEM objects owned by at least one file. */
+	struct list_head gems;
+#endif
 };
 
 struct panthor_gpu_usage {
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index f41b8946258f..6663eff44bdc 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1525,9 +1525,35 @@ static const struct file_operations panthor_drm_driver_fops = {
 };
 
 #ifdef CONFIG_DEBUG_FS
+static int panthor_gems_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
+
+	panthor_gem_print_objects(ptdev, m);
+
+	return 0;
+}
+
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
 static void panthor_debugfs_init(struct drm_minor *minor)
 {
 	panthor_mmu_debugfs_init(minor);
+	panthor_gems_debugfs_init(minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 3c58bb2965ea..8cea6caf3143 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -17,6 +17,16 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
+#ifdef CONFIG_DEBUG_FS
+	struct drm_device *dev = bo->base.base.dev;
+	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
+
+	if (!list_empty(&bo->gems_node)) {
+		mutex_lock(&ptdev->gems_lock);
+		list_del_init(&bo->gems_node);
+		mutex_unlock(&ptdev->gems_lock);
+	}
+#endif
 
 	kfree(bo->label);
 	mutex_destroy(&bo->label_lock);
@@ -201,6 +211,12 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
 	mutex_init(&obj->label_lock);
 
+#ifdef CONFIG_DEBUG_FS
+	INIT_LIST_HEAD(&obj->gems_node);
+	obj->creator.tgid = current->group_leader->pid;
+	get_task_comm(obj->creator.process_name, current->group_leader);
+#endif
+
 	return &obj->base.base;
 }
 
@@ -224,6 +240,10 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	int ret;
 	struct drm_gem_shmem_object *shmem;
 	struct panthor_gem_object *bo;
+#ifdef CONFIG_DEBUG_FS
+	struct panthor_device *ptdev =
+		container_of(ddev, struct panthor_device, base);
+#endif
 
 	shmem = drm_gem_shmem_create(ddev, *size);
 	if (IS_ERR(shmem))
@@ -249,6 +269,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
+#ifdef CONFIG_DEBUG_FS
+	mutex_lock(&ptdev->gems_lock);
+	list_add_tail(&bo->gems_node, &ptdev->gems);
+	mutex_unlock(&ptdev->gems_lock);
+#endif
+
 	return ret;
 }
 
@@ -265,3 +291,78 @@ panthor_gem_label_bo(struct drm_gem_object *obj, const char *label)
 
 	kfree(old_label);
 }
+
+#ifdef CONFIG_DEBUG_FS
+static bool panfrost_gem_print_flag(const char *name,
+				    bool is_set,
+				    bool other_flags_printed,
+				    struct seq_file *m)
+{
+	if (is_set)
+		seq_printf(m, "%s%s", other_flags_printed ? "," : "", name);
+
+	return is_set | other_flags_printed;
+}
+
+void panthor_gem_print_objects(struct panthor_device *ptdev,
+				struct seq_file *m)
+{
+	size_t total = 0, total_resident = 0, total_reclaimable = 0;
+	struct panthor_gem_object *bo;
+
+	seq_puts(m, "created-by                      global-name     refcount        size            resident-size   file-offset     flags           label\n");
+	seq_puts(m, "------------------------------------------------------------------------------------------------------------------------------------------------\n");
+
+	mutex_lock(&ptdev->gems_lock);
+	list_for_each_entry(bo, &ptdev->gems, gems_node) {
+		unsigned int refcount = kref_read(&bo->base.base.refcount);
+		char creator_info[32] = {};
+		bool has_flags = false;
+		size_t resident_size;
+
+		/* Skip BOs being destroyed. */
+		if (!refcount)
+			continue;
+
+		resident_size = bo->base.pages != NULL ? bo->base.base.size : 0;
+
+		snprintf(creator_info, sizeof(creator_info),
+			 "%s/%d", bo->creator.process_name, bo->creator.tgid);
+		seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
+			   creator_info,
+			   bo->base.base.name,
+			   refcount,
+			   bo->base.base.size,
+			   resident_size,
+			   drm_vma_node_start(&bo->base.base.vma_node));
+
+		seq_puts(m, "(");
+		has_flags = panfrost_gem_print_flag("imported", bo->base.base.import_attach != NULL,
+						    has_flags, m);
+		has_flags = panfrost_gem_print_flag("exported", bo->base.base.dma_buf != NULL,
+						    has_flags, m);
+		if (bo->base.madv < 0)
+			has_flags = panfrost_gem_print_flag("purged", true, has_flags, m);
+		else if (bo->base.madv > 0)
+			has_flags = panfrost_gem_print_flag("purgeable", true, has_flags, m);
+		if (!has_flags)
+			seq_puts(m, "none");
+		seq_puts(m, ")");
+
+		mutex_lock(&bo->label_lock);
+		seq_printf(m, "%-16s%-60s", "", bo->label ? : NULL);
+		mutex_unlock(&bo->label_lock);
+		seq_puts(m, "\n");
+
+		total += bo->base.base.size;
+		total_resident += resident_size;
+		if (bo->base.madv > 0)
+			total_reclaimable += resident_size;
+	}
+	mutex_unlock(&ptdev->gems_lock);
+
+	seq_puts(m, "================================================================================================================================================\n");
+	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
+		   total, total_resident, total_reclaimable);
+}
+#endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index da9268d24566..c0be30434b34 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -55,6 +55,23 @@ struct panthor_gem_object {
 
 	/** @label_lock: Lock that protects access to the @label field. */
 	struct mutex label_lock;
+
+#ifdef CONFIG_DEBUG_FS
+	/**
+	 * @gems_node: Node used to insert the object in the device-wide list of
+	 * GEM objects, to display information about it through a DebugFS file.
+	 */
+	struct list_head gems_node;
+
+	/** @creator: Information about the UM process which created the GEM. */
+	struct {
+		/** @process_name: Group leader name in owning thread's process */
+		char process_name[TASK_COMM_LEN];
+
+		/** @tgid: PID of the thread's group leader within its process */
+		pid_t tgid;
+	} creator;
+#endif
 };
 
 /**
@@ -150,4 +167,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_gem_print_objects(struct panthor_device *pfdev,
+			       struct seq_file *m);
+#endif
+
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.48.1

