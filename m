Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08814EE3D7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 00:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F7410E216;
	Thu, 31 Mar 2022 22:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34010E0D4;
 Thu, 31 Mar 2022 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648764531; x=1680300531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ao9DCsl2hv+h/cbpE4rHFScNNvvAbb+Bpq+xoPthhJY=;
 b=KZnNljyL8f534LtxelE62mCeeZn5Ex7khl/fuHRXEne+eYnHjduUE5cB
 qK49a/apNKy4QT4fnZxn97QwxagOEajPLMa6mN+EBprIPUEVElas0pyID
 TYp84pR1wG30a85joVCq6fCQ9/FsAwk0SfOvOV1AUD/OpllTqGh90zsZZ
 +OYhubFGG8UCxnFOLEmPrWexFUySUDAIWeeKfSkYU0MtC8gXsBneZ868M
 TZ+XhbTn8DhRdw9FzivyEDRr2H0VK1L52bUyMh4n/qn4gyk2IFlSRIpFp
 vuIW++czpiXnhOn+IYFqBEMKZyn5UBX3gMZf5oZyzkvojENPZpnkkfjkg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="247475074"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="247475074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 15:08:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="566873324"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril-10.165.21.154)
 ([10.165.21.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 15:08:51 -0700
Date: Thu, 31 Mar 2022 15:08:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/11] intel-gpu-top: Add support for per
 client stats
Message-ID: <20220331220850.GF59408@unerlige-ril-10.165.21.154>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
 <20220222135605.1120767-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222135605.1120767-4-tvrtko.ursulin@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lgtm, I just have a few nits and questions below:

Regardless, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

On Tue, Feb 22, 2022 at 01:55:57PM +0000, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>Use the i915 exported data in /proc/<pid>/fdinfo to show GPU utilization
>per DRM client.
>
>Example of the output:
>
>intel-gpu-top: Intel Tigerlake (Gen12) @ /dev/dri/card0 -  220/ 221 MHz
>    70% RC6;  0.62/ 7.08 W;      760 irqs/s
>
>         ENGINES     BUSY                                 MI_SEMA MI_WAIT
>       Render/3D   23.06% |██████▊                      |      0%      0%
>         Blitter    0.00% |                             |      0%      0%
>           Video    5.40% |█▋                           |      0%      0%
>    VideoEnhance   20.67% |██████                       |      0%      0%
>
>   PID              NAME  Render/3D    Blitter      Video    VideoEnhance
>  3082               mpv |          ||          ||▌         ||██        |
>  3117         neverball |█▉        ||          ||          ||          |
>     1           systemd |▍         ||          ||          ||          |
>  2338       gnome-shell |          ||          ||          ||          |
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>---
> man/intel_gpu_top.rst |   4 +
> tools/intel_gpu_top.c | 801 +++++++++++++++++++++++++++++++++++++++++-
> tools/meson.build     |   2 +-
> 3 files changed, 804 insertions(+), 3 deletions(-)
>
>diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
>index b3b765b05feb..f4dbfc5b44d9 100644
>--- a/man/intel_gpu_top.rst
>+++ b/man/intel_gpu_top.rst
>@@ -56,6 +56,10 @@ Supported keys:
>     'q'    Exit from the tool.
>     'h'    Show interactive help.
>     '1'    Toggle between aggregated engine class and physical engine mode.
>+    'n'    Toggle display of numeric client busyness overlay.
>+    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
>+    'i'    Toggle display of clients which used no GPU time.
>+    'H'    Toggle between per PID aggregation and individual clients.
>
> DEVICE SELECTION
> ================
>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>index bc11fce2bb1e..73815cdea8aa 100644
>--- a/tools/intel_gpu_top.c
>+++ b/tools/intel_gpu_top.c
>@@ -43,8 +43,10 @@
> #include <sys/types.h>
> #include <unistd.h>
> #include <termios.h>
>+#include <sys/sysmacros.h>
>
> #include "igt_perf.h"
>+#include "igt_drm_fdinfo.h"
>
> #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
>
>@@ -311,7 +313,8 @@ static int engine_cmp(const void *__a, const void *__b)
> 		return a->instance - b->instance;
> }
>
>-#define is_igpu_pci(x) (strcmp(x, "0000:00:02.0") == 0)
>+#define IGPU_PCI "0000:00:02.0"
>+#define is_igpu_pci(x) (strcmp(x, IGPU_PCI) == 0)
> #define is_igpu(x) (strcmp(x, "i915") == 0)
>
> static struct engines *discover_engines(char *device)
>@@ -635,6 +638,547 @@ static void pmu_sample(struct engines *engines)
> 	}
> }
>
>+enum client_status {
>+	FREE = 0, /* mbz */
>+	ALIVE,
>+	PROBE
>+};
>+
>+struct clients;
>+
>+struct client {
>+	struct clients *clients;
>+
>+	enum client_status status;
>+	unsigned int id;
>+	unsigned int pid;
>+	char name[24];
>+	char print_name[24];
>+	unsigned int samples;
>+	unsigned long total_runtime;
>+	unsigned long last_runtime;
>+	unsigned long *val;
>+	uint64_t *last;
>+};
>+
>+struct clients {
>+	unsigned int num_clients;
>+	unsigned int active_clients;
>+
>+	unsigned int num_classes;
>+	struct engine_class *class;
>+
>+	char pci_slot[64];
>+
>+	struct client *client;
>+};
>+
>+#define for_each_client(clients, c, tmp) \
>+	for ((tmp) = (clients)->num_clients, c = (clients)->client; \
>+	     (tmp > 0); (tmp)--, (c)++)
>+
>+static struct clients *init_clients(const char *pci_slot)
>+{
>+	struct clients *clients;
>+
>+	clients = malloc(sizeof(*clients));
>+	if (!clients)
>+		return NULL;
>+
>+	memset(clients, 0, sizeof(*clients));
>+
>+	strncpy(clients->pci_slot, pci_slot, sizeof(clients->pci_slot));
>+
>+	return clients;
>+}
>+
>+static struct client *
>+find_client(struct clients *clients, enum client_status status, unsigned int id)
>+{
>+	unsigned int start, num;
>+	struct client *c;
>+
>+	start = status == FREE ? clients->active_clients : 0; /* Free block at the end. */
>+	num = clients->num_clients - start;
>+
>+	for (c = &clients->client[start]; num; c++, num--) {
>+		if (status != c->status)
>+			continue;
>+
>+		if (status == FREE || c->id == id)
>+			return c;
>+	}
>+
>+	return NULL;
>+}
>+
>+static void
>+update_client(struct client *c, unsigned int pid, char *name, uint64_t val[16])
>+{
>+	unsigned int i;
>+
>+	if (c->pid != pid)
>+		c->pid = pid;
>+
>+	if (strcmp(c->name, name)) {
>+		char *p;
>+
>+		strncpy(c->name, name, sizeof(c->name) - 1);
>+		strncpy(c->print_name, name, sizeof(c->print_name) - 1);
>+
>+		p = c->print_name;
>+		while (*p) {
>+			if (!isprint(*p))
>+				*p = '*';
>+			p++;
>+		}
>+	}
>+
>+	c->last_runtime = 0;
>+	c->total_runtime = 0;
>+

assert(c->clients->num_classes <= 16);

>+	for (i = 0; i < c->clients->num_classes; i++) {
>+		if (val[i] < c->last[i])
>+			continue; /* It will catch up soon. */
>+
>+		c->total_runtime += val[i];
As far as busyness is concerned c->total_runtime += val[i] should be it.  

>+		c->val[i] = val[i] - c->last[i];
>+		c->last_runtime += c->val[i];
>+		c->last[i] = val[i];

Can you describe what these 3 lines are doing?

>+	}
>+
>+	c->samples++;
>+	c->status = ALIVE;
>+}
>+
>+static void
>+add_client(struct clients *clients, unsigned int id, unsigned int pid,
>+	   char *name, uint64_t busy[16])
>+{
>+	struct client *c;
>+
>+	assert(!find_client(clients, ALIVE, id));
>+
>+	c = find_client(clients, FREE, 0);
>+	if (!c) {
>+		unsigned int idx = clients->num_clients;
>+
>+		clients->num_clients += (clients->num_clients + 2) / 2;
>+		clients->client = realloc(clients->client,
>+					  clients->num_clients * sizeof(*c));
>+		assert(clients->client);
>+
>+		c = &clients->client[idx];
>+		memset(c, 0, (clients->num_clients - idx) * sizeof(*c));
>+	}
>+
>+	c->id = id;
>+	c->clients = clients;
>+	c->val = calloc(clients->num_classes, sizeof(c->val));
>+	c->last = calloc(clients->num_classes, sizeof(c->last));
>+	assert(c->val && c->last);
>+
>+	update_client(c, pid, name, busy);
>+}
>+
>+static void free_client(struct client *c)
>+{
>+	free(c->val);
>+	free(c->last);
>+	memset(c, 0, sizeof(*c));
>+}
>+
>+static int client_last_cmp(const void *_a, const void *_b)
>+{
>+	const struct client *a = _a;
>+	const struct client *b = _b;
>+	long tot_a, tot_b;
>+
>+	/*
>+	 * Sort clients in descending order of runtime in the previous sampling
>+	 * period for active ones, followed by inactive. Tie-breaker is client
>+	 * id.
>+	 */
>+
>+	tot_a = a->status == ALIVE ? a->last_runtime : -1;
>+	tot_b = b->status == ALIVE ? b->last_runtime : -1;
>+
>+	tot_b -= tot_a;
>+	if (tot_b > 0)
>+		return 1;
>+	if (tot_b < 0)
>+		return -1;
>+
>+	return (int)b->id - a->id;

nit: the compare functions could use a single if, if you agree on just 
returning tot_b.

	if (!tot_b)
		return (int)b->id - a->id;

	return tot_b;

>+}
>+
>+static int client_total_cmp(const void *_a, const void *_b)
>+{
>+	const struct client *a = _a;
>+	const struct client *b = _b;
>+	long tot_a, tot_b;
>+
>+	tot_a = a->status == ALIVE ? a->total_runtime : -1;
>+	tot_b = b->status == ALIVE ? b->total_runtime : -1;
>+
>+	tot_b -= tot_a;
>+	if (tot_b > 0)
>+		return 1;
>+	if (tot_b < 0)
>+		return -1;
>+
>+	return (int)b->id - a->id;
>+}
>+
>+static int client_id_cmp(const void *_a, const void *_b)
>+{
>+	const struct client *a = _a;
>+	const struct client *b = _b;
>+	int id_a, id_b;
>+
>+	id_a = a->status == ALIVE ? a->id : -1;
>+	id_b = b->status == ALIVE ? b->id : -1;
>+
>+	id_b -= id_a;
>+	if (id_b > 0)
>+		return 1;
>+	if (id_b < 0)
>+		return -1;
>+
>+	return (int)b->id - a->id;
>+}
>+
>+static int client_pid_cmp(const void *_a, const void *_b)
>+{
>+	const struct client *a = _a;
>+	const struct client *b = _b;
>+	int pid_a, pid_b;
>+
>+	pid_a = a->status == ALIVE ? a->pid : INT_MAX;
>+	pid_b = b->status == ALIVE ? b->pid : INT_MAX;
>+
>+	pid_b -= pid_a;
>+	if (pid_b > 0)
>+		return -1;
>+	if (pid_b < 0)
>+		return 1;
>+
>+	return (int)a->id - b->id;
>+}
>+
>+static int (*client_cmp)(const void *, const void *) = client_last_cmp;
>+
>+static struct clients *sort_clients(struct clients *clients,
>+				    int (*cmp)(const void *, const void *))
>+{
>+	unsigned int active, free;
>+	struct client *c;
>+	int tmp;
>+
>+	if (!clients)
>+		return clients;
>+
>+	qsort(clients->client, clients->num_clients, sizeof(*clients->client),
>+	      cmp);
>+
>+	/* Trim excessive array space. */
>+	active = 0;
>+	for_each_client(clients, c, tmp) {
>+		if (c->status != ALIVE)
>+			break; /* Active clients are first in the array. */
>+		active++;
>+	}
>+
>+	clients->active_clients = active;
>+
>+	free = clients->num_clients - active;
>+	if (free > clients->num_clients / 2) {
>+		active = clients->num_clients - free / 2;
>+		if (active != clients->num_clients) {
>+			clients->num_clients = active;
>+			clients->client = realloc(clients->client,
>+						  clients->num_clients *
>+						  sizeof(*c));
>+		}
>+	}
>+
>+	return clients;
>+}
>+
>+static bool aggregate_pids = true;
>+
>+static struct clients *display_clients(struct clients *clients)
>+{
>+	struct client *ac, *c, *cp = NULL;
>+	struct clients *aggregated;
>+	int tmp, num = 0;
>+
>+	if (!aggregate_pids)
>+		goto out;
>+
>+	/* Sort by pid first to make it easy to aggregate while walking. */
>+	sort_clients(clients, client_pid_cmp);
>+
>+	aggregated = calloc(1, sizeof(*clients));
>+	assert(aggregated);
>+
>+	ac = calloc(clients->num_clients, sizeof(*c));
>+	assert(ac);
>+
>+	aggregated->num_classes = clients->num_classes;
>+	aggregated->class = clients->class;
>+	aggregated->client = ac;
>+
>+	for_each_client(clients, c, tmp) {
>+		unsigned int i;
>+
>+		if (c->status == FREE)
>+			break;
>+
>+		assert(c->status == ALIVE);
>+
>+		if ((cp && c->pid != cp->pid) || !cp) {

same as: if (!cp || c->pid != cp->pid), fine either ways

>+			ac = &aggregated->client[num++];
>+
>+			/* New pid. */
>+			ac->clients = aggregated;
>+			ac->status = ALIVE;
>+			ac->id = -c->pid;
>+			ac->pid = c->pid;
>+			strcpy(ac->name, c->name);
>+			strcpy(ac->print_name, c->print_name);
>+			ac->val = calloc(clients->num_classes,
>+					 sizeof(ac->val[0]));
>+			assert(ac->val);
>+			ac->samples = 1;
>+		}
>+
>+		cp = c;
>+
>+		if (c->samples < 2)
>+			continue;
>+
>+		ac->samples = 2; /* All what matters for display. */
>+		ac->total_runtime += c->total_runtime;
>+		ac->last_runtime += c->last_runtime;
>+
>+		for (i = 0; i < clients->num_classes; i++)
>+			ac->val[i] += c->val[i];
>+	}
>+
>+	aggregated->num_clients = num;
>+	aggregated->active_clients = num;
>+
>+	clients = aggregated;
>+
>+out:
>+	return sort_clients(clients, client_cmp);
>+}
>+
>+static void free_clients(struct clients *clients)
>+{
>+	struct client *c;
>+	unsigned int tmp;
>+
>+	for_each_client(clients, c, tmp) {
>+		free(c->val);
>+		free(c->last);
>+	}
>+
>+	free(clients->client);
>+	free(clients);
>+}
>+
>+static bool is_drm_fd(DIR *fd_dir, const char *name)
>+{
>+	struct stat stat;
>+	int ret;
>+
>+	ret = fstatat(dirfd(fd_dir), name, &stat, 0);
>+
>+	return ret == 0 &&
>+	       (stat.st_mode & S_IFMT) == S_IFCHR &&
>+	       major(stat.st_rdev) == 226;
>+}
>+
>+static bool get_task_name(const char *buffer, char *out, unsigned long sz)
>+{
>+	char *s = index(buffer, '(');
>+	char *e = rindex(buffer, ')');
>+	unsigned int len;
>+
>+	if (!s || !e)
>+		return false;

maybe assert(e > s);

>+
>+	len = --e - ++s + 1;

len = e - ++s;

Thanks,
Umesh
