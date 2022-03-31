Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E94EDB37
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3989115;
	Thu, 31 Mar 2022 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6B710F234;
 Thu, 31 Mar 2022 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735458; x=1680271458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W2A2KVAd7dam9mGbLllRuGBoxc9d9am1UTZhrjI5kg0=;
 b=jnA6C1y77nzC2lve7n92i4dWRUQzZ9ODQgyPNo57LCXYVDIxxXMI2wBa
 sopDp7xnXyHNTaYjhHyAWkua/E6U8ArLvWWXvmD3OODbe6TsUuudE6igH
 pLxcv0x1lbm7ZOpNZbyYp7hfCbl5OHFxaDwS75E8qOl4NVT6ljfTXDLe+
 d92v9b8P96Q4da34EL0PsGO48l+ixqIS1gm87tMWN5zzSx2JpkqjwNOXw
 K5HSIkqVZiUx45NkBzOKRF1IK0fUO9Nzyf9aLEeC9H3lHxtjdZ3XDx5ki
 xQJOCPNy18FW3DcgnaJdeDYbkXnQZr9qs6l1No4IN+m8QjD+FAZDdzWne g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260027234"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260027234"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547347235"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:04 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/12] lib: Extract igt_drm_clients from intel_gpu_top
Date: Thu, 31 Mar 2022 15:03:40 +0100
Message-Id: <20220331140348.2985832-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Code movement with some improvements to prepare for further work in
making a vendor agnostic gputop tool possible.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 386 +++++++++++++++++++++++++++++++
 lib/igt_drm_clients.h | 102 +++++++++
 lib/meson.build       |   8 +
 tools/intel_gpu_top.c | 516 ++++++------------------------------------
 tools/meson.build     |   2 +-
 5 files changed, 570 insertions(+), 444 deletions(-)
 create mode 100644 lib/igt_drm_clients.c
 create mode 100644 lib/igt_drm_clients.h

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
new file mode 100644
index 000000000000..58d82648d821
--- /dev/null
+++ b/lib/igt_drm_clients.c
@@ -0,0 +1,386 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <dirent.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <strings.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "igt_drm_clients.h"
+#include "igt_drm_fdinfo.h"
+
+struct igt_drm_clients *igt_drm_clients_init(void *private_data)
+{
+	struct igt_drm_clients *clients;
+
+	clients = malloc(sizeof(*clients));
+	if (!clients)
+		return NULL;
+
+	memset(clients, 0, sizeof(*clients));
+
+	clients->private_data = private_data;
+
+	return clients;
+}
+
+struct igt_drm_client *
+igt_drm_clients_find(struct igt_drm_clients *clients,
+		     enum igt_drm_client_status status,
+		     unsigned int id)
+{
+	unsigned int start, num;
+	struct igt_drm_client *c;
+
+	start = status == IGT_DRM_CLIENT_FREE ? clients->active_clients : 0; /* Free block at the end. */
+	num = clients->num_clients - start;
+
+	for (c = &clients->client[start]; num; c++, num--) {
+		if (status != c->status)
+			continue;
+
+		if (status == IGT_DRM_CLIENT_FREE || c->id == id)
+			return c;
+	}
+
+	return NULL;
+}
+
+void
+igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
+		      uint64_t val[16])
+{
+	unsigned int i;
+
+	if (c->pid != pid)
+		c->pid = pid;
+
+	if (strcmp(c->name, name)) {
+		char *p;
+
+		strncpy(c->name, name, sizeof(c->name) - 1);
+		strncpy(c->print_name, name, sizeof(c->print_name) - 1);
+
+		p = c->print_name;
+		while (*p) {
+			if (!isprint(*p))
+				*p = '*';
+			p++;
+		}
+	}
+
+	c->last_runtime = 0;
+	c->total_runtime = 0;
+
+	for (i = 0; i < c->clients->num_classes; i++) {
+		if (val[i] < c->last[i])
+			continue; /* It will catch up soon. */
+
+		c->total_runtime += val[i];
+		c->val[i] = val[i] - c->last[i];
+		c->last_runtime += c->val[i];
+		c->last[i] = val[i];
+	}
+
+	c->samples++;
+	c->status = IGT_DRM_CLIENT_ALIVE;
+}
+
+void
+igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
+		   unsigned int pid, char *name, uint64_t busy[16])
+{
+	struct igt_drm_client *c;
+
+	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, id));
+
+	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0);
+	if (!c) {
+		unsigned int idx = clients->num_clients;
+
+		clients->num_clients += (clients->num_clients + 2) / 2;
+		clients->client = realloc(clients->client,
+					  clients->num_clients * sizeof(*c));
+		assert(clients->client);
+
+		c = &clients->client[idx];
+		memset(c, 0, (clients->num_clients - idx) * sizeof(*c));
+	}
+
+	c->id = id;
+	c->clients = clients;
+	c->val = calloc(clients->num_classes, sizeof(c->val));
+	c->last = calloc(clients->num_classes, sizeof(c->last));
+	assert(c->val && c->last);
+
+	igt_drm_client_update(c, pid, name, busy);
+}
+
+void igt_drm_client_free(struct igt_drm_client *c)
+{
+	free(c->val);
+	free(c->last);
+	memset(c, 0, sizeof(*c));
+}
+
+struct igt_drm_clients *
+igt_drm_clients_sort(struct igt_drm_clients *clients,
+		     int (*cmp)(const void *, const void *))
+{
+	unsigned int active, free;
+	struct igt_drm_client *c;
+	int tmp;
+
+	if (!clients)
+		return clients;
+
+	qsort(clients->client, clients->num_clients, sizeof(*clients->client),
+	      cmp);
+
+	/* Trim excessive array space. */
+	active = 0;
+	igt_for_each_drm_client(clients, c, tmp) {
+		if (c->status != IGT_DRM_CLIENT_ALIVE)
+			break; /* Active clients are first in the array. */
+		active++;
+	}
+
+	clients->active_clients = active;
+
+	free = clients->num_clients - active;
+	if (free > clients->num_clients / 2) {
+		active = clients->num_clients - free / 2;
+		if (active != clients->num_clients) {
+			clients->num_clients = active;
+			clients->client = realloc(clients->client,
+						  clients->num_clients *
+						  sizeof(*c));
+		}
+	}
+
+	return clients;
+}
+
+void igt_drm_clients_free(struct igt_drm_clients *clients)
+{
+	struct igt_drm_client *c;
+	unsigned int tmp;
+
+	igt_for_each_drm_client(clients, c, tmp)
+		igt_drm_client_free(c);
+
+	free(clients->client);
+	free(clients);
+}
+
+static DIR *opendirat(int at, const char *name)
+{
+	DIR *dir;
+	int fd;
+
+	fd = openat(at, name, O_DIRECTORY);
+	if (fd < 0)
+		return NULL;
+
+	dir = fdopendir(fd);
+	if (!dir)
+		close(fd);
+
+	return dir;
+}
+
+static size_t readat2buf(char *buf, const size_t sz, int at, const char *name)
+{
+	size_t count;
+	int fd;
+
+	fd = openat(at, name, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	buf[sz - 1] = 0;
+	count = read(fd, buf, sz);
+	close(fd);
+
+	return count;
+}
+
+static bool get_task_name(const char *buffer, char *out, unsigned long sz)
+{
+	char *s = index(buffer, '(');
+	char *e = rindex(buffer, ')');
+	unsigned int len;
+
+	if (!s || !e)
+		return false;
+
+	len = --e - ++s + 1;
+	if(!len || (len + 1) >= sz)
+		return false;
+
+	strncpy(out, s, len);
+	out[len] = 0;
+
+	return true;
+}
+
+static bool is_drm_fd(int fd_dir, const char *name)
+{
+	struct stat stat;
+	int ret;
+
+	ret = fstatat(fd_dir, name, &stat, 0);
+
+	return ret == 0 &&
+	       (stat.st_mode & S_IFMT) == S_IFCHR &&
+	       major(stat.st_rdev) == 226;
+}
+
+struct igt_drm_clients *
+igt_drm_clients_scan(struct igt_drm_clients *clients,
+		     bool (*filter_client)(const struct igt_drm_clients *,
+					   const struct drm_client_fdinfo *))
+{
+	struct dirent *proc_dent;
+	struct igt_drm_client *c;
+	DIR *proc_dir;
+	int tmp;
+
+	if (!clients)
+		return clients;
+
+	igt_for_each_drm_client(clients, c, tmp) {
+		assert(c->status != IGT_DRM_CLIENT_PROBE);
+		if (c->status == IGT_DRM_CLIENT_ALIVE)
+			c->status = IGT_DRM_CLIENT_PROBE;
+		else
+			break; /* Free block at the end of array. */
+	}
+
+	proc_dir = opendir("/proc");
+	if (!proc_dir)
+		return clients;
+
+	while ((proc_dent = readdir(proc_dir)) != NULL) {
+		int pid_dir = -1, fd_dir = -1;
+		struct dirent *fdinfo_dent;
+		char client_name[64] = { };
+		unsigned int client_pid;
+		DIR *fdinfo_dir = NULL;
+		char buf[4096];
+		size_t count;
+
+		if (proc_dent->d_type != DT_DIR)
+			continue;
+		if (!isdigit(proc_dent->d_name[0]))
+			continue;
+
+		pid_dir = openat(dirfd(proc_dir), proc_dent->d_name,
+				 O_DIRECTORY | O_RDONLY);
+		if (pid_dir < 0)
+			continue;
+
+		count = readat2buf(buf, sizeof(buf), pid_dir, "stat");
+		if (!count)
+			goto next;
+
+		client_pid = atoi(buf);
+		if (!client_pid)
+			goto next;
+
+		if (!get_task_name(buf, client_name, sizeof(client_name)))
+			goto next;
+
+		fd_dir = openat(pid_dir, "fd", O_DIRECTORY | O_RDONLY);
+		if (fd_dir < 0)
+			goto next;
+
+		fdinfo_dir = opendirat(pid_dir, "fdinfo");
+		if (!fdinfo_dir)
+			goto next;
+
+		while ((fdinfo_dent = readdir(fdinfo_dir)) != NULL) {
+			struct drm_client_fdinfo info;
+
+			if (fdinfo_dent->d_type != DT_REG)
+				continue;
+			if (!isdigit(fdinfo_dent->d_name[0]))
+				continue;
+
+			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
+				continue;
+
+			memset(&info, 0, sizeof(info));
+
+			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
+						    fdinfo_dent->d_name,
+						    &info))
+				continue;
+
+			if (filter_client && !filter_client(clients, &info))
+				continue;
+
+			if (igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
+						info.id))
+				continue; /* Skip duplicate fds. */
+
+			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
+						info.id);
+			if (!c)
+				igt_drm_client_add(clients, info.id, client_pid,
+						   client_name, info.busy);
+			else
+				igt_drm_client_update(c, client_pid,
+						      client_name, info.busy);
+		}
+
+next:
+		if (fdinfo_dir)
+			closedir(fdinfo_dir);
+		if (fd_dir >= 0)
+			close(fd_dir);
+		if (pid_dir >= 0)
+			close(pid_dir);
+	}
+
+	closedir(proc_dir);
+
+	igt_for_each_drm_client(clients, c, tmp) {
+		if (c->status == IGT_DRM_CLIENT_PROBE)
+			igt_drm_client_free(c);
+		else if (c->status == IGT_DRM_CLIENT_FREE)
+			break;
+	}
+
+	return clients;
+}
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
new file mode 100644
index 000000000000..f52080847291
--- /dev/null
+++ b/lib/igt_drm_clients.h
@@ -0,0 +1,102 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef IGT_DRM_CLIENTS_H
+#define IGT_DRM_CLIENTS_H
+
+#include <stdint.h>
+
+struct drm_client_fdinfo;
+
+enum igt_drm_client_status {
+	IGT_DRM_CLIENT_FREE = 0, /* mbz */
+	IGT_DRM_CLIENT_ALIVE,
+	IGT_DRM_CLIENT_PROBE
+};
+
+struct igt_drm_client_engine_class {
+	unsigned int engine_class;
+	const char *name;
+	unsigned int num_engines;
+};
+
+struct igt_drm_clients;
+
+struct igt_drm_client {
+	struct igt_drm_clients *clients;
+
+	enum igt_drm_client_status status;
+	unsigned int id;
+	unsigned int pid;
+	char name[24];
+	char print_name[24];
+	unsigned int samples;
+	unsigned long total_runtime;
+	unsigned long last_runtime;
+	unsigned long *val;
+	uint64_t *last;
+};
+
+struct igt_drm_clients {
+	unsigned int num_clients;
+	unsigned int active_clients;
+
+	unsigned int num_classes;
+	struct igt_drm_client_engine_class *engine_class;
+
+	void *private_data;
+
+	struct igt_drm_client *client; /* Must be last. */
+};
+
+#define igt_for_each_drm_client(clients, c, tmp) \
+	for ((tmp) = (clients)->num_clients, c = (clients)->client; \
+	     (tmp > 0); (tmp)--, (c)++)
+
+struct igt_drm_clients *igt_drm_clients_init(void *private_data);
+void igt_drm_clients_free(struct igt_drm_clients *clients);
+
+struct igt_drm_clients *
+igt_drm_clients_scan(struct igt_drm_clients *clients,
+		     bool (*filter_client)(const struct igt_drm_clients *,
+					   const struct drm_client_fdinfo *));
+
+struct igt_drm_client *
+igt_drm_clients_find(struct igt_drm_clients *clients,
+		     enum igt_drm_client_status status,
+		     unsigned int id);
+
+struct igt_drm_clients *
+igt_drm_clients_sort(struct igt_drm_clients *clients,
+		     int (*cmp)(const void *, const void *));
+
+void igt_drm_client_update(struct igt_drm_client *c,
+			   unsigned int pid, char *name, uint64_t val[16]);
+
+void igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
+			unsigned int pid, char *name, uint64_t busy[16]);
+
+void igt_drm_client_free(struct igt_drm_client *c);
+
+#endif /* IGT_DRM_CLIENTS_H */
diff --git a/lib/meson.build b/lib/meson.build
index ccee7a596561..6a1475fdafda 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -18,6 +18,7 @@ lib_sources = [
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
+	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
 	'igt_aux.c',
 	'igt_gt.c',
@@ -219,6 +220,13 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
 				  include_directories : inc)
 
+lib_igt_drm_clients_build = static_library('igt_drm_clients',
+        ['igt_drm_clients.c'],
+        include_directories : inc)
+
+lib_igt_drm_clients = declare_dependency(link_with : lib_igt_drm_clients_build,
+				         include_directories : inc)
+
 lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
 	['igt_drm_fdinfo.c'],
 	include_directories : inc)
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 73815cdea8aa..c4f990b2a7d0 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -46,6 +46,7 @@
 #include <sys/sysmacros.h>
 
 #include "igt_perf.h"
+#include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 
 #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
@@ -80,16 +81,10 @@ struct engine {
 	struct pmu_counter sema;
 };
 
-struct engine_class {
-	unsigned int class;
-	const char *name;
-	unsigned int num_engines;
-};
-
 struct engines {
 	unsigned int num_engines;
 	unsigned int num_classes;
-	struct engine_class *class;
+	struct igt_drm_client_engine_class *class;
 	unsigned int num_counters;
 	DIR *root;
 	int fd;
@@ -638,160 +633,10 @@ static void pmu_sample(struct engines *engines)
 	}
 }
 
-enum client_status {
-	FREE = 0, /* mbz */
-	ALIVE,
-	PROBE
-};
-
-struct clients;
-
-struct client {
-	struct clients *clients;
-
-	enum client_status status;
-	unsigned int id;
-	unsigned int pid;
-	char name[24];
-	char print_name[24];
-	unsigned int samples;
-	unsigned long total_runtime;
-	unsigned long last_runtime;
-	unsigned long *val;
-	uint64_t *last;
-};
-
-struct clients {
-	unsigned int num_clients;
-	unsigned int active_clients;
-
-	unsigned int num_classes;
-	struct engine_class *class;
-
-	char pci_slot[64];
-
-	struct client *client;
-};
-
-#define for_each_client(clients, c, tmp) \
-	for ((tmp) = (clients)->num_clients, c = (clients)->client; \
-	     (tmp > 0); (tmp)--, (c)++)
-
-static struct clients *init_clients(const char *pci_slot)
-{
-	struct clients *clients;
-
-	clients = malloc(sizeof(*clients));
-	if (!clients)
-		return NULL;
-
-	memset(clients, 0, sizeof(*clients));
-
-	strncpy(clients->pci_slot, pci_slot, sizeof(clients->pci_slot));
-
-	return clients;
-}
-
-static struct client *
-find_client(struct clients *clients, enum client_status status, unsigned int id)
-{
-	unsigned int start, num;
-	struct client *c;
-
-	start = status == FREE ? clients->active_clients : 0; /* Free block at the end. */
-	num = clients->num_clients - start;
-
-	for (c = &clients->client[start]; num; c++, num--) {
-		if (status != c->status)
-			continue;
-
-		if (status == FREE || c->id == id)
-			return c;
-	}
-
-	return NULL;
-}
-
-static void
-update_client(struct client *c, unsigned int pid, char *name, uint64_t val[16])
-{
-	unsigned int i;
-
-	if (c->pid != pid)
-		c->pid = pid;
-
-	if (strcmp(c->name, name)) {
-		char *p;
-
-		strncpy(c->name, name, sizeof(c->name) - 1);
-		strncpy(c->print_name, name, sizeof(c->print_name) - 1);
-
-		p = c->print_name;
-		while (*p) {
-			if (!isprint(*p))
-				*p = '*';
-			p++;
-		}
-	}
-
-	c->last_runtime = 0;
-	c->total_runtime = 0;
-
-	for (i = 0; i < c->clients->num_classes; i++) {
-		if (val[i] < c->last[i])
-			continue; /* It will catch up soon. */
-
-		c->total_runtime += val[i];
-		c->val[i] = val[i] - c->last[i];
-		c->last_runtime += c->val[i];
-		c->last[i] = val[i];
-	}
-
-	c->samples++;
-	c->status = ALIVE;
-}
-
-static void
-add_client(struct clients *clients, unsigned int id, unsigned int pid,
-	   char *name, uint64_t busy[16])
-{
-	struct client *c;
-
-	assert(!find_client(clients, ALIVE, id));
-
-	c = find_client(clients, FREE, 0);
-	if (!c) {
-		unsigned int idx = clients->num_clients;
-
-		clients->num_clients += (clients->num_clients + 2) / 2;
-		clients->client = realloc(clients->client,
-					  clients->num_clients * sizeof(*c));
-		assert(clients->client);
-
-		c = &clients->client[idx];
-		memset(c, 0, (clients->num_clients - idx) * sizeof(*c));
-	}
-
-	c->id = id;
-	c->clients = clients;
-	c->val = calloc(clients->num_classes, sizeof(c->val));
-	c->last = calloc(clients->num_classes, sizeof(c->last));
-	assert(c->val && c->last);
-
-	update_client(c, pid, name, busy);
-}
-
-static void free_client(struct client *c)
-{
-	free(c->val);
-	free(c->last);
-	memset(c, 0, sizeof(*c));
-}
-
 static int client_last_cmp(const void *_a, const void *_b)
 {
-	const struct client *a = _a;
-	const struct client *b = _b;
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
 	long tot_a, tot_b;
 
 	/*
@@ -800,8 +645,8 @@ static int client_last_cmp(const void *_a, const void *_b)
 	 * id.
 	 */
 
-	tot_a = a->status == ALIVE ? a->last_runtime : -1;
-	tot_b = b->status == ALIVE ? b->last_runtime : -1;
+	tot_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->last_runtime : -1;
+	tot_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->last_runtime : -1;
 
 	tot_b -= tot_a;
 	if (tot_b > 0)
@@ -814,12 +659,12 @@ static int client_last_cmp(const void *_a, const void *_b)
 
 static int client_total_cmp(const void *_a, const void *_b)
 {
-	const struct client *a = _a;
-	const struct client *b = _b;
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
 	long tot_a, tot_b;
 
-	tot_a = a->status == ALIVE ? a->total_runtime : -1;
-	tot_b = b->status == ALIVE ? b->total_runtime : -1;
+	tot_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->total_runtime : -1;
+	tot_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->total_runtime : -1;
 
 	tot_b -= tot_a;
 	if (tot_b > 0)
@@ -832,12 +677,12 @@ static int client_total_cmp(const void *_a, const void *_b)
 
 static int client_id_cmp(const void *_a, const void *_b)
 {
-	const struct client *a = _a;
-	const struct client *b = _b;
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
 	int id_a, id_b;
 
-	id_a = a->status == ALIVE ? a->id : -1;
-	id_b = b->status == ALIVE ? b->id : -1;
+	id_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->id : -1;
+	id_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->id : -1;
 
 	id_b -= id_a;
 	if (id_b > 0)
@@ -850,12 +695,12 @@ static int client_id_cmp(const void *_a, const void *_b)
 
 static int client_pid_cmp(const void *_a, const void *_b)
 {
-	const struct client *a = _a;
-	const struct client *b = _b;
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
 	int pid_a, pid_b;
 
-	pid_a = a->status == ALIVE ? a->pid : INT_MAX;
-	pid_b = b->status == ALIVE ? b->pid : INT_MAX;
+	pid_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->pid : INT_MAX;
+	pid_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->pid : INT_MAX;
 
 	pid_b -= pid_a;
 	if (pid_b > 0)
@@ -868,56 +713,19 @@ static int client_pid_cmp(const void *_a, const void *_b)
 
 static int (*client_cmp)(const void *, const void *) = client_last_cmp;
 
-static struct clients *sort_clients(struct clients *clients,
-				    int (*cmp)(const void *, const void *))
-{
-	unsigned int active, free;
-	struct client *c;
-	int tmp;
-
-	if (!clients)
-		return clients;
-
-	qsort(clients->client, clients->num_clients, sizeof(*clients->client),
-	      cmp);
-
-	/* Trim excessive array space. */
-	active = 0;
-	for_each_client(clients, c, tmp) {
-		if (c->status != ALIVE)
-			break; /* Active clients are first in the array. */
-		active++;
-	}
-
-	clients->active_clients = active;
-
-	free = clients->num_clients - active;
-	if (free > clients->num_clients / 2) {
-		active = clients->num_clients - free / 2;
-		if (active != clients->num_clients) {
-			clients->num_clients = active;
-			clients->client = realloc(clients->client,
-						  clients->num_clients *
-						  sizeof(*c));
-		}
-	}
-
-	return clients;
-}
-
 static bool aggregate_pids = true;
 
-static struct clients *display_clients(struct clients *clients)
+static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 {
-	struct client *ac, *c, *cp = NULL;
-	struct clients *aggregated;
+	struct igt_drm_client *ac, *c, *cp = NULL;
+	struct igt_drm_clients *aggregated;
 	int tmp, num = 0;
 
 	if (!aggregate_pids)
 		goto out;
 
 	/* Sort by pid first to make it easy to aggregate while walking. */
-	sort_clients(clients, client_pid_cmp);
+	igt_drm_clients_sort(clients, client_pid_cmp);
 
 	aggregated = calloc(1, sizeof(*clients));
 	assert(aggregated);
@@ -926,23 +734,24 @@ static struct clients *display_clients(struct clients *clients)
 	assert(ac);
 
 	aggregated->num_classes = clients->num_classes;
-	aggregated->class = clients->class;
+	aggregated->engine_class = clients->engine_class;
+	aggregated->private_data = clients->private_data;
 	aggregated->client = ac;
 
-	for_each_client(clients, c, tmp) {
+	igt_for_each_drm_client(clients, c, tmp) {
 		unsigned int i;
 
-		if (c->status == FREE)
+		if (c->status == IGT_DRM_CLIENT_FREE)
 			break;
 
-		assert(c->status == ALIVE);
+		assert(c->status == IGT_DRM_CLIENT_ALIVE);
 
 		if ((cp && c->pid != cp->pid) || !cp) {
 			ac = &aggregated->client[num++];
 
 			/* New pid. */
 			ac->clients = aggregated;
-			ac->status = ALIVE;
+			ac->status = IGT_DRM_CLIENT_ALIVE;
 			ac->id = -c->pid;
 			ac->pid = c->pid;
 			strcpy(ac->name, c->name);
@@ -972,213 +781,21 @@ static struct clients *display_clients(struct clients *clients)
 	clients = aggregated;
 
 out:
-	return sort_clients(clients, client_cmp);
+	return igt_drm_clients_sort(clients, client_cmp);
 }
 
-static void free_clients(struct clients *clients)
+static void free_display_clients(struct igt_drm_clients *clients)
 {
-	struct client *c;
-	unsigned int tmp;
+	struct igt_drm_client *c;
+	int tmp;
 
-	for_each_client(clients, c, tmp) {
+	igt_for_each_drm_client(clients, c, tmp)
 		free(c->val);
-		free(c->last);
-	}
 
 	free(clients->client);
 	free(clients);
 }
 
-static bool is_drm_fd(DIR *fd_dir, const char *name)
-{
-	struct stat stat;
-	int ret;
-
-	ret = fstatat(dirfd(fd_dir), name, &stat, 0);
-
-	return ret == 0 &&
-	       (stat.st_mode & S_IFMT) == S_IFCHR &&
-	       major(stat.st_rdev) == 226;
-}
-
-static bool get_task_name(const char *buffer, char *out, unsigned long sz)
-{
-	char *s = index(buffer, '(');
-	char *e = rindex(buffer, ')');
-	unsigned int len;
-
-	if (!s || !e)
-		return false;
-
-	len = --e - ++s + 1;
-	if(!len || (len + 1) >= sz)
-		return false;
-
-	strncpy(out, s, len);
-	out[len] = 0;
-
-	return true;
-}
-
-static DIR *opendirat(DIR *at, const char *name)
-{
-	DIR *dir;
-	int fd;
-
-	fd = openat(dirfd(at), name, O_DIRECTORY);
-	if (fd < 0)
-		return NULL;
-
-	dir = fdopendir(fd);
-	if (!dir)
-		close(fd);
-
-	return dir;
-}
-
-static FILE *fropenat(DIR *at, const char *name)
-{
-	FILE *f;
-	int fd;
-
-	fd = openat(dirfd(at), name, O_RDONLY);
-	if (fd < 0)
-		return NULL;
-
-	f = fdopen(fd, "r");
-	if (!f)
-		close(fd);
-
-	return f;
-}
-
-static size_t freadat2buf(char *buf, const size_t sz, DIR *at, const char *name)
-{
-	size_t count;
-	FILE *f;
-
-	f = fropenat(at, name);
-	if (!f)
-		return 0;
-
-	memset(buf, 0, sz);
-	count = fread(buf, 1, sz, f);
-	fclose(f);
-
-	return count;
-}
-
-static struct clients *scan_clients(struct clients *clients)
-{
-	struct dirent *proc_dent;
-	struct client *c;
-	DIR *proc_dir;
-	int tmp;
-
-	if (!clients)
-		return clients;
-
-	for_each_client(clients, c, tmp) {
-		assert(c->status != PROBE);
-		if (c->status == ALIVE)
-			c->status = PROBE;
-		else
-			break; /* Free block at the end of array. */
-	}
-
-	proc_dir = opendir("/proc");
-	if (!proc_dir)
-		return clients;
-
-	while ((proc_dent = readdir(proc_dir)) != NULL) {
-		DIR *pid_dir = NULL, *fd_dir = NULL, *fdinfo_dir = NULL;
-		struct dirent *fdinfo_dent;
-		char client_name[64] = { };
-		unsigned int client_pid;
-		char buf[4096];
-		size_t count;
-
-		if (proc_dent->d_type != DT_DIR)
-			continue;
-		if (!isdigit(proc_dent->d_name[0]))
-			continue;
-
-		pid_dir = opendirat(proc_dir, proc_dent->d_name);
-		if (!pid_dir)
-			continue;
-
-		count = freadat2buf(buf, sizeof(buf), pid_dir, "stat");
-		if (!count)
-			goto next;
-
-		client_pid = atoi(buf);
-		if (!client_pid)
-			goto next;
-
-		if (!get_task_name(buf, client_name, sizeof(client_name)))
-			goto next;
-
-		fd_dir = opendirat(pid_dir, "fd");
-		if (!fd_dir)
-			goto next;
-
-		fdinfo_dir = opendirat(pid_dir, "fdinfo");
-		if (!fdinfo_dir)
-			goto next;
-
-		while ((fdinfo_dent = readdir(fdinfo_dir)) != NULL) {
-			struct drm_client_fdinfo info = { };
-
-			if (fdinfo_dent->d_type != DT_REG)
-				continue;
-			if (!isdigit(fdinfo_dent->d_name[0]))
-				continue;
-
-			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
-				continue;
-
-			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
-						    fdinfo_dent->d_name,
-						    &info))
-				continue;
-
-			if (strcmp(info.driver, "i915"))
-				continue;
-			if (strcmp(info.pdev, clients->pci_slot))
-				continue;
-			if (find_client(clients, ALIVE, info.id))
-				continue; /* Skip duplicate fds. */
-
-			c = find_client(clients, PROBE, info.id);
-			if (!c)
-				add_client(clients, info.id, client_pid,
-					   client_name, info.busy);
-			else
-				update_client(c, client_pid, client_name,
-					      info.busy);
-		}
-
-next:
-		if (fdinfo_dir)
-			closedir(fdinfo_dir);
-		if (fd_dir)
-			closedir(fd_dir);
-		if (pid_dir)
-			closedir(pid_dir);
-	}
-
-	closedir(proc_dir);
-
-	for_each_client(clients, c, tmp) {
-		if (c->status == PROBE)
-			free_client(c);
-		else if (c->status == FREE)
-			break;
-	}
-
-	return display_clients(clients);
-}
-
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
 static void n_spaces(const unsigned int n)
@@ -1881,15 +1498,15 @@ print_engines_footer(struct engines *engines, double t,
 
 static int class_cmp(const void *_a, const void *_b)
 {
-	const struct engine_class *a = _a;
-	const struct engine_class *b = _b;
+	const struct igt_drm_client_engine_class *a = _a;
+	const struct igt_drm_client_engine_class *b = _b;
 
-	return a->class - b->class;
+	return a->engine_class - b->engine_class;
 }
 
 static void init_engine_classes(struct engines *engines)
 {
-	struct engine_class *classes;
+	struct igt_drm_client_engine_class *classes;
 	unsigned int i, num;
 	int max = -1;
 
@@ -1916,7 +1533,7 @@ static void init_engine_classes(struct engines *engines)
 	}
 
 	for (i = 0; i < num; i++) {
-		classes[i].class = i;
+		classes[i].engine_class = i;
 		classes[i].name = class_display_name(i);
 	}
 
@@ -2058,7 +1675,7 @@ print_engines(struct engines *engines, double t, int lines, int w, int h)
 }
 
 static int
-print_clients_header(struct clients *clients, int lines,
+print_clients_header(struct igt_drm_clients *clients, int lines,
 		     int con_w, int con_h, int *class_w)
 {
 	if (output_mode == INTERACTIVE) {
@@ -2080,19 +1697,19 @@ print_clients_header(struct clients *clients, int lines,
 			int width;
 
 			for (i = 0; i < clients->num_classes; i++) {
-				if (clients->class[i].num_engines)
+				if (clients->engine_class[i].num_engines)
 					num_active++;
 			}
 
 			*class_w = width = (con_w - len) / num_active;
 
 			for (i = 0; i < clients->num_classes; i++) {
-				const char *name = clients->class[i].name;
+				const char *name = clients->engine_class[i].name;
 				int name_len = strlen(name);
 				int pad = (width - name_len) / 2;
 				int spaces = width - pad - name_len;
 
-				if (!clients->class[i].num_engines)
+				if (!clients->engine_class[i].num_engines)
 					continue; /* Assert in the ideal world. */
 
 				if (pad < 0 || spaces < 0)
@@ -2119,10 +1736,10 @@ static bool numeric_clients;
 static bool filter_idle;
 
 static int
-print_client(struct client *c, struct engines *engines, double t, int lines,
+print_client(struct igt_drm_client *c, struct engines *engines, double t, int lines,
 	     int con_w, int con_h, unsigned int period_us, int *class_w)
 {
-	struct clients *clients = c->clients;
+	struct igt_drm_clients *clients = c->clients;
 	unsigned int i;
 
 	if (output_mode == INTERACTIVE) {
@@ -2136,11 +1753,11 @@ print_client(struct client *c, struct engines *engines, double t, int lines,
 		for (i = 0; c->samples > 1 && i < clients->num_classes; i++) {
 			double pct;
 
-			if (!clients->class[i].num_engines)
+			if (!clients->engine_class[i].num_engines)
 				continue; /* Assert in the ideal world. */
 
 			pct = (double)c->val[i] / period_us / 1e3 * 100 /
-			      clients->class[i].num_engines;
+			      clients->engine_class[i].num_engines;
 
 			/*
 			 * Guard against possible time-drift between sampling
@@ -2172,7 +1789,7 @@ print_client(struct client *c, struct engines *engines, double t, int lines,
 				double pct;
 
 				snprintf(buf, sizeof(buf), "%s",
-					clients->class[i].name);
+					clients->engine_class[i].name);
 				pops->open_struct(buf);
 
 				pct = (double)c->val[i] / period_us / 1e3 * 100;
@@ -2194,7 +1811,7 @@ print_client(struct client *c, struct engines *engines, double t, int lines,
 }
 
 static int
-print_clients_footer(struct clients *clients, double t,
+print_clients_footer(struct igt_drm_clients *clients, double t,
 		     int lines, int con_w, int con_h)
 {
 	if (output_mode == INTERACTIVE) {
@@ -2398,10 +2015,21 @@ static void show_help_screen(void)
 "\n");
 }
 
+static bool client_match(const struct igt_drm_clients *clients,
+			 const struct drm_client_fdinfo *info)
+{
+	if (strcmp(info->driver, "i915"))
+		return false;
+	if (strcmp(info->pdev, clients->private_data))
+		return false;
+
+	return true;
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
-	struct clients *clients = NULL;
+	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	char *output_path = NULL;
 	struct engines *engines;
@@ -2540,24 +2168,24 @@ int main(int argc, char **argv)
 
 	ret = EXIT_SUCCESS;
 
-	clients = init_clients(card.pci_slot_name[0] ?
-			       card.pci_slot_name : IGPU_PCI);
+	clients = igt_drm_clients_init(strdup(card.pci_slot_name[0] ?
+					      card.pci_slot_name : IGPU_PCI));
 	init_engine_classes(engines);
 	if (clients) {
 		clients->num_classes = engines->num_classes;
-		clients->class = engines->class;
+		clients->engine_class = engines->class;
 	}
 
 	pmu_sample(engines);
-	scan_clients(clients);
+	igt_drm_clients_scan(clients, client_match);
 	codename = igt_device_get_pretty_name(&card, false);
 
 	while (!stop_top) {
-		struct clients *disp_clients;
+		struct igt_drm_clients *disp_clients;
 		bool consumed = false;
 		int j, lines = 0;
 		struct winsize ws;
-		struct client *c;
+		struct igt_drm_client *c;
 		double t;
 
 		/* Update terminal size. */
@@ -2576,7 +2204,9 @@ int main(int argc, char **argv)
 		pmu_sample(engines);
 		t = (double)(engines->ts.cur - engines->ts.prev) / 1e9;
 
-		disp_clients = scan_clients(clients);
+		disp_clients =
+			display_clients(igt_drm_clients_scan(clients,
+							     client_match));
 
 		if (stop_top)
 			break;
@@ -2604,9 +2234,9 @@ int main(int argc, char **argv)
 							     con_w, con_h,
 							     &class_w);
 
-				for_each_client(disp_clients, c, j) {
-					assert(c->status != PROBE);
-					if (c->status != ALIVE)
+				igt_for_each_drm_client(disp_clients, c, j) {
+					assert(c->status != IGT_DRM_CLIENT_PROBE);
+					if (c->status != IGT_DRM_CLIENT_ALIVE)
 						break; /* Active clients are first in the array. */
 
 					if (lines >= con_h)
@@ -2630,7 +2260,7 @@ int main(int argc, char **argv)
 			break;
 
 		if (disp_clients != clients)
-			free_clients(disp_clients);
+			free_display_clients(disp_clients);
 
 		if (output_mode == INTERACTIVE)
 			process_stdin(period_us);
diff --git a/tools/meson.build b/tools/meson.build
index 771d0b9e3d5d..e65aceeef9fa 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -91,7 +91,7 @@ install_subdir('registers', install_dir : datadir)
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_fdinfo,math])
+	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.32.0

