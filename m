Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B79956B0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00910E237;
	Tue,  8 Oct 2024 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYPUdSkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6885A10E139
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412539; x=1759948539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wcVQHgu0ANeHR4UYpWHs2sNLqJA/YG+05getslSrXfE=;
 b=DYPUdSkIyfIbvdpAIDk4EljVAhmzvejXD6yvIgJkhPbh32Gs1TzZPpKj
 01gWZ7xhR5+Jm4V1oLr6TfY1KOY32O42NO3sI7gfqntptAJfzwsU3xksl
 ud7zJjBn+Jx5k3GpJS8nDhi+6RPvsWeRDnwRgwRF8Ghw2SJr1TS3NflqF
 EXKn9ZpNqNLWvEUC+fLKYrAIepeYDRTy9b/cPMqwSSKq+QgZljGpf398g
 fpSVtTkUPWRvKz3JKgl/PZ+aIDVSXrOsxJoPVG9nboEoQGeI26SnxAjdo
 KkJMi6RwTGYljRfiU16By3QcnMjCZ0aP2WB/s32TysqJY6Gl8SBIu76RW g==;
X-CSE-ConnectionGUID: VBQWWYS3Qu6dba9n8HNoUQ==
X-CSE-MsgGUID: Q+qIhY03SVaeRHxDGxipiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38295335"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38295335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:38 -0700
X-CSE-ConnectionGUID: A9Fd8u2BQsyq0fW1dgvljw==
X-CSE-MsgGUID: dkoM+u6tRHGfQ3RHWy9y6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80530907"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.125.110.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/5] perf: Add dummy pmu module
Date: Tue,  8 Oct 2024 13:34:57 -0500
Message-ID: <20241008183501.1354695-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008183501.1354695-1-lucas.demarchi@intel.com>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
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

Simple dummy module that mimics what can be done with drivers to
bind/unbind them from the bus, which should trigger resource release.

This is mostly based on how i915 and (pending changes for) xe drivers
are interacting with perf pmu. A few differences due to not having
backing hardware or for simplicity:

	- Instead of using BDF for bind/unbind, use a single number.
	- Unbind is triggered either via debugfs or when removing the
	  module.
	- event::destroy() is always assigned as there should only be a
	  few additional calls

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 kernel/events/Makefile    |   1 +
 kernel/events/dummy_pmu.c | 426 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 427 insertions(+)
 create mode 100644 kernel/events/dummy_pmu.c

diff --git a/kernel/events/Makefile b/kernel/events/Makefile
index 91a62f566743..2993fed2d091 100644
--- a/kernel/events/Makefile
+++ b/kernel/events/Makefile
@@ -4,3 +4,4 @@ obj-y := core.o ring_buffer.o callchain.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT) += hw_breakpoint.o
 obj-$(CONFIG_HW_BREAKPOINT_KUNIT_TEST) += hw_breakpoint_test.o
 obj-$(CONFIG_UPROBES) += uprobes.o
+obj-m += dummy_pmu.o
diff --git a/kernel/events/dummy_pmu.c b/kernel/events/dummy_pmu.c
new file mode 100644
index 000000000000..cdba3a831e4a
--- /dev/null
+++ b/kernel/events/dummy_pmu.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#define pr_fmt(fmt) "%s: " fmt, KBUILD_MODNAME
+
+#include <linux/debugfs.h>
+#include <linux/init.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/perf_event.h>
+#include <linux/random.h>
+#include <linux/seq_file.h>
+#include <linux/types.h>
+
+struct dummy_mod {
+	struct dentry *debugfs_root;
+
+	struct list_head device_list;
+	struct mutex mutex;
+};
+
+struct dummy_pmu {
+	struct pmu base;
+	char *name;
+	bool registered;
+};
+
+struct dummy_device {
+	unsigned int instance;
+	struct kref refcount;
+	struct list_head mod_entry;
+	struct dummy_pmu pmu;
+};
+
+static struct dummy_mod dm;
+
+static void device_release(struct kref *ref);
+
+static struct dummy_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, struct dummy_pmu, base);
+}
+
+static struct dummy_device *pmu_to_device(struct dummy_pmu *pmu)
+{
+	return container_of(pmu, struct dummy_device, pmu);
+}
+
+static ssize_t dummy_pmu_events_sysfs_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *page)
+{
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
+
+	return sprintf(page, "event=0x%04llx\n", pmu_attr->id);
+}
+
+#define DUMMY_PMU_EVENT_ATTR(name, config)				\
+	PMU_EVENT_ATTR_ID(name, dummy_pmu_events_sysfs_show, config)
+
+PMU_FORMAT_ATTR(event, "config:0-63");
+
+#define DUMMY1_CONFIG 0x01
+#define DUMMY2_CONFIG 0x02
+
+static struct attribute *dummy_pmu_event_attrs[] = {
+	DUMMY_PMU_EVENT_ATTR(test-event-1, DUMMY1_CONFIG),
+	DUMMY_PMU_EVENT_ATTR(test-event-2, DUMMY2_CONFIG),
+	NULL,
+};
+
+static struct attribute *dummy_pmu_format_attrs[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+static const struct attribute_group dummy_pmu_events_attr_group = {
+	.name = "events",
+	.attrs = dummy_pmu_event_attrs,
+};
+static const struct attribute_group dummy_pmu_format_attr_group = {
+	.name = "format",
+	.attrs = dummy_pmu_format_attrs,
+};
+static const struct attribute_group *attr_groups[] = {
+	&dummy_pmu_format_attr_group,
+	&dummy_pmu_events_attr_group,
+	NULL,
+};
+
+static void dummy_pmu_event_destroy(struct perf_event *event)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+	struct dummy_device *d = pmu_to_device(pmu);
+
+	kref_put(&d->refcount, device_release);
+}
+
+static int dummy_pmu_event_init(struct perf_event *event)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+	struct dummy_device *d = pmu_to_device(pmu);
+
+	if (!pmu->registered)
+		return -ENODEV;
+
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	/* unsupported modes and filters */
+	if (event->attr.sample_period) /* no sampling */
+		return -EINVAL;
+
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	if (event->cpu < 0)
+		return -EINVAL;
+
+	/* Event keeps a ref to maintain PMU allocated, even if it's unregistered */
+	kref_get(&d->refcount);
+	event->destroy = dummy_pmu_event_destroy;
+
+	return 0;
+}
+
+static void dummy_pmu_event_start(struct perf_event *event, int flags)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+
+	if (!pmu->registered)
+		return;
+
+	event->hw.state = 0;
+}
+
+static void dummy_pmu_event_read(struct perf_event *event)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+	u8 buf;
+
+	if (!pmu->registered) {
+		event->hw.state = PERF_HES_STOPPED;
+		return;
+	}
+
+	get_random_bytes(&buf, 1);
+	buf %= 10;
+
+	switch (event->attr.config & 0xf) {
+	case DUMMY1_CONFIG:
+		break;
+	case DUMMY2_CONFIG:
+		buf *= 2;
+		break;
+	}
+
+	local64_add(buf, &event->count);
+}
+
+static void dummy_pmu_event_stop(struct perf_event *event, int flags)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+
+	if (!pmu->registered)
+		goto out;
+
+	if (flags & PERF_EF_UPDATE)
+		dummy_pmu_event_read(event);
+
+out:
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static int dummy_pmu_event_add(struct perf_event *event, int flags)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+
+	if (!pmu->registered)
+		return -ENODEV;
+
+	if (flags & PERF_EF_START)
+		dummy_pmu_event_start(event, flags);
+
+	return 0;
+
+}
+
+static void dummy_pmu_event_del(struct perf_event *event, int flags)
+{
+	dummy_pmu_event_stop(event, PERF_EF_UPDATE);
+}
+
+static int device_init(struct dummy_device *d)
+{
+	int ret;
+
+	d->pmu.base = (struct pmu){
+		.attr_groups	= attr_groups,
+		.module		= THIS_MODULE,
+		.task_ctx_nr	= perf_invalid_context,
+		.event_init	= dummy_pmu_event_init,
+		.add		= dummy_pmu_event_add,
+		.del		= dummy_pmu_event_del,
+		.start		= dummy_pmu_event_start,
+		.stop		= dummy_pmu_event_stop,
+		.read		= dummy_pmu_event_read,
+	};
+
+	d->pmu.name = kasprintf(GFP_KERNEL, "dummy_pmu_%u", d->instance);
+	if (!d->pmu.name)
+		return -ENOMEM;
+
+	ret = perf_pmu_register(&d->pmu.base, d->pmu.name, -1);
+	if (ret)
+		return ret;
+
+	d->pmu.registered = true;
+	pr_info("Device registered: %s\n", d->pmu.name);
+
+	return 0;
+}
+
+static void device_exit(struct dummy_device *d)
+{
+	d->pmu.registered = false;
+	perf_pmu_unregister(&d->pmu.base);
+
+	pr_info("Device released: %s\n", d->pmu.name);
+}
+
+static void device_release(struct kref *ref)
+{
+	struct dummy_device *d = container_of(ref, struct dummy_device, refcount);
+
+	kfree(d->pmu.name);
+	kfree(d);
+}
+
+static struct dummy_device *find_device_locked(struct dummy_mod *m, unsigned int instance)
+{
+	struct dummy_device *d;
+
+	list_for_each_entry(d, &m->device_list, mod_entry)
+		if (d->instance == instance)
+			return d;
+
+	return NULL;
+}
+
+static int dummy_add_device(struct dummy_mod *m, unsigned int instance)
+{
+	struct dummy_device *d, *d2;
+	int ret = 0;
+
+	mutex_lock(&m->mutex);
+	d = find_device_locked(m, instance);
+	mutex_unlock(&m->mutex);
+	if (d)
+		return -EINVAL;
+
+	d = kcalloc(1, sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+
+	kref_init(&d->refcount);
+	d->instance = instance;
+
+	ret = device_init(d);
+	if (ret < 0)
+		goto fail_put;
+
+	mutex_lock(&m->mutex);
+	d2 = find_device_locked(m, instance);
+	if (d2) {
+		mutex_unlock(&m->mutex);
+		ret = -EINVAL;
+		goto fail_exit;
+	}
+	list_add(&d->mod_entry, &m->device_list);
+	mutex_unlock(&m->mutex);
+
+	return 0;
+
+fail_exit:
+	device_exit(d);
+fail_put:
+	kref_put(&d->refcount, device_release);
+	return ret;
+}
+
+static int dummy_del_device(struct dummy_mod *m, unsigned int instance)
+{
+	struct dummy_device *d, *found = NULL;
+
+	mutex_lock(&m->mutex);
+	list_for_each_entry(d, &m->device_list, mod_entry) {
+		if (d->instance == instance) {
+			list_del(&d->mod_entry);
+			found = d;
+			break;
+		}
+	}
+	mutex_unlock(&m->mutex);
+
+	if (!found)
+		return -EINVAL;
+
+	device_exit(found);
+	kref_put(&found->refcount, device_release);
+
+	return 0;
+}
+
+static int parse_device(const char __user *ubuf, size_t size, u32 *instance)
+{
+	char buf[16];
+	ssize_t len;
+
+	if (size > sizeof(buf) - 1)
+		return -E2BIG;
+
+	len = strncpy_from_user(buf, ubuf, sizeof(buf));
+	if (len < 0 || len >= sizeof(buf) - 1)
+		return -E2BIG;
+
+	if (kstrtou32(buf, 0, instance))
+		return -EINVAL;
+
+	return size;
+}
+
+static int bind_show(struct seq_file *s, void *unused)
+{
+	struct dummy_mod *m = s->private;
+	struct dummy_device *d;
+
+	mutex_lock(&m->mutex);
+	list_for_each_entry(d, &m->device_list, mod_entry)
+		seq_printf(s, "%u\n", d->instance);
+	mutex_unlock(&m->mutex);
+
+	return 0;
+}
+
+static ssize_t bind_write(struct file *f, const char __user *ubuf,
+			  size_t size, loff_t *pos)
+{
+	struct dummy_mod *m = file_inode(f)->i_private;
+	u32 instance;
+	ssize_t ret;
+
+	ret = parse_device(ubuf, size, &instance);
+	if (ret < 0)
+		return ret;
+
+	ret = dummy_add_device(m, instance);
+	if (ret < 0)
+		return ret;
+
+	return size;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(bind);
+
+static int unbind_show(struct seq_file *s, void *unused)
+{
+	return -EPERM;
+}
+
+static ssize_t unbind_write(struct file *f, const char __user *ubuf,
+			    size_t size, loff_t *pos)
+{
+	struct dummy_mod *m = file_inode(f)->i_private;
+	unsigned int instance;
+	ssize_t ret;
+
+	ret = parse_device(ubuf, size, &instance);
+	if (ret < 0)
+		return ret;
+
+	ret = dummy_del_device(m, instance);
+	if (ret < 0)
+		return ret;
+
+	return size;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(unbind);
+
+static int __init dummy_init(void)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
+	debugfs_create_file("bind", 0600, dir, &dm, &bind_fops);
+	debugfs_create_file("unbind", 0200, dir, &dm, &unbind_fops);
+
+	dm.debugfs_root = dir;
+	INIT_LIST_HEAD(&dm.device_list);
+	mutex_init(&dm.mutex);
+
+	return 0;
+}
+
+static void dummy_exit(void)
+{
+	struct dummy_device *d, *tmp;
+
+	debugfs_remove_recursive(dm.debugfs_root);
+
+	mutex_lock(&dm.mutex);
+	list_for_each_entry_safe(d, tmp, &dm.device_list, mod_entry) {
+		device_exit(d);
+		kref_put(&d->refcount, device_release);
+	}
+	mutex_unlock(&dm.mutex);
+}
+
+module_init(dummy_init);
+module_exit(dummy_exit);
+
+MODULE_AUTHOR("Lucas De Marchi <lucas.demarchi@intel.com>");
+MODULE_LICENSE("GPL");
-- 
2.46.2

