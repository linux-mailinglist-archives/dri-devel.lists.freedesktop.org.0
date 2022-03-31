Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E94EDB36
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FC989061;
	Thu, 31 Mar 2022 14:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6AC10F2DC;
 Thu, 31 Mar 2022 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735461; x=1680271461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTVrt2cqXjYUP16ctlEazT6xf2B1Gz3HeJDo6NhzfT8=;
 b=LUEWxM+TzDZcxE7ErV4gUXnnF11YhBIT6ACJLR0MgpOgVdjROA0I2Tjz
 Kf1MsawGL8bLBt9KkZotLEoVuYOnkTR1InXJCuhCeESe8hO+6IEWND9VD
 sQHamBSqNVUJIuMlTMBxBRQ2SesVVPCgVzTMafhwgKfr7kizr5GQWThHO
 keisI5kn5Htj6yHecKMhHk8XT/AHHOTvd3eWDZIuP6Bakyd+VyeZJtaJK
 yQZKRB9t85ZypxjEQBOZzsie7IdTYNUxJL1NleVwz/hLR+/Wasr9qwiMS
 u+KcF9Tl9xITJPLflsU8B4toLfV98WsPowVGcUKU9NKDPi71xPBMY9KJ9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260027307"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260027307"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547347378"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:15 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/12] gputop: Basic vendor agnostic GPU top tool
Date: Thu, 31 Mar 2022 15:03:48 +0100
Message-Id: <20220331140348.2985832-13-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Rudimentary vendor agnostic example of how lib_igt_drm_clients can be used
to display a sorted by card and usage list of processes using GPUs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 tools/gputop.c    | 276 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build |   5 +
 2 files changed, 281 insertions(+)
 create mode 100644 tools/gputop.c

diff --git a/tools/gputop.c b/tools/gputop.c
new file mode 100644
index 000000000000..1a30d03753c4
--- /dev/null
+++ b/tools/gputop.c
@@ -0,0 +1,276 @@
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
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <locale.h>
+#include <math.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <termios.h>
+#include <sys/sysmacros.h>
+#include <stdbool.h>
+
+#include "igt_drm_clients.h"
+#include "igt_drm_fdinfo.h"
+
+#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
+
+static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
+
+static void n_spaces(const unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		putchar(' ');
+}
+
+static void print_percentage_bar(double percent, int max_len)
+{
+	int bar_len, i, len = max_len - 2;
+	const int w = 8;
+
+	assert(max_len > 0);
+
+	bar_len = ceil(w * percent * len / 100.0);
+	if (bar_len > w * len)
+		bar_len = w * len;
+
+	putchar('|');
+
+	for (i = bar_len; i >= w; i -= w)
+		printf("%s", bars[w]);
+	if (i)
+		printf("%s", bars[i]);
+
+	len -= (bar_len + (w - 1)) / w;
+	n_spaces(len);
+
+	putchar('|');
+}
+
+static int
+print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
+		    int *engine_w)
+{
+	const char *pidname = "    PID               NAME ";
+	int ret, len = strlen(pidname);
+
+	if (lines++ >= con_h || len >= con_w)
+		return lines;
+	printf("\033[7m");
+	ret = printf("DRM minor %u", c->drm_minor);
+	n_spaces(con_w - ret);
+
+	if (lines++ >= con_h)
+		return lines;
+	printf("\n%s", pidname);
+
+	if (c->engines->num_engines) {
+		unsigned int i;
+		int width;
+
+		*engine_w = width = (con_w - len) / c->engines->num_engines;
+
+		for (i = 0; i <= c->engines->max_engine_id; i++) {
+			const char *name = c->engines->names[i];
+			int name_len = strlen(name);
+			int pad = (width - name_len) / 2;
+			int spaces = width - pad - name_len;
+
+			if (!name)
+				continue;
+
+			if (pad < 0 || spaces < 0)
+				continue;
+
+			n_spaces(pad);
+			printf("%s", name);
+			n_spaces(spaces);
+			len += pad + name_len + spaces;
+		}
+	}
+
+	n_spaces(con_w - len);
+	printf("\033[0m\n");
+
+	return lines;
+}
+
+
+static bool
+newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
+{
+	return !pc || c->drm_minor != pc->drm_minor;
+}
+
+static bool filter_idle = true;
+
+static int
+print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
+	     double t, int lines, int con_w, int con_h,
+	     unsigned int period_us, int *engine_w)
+{
+	unsigned int i;
+
+	if (filter_idle && (!c->total_runtime || c->samples < 2))
+		return lines;
+
+	if (newheader(c, *prevc)) {
+		lines = print_client_header(c, lines, con_w, con_h, engine_w);
+		if (lines >= con_h)
+			return lines;
+	}
+
+	*prevc = c;
+
+	printf("%8u %17s ", c->pid, c->print_name);
+	lines++;
+
+	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
+		double pct;
+
+		if (!c->engines->capacity[i])
+			continue;
+
+		pct = (double)c->val[i] / period_us / 1e3 * 100 /
+		      c->engines->capacity[i];
+
+		/*
+		 * Guard against possible time-drift between sampling
+		 * client data and time we obtained our time-delta from
+		 * PMU.
+		 */
+		if (pct > 100.0)
+			pct = 100.0;
+
+		print_percentage_bar(pct, *engine_w);
+	}
+
+	putchar('\n');
+
+	return lines;
+}
+
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
+static int client_cmp(const void *_a, const void *_b, void *unused)
+{
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
+	long val_a, val_b;
+
+	val_a = a->drm_minor;
+	val_b = b->drm_minor;
+	if (val_a > val_b)
+		return 1;
+	else if (val_b > val_a)
+		return -1;
+
+	val_a = a->last_runtime;
+	val_b = b->last_runtime;
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
+		return 1;
+	else
+		return -1;
+
+}
+
+int main(int argc, char **argv)
+{
+	unsigned int period_us = 2e6;
+	struct igt_drm_clients *clients = NULL;
+	int con_w = -1, con_h = -1;
+
+	clients = igt_drm_clients_init(NULL);
+	if (!clients)
+		exit(1);
+
+	igt_drm_clients_scan(clients, NULL, NULL, 0);
+
+	for (;;) {
+		struct igt_drm_client *c, *prevc = NULL;
+		int i, engine_w = 0, lines = 0;
+		struct winsize ws;
+
+		if (ioctl(0, TIOCGWINSZ, &ws) != -1) {
+			con_w = ws.ws_col;
+			con_h = ws.ws_row;
+			if (con_w == 0 && con_h == 0) {
+				/* Serial console. */
+				con_w = 80;
+				con_h = 24;
+			}
+		}
+
+		igt_drm_clients_scan(clients, NULL, NULL, 0);
+		igt_drm_clients_sort(clients, client_cmp);
+
+		printf("\033[H\033[J");
+
+		igt_for_each_drm_client(clients, c, i) {
+			assert(c->status != IGT_DRM_CLIENT_PROBE);
+			if (c->status != IGT_DRM_CLIENT_ALIVE)
+				break; /* Active clients are first in the array. */
+
+			lines = print_client(c, &prevc, (double)period_us / 1e6,
+					     lines, con_w, con_h, period_us,
+					     &engine_w);
+			if (lines >= con_h)
+				break;
+		}
+
+		if (lines++ < con_h)
+			printf("\n");
+
+		usleep(period_us);
+	}
+
+	return 0;
+}
diff --git a/tools/meson.build b/tools/meson.build
index e65aceeef9fa..508964004bb0 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -69,6 +69,11 @@ if libudev.found()
 		   install : true)
 endif
 
+executable('gputop', 'gputop.c',
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
+
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
-- 
2.32.0

