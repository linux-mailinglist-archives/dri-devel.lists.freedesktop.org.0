Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC894BF9F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEC210E777;
	Tue, 22 Feb 2022 13:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061F610E79A;
 Tue, 22 Feb 2022 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538183; x=1677074183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxwX5C2cfWIgDKMCpSb2AioJcq6p4rLgqBhPMrkwfTw=;
 b=VBhyfI1saomoFO5ngZhoz0piXQ65CYB7XPWy2qw5hTa/vCtJ23F9jwn4
 7neJLTywBrnI5FPPXoA+7dJwEwLO4iVug8jXmwNs0CYCtVy6AEJdo+5Ye
 +wHlGhcW7XiN8dT8fXYeKOXD6n1A/RZ0WN8nYCAhFiJlUC2+8JA67rpb8
 oHW5Ub/d3C2AzS+TQ/C7MCp0N/ISorv7Pbe1KpUQdt4T3c1PMowto2b1r
 XjsxwDteyWgW7nr5GqJggy733IYoauX1zJNC5IRVBRY9vdgQdUzvTBUGh
 qt28GjIJWMleP3cVozAYrtxnzkLLmNhSk++9Znm5cwB+pcHPWtR/y/uaK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326490"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326490"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534083"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:21 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/11] libdrmfdinfo: Allow specifying custom engine map
Date: Tue, 22 Feb 2022 13:55:59 +0000
Message-Id: <20220222135605.1120767-6-tvrtko.ursulin@linux.intel.com>
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

Instead of hard coding the engine names, allow a map of names to indices
to either be passed in or it gets auto-detected (less efficient) while
parsing.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c   |  7 +++---
 lib/igt_drm_clients.h   |  3 ++-
 lib/igt_drm_fdinfo.c    | 47 +++++++++++++++++++++++++++--------------
 lib/igt_drm_fdinfo.h    |  7 ++++--
 tests/i915/drm_fdinfo.c | 16 +++++++++++---
 tools/intel_gpu_top.c   | 13 ++++++++++--
 6 files changed, 66 insertions(+), 27 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 58d82648d821..591602f4c9f5 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -269,7 +269,8 @@ static bool is_drm_fd(int fd_dir, const char *name)
 struct igt_drm_clients *
 igt_drm_clients_scan(struct igt_drm_clients *clients,
 		     bool (*filter_client)(const struct igt_drm_clients *,
-					   const struct drm_client_fdinfo *))
+					   const struct drm_client_fdinfo *),
+		     const char **name_map, unsigned int map_entries)
 {
 	struct dirent *proc_dent;
 	struct igt_drm_client *c;
@@ -343,8 +344,8 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			memset(&info, 0, sizeof(info));
 
 			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
-						    fdinfo_dent->d_name,
-						    &info))
+						    fdinfo_dent->d_name, &info,
+						    name_map, map_entries))
 				continue;
 
 			if (filter_client && !filter_client(clients, &info))
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index f52080847291..91e9da4c0733 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -80,7 +80,8 @@ void igt_drm_clients_free(struct igt_drm_clients *clients);
 struct igt_drm_clients *
 igt_drm_clients_scan(struct igt_drm_clients *clients,
 		     bool (*filter_client)(const struct igt_drm_clients *,
-					   const struct drm_client_fdinfo *));
+					   const struct drm_client_fdinfo *),
+		     const char **name_map, unsigned int map_entries);
 
 struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 28c1bdbda08e..96a8b768a4b1 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -22,6 +22,7 @@
  *
  */
 
+#include <assert.h>
 #include <ctype.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -52,14 +53,10 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
 }
 
 static int parse_engine(char *line, struct drm_client_fdinfo *info,
-			size_t prefix_len, uint64_t *val)
+			size_t prefix_len,
+			const char **name_map, unsigned int map_entries,
+			uint64_t *val)
 {
-	static const char *e2class[] = {
-		"render",
-		"copy",
-		"video",
-		"video-enhance",
-	};
 	ssize_t name_len;
 	char *name, *p;
 	int found = -1;
@@ -75,10 +72,26 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 
 	name = line + prefix_len;
 
-	for (i = 0; i < ARRAY_SIZE(e2class); i++) {
-		if (!strncmp(name, e2class[i], name_len)) {
-			found = i;
-			break;
+	if (name_map) {
+		for (i = 0; i < map_entries; i++) {
+			if (!strncmp(name, name_map[i], name_len)) {
+				found = i;
+				break;
+			}
+		}
+	} else {
+		for (i = 0; i < info->num_engines; i++) {
+			if (!strncmp(name, info->names[i], name_len)) {
+				found = i;
+				break;
+			}
+		}
+
+		if (found < 0) {
+			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
+			assert((strlen(name) + 1) < sizeof(info->names[0]));
+			strncpy(info->names[info->num_engines], name, name_len);
+			found = info->num_engines;
 		}
 	}
 
@@ -109,7 +122,8 @@ static const char *find_kv(const char *buf, const char *key, size_t keylen)
 }
 
 bool
-__igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info)
+__igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
+		       const char **name_map, unsigned int map_entries)
 {
 	char buf[4096], *_buf = buf;
 	char *l, *ctx = NULL;
@@ -139,7 +153,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info)
 		} else if (!strncmp(l, "drm-engine-", 11) &&
 			   strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info, strlen("drm-engine-"),
-					   &val);
+					   name_map, map_entries, &val);
 			if (idx >= 0) {
 				if (!info->capacity[idx])
 					info->capacity[idx] = 1;
@@ -149,7 +163,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info)
 		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info,
 					   strlen("drm-engine-capacity-"),
-					   &val);
+					   name_map, map_entries, &val);
 			if (idx >= 0)
 				info->capacity[idx] = val;
 		}
@@ -161,7 +175,8 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info)
 	return true;
 }
 
-bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info)
+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info,
+			  const char **name_map, unsigned int map_entries)
 {
 	char fd[64];
 	int dir, ret;
@@ -175,7 +190,7 @@ bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info)
 	if (dir < 0)
 		return false;
 
-	res = __igt_parse_drm_fdinfo(dir, fd, info);
+	res = __igt_parse_drm_fdinfo(dir, fd, info, name_map, map_entries);
 
 	close(dir);
 
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index c527bab9a204..bea4a6304734 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -37,12 +37,15 @@ struct drm_client_fdinfo {
 
 	unsigned int num_engines;
 	unsigned int capacity[16];
+	char names[16][256];
 	uint64_t busy[16];
 };
 
-bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info);
+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info,
+			  const char **name_map, unsigned int map_entries);
 
 bool __igt_parse_drm_fdinfo(int dir, const char *fd,
-			    struct drm_client_fdinfo *info);
+			    struct drm_client_fdinfo *info,
+			    const char **name_map, unsigned int map_entries);
 
 #endif /* IGT_DRM_FDINFO_H */
diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
index e3b1ebb0f454..d1053a53ae2c 100644
--- a/tests/i915/drm_fdinfo.c
+++ b/tests/i915/drm_fdinfo.c
@@ -34,6 +34,13 @@ IGT_TEST_DESCRIPTION("Test the i915 drm fdinfo data");
 const double tolerance = 0.05f;
 const unsigned long batch_duration_ns = 500e6;
 
+static const char *engine_map[] = {
+	"render",
+	"copy",
+	"video",
+	"video-enhance",
+};
+
 #define __assert_within_epsilon(x, ref, tol_up, tol_down) \
 	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
 		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
@@ -50,7 +57,8 @@ static void basics(int i915, unsigned int num_classes)
 	struct drm_client_fdinfo info = { };
 	bool ret;
 
-	ret = igt_parse_drm_fdinfo(i915, &info);
+	ret = igt_parse_drm_fdinfo(i915, &info, engine_map,
+				   ARRAY_SIZE(engine_map));
 	igt_assert(ret);
 
 	igt_assert(!strcmp(info.driver, "i915"));
@@ -181,7 +189,8 @@ static uint64_t read_busy(int i915, unsigned int class)
 {
 	struct drm_client_fdinfo info = { };
 
-	igt_assert(igt_parse_drm_fdinfo(i915, &info));
+	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
+					ARRAY_SIZE(engine_map)));
 
 	return info.busy[class];
 }
@@ -267,7 +276,8 @@ static void read_busy_all(int i915, uint64_t *val)
 {
 	struct drm_client_fdinfo info = { };
 
-	igt_assert(igt_parse_drm_fdinfo(i915, &info));
+	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
+					ARRAY_SIZE(engine_map)));
 
 	memcpy(val, info.busy, sizeof(info.busy));
 }
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index c4f990b2a7d0..99e8e1d8ffd4 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2030,6 +2030,12 @@ int main(int argc, char **argv)
 {
 	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
 	struct igt_drm_clients *clients = NULL;
+	static const char *engine_map[] = {
+		"render",
+		"copy",
+		"video",
+		"video-enhance",
+	};
 	int con_w = -1, con_h = -1;
 	char *output_path = NULL;
 	struct engines *engines;
@@ -2177,7 +2183,8 @@ int main(int argc, char **argv)
 	}
 
 	pmu_sample(engines);
-	igt_drm_clients_scan(clients, client_match);
+	igt_drm_clients_scan(clients, client_match, engine_map,
+			     ARRAY_SIZE(engine_map));
 	codename = igt_device_get_pretty_name(&card, false);
 
 	while (!stop_top) {
@@ -2206,7 +2213,9 @@ int main(int argc, char **argv)
 
 		disp_clients =
 			display_clients(igt_drm_clients_scan(clients,
-							     client_match));
+							     client_match,
+							     engine_map,
+							     ARRAY_SIZE(engine_map)));
 
 		if (stop_top)
 			break;
-- 
2.32.0

