Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D74BF9F2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEADE10E679;
	Tue, 22 Feb 2022 13:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192E10E5E9;
 Tue, 22 Feb 2022 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538176; x=1677074176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yqMvWpqfppHNsmEjadq6Fwk41QTTYw8idNISya2ekrg=;
 b=P42QHd59J/NHN1RFx/k4dujlL4kDr9eh+/qgHNvBEHeEyCGrMfLuVpLq
 /XuePd8uw17qeocEKqBCNMzN0vP273O0A6T0yxxgLG60sbh0we9NeXpcp
 hhJu5JQ+/vyZ/JiCUNdYeqOqEn4+ykuyy4repy0wqm3hHMran1BPTl1nz
 RYM3Prt2I/nlQGA/oxfQeexGku5kc4mHmwdCubTtfaVrQpfKLcR+VDLGD
 omkcbJxCzLR9cCYX6iOEk83pUWL2zjJY1jtpoIj1ooA5Mk1AvWiWsufah
 hYRorqyIGQgGJi0Ed8cLSUorrFHAeNuLNaLgns0a1g2CFYZhhm0hiPyZf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326443"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326443"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534053"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:14 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/11] lib: Helper library for parsing i915 fdinfo output
Date: Tue, 22 Feb 2022 13:55:55 +0000
Message-Id: <20220222135605.1120767-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
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

Tests and intel_gpu_top will share common code for parsing this file.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_fdinfo.c | 183 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_fdinfo.h |  48 ++++++++++++
 lib/meson.build      |   7 ++
 3 files changed, 238 insertions(+)
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
new file mode 100644
index 000000000000..28c1bdbda08e
--- /dev/null
+++ b/lib/igt_drm_fdinfo.c
@@ -0,0 +1,183 @@
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
+#include <ctype.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+
+#include "igt_drm_fdinfo.h"
+
+static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
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
+static int parse_engine(char *line, struct drm_client_fdinfo *info,
+			size_t prefix_len, uint64_t *val)
+{
+	static const char *e2class[] = {
+		"render",
+		"copy",
+		"video",
+		"video-enhance",
+	};
+	ssize_t name_len;
+	char *name, *p;
+	int found = -1;
+	unsigned int i;
+
+	p = index(line, ':');
+	if (!p || p == line)
+		return -1;
+
+	name_len = p - line - prefix_len;
+	if (name_len < 1)
+		return -1;
+
+	name = line + prefix_len;
+
+	for (i = 0; i < ARRAY_SIZE(e2class); i++) {
+		if (!strncmp(name, e2class[i], name_len)) {
+			found = i;
+			break;
+		}
+	}
+
+	if (found >= 0) {
+		while (*++p && isspace(*p));
+		*val = strtoull(p, NULL, 10);
+	}
+
+	return found;
+}
+
+static const char *find_kv(const char *buf, const char *key, size_t keylen)
+{
+	const char *p = buf;
+
+	p = index(buf, ':');
+	if (!p || p == buf)
+		return NULL;
+
+	if ((p - buf) != keylen)
+		return NULL;
+
+	while (*++p && isspace(*p));
+	if (*p && !strncmp(buf, key, keylen))
+		return p;
+
+	return NULL;
+}
+
+bool
+__igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info)
+{
+	char buf[4096], *_buf = buf;
+	char *l, *ctx = NULL;
+	unsigned int good = 0;
+	size_t count;
+
+	count = read_fdinfo(buf, sizeof(buf), dir, fd);
+	if (!count)
+		return false;
+
+	while ((l = strtok_r(_buf, "\n", &ctx))) {
+		uint64_t val = 0;
+		const char *v;
+		int idx;
+
+		_buf = NULL;
+
+		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
+			strncpy(info->driver, v, sizeof(info->driver) - 1);
+			good++;
+		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
+			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
+		}  else if ((v = find_kv(l, "drm-client-id",
+					 strlen("drm-client-id")))) {
+			info->id = atol(v);
+			good++;
+		} else if (!strncmp(l, "drm-engine-", 11) &&
+			   strncmp(l, "drm-engine-capacity-", 20)) {
+			idx = parse_engine(l, info, strlen("drm-engine-"),
+					   &val);
+			if (idx >= 0) {
+				if (!info->capacity[idx])
+					info->capacity[idx] = 1;
+				info->busy[idx] = val;
+				info->num_engines++;
+			}
+		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
+			idx = parse_engine(l, info,
+					   strlen("drm-engine-capacity-"),
+					   &val);
+			if (idx >= 0)
+				info->capacity[idx] = val;
+		}
+	}
+
+	if (good < 2 || !info->num_engines)
+		return false; /* fdinfo format not as expected */
+
+	return true;
+}
+
+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info)
+{
+	char fd[64];
+	int dir, ret;
+	bool res;
+
+	ret = snprintf(fd, sizeof(fd), "%u", drm_fd);
+	if (ret < 0 || ret == sizeof(fd))
+		return false;
+
+	dir = open("/proc/self/fdinfo", O_DIRECTORY | O_RDONLY);
+	if (dir < 0)
+		return false;
+
+	res = __igt_parse_drm_fdinfo(dir, fd, info);
+
+	close(dir);
+
+	return res;
+}
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
new file mode 100644
index 000000000000..c527bab9a204
--- /dev/null
+++ b/lib/igt_drm_fdinfo.h
@@ -0,0 +1,48 @@
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
+#ifndef IGT_DRM_FDINFO_H
+#define IGT_DRM_FDINFO_H
+
+#include <sys/types.h>
+#include <dirent.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+struct drm_client_fdinfo {
+	char driver[128];
+	char pdev[128];
+	unsigned long id;
+
+	unsigned int num_engines;
+	unsigned int capacity[16];
+	uint64_t busy[16];
+};
+
+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info);
+
+bool __igt_parse_drm_fdinfo(int dir, const char *fd,
+			    struct drm_client_fdinfo *info);
+
+#endif /* IGT_DRM_FDINFO_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3e43316d1e36..d00817dc58bc 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -16,6 +16,7 @@ lib_sources = [
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
+	'igt_drm_fdinfo.c',
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
@@ -216,6 +217,12 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
 				  include_directories : inc)
 
+lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
+	['igt_drm_fdinfo.c'],
+	include_directories : inc)
+
+lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
+				  include_directories : inc)
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.32.0

