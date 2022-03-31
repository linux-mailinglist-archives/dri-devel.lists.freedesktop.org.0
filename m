Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E914EDB3D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D20890D3;
	Thu, 31 Mar 2022 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168E10F3F0;
 Thu, 31 Mar 2022 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735460; x=1680271460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8oXj9pkWUwvSGfVFpbikXm0TD++sjG6Zkk2XcP66oI=;
 b=UiR8xCOoCphqMNt8oFnrlq/8hfW4DDOd/9kt5zOJ0ST1QfamT+bW1w82
 aipqAInAPfZYoup7oJ9udt/+ShmJ7PBdANCR2Lgz64VF5bKVJXplyn1d6
 ajPD2z4r+rbA3jQUYjwp7OS0blmaXNUgtGZK3b/L+GSpHdASZYgYXpbj0
 q5mrKC6xavLwUczzQZ8XXfOee606MCLQcuFps5ApJRuDbJcxPThCchSqo
 Zg6ccrO2Bme4Yz9kHuwOIyBo4vgz+dzT8tjnXNlbLDPt3ZyS1CJ1q7KXa
 9bS9m/OdegZ65PRSzqd2cGvAmqwcMMdv32eZvnI0Ys9vjcGDJvv6uKyEA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260027289"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260027289"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547347356"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/12] libdrmclient: Enforce client status sort order in
 the library
Date: Thu, 31 Mar 2022 15:03:46 +0100
Message-Id: <20220331140348.2985832-11-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
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

Some libdrmclient operations require that inactive clients are last in the
list. Rather than relying on callers of the library sort routine to
implement their comparison callbacks correctly, enforce this order
directly in the library and let callers comparison callbacks concern
themselves only with ordering they are interested in.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 25 +++++++++++--
 lib/igt_drm_clients.h |  2 +-
 tools/intel_gpu_top.c | 81 +++++++++++++++++++------------------------
 3 files changed, 58 insertions(+), 50 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 6299f3632b74..e8e86969f984 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -185,10 +185,29 @@ void igt_drm_client_free(struct igt_drm_client *c)
 	memset(c, 0, sizeof(*c));
 }
 
+struct sort_context
+{
+	int (*user_cmp)(const void *, const void *, void *);
+};
+
+static int sort_cmp(const void *_a, const void *_b, void *_ctx)
+{
+	const struct sort_context *ctx = _ctx;
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
+	int cmp = b->status - a->status;
+
+	if (cmp == 0)
+		return ctx->user_cmp(_a, _b, _ctx);
+	else
+		return cmp;
+}
+
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
-		     int (*cmp)(const void *, const void *))
+		     int (*cmp)(const void *, const void *, void *))
 {
+	struct sort_context ctx = { .user_cmp = cmp };
 	unsigned int active, free;
 	struct igt_drm_client *c;
 	int tmp;
@@ -196,8 +215,8 @@ igt_drm_clients_sort(struct igt_drm_clients *clients,
 	if (!clients)
 		return clients;
 
-	qsort(clients->client, clients->num_clients, sizeof(*clients->client),
-	      cmp);
+	qsort_r(clients->client, clients->num_clients, sizeof(*clients->client),
+	      sort_cmp, &ctx);
 
 	/* Trim excessive array space. */
 	active = 0;
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 4668df2d7fd6..47547aa8b75f 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -90,7 +90,7 @@ igt_drm_clients_find(struct igt_drm_clients *clients,
 
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
-		     int (*cmp)(const void *, const void *));
+		     int (*cmp)(const void *, const void *, void *));
 
 void igt_drm_client_update(struct igt_drm_client *c,
 			   unsigned int pid, char *name, uint64_t val[16]);
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index fb7ec9ae6d74..fcc4e5501d3d 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -644,85 +644,74 @@ static void pmu_sample(struct engines *engines)
 	}
 }
 
-static int client_last_cmp(const void *_a, const void *_b)
+static int
+__client_id_cmp(const struct igt_drm_client *a,
+		const struct igt_drm_client *b)
+{
+	if (a->id > b->id)
+		return 1;
+	else if (a->id < b->id)
+		return -1;
+	else
+		return 0;
+}
+
+static int client_last_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	long tot_a, tot_b;
+	long val_a = a->last_runtime, val_b = b->last_runtime;
 
 	/*
 	 * Sort clients in descending order of runtime in the previous sampling
-	 * period for active ones, followed by inactive. Tie-breaker is client
-	 * id.
+	 * period. Tie-breaker is client id.
 	 */
 
-	tot_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->last_runtime : -1;
-	tot_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->last_runtime : -1;
-
-	tot_b -= tot_a;
-	if (tot_b > 0)
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
 		return 1;
-	if (tot_b < 0)
+	else
 		return -1;
-
-	return (int)b->id - a->id;
 }
 
-static int client_total_cmp(const void *_a, const void *_b)
+static int client_total_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	long tot_a, tot_b;
+	long val_a = a->total_runtime, val_b = b->total_runtime;
 
-	tot_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->total_runtime : -1;
-	tot_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->total_runtime : -1;
-
-	tot_b -= tot_a;
-	if (tot_b > 0)
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
 		return 1;
-	if (tot_b < 0)
+	else
 		return -1;
-
-	return (int)b->id - a->id;
 }
 
-static int client_id_cmp(const void *_a, const void *_b)
+static int client_id_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	int id_a, id_b;
-
-	id_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->id : -1;
-	id_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->id : -1;
-
-	id_b -= id_a;
-	if (id_b > 0)
-		return 1;
-	if (id_b < 0)
-		return -1;
 
-	return (int)b->id - a->id;
+	return __client_id_cmp(a, b);
 }
 
-static int client_pid_cmp(const void *_a, const void *_b)
+static int client_pid_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	int pid_a, pid_b;
-
-	pid_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->pid : INT_MAX;
-	pid_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->pid : INT_MAX;
+	int val_a = a->pid, val_b = b->pid;
 
-	pid_b -= pid_a;
-	if (pid_b > 0)
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
 		return -1;
-	if (pid_b < 0)
+	else
 		return 1;
-
-	return (int)a->id - b->id;
 }
 
-static int (*client_cmp)(const void *, const void *) = client_last_cmp;
+static int (*client_cmp)(const void *, const void *, void *) = client_last_cmp;
 
 static bool aggregate_pids = true;
 
@@ -1910,7 +1899,7 @@ static void interactive_stdin(void)
 static void select_client_sort(void)
 {
 	struct {
-		int (*cmp)(const void *, const void *);
+		int (*cmp)(const void *, const void *, void *);
 		const char *msg;
 	} cmp[] = {
 		{ client_last_cmp, "Sorting clients by current GPU usage." },
-- 
2.32.0

