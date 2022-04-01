Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FC4EEF00
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09A10E3AD;
	Fri,  1 Apr 2022 14:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DDF10E3A7;
 Fri,  1 Apr 2022 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648822334; x=1680358334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/+fIAQOiwc0Bqr8+b4gJozIra0BIGmeG35HWMBiQSE=;
 b=FcJUSDedtNgaFw9GdDwZmlwJO3AJMLPYWKp1obDCUmyVJJxW/E01qCAo
 6IDhsIDt9jV07Q34pCPwyb9+sq8/rmKFNCWVt4BqqVjZgnHhvab7wj/9I
 44rXH01ysyqQ85IF7Q2CoO61P/Tx+8++wxt4CuG+603WsWjJ6b7Sqj3gJ
 doK0M3rR0J9P5tCmGIme1RamqqC6QEbA7fmYrKysFDxGDx9hI3rebZx62
 ZlkQYouPRytS3pNcLJjDg9p6HzSuaqHpVRNMw7KhIIA8eyPAvG+lHDP3y
 nj/SwxqX0/qUtu+OHJAzEsyZ4ICvpFhjcGgCP+ER+V/Wn6kBynG3KzXGg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="320832836"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="320832836"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:12:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="586864901"
Received: from ewanhaye-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.217.32])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:12:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] intel-gpu-top: Add support for per client stats
Date: Fri,  1 Apr 2022 15:11:55 +0100
Message-Id: <20220401141155.3122817-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401141155.3122817-1-tvrtko.ursulin@linux.intel.com>
References: <20220401141155.3122817-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the i915 exported data in /proc/<pid>/fdinfo to show GPU utilization
per DRM client.

Example of the output:

intel-gpu-top: Intel Tigerlake (Gen12) @ /dev/dri/card0 -  220/ 221 MHz
    70% RC6;  0.62/ 7.08 W;      760 irqs/s

         ENGINES     BUSY                                 MI_SEMA MI_WAIT
       Render/3D   23.06% |██████▊                      |      0%      0%
         Blitter    0.00% |                             |      0%      0%
           Video    5.40% |█▋                           |      0%      0%
    VideoEnhance   20.67% |██████                       |      0%      0%

   PID              NAME  Render/3D    Blitter      Video    VideoEnhance
  3082               mpv |          ||          ||▌         ||██        |
  3117         neverball |█▉        ||          ||          ||          |
     1           systemd |▍         ||          ||          ||          |
  2338       gnome-shell |          ||          ||          ||          |

v2:
 * Removed hardcoded array size from client add/update by passing in
   drm_fd_info directly.
 * Added some asserts and simplified a couple expressions. (Umesh)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 man/intel_gpu_top.rst |   4 +
 tools/intel_gpu_top.c | 806 +++++++++++++++++++++++++++++++++++++++++-
 tools/meson.build     |   2 +-
 3 files changed, 809 insertions(+), 3 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index b3b765b05feb..f4dbfc5b44d9 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -56,6 +56,10 @@ Supported keys:
     'q'    Exit from the tool.
     'h'    Show interactive help.
     '1'    Toggle between aggregated engine class and physical engine mode.
+    'n'    Toggle display of numeric client busyness overlay.
+    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
+    'i'    Toggle display of clients which used no GPU time.
+    'H'    Toggle between per PID aggregation and individual clients.
 
 DEVICE SELECTION
 ================
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index bc11fce2bb1e..1984c10dca29 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -43,8 +43,10 @@
 #include <sys/types.h>
 #include <unistd.h>
 #include <termios.h>
+#include <sys/sysmacros.h>
 
 #include "igt_perf.h"
+#include "igt_drm_fdinfo.h"
 
 #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
 
@@ -311,7 +313,8 @@ static int engine_cmp(const void *__a, const void *__b)
 		return a->instance - b->instance;
 }
 
-#define is_igpu_pci(x) (strcmp(x, "0000:00:02.0") == 0)
+#define IGPU_PCI "0000:00:02.0"
+#define is_igpu_pci(x) (strcmp(x, IGPU_PCI) == 0)
 #define is_igpu(x) (strcmp(x, "i915") == 0)
 
 static struct engines *discover_engines(char *device)
@@ -635,6 +638,552 @@ static void pmu_sample(struct engines *engines)
 	}
 }
 
+enum client_status {
+	FREE = 0, /* mbz */
+	ALIVE,
+	PROBE
+};
+
+struct clients;
+
+struct client {
+	struct clients *clients;
+
+	enum client_status status;
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
+struct clients {
+	unsigned int num_clients;
+	unsigned int active_clients;
+
+	unsigned int num_classes;
+	struct engine_class *class;
+
+	char pci_slot[64];
+
+	struct client *client;
+};
+
+#define for_each_client(clients, c, tmp) \
+	for ((tmp) = (clients)->num_clients, c = (clients)->client; \
+	     (tmp > 0); (tmp)--, (c)++)
+
+static struct clients *init_clients(const char *pci_slot)
+{
+	struct clients *clients;
+
+	clients = malloc(sizeof(*clients));
+	if (!clients)
+		return NULL;
+
+	memset(clients, 0, sizeof(*clients));
+
+	strncpy(clients->pci_slot, pci_slot, sizeof(clients->pci_slot));
+
+	return clients;
+}
+
+static struct client *
+find_client(struct clients *clients, enum client_status status, unsigned int id)
+{
+	unsigned int start, num;
+	struct client *c;
+
+	start = status == FREE ? clients->active_clients : 0; /* Free block at the end. */
+	num = clients->num_clients - start;
+
+	for (c = &clients->client[start]; num; c++, num--) {
+		if (status != c->status)
+			continue;
+
+		if (status == FREE || c->id == id)
+			return c;
+	}
+
+	return NULL;
+}
+
+static void
+update_client(struct client *c, unsigned int pid, char *name,
+	      const struct drm_client_fdinfo *info)
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
+		assert(i < ARRAY_SIZE(info->busy));
+
+		if (info->busy[i] < c->last[i])
+			continue; /* It will catch up soon. */
+
+		c->total_runtime += info->busy[i];
+		c->val[i] = info->busy[i] - c->last[i];
+		c->last_runtime += c->val[i];
+		c->last[i] = info->busy[i];
+	}
+
+	c->samples++;
+	c->status = ALIVE;
+}
+
+static void
+add_client(struct clients *clients, const struct drm_client_fdinfo *info,
+	   unsigned int pid, char *name)
+{
+	struct client *c;
+
+	assert(!find_client(clients, ALIVE, info->id));
+
+	c = find_client(clients, FREE, 0);
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
+	c->id = info->id;
+	c->clients = clients;
+	c->val = calloc(clients->num_classes, sizeof(c->val));
+	c->last = calloc(clients->num_classes, sizeof(c->last));
+	assert(c->val && c->last);
+
+	update_client(c, pid, name, info);
+}
+
+static void free_client(struct client *c)
+{
+	free(c->val);
+	free(c->last);
+	memset(c, 0, sizeof(*c));
+}
+
+static int client_last_cmp(const void *_a, const void *_b)
+{
+	const struct client *a = _a;
+	const struct client *b = _b;
+	long tot_a, tot_b;
+
+	/*
+	 * Sort clients in descending order of runtime in the previous sampling
+	 * period for active ones, followed by inactive. Tie-breaker is client
+	 * id.
+	 */
+
+	tot_a = a->status == ALIVE ? a->last_runtime : -1;
+	tot_b = b->status == ALIVE ? b->last_runtime : -1;
+
+	tot_b -= tot_a;
+	if (tot_b > 0)
+		return 1;
+	if (tot_b < 0)
+		return -1;
+
+	return (int)b->id - a->id;
+}
+
+static int client_total_cmp(const void *_a, const void *_b)
+{
+	const struct client *a = _a;
+	const struct client *b = _b;
+	long tot_a, tot_b;
+
+	tot_a = a->status == ALIVE ? a->total_runtime : -1;
+	tot_b = b->status == ALIVE ? b->total_runtime : -1;
+
+	tot_b -= tot_a;
+	if (tot_b > 0)
+		return 1;
+	if (tot_b < 0)
+		return -1;
+
+	return (int)b->id - a->id;
+}
+
+static int client_id_cmp(const void *_a, const void *_b)
+{
+	const struct client *a = _a;
+	const struct client *b = _b;
+	int id_a, id_b;
+
+	id_a = a->status == ALIVE ? a->id : -1;
+	id_b = b->status == ALIVE ? b->id : -1;
+
+	id_b -= id_a;
+	if (id_b > 0)
+		return 1;
+	if (id_b < 0)
+		return -1;
+
+	return (int)b->id - a->id;
+}
+
+static int client_pid_cmp(const void *_a, const void *_b)
+{
+	const struct client *a = _a;
+	const struct client *b = _b;
+	int pid_a, pid_b;
+
+	pid_a = a->status == ALIVE ? a->pid : INT_MAX;
+	pid_b = b->status == ALIVE ? b->pid : INT_MAX;
+
+	pid_b -= pid_a;
+	if (pid_b > 0)
+		return -1;
+	if (pid_b < 0)
+		return 1;
+
+	return (int)a->id - b->id;
+}
+
+static int (*client_cmp)(const void *, const void *) = client_last_cmp;
+
+static struct clients *sort_clients(struct clients *clients,
+				    int (*cmp)(const void *, const void *))
+{
+	unsigned int active, free;
+	struct client *c;
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
+	for_each_client(clients, c, tmp) {
+		if (c->status != ALIVE)
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
+static bool aggregate_pids = true;
+
+static struct clients *display_clients(struct clients *clients)
+{
+	struct client *ac, *c, *cp = NULL;
+	struct clients *aggregated;
+	int tmp, num = 0;
+
+	if (!aggregate_pids)
+		goto out;
+
+	/* Sort by pid first to make it easy to aggregate while walking. */
+	sort_clients(clients, client_pid_cmp);
+
+	aggregated = calloc(1, sizeof(*clients));
+	assert(aggregated);
+
+	ac = calloc(clients->num_clients, sizeof(*c));
+	assert(ac);
+
+	aggregated->num_classes = clients->num_classes;
+	aggregated->class = clients->class;
+	aggregated->client = ac;
+
+	for_each_client(clients, c, tmp) {
+		unsigned int i;
+
+		if (c->status == FREE)
+			break;
+
+		assert(c->status == ALIVE);
+
+		if (!cp || c->pid != cp->pid) {
+			ac = &aggregated->client[num++];
+
+			/* New pid. */
+			ac->clients = aggregated;
+			ac->status = ALIVE;
+			ac->id = -c->pid;
+			ac->pid = c->pid;
+			strcpy(ac->name, c->name);
+			strcpy(ac->print_name, c->print_name);
+			ac->val = calloc(clients->num_classes,
+					 sizeof(ac->val[0]));
+			assert(ac->val);
+			ac->samples = 1;
+		}
+
+		cp = c;
+
+		if (c->samples < 2)
+			continue;
+
+		ac->samples = 2; /* All what matters for display. */
+		ac->total_runtime += c->total_runtime;
+		ac->last_runtime += c->last_runtime;
+
+		for (i = 0; i < clients->num_classes; i++)
+			ac->val[i] += c->val[i];
+	}
+
+	aggregated->num_clients = num;
+	aggregated->active_clients = num;
+
+	clients = aggregated;
+
+out:
+	return sort_clients(clients, client_cmp);
+}
+
+static void free_clients(struct clients *clients)
+{
+	struct client *c;
+	unsigned int tmp;
+
+	for_each_client(clients, c, tmp) {
+		free(c->val);
+		free(c->last);
+	}
+
+	free(clients->client);
+	free(clients);
+}
+
+static bool is_drm_fd(DIR *fd_dir, const char *name)
+{
+	struct stat stat;
+	int ret;
+
+	ret = fstatat(dirfd(fd_dir), name, &stat, 0);
+
+	return ret == 0 &&
+	       (stat.st_mode & S_IFMT) == S_IFCHR &&
+	       major(stat.st_rdev) == 226;
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
+	assert(e >= s);
+
+	len = e - ++s;
+	if(!len || (len + 1) >= sz)
+		return false;
+
+	strncpy(out, s, len);
+	out[len] = 0;
+
+	return true;
+}
+
+static DIR *opendirat(DIR *at, const char *name)
+{
+	DIR *dir;
+	int fd;
+
+	fd = openat(dirfd(at), name, O_DIRECTORY);
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
+static FILE *fropenat(DIR *at, const char *name)
+{
+	FILE *f;
+	int fd;
+
+	fd = openat(dirfd(at), name, O_RDONLY);
+	if (fd < 0)
+		return NULL;
+
+	f = fdopen(fd, "r");
+	if (!f)
+		close(fd);
+
+	return f;
+}
+
+static size_t freadat2buf(char *buf, const size_t sz, DIR *at, const char *name)
+{
+	size_t count;
+	FILE *f;
+
+	f = fropenat(at, name);
+	if (!f)
+		return 0;
+
+	buf[sz - 1] = 0;
+	count = fread(buf, 1, sz, f);
+	buf[count - 1] = 0;
+	fclose(f);
+
+	return count;
+}
+
+static struct clients *scan_clients(struct clients *clients)
+{
+	struct dirent *proc_dent;
+	struct client *c;
+	DIR *proc_dir;
+	int tmp;
+
+	if (!clients)
+		return clients;
+
+	for_each_client(clients, c, tmp) {
+		assert(c->status != PROBE);
+		if (c->status == ALIVE)
+			c->status = PROBE;
+		else
+			break; /* Free block at the end of array. */
+	}
+
+	proc_dir = opendir("/proc");
+	if (!proc_dir)
+		return clients;
+
+	while ((proc_dent = readdir(proc_dir)) != NULL) {
+		DIR *pid_dir = NULL, *fd_dir = NULL, *fdinfo_dir = NULL;
+		struct dirent *fdinfo_dent;
+		char client_name[64] = { };
+		unsigned int client_pid;
+		char buf[4096];
+		size_t count;
+
+		if (proc_dent->d_type != DT_DIR)
+			continue;
+		if (!isdigit(proc_dent->d_name[0]))
+			continue;
+
+		pid_dir = opendirat(proc_dir, proc_dent->d_name);
+		if (!pid_dir)
+			continue;
+
+		count = freadat2buf(buf, sizeof(buf), pid_dir, "stat");
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
+		fd_dir = opendirat(pid_dir, "fd");
+		if (!fd_dir)
+			goto next;
+
+		fdinfo_dir = opendirat(pid_dir, "fdinfo");
+		if (!fdinfo_dir)
+			goto next;
+
+		while ((fdinfo_dent = readdir(fdinfo_dir)) != NULL) {
+			struct drm_client_fdinfo info = { };
+
+			if (fdinfo_dent->d_type != DT_REG)
+				continue;
+			if (!isdigit(fdinfo_dent->d_name[0]))
+				continue;
+
+			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
+				continue;
+
+			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
+						    fdinfo_dent->d_name,
+						    &info))
+				continue;
+
+			if (strcmp(info.driver, "i915"))
+				continue;
+			if (strcmp(info.pdev, clients->pci_slot))
+				continue;
+			if (find_client(clients, ALIVE, info.id))
+				continue; /* Skip duplicate fds. */
+
+			c = find_client(clients, PROBE, info.id);
+			if (!c)
+				add_client(clients, &info, client_pid,
+					   client_name);
+			else
+				update_client(c, client_pid, client_name,
+					      &info);
+		}
+
+next:
+		if (fdinfo_dir)
+			closedir(fdinfo_dir);
+		if (fd_dir)
+			closedir(fd_dir);
+		if (pid_dir)
+			closedir(pid_dir);
+	}
+
+	closedir(proc_dir);
+
+	for_each_client(clients, c, tmp) {
+		if (c->status == PROBE)
+			free_client(c);
+		else if (c->status == FREE)
+			break;
+	}
+
+	return display_clients(clients);
+}
+
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
 static void n_spaces(const unsigned int n)
@@ -776,6 +1325,18 @@ json_close_struct(void)
 		fflush(stdout);
 }
 
+static void
+__json_add_member(const char *key, const char *val)
+{
+	assert(json_indent_level < ARRAY_SIZE(json_indent));
+
+	fprintf(out, "%s%s\"%s\": \"%s\"",
+		json_struct_members ? ",\n" : "",
+		json_indent[json_indent_level], key, val);
+
+	json_struct_members++;
+}
+
 static unsigned int
 json_add_member(const struct cnt_group *parent, struct cnt_item *item,
 		unsigned int headers)
@@ -1501,6 +2062,157 @@ print_engines(struct engines *engines, double t, int lines, int w, int h)
 	return lines;
 }
 
+static int
+print_clients_header(struct clients *clients, int lines,
+		     int con_w, int con_h, int *class_w)
+{
+	if (output_mode == INTERACTIVE) {
+		const char *pidname = "   PID              NAME ";
+		unsigned int num_active = 0;
+		int len = strlen(pidname);
+
+		if (lines++ >= con_h)
+			return lines;
+
+		printf("\033[7m");
+		printf("%s", pidname);
+
+		if (lines++ >= con_h || len >= con_w)
+			return lines;
+
+		if (clients->num_classes) {
+			unsigned int i;
+			int width;
+
+			for (i = 0; i < clients->num_classes; i++) {
+				if (clients->class[i].num_engines)
+					num_active++;
+			}
+
+			*class_w = width = (con_w - len) / num_active;
+
+			for (i = 0; i < clients->num_classes; i++) {
+				const char *name = clients->class[i].name;
+				int name_len = strlen(name);
+				int pad = (width - name_len) / 2;
+				int spaces = width - pad - name_len;
+
+				if (!clients->class[i].num_engines)
+					continue; /* Assert in the ideal world. */
+
+				if (pad < 0 || spaces < 0)
+					continue;
+
+				n_spaces(pad);
+				printf("%s", name);
+				n_spaces(spaces);
+				len += pad + name_len + spaces;
+			}
+		}
+
+		n_spaces(con_w - len);
+		printf("\033[0m\n");
+	} else {
+		if (clients->num_classes)
+			pops->open_struct("clients");
+	}
+
+	return lines;
+}
+
+static bool numeric_clients;
+static bool filter_idle;
+
+static int
+print_client(struct client *c, struct engines *engines, double t, int lines,
+	     int con_w, int con_h, unsigned int period_us, int *class_w)
+{
+	struct clients *clients = c->clients;
+	unsigned int i;
+
+	if (output_mode == INTERACTIVE) {
+		if (filter_idle && (!c->total_runtime || c->samples < 2))
+			return lines;
+
+		lines++;
+
+		printf("%6u %17s ", c->pid, c->print_name);
+
+		for (i = 0; c->samples > 1 && i < clients->num_classes; i++) {
+			double pct;
+
+			if (!clients->class[i].num_engines)
+				continue; /* Assert in the ideal world. */
+
+			pct = (double)c->val[i] / period_us / 1e3 * 100 /
+			      clients->class[i].num_engines;
+
+			/*
+			 * Guard against possible time-drift between sampling
+			 * client data and time we obtained our time-delta from
+			 * PMU.
+			 */
+			if (pct > 100.0)
+				pct = 100.0;
+
+			print_percentage_bar(pct, *class_w, numeric_clients);
+		}
+
+		putchar('\n');
+	} else if (output_mode == JSON) {
+		char buf[64];
+
+		snprintf(buf, sizeof(buf), "%u", c->id);
+		pops->open_struct(buf);
+
+		__json_add_member("name", c->print_name);
+
+		snprintf(buf, sizeof(buf), "%u", c->pid);
+		__json_add_member("pid", buf);
+
+		if (c->samples > 1) {
+			pops->open_struct("engine-classes");
+
+			for (i = 0; i < clients->num_classes; i++) {
+				double pct;
+
+				snprintf(buf, sizeof(buf), "%s",
+					clients->class[i].name);
+				pops->open_struct(buf);
+
+				pct = (double)c->val[i] / period_us / 1e3 * 100;
+				snprintf(buf, sizeof(buf), "%f", pct);
+				__json_add_member("busy", buf);
+
+				__json_add_member("unit", "%");
+
+				pops->close_struct();
+			}
+
+			pops->close_struct();
+		}
+
+		pops->close_struct();
+	}
+
+	return lines;
+}
+
+static int
+print_clients_footer(struct clients *clients, double t,
+		     int lines, int con_w, int con_h)
+{
+	if (output_mode == INTERACTIVE) {
+		if (lines++ < con_h)
+			printf("\n");
+	} else {
+		if (clients->num_classes)
+			pops->close_struct();
+	}
+
+	return lines;
+}
+
 static void restore_term(void)
 {
 	tcsetattr(STDIN_FILENO, TCSANOW, &termios_orig);
@@ -1565,6 +2277,31 @@ static void interactive_stdin(void)
 	assert(ret == 0);
 }
 
+static void select_client_sort(void)
+{
+	struct {
+		int (*cmp)(const void *, const void *);
+		const char *msg;
+	} cmp[] = {
+		{ client_last_cmp, "Sorting clients by current GPU usage." },
+		{ client_total_cmp, "Sorting clients by accummulated GPU usage." },
+		{ client_pid_cmp, "Sorting clients by pid." },
+		{ client_id_cmp, "Sorting clients by DRM id." },
+	};
+	static unsigned int client_sort;
+
+bump:
+	if (++client_sort >= ARRAY_SIZE(cmp))
+		client_sort = 0;
+
+	client_cmp = cmp[client_sort].cmp;
+	header_msg = cmp[client_sort].msg;
+
+	/* Sort by client id makes no sense with pid aggregation. */
+	if (aggregate_pids && client_cmp == client_id_cmp)
+		goto bump;
+}
+
 static bool in_help;
 
 static void process_help_stdin(void)
@@ -1607,9 +2344,29 @@ static void process_normal_stdin(void)
 			else
 				header_msg = "Showing physical engines.";
 			break;
+		case 'i':
+			filter_idle ^= true;
+			if (filter_idle)
+				header_msg = "Hiding inactive clients.";
+			else
+				header_msg = "Showing inactive clients.";
+			break;
+		case 'n':
+			numeric_clients ^= true;
+			break;
+		case 's':
+			select_client_sort();
+			break;
 		case 'h':
 			in_help = true;
 			break;
+		case 'H':
+			aggregate_pids ^= true;
+			if (aggregate_pids)
+				header_msg = "Aggregating clients.";
+			else
+				header_msg = "Showing individual clients.";
+			break;
 		};
 	}
 }
@@ -1637,6 +2394,10 @@ static void show_help_screen(void)
 	printf(
 "Help for interactive commands:\n\n"
 "    '1'    Toggle between aggregated engine class and physical engine mode.\n"
+"    'n'    Toggle display of numeric client busyness overlay.\n"
+"    's'    Toggle between sort modes (runtime, total runtime, pid, client id).\n"
+"    'i'    Toggle display of clients which used no GPU time.\n"
+"    'H'    Toggle between per PID aggregation and individual clients.\n"
 "\n"
 "    'h' or 'q'    Exit interactive help.\n"
 "\n");
@@ -1645,6 +2406,7 @@ static void show_help_screen(void)
 int main(int argc, char **argv)
 {
 	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
+	struct clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	char *output_path = NULL;
 	struct engines *engines;
@@ -1783,15 +2545,24 @@ int main(int argc, char **argv)
 
 	ret = EXIT_SUCCESS;
 
+	clients = init_clients(card.pci_slot_name[0] ?
+			       card.pci_slot_name : IGPU_PCI);
 	init_engine_classes(engines);
+	if (clients) {
+		clients->num_classes = engines->num_classes;
+		clients->class = engines->class;
+	}
 
 	pmu_sample(engines);
+	scan_clients(clients);
 	codename = igt_device_get_pretty_name(&card, false);
 
 	while (!stop_top) {
+		struct clients *disp_clients;
 		bool consumed = false;
+		int j, lines = 0;
 		struct winsize ws;
-		int lines = 0;
+		struct client *c;
 		double t;
 
 		/* Update terminal size. */
@@ -1810,6 +2581,8 @@ int main(int argc, char **argv)
 		pmu_sample(engines);
 		t = (double)(engines->ts.cur - engines->ts.prev) / 1e9;
 
+		disp_clients = scan_clients(clients);
+
 		if (stop_top)
 			break;
 
@@ -1829,12 +2602,41 @@ int main(int argc, char **argv)
 
 			lines = print_engines(engines, t, lines, con_w, con_h);
 
+			if (disp_clients) {
+				int class_w;
+
+				lines = print_clients_header(disp_clients, lines,
+							     con_w, con_h,
+							     &class_w);
+
+				for_each_client(disp_clients, c, j) {
+					assert(c->status != PROBE);
+					if (c->status != ALIVE)
+						break; /* Active clients are first in the array. */
+
+					if (lines >= con_h)
+						break;
+
+					lines = print_client(c, engines, t,
+							     lines, con_w,
+							     con_h, period_us,
+							     &class_w);
+				}
+
+				lines = print_clients_footer(disp_clients, t,
+							     lines, con_w,
+							     con_h);
+			}
+
 			pops->close_struct();
 		}
 
 		if (stop_top)
 			break;
 
+		if (disp_clients != clients)
+			free_clients(disp_clients);
+
 		if (output_mode == INTERACTIVE)
 			process_stdin(period_us);
 		else
diff --git a/tools/meson.build b/tools/meson.build
index b6b9753463a9..771d0b9e3d5d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -91,7 +91,7 @@ install_subdir('registers', install_dir : datadir)
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,math])
+	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_fdinfo,math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.32.0

