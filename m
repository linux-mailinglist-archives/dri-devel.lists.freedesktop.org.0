Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85AA4BFA03
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237BB10E80F;
	Tue, 22 Feb 2022 13:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249F510E7AE;
 Tue, 22 Feb 2022 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538189; x=1677074189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9QbY9cIMI/UV2FGPHqrZ1zT2QMBADl5533ZRvbwaGFo=;
 b=djGGynhXaiLVWD0HsamesyhYSE5yT1GtnXkOaFMsfc8q5hfDYIzHcUyJ
 ArGnxaisqGnhz5exOvfe3r0oJMfSVVQskqnmnr1peymwUrMJjjaRTJWls
 Pfl/804UJGCwPDJLA+sPqS2tsltoHAWA8K+BWQYg5285rB1zMXTAadQda
 Uic/fqHfIUgQ0rdXjQ+RvSnVsRGPnvfltyHaWnKY9KszEeSlGRKb9i/k0
 C4707BHkONb0QCMhxNyNI3NAqYiu1vgXyMnPshNy4HpcbEnTDESaKlkPR
 eeIwTUz3c93STXOD6QMmcfFGjhcpSgCKNjblivZoUmd9bqogUjNN4PZZe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326516"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534113"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:27 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/11] libdrmclient/intel_gpu_top: Decouple hardcoded
 engine assumptions
Date: Tue, 22 Feb 2022 13:56:03 +0000
Message-Id: <20220222135605.1120767-10-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Intel_gpu_top gets it's main engine configuration data via PMU probe and
uses that for per client view as well. Furthemore code so far assumed only
clients belonging from a single DRM card would be tracked in a single
clients list.

Break this inter-dependency by moving the engine data to be per client and
also have libdrmclient probe the engine configuration independently using
the previously added libdrmfdinfo facilities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c |  34 +++++++++++--
 lib/igt_drm_clients.h |  11 ++---
 tools/intel_gpu_top.c | 112 ++++++++++++++++++++++++++++++------------
 3 files changed, 117 insertions(+), 40 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index cf044597d537..6299f3632b74 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -103,7 +103,7 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	c->last_runtime = 0;
 	c->total_runtime = 0;
 
-	for (i = 0; i < c->clients->num_classes; i++) {
+	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		if (val[i] < c->last[i])
 			continue; /* It will catch up soon. */
 
@@ -123,6 +123,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 		   unsigned int pid, char *name, unsigned int drm_minor)
 {
 	struct igt_drm_client *c;
+	unsigned int i;
 
 	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
 				     drm_minor, info->id));
@@ -143,8 +144,28 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->id = info->id;
 	c->drm_minor = drm_minor;
 	c->clients = clients;
-	c->val = calloc(clients->num_classes, sizeof(c->val));
-	c->last = calloc(clients->num_classes, sizeof(c->last));
+	c->engines = malloc(sizeof(*c->engines));
+	assert(c->engines);
+	memset(c->engines, 0, sizeof(*c->engines));
+	c->engines->capacity = calloc(info->last_engine_index + 1,
+				      sizeof(*c->engines->capacity));
+	assert(c->engines->capacity);
+	c->engines->names = calloc(info->last_engine_index + 1,
+				   sizeof(*c->engines->names));
+	assert(c->engines->names);
+
+	for (i = 0; i <= info->last_engine_index; i++) {
+		if (!info->capacity[i])
+			continue;
+
+		c->engines->capacity[i] = info->capacity[i];
+		c->engines->names[i] = strdup(info->names[i]);
+		assert(c->engines->names[i]);
+		c->engines->num_engines++;
+		c->engines->max_engine_id = i;
+	}
+	c->val = calloc(c->engines->max_engine_id + 1, sizeof(c->val));
+	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
 	assert(c->val && c->last);
 
 	igt_drm_client_update(c, pid, name, info->busy);
@@ -152,6 +173,13 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 
 void igt_drm_client_free(struct igt_drm_client *c)
 {
+	unsigned int i;
+
+	for (i = 0; i <= c->engines->max_engine_id; i++)
+		free(c->engines->names[i]);
+	free(c->engines->capacity);
+	free(c->engines->names);
+	free(c->engines);
 	free(c->val);
 	free(c->last);
 	memset(c, 0, sizeof(*c));
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 6da445eab34a..4668df2d7fd6 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -35,10 +35,11 @@ enum igt_drm_client_status {
 	IGT_DRM_CLIENT_PROBE
 };
 
-struct igt_drm_client_engine_class {
-	unsigned int engine_class;
-	const char *name;
+struct igt_drm_client_engines {
 	unsigned int num_engines;
+	unsigned int max_engine_id;
+	unsigned int *capacity;
+	char **names;
 };
 
 struct igt_drm_clients;
@@ -47,6 +48,7 @@ struct igt_drm_client {
 	struct igt_drm_clients *clients;
 
 	enum igt_drm_client_status status;
+	struct igt_drm_client_engines *engines;
 	unsigned int id;
 	unsigned int drm_minor;
 	unsigned int pid;
@@ -63,9 +65,6 @@ struct igt_drm_clients {
 	unsigned int num_clients;
 	unsigned int active_clients;
 
-	unsigned int num_classes;
-	struct igt_drm_client_engine_class *engine_class;
-
 	void *private_data;
 
 	struct igt_drm_client *client; /* Must be last. */
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 99e8e1d8ffd4..fb7ec9ae6d74 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -66,6 +66,12 @@ struct pmu_counter {
 	bool present;
 };
 
+struct engine_class {
+	unsigned int engine_class;
+	const char *name;
+	unsigned int num_engines;
+};
+
 struct engine {
 	const char *name;
 	char *display_name;
@@ -84,7 +90,7 @@ struct engine {
 struct engines {
 	unsigned int num_engines;
 	unsigned int num_classes;
-	struct igt_drm_client_engine_class *class;
+	struct engine_class *class;
 	unsigned int num_counters;
 	DIR *root;
 	int fd;
@@ -116,6 +122,11 @@ struct engines {
 
 };
 
+struct intel_clients {
+	const char *pci_slot;
+	struct igt_drm_client_engines classes;
+};
+
 static struct termios termios_orig;
 
 __attribute__((format(scanf,3,4)))
@@ -733,9 +744,8 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 	ac = calloc(clients->num_clients, sizeof(*c));
 	assert(ac);
 
-	aggregated->num_classes = clients->num_classes;
-	aggregated->engine_class = clients->engine_class;
 	aggregated->private_data = clients->private_data;
+
 	aggregated->client = ac;
 
 	igt_for_each_drm_client(clients, c, tmp) {
@@ -756,7 +766,8 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			ac->pid = c->pid;
 			strcpy(ac->name, c->name);
 			strcpy(ac->print_name, c->print_name);
-			ac->val = calloc(clients->num_classes,
+			ac->engines = c->engines;
+			ac->val = calloc(c->engines->max_engine_id + 1,
 					 sizeof(ac->val[0]));
 			assert(ac->val);
 			ac->samples = 1;
@@ -771,7 +782,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 		ac->total_runtime += c->total_runtime;
 		ac->last_runtime += c->last_runtime;
 
-		for (i = 0; i < clients->num_classes; i++)
+		for (i = 0; i <= c->engines->max_engine_id; i++)
 			ac->val[i] += c->val[i];
 	}
 
@@ -1498,15 +1509,15 @@ print_engines_footer(struct engines *engines, double t,
 
 static int class_cmp(const void *_a, const void *_b)
 {
-	const struct igt_drm_client_engine_class *a = _a;
-	const struct igt_drm_client_engine_class *b = _b;
+	const struct engine_class *a = _a;
+	const struct engine_class *b = _b;
 
 	return a->engine_class - b->engine_class;
 }
 
 static void init_engine_classes(struct engines *engines)
 {
-	struct igt_drm_client_engine_class *classes;
+	struct engine_class *classes;
 	unsigned int i, num;
 	int max = -1;
 
@@ -1678,6 +1689,8 @@ static int
 print_clients_header(struct igt_drm_clients *clients, int lines,
 		     int con_w, int con_h, int *class_w)
 {
+	struct intel_clients *iclients = clients->private_data;
+
 	if (output_mode == INTERACTIVE) {
 		const char *pidname = "   PID              NAME ";
 		unsigned int num_active = 0;
@@ -1692,25 +1705,25 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
 		if (lines++ >= con_h || len >= con_w)
 			return lines;
 
-		if (clients->num_classes) {
+		if (iclients->classes.num_engines) {
 			unsigned int i;
 			int width;
 
-			for (i = 0; i < clients->num_classes; i++) {
-				if (clients->engine_class[i].num_engines)
+			for (i = 0; i <= iclients->classes.max_engine_id; i++) {
+				if (iclients->classes.capacity[i])
 					num_active++;
 			}
 
 			*class_w = width = (con_w - len) / num_active;
 
-			for (i = 0; i < clients->num_classes; i++) {
-				const char *name = clients->engine_class[i].name;
+			for (i = 0; i <= iclients->classes.max_engine_id; i++) {
+				const char *name = iclients->classes.names[i];
 				int name_len = strlen(name);
 				int pad = (width - name_len) / 2;
 				int spaces = width - pad - name_len;
 
-				if (!clients->engine_class[i].num_engines)
-					continue; /* Assert in the ideal world. */
+				if (!iclients->classes.capacity[i])
+					continue;
 
 				if (pad < 0 || spaces < 0)
 					continue;
@@ -1725,7 +1738,7 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
 		n_spaces(con_w - len);
 		printf("\033[0m\n");
 	} else {
-		if (clients->num_classes)
+		if (iclients->classes.num_engines)
 			pops->open_struct("clients");
 	}
 
@@ -1740,6 +1753,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 	     int con_w, int con_h, unsigned int period_us, int *class_w)
 {
 	struct igt_drm_clients *clients = c->clients;
+	struct intel_clients *iclients = clients->private_data;
 	unsigned int i;
 
 	if (output_mode == INTERACTIVE) {
@@ -1750,14 +1764,16 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 
 		printf("%6u %17s ", c->pid, c->print_name);
 
-		for (i = 0; c->samples > 1 && i < clients->num_classes; i++) {
+		for (i = 0;
+		     c->samples > 1 && i <= iclients->classes.max_engine_id;
+		     i++) {
 			double pct;
 
-			if (!clients->engine_class[i].num_engines)
-				continue; /* Assert in the ideal world. */
+			if (!iclients->classes.capacity[i])
+				continue;
 
 			pct = (double)c->val[i] / period_us / 1e3 * 100 /
-			      clients->engine_class[i].num_engines;
+			      iclients->classes.capacity[i];
 
 			/*
 			 * Guard against possible time-drift between sampling
@@ -1785,11 +1801,11 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 		if (c->samples > 1) {
 			pops->open_struct("engine-classes");
 
-			for (i = 0; i < clients->num_classes; i++) {
+			for (i = 0; i <= iclients->classes.max_engine_id; i++) {
 				double pct;
 
 				snprintf(buf, sizeof(buf), "%s",
-					clients->engine_class[i].name);
+					 iclients->classes.names[i]);
 				pops->open_struct(buf);
 
 				pct = (double)c->val[i] / period_us / 1e3 * 100;
@@ -1818,7 +1834,9 @@ print_clients_footer(struct igt_drm_clients *clients, double t,
 		if (lines++ < con_h)
 			printf("\n");
 	} else {
-		if (clients->num_classes)
+		struct intel_clients *iclients = clients->private_data;
+
+		if (iclients->classes.num_engines)
 			pops->close_struct();
 	}
 
@@ -2018,14 +2036,47 @@ static void show_help_screen(void)
 static bool client_match(const struct igt_drm_clients *clients,
 			 const struct drm_client_fdinfo *info)
 {
+	struct intel_clients *iclients = clients->private_data;
+
 	if (strcmp(info->driver, "i915"))
 		return false;
-	if (strcmp(info->pdev, clients->private_data))
+	if (strcmp(info->pdev, iclients->pci_slot))
 		return false;
 
 	return true;
 }
 
+static void
+intel_init_clients(struct intel_clients *iclients,
+		   const struct igt_device_card *card, struct engines *engines)
+{
+	unsigned int i;
+
+	iclients->pci_slot = strdup(card->pci_slot_name[0] ?
+				    card->pci_slot_name : IGPU_PCI);
+	assert(iclients->pci_slot);
+
+	iclients->classes.num_engines = engines->num_classes;
+	iclients->classes.max_engine_id = engines->num_classes - 1;
+
+	iclients->classes.capacity = calloc(engines->num_classes,
+					    sizeof(*iclients->classes.capacity));
+	assert(iclients->classes.capacity);
+	iclients->classes.names = calloc(engines->num_classes,
+					 sizeof(*iclients->classes.names));
+	assert(iclients->classes.names);
+
+	for (i = 0; i < engines->num_classes; i++) {
+		if (!engines->class[i].num_engines)
+			continue;
+
+		iclients->classes.num_engines++;
+		iclients->classes.max_engine_id = i;
+		iclients->classes.capacity[i] = engines->class[i].num_engines;
+		iclients->classes.names[i] = strdup(engines->class[i].name);
+	}
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
@@ -2036,6 +2087,7 @@ int main(int argc, char **argv)
 		"video",
 		"video-enhance",
 	};
+	struct intel_clients iclients;
 	int con_w = -1, con_h = -1;
 	char *output_path = NULL;
 	struct engines *engines;
@@ -2146,6 +2198,8 @@ int main(int argc, char **argv)
 	else
 		pmu_device = strdup("i915");
 
+	codename = igt_device_get_pretty_name(&card, false);
+
 	engines = discover_engines(pmu_device);
 	if (!engines) {
 		fprintf(stderr,
@@ -2174,18 +2228,14 @@ int main(int argc, char **argv)
 
 	ret = EXIT_SUCCESS;
 
-	clients = igt_drm_clients_init(strdup(card.pci_slot_name[0] ?
-					      card.pci_slot_name : IGPU_PCI));
 	init_engine_classes(engines);
-	if (clients) {
-		clients->num_classes = engines->num_classes;
-		clients->engine_class = engines->class;
-	}
+
+	intel_init_clients(&iclients, &card, engines);
+	clients = igt_drm_clients_init(&iclients);
 
 	pmu_sample(engines);
 	igt_drm_clients_scan(clients, client_match, engine_map,
 			     ARRAY_SIZE(engine_map));
-	codename = igt_device_get_pretty_name(&card, false);
 
 	while (!stop_top) {
 		struct igt_drm_clients *disp_clients;
-- 
2.32.0

