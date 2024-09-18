Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8FC97B9A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 10:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662D810E18A;
	Wed, 18 Sep 2024 08:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="lHkVF0ht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3810E18A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 08:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726649647; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SJRn11XEnlanBSLP6sC6TyydwVCQ7DYRENByuQGuJ+MfT1y8n0nk/fsTKL+uCidVfbOx9krD2QJpCFhrZbdVLIBXwiM47n+BgYy9GhUQPiOdleaQGliEaNH+/PHGgrAboRnpMQwfEhzYYwb4ohFH88cpdoEr5P1IuwV/cYtKukk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726649647;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dllsse1ukskOvEmQg/58+68rmkSOqjApie4FUwPoeJ8=; 
 b=g5T/SE9hQRiTWOlBVkeNbZX6BZgvWjzdFZq/PlcHDfr8Wrozv4aD3i+CWpO2vcHXIfJs162KgW8HBsuYBWchqNeGsDAE9qZCJvT37oj0427KRYUjgcRv37cEENNhea5ZbfM0xmRQAN7WLrQMmJydRPbVBOVgUdZGtbbKRvynA0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726649647; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dllsse1ukskOvEmQg/58+68rmkSOqjApie4FUwPoeJ8=;
 b=lHkVF0ht7fLVQf0t/YOZqEqBad2J9SXtJvsiDvvYlPQNePJDCHW0noZeQe1Z0bXD
 PVF4y+oLCkybyeuIKiRS9MP6MAf9XALc9PF38oEMOGCBRyVYC+0E0CgNK8QP1QcujUn
 3sw9y0Vsnt+b6nuoh0SXqrigbsvdKwN+uy7Q3lLM=
Received: by mx.zohomail.com with SMTPS id 1726649646092669.3219050924438;
 Wed, 18 Sep 2024 01:54:06 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/panthor: Expose scheduler groups info in debugfs
Date: Wed, 18 Sep 2024 10:50:56 +0200
Message-ID: <20240918085056.24422-4-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918085056.24422-2-mary.guillemard@collabora.com>
References: <20240918085056.24422-2-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This adds a new debugfs file named "sched_groups" allowing a user to
query information about all userspace clients scheduler groups.

As we uses drm_device.filelist to achieve it, we also expose the
client_id with the task information to differentiate one client
from another inside the same task.

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   |   1 +
 drivers/gpu/drm/panthor/panthor_sched.c | 127 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h |   4 +
 3 files changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 0d825d63d712..aa390597d355 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1450,6 +1450,7 @@ static const struct file_operations panthor_drm_driver_fops = {
 static void panthor_debugfs_init(struct drm_minor *minor)
 {
 	panthor_mmu_debugfs_init(minor);
+	panthor_sched_debugfs_init(minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index f15abeef4ece..0c1ddbfbe164 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 /* Copyright 2023 Collabora ltd. */
 
+#include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_gem_shmem_helper.h>
@@ -3581,3 +3582,129 @@ int panthor_sched_init(struct panthor_device *ptdev)
 	ptdev->scheduler = sched;
 	return 0;
 }
+
+#ifdef CONFIG_DEBUG_FS
+static const char *panthor_csg_priority_names[PANTHOR_CSG_PRIORITY_COUNT] = {
+	"LOW",
+	"MEDIUM",
+	"HIGH",
+	"REALTIME"
+};
+
+static const char *panthor_group_state_names[PANTHOR_CS_GROUP_UNKNOWN_STATE] = {
+	"CREATED",
+	"ACTIVE",
+	"SUSPENDED",
+	"TERMINATED"
+};
+
+static void show_panthor_queue(const struct panthor_queue *queue,
+			       u32 queue_index,
+			       struct seq_file *m)
+{
+	seq_printf(m, "queue %u:", queue_index);
+	seq_printf(m, " priority %u", queue->priority);
+	seq_printf(m, " doorbell_id %d", queue->doorbell_id);
+	seq_puts(m, "\n");
+}
+
+static void show_panthor_group(struct panthor_group *group,
+			       u32 group_handle,
+			       struct seq_file *m)
+{
+	u32 i;
+
+	group_get(group);
+
+	seq_printf(m, "group %u:", group_handle);
+	seq_printf(m, " priority %s", group->priority < PANTHOR_CSG_PRIORITY_COUNT ?
+		   panthor_csg_priority_names[group->priority] : "UNKNOWN");
+	seq_printf(m, " state %s", group->state < PANTHOR_CS_GROUP_UNKNOWN_STATE ?
+		   panthor_group_state_names[group->state] : "UNKNOWN");
+	seq_printf(m, " csg_id %d", group->csg_id);
+	seq_printf(m, " csg_priority %d", group->csg_priority);
+	seq_printf(m, " compute_core_mask 0x%016llx", group->compute_core_mask);
+	seq_printf(m, " fragment_core_mask 0x%016llx", group->fragment_core_mask);
+	seq_printf(m, " tiler_core_mask 0x%016llx", group->tiler_core_mask);
+	seq_printf(m, " max_compute_cores %d", group->max_compute_cores);
+	seq_printf(m, " max_fragment_cores %d", group->max_fragment_cores);
+	seq_printf(m, " max_tiler_cores %d", group->max_tiler_cores);
+	seq_puts(m, "\n");
+
+	for (i = 0; i < group->queue_count; i++)
+		show_panthor_queue(group->queues[i], i, m);
+
+	group_put(group);
+}
+
+static int show_file_group_pool(const struct panthor_file *pfile, struct seq_file *m)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return 0;
+
+	xa_for_each(&gpool->xa, i, group)
+		show_panthor_group(group, i, m);
+
+	return 0;
+}
+
+static int show_each_file(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	int (*show)(const struct panthor_file *, struct seq_file *) = node->info_ent->data;
+	struct drm_file *file;
+	int ret;
+
+	ret = mutex_lock_interruptible(&ddev->filelist_mutex);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(file, &ddev->filelist, lhead) {
+		struct task_struct *task;
+		struct panthor_file *pfile = file->driver_priv;
+		struct pid *pid;
+
+		/*
+		 * Although we have a valid reference on file->pid, that does
+		 * not guarantee that the task_struct who called get_pid() is
+		 * still alive (e.g. get_pid(current) => fork() => exit()).
+		 * Therefore, we need to protect this ->comm access using RCU.
+		 */
+		rcu_read_lock();
+		pid = rcu_dereference(file->pid);
+		task = pid_task(pid, PIDTYPE_TGID);
+		seq_printf(m, "client_id %8llu pid %8d command %s:\n", file->client_id,
+			   pid_nr(pid), task ? task->comm : "<unknown>");
+		rcu_read_unlock();
+
+		ret = show(pfile, m);
+		if (ret < 0)
+			break;
+
+		seq_puts(m, "\n");
+	}
+
+	mutex_unlock(&ddev->filelist_mutex);
+	return ret;
+}
+
+static struct drm_info_list panthor_sched_debugfs_list[] = {
+	{ "sched_groups", show_each_file, 0, show_file_group_pool },
+};
+
+/**
+ * panthor_sched_debugfs_init() - Initialize scheduler debugfs entries
+ * @minor: Minor.
+ */
+void panthor_sched_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(panthor_sched_debugfs_list,
+				 ARRAY_SIZE(panthor_sched_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+#endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 3a30d2328b30..577239aa66bf 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -47,4 +47,8 @@ void panthor_sched_resume(struct panthor_device *ptdev);
 void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
 void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_sched_debugfs_init(struct drm_minor *minor);
+#endif
+
 #endif
-- 
2.46.0

