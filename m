Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072DFB9E860
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1325810E8BC;
	Thu, 25 Sep 2025 09:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOSH65oT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A5A10E8BA;
 Thu, 25 Sep 2025 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758794312; x=1790330312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A1vETdNmB+RgkQCnYcecAOv9GsR3L219TL7RTb6Ss1g=;
 b=JOSH65oT+YzxnetvE/Z9u1fOVwo+as89VrbL6A+ywcGjbpzp4Vx0nCcc
 WZm2ZD/Uzhtc50LIvvj2hLsdq92AKesfeiTbE1GxwPPNPtMkDay5JvYqA
 pp6ufb3NfEP+lRYDzuE5+nGT+/hnE8smVRiChR3NUyrTjcJpTpFNNuYzp
 x9jNdzcjPQ/Xd1lIuH3mIhTcZdR9BIBNI6ig2sFNy7n+RPRmr2d9GRfsW
 1aTI/fsa/5d2XTjG0S1t/bptL1WxeSOtUjQsdSeIDgec+3PH/VOITN0Rm
 XP933GZyNl48nsUquBtba8q8MeAUsV0aeEAWJmVz4VBTfGgl2SfaAEnmd A==;
X-CSE-ConnectionGUID: rDYTIZllRRiheyZWrsQabw==
X-CSE-MsgGUID: 8fPSR99hTC6r0uICN32I8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61273427"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61273427"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:58:32 -0700
X-CSE-ConnectionGUID: ELOsSbzcQnOT9ji0hYIqsQ==
X-CSE-MsgGUID: wOsv64Y2R3u+HhF3Q0e/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177128859"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.90])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:58:29 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/syncobj_timeline: Exercise signaling of
 awaited points
Date: Thu, 25 Sep 2025 11:55:37 +0200
Message-ID: <20250925095806.1967580-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CI reports kernel soft lockups when running a wait_backward test case of
igt@dmabuf@all-tests@dma_fence_chain selftest on less powerful machines.
A kernel fix has been developed that has proven to resolve the issue, but
it hasn't been accepted upstream, with a recommendation for dropping that
test case as a "nonsense".

Before we decide to take that path, try to implement the problematic test
case in user space as an IGT subtest.  Since no kernel uAPIs have been
found that allow strict reimplementation of exact algorithm of the
problematic test case, where every link of a dma-fence chain is signaled
one by one from a loop running in kernel space, provide two approximate
variants, one that signals each fence with an individual system call, and
one that depends on vgem fences being signaled automatically on their
consecutive expiry under the same schedule as they were created.

For more comprehensive testing, also implement the _forward and _random
scenarios from the original selftest, as well as simplified variants that
don't enable signaling on each link of the dma-fence chain.

v2: Fix incorrectly calculated backward ordering of syncobj points,
  - replace problematic sw_sync timeline points with vgem object fences,
  - drop wait-all subtest variants, those add no value over enable-all,
  - to simplify the code, enable signaling of each point, if requested,
    right after it is added to the syncobj timeline.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/syncobj_timeline.c | 267 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index a77896ec1d..78af6e012e 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -27,9 +27,14 @@
 #include <unistd.h>
 #include <time.h>
 #include <sys/ioctl.h>
+#include <sys/param.h>
 #include <pthread.h>
 #include <signal.h>
+
+#include "dmabuf_sync_file.h"
 #include "drm.h"
+#include "igt_vgem.h"
+
 /**
  * TEST: syncobj timeline
  * Description: Tests for the drm timeline sync object API
@@ -427,6 +432,42 @@
  *
  * SUBTEST: wait-zero-handles
  * Description: Verifies that waiting on an empty list of syncobj handles is accepted
+ *
+ * SUBTEST: stress-wait-last-signal-forward
+ * Description: Signals each fence of a large timeline while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-wait-last-signal-backward
+ * Description: Signals each fence of a large timeline in reverse order while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-wait-last-signal-random
+ * Description: Signals each fence of a large timeline in random order while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-wait-last-signal-all-forward
+ * Description: Signals all fences of a large timeline while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-wait-last-signal-all-backward
+ * Description: Signals all fences of a large reverse ordered timeline while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-wait-last-signal-all-random
+ * Description: Signals all fences of a large randomly ordered timeline while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-enable-all-signal-forward
+ * Description: Signals each fence of a large timeline with signaling enabled on each point while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-enable-all-signal-backward
+ * Description: Signals each fence of a large timeline in reversed order with signaling enabled on each point while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-enable-all-signal-random
+ * Description: Signals each fence of a large timeline in random order with signaling enabled on each point while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-enable-all-signal-all-forward
+ * Description: Signals all fences of a large timeline with signaling enabled on each point while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-enable-all-signal-all-backward
+ * Description: Signals all fences of a large reversed ordered timeline with signaling enabled on each point while another thread is waiting on that timeline
+ *
+ * SUBTEST: stress-enable-all-signal-all-random
+ * Description: Signals all fences of a large randomly ordered timeline with signaling enabled on each point while another thread is waiting on that timeline
  */
 
 IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
@@ -1675,6 +1716,216 @@ test_32bits_limit(int fd)
 	close(timeline);
 }
 
+#define STRESS_FLAGS_ENABLE_ALL		(0x1 << 0)
+#define STRESS_FLAGS_SIGNAL_ALL		(STRESS_FLAGS_ENABLE_ALL << 1)
+#define STRESS_FLAGS_SIGNAL_BACKWARD	(STRESS_FLAGS_SIGNAL_ALL << 1)
+#define STRESS_FLAGS_SIGNAL_RANDOM	(STRESS_FLAGS_SIGNAL_BACKWARD << 1)
+
+const char *stress_descriptions[] = {
+	/* stress-wait-last-signal-forward */
+	[0] =
+		"Signals each fence of a large timeline while another thread is waiting on that timeline",
+	/* stress-wait-last-signal-backward */
+	[STRESS_FLAGS_SIGNAL_BACKWARD] =
+		"Signals each fence of a large timeline in reverse order while another thread is waiting on that timeline",
+	/* stress-wait-last-signal-random */
+	[STRESS_FLAGS_SIGNAL_RANDOM] =
+		"Signals each fence of a large timeline in random order while another thread is waiting on that timeline",
+	/* stress-wait-last-signal-all-forward */
+	[STRESS_FLAGS_SIGNAL_ALL] =
+		"Signals all fences of a large timeline while another thread is waiting on that timeline",
+	/* stress-wait-last-signal-all-backward */
+	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
+		"Signals all fences of a large reverse ordered timeline while another thread is waiting on that timeline",
+	/* stress-wait-last-signal-all-random */
+	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
+		"Signals all fences of a large randomly ordered timeline while another thread is waiting on that timeline",
+	/* stress-enable-all-signal-forward */
+	[STRESS_FLAGS_ENABLE_ALL] =
+		"Signals each fence of a large timeline with signaling enabled on each point while another thread is waiting on that timeline",
+	/* stress-enable-all-signal-backward */
+	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
+		"Signals each fence of a large timeline in reversed order with signaling enabled on each point while another thread is waiting on that timeline",
+	/* stress-enable-all-signal-random */
+	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
+		"Signals each fence of a large timeline in random order with signaling enabled on each point while another thread is waiting on that timeline",
+	/* stress-enable-all-signal-all-forward */
+	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL] =
+		"Signals all fences of a large timeline with signaling enabled on each point while another thread is waiting on that timeline",
+	/* stress-enable-all-signal-all-backward */
+	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
+		"Signals all fences of a large reversed ordered timeline with signaling enabled on each point while another thread is waiting on that timeline",
+	/* stress-enable-all-signal-all-random */
+	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
+		"Signals all fences of a large randomly ordered timeline with signaling enabled on each point while another thread is waiting on that timeline",
+};
+
+#define TL_LENGTH 4096
+
+struct stress_timeline {
+	int fd;
+	int vgem;
+	int dmabuf;
+	int sync_file;
+	uint32_t syncobj;
+	uint32_t tmp_syncobj;
+	struct vgem_bo *vgem_bos;
+	uint32_t *vgem_fences;
+	uint64_t *order;
+	uint64_t length;
+	unsigned int flags;
+};
+
+static void stress_init(int fd, struct stress_timeline **timeline, unsigned int flags)
+{
+	struct stress_timeline *tl;
+	uint64_t point;
+	int i;
+
+	tl = calloc(TL_LENGTH, sizeof(*tl));
+	igt_assert(tl);
+	*timeline = tl;
+
+	tl->fd = fd;
+	tl->length = TL_LENGTH;
+	tl->flags = flags;
+	tl->dmabuf = -1;
+	tl->sync_file = -1;
+
+	tl->vgem = drm_open_driver(DRIVER_VGEM);
+	tl->syncobj = syncobj_create(fd, 0);
+
+	tl->vgem_bos = calloc(tl->length, sizeof(*tl->vgem_bos));
+	igt_assert(tl->vgem_bos);
+	for (i = 0; i < tl->length; i++) {
+		tl->vgem_bos[i].width = 1;
+		tl->vgem_bos[i].height = 1;
+		tl->vgem_bos[i].bpp = 4;
+	}
+
+	tl->vgem_fences = calloc(tl->length, sizeof(*tl->vgem_fences));
+	igt_assert(tl->vgem_fences);
+
+	tl->order = calloc(tl->length, sizeof(*tl->order));
+	igt_assert(tl->order);
+	for (i = 0; i < tl->length; i++)
+		tl->order[i] = flags & STRESS_FLAGS_SIGNAL_BACKWARD ? tl->length - 1 - i : i;
+	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
+		igt_permute_array(tl->order, tl->length, igt_exchange_int64);
+
+	for (i = 0; i < tl->length; i++) {
+		vgem_create(tl->vgem, &tl->vgem_bos[i]);
+		tl->vgem_fences[i] = vgem_fence_attach(tl->vgem, &tl->vgem_bos[i], 0);
+	}
+
+	for (point = 1; point <= tl->length; point++) {
+		i = tl->order[point - 1];
+		tl->dmabuf = prime_handle_to_fd(tl->vgem, tl->vgem_bos[i].handle);
+		igt_assert_fd(tl->dmabuf);
+
+		tl->sync_file = dmabuf_export_sync_file(tl->dmabuf, DMA_BUF_SYNC_RW);
+		igt_assert_fd(tl->sync_file);
+		close(tl->dmabuf);
+		tl->dmabuf = -1;
+
+		tl->tmp_syncobj = syncobj_create(fd, 0);
+		syncobj_import_sync_file(fd, tl->tmp_syncobj, tl->sync_file);
+		close(tl->sync_file);
+		tl->sync_file = -1;
+
+		syncobj_binary_to_timeline(fd, tl->syncobj, point, tl->tmp_syncobj);
+		syncobj_destroy(fd, tl->tmp_syncobj);
+		tl->tmp_syncobj = 0;
+
+		if (flags & STRESS_FLAGS_ENABLE_ALL)
+			igt_assert_eq(syncobj_timeline_wait_err(tl->fd, &tl->syncobj,
+								&point, 1, 0, 0), -ETIME);
+	}
+
+	syncobj_timeline_query(fd, &tl->syncobj, &point, 1);
+	igt_assert_eq(point, 0);
+}
+
+static void test_stress_enable_wait_signal(int fd, struct stress_timeline **timeline,
+					   unsigned int flags)
+{
+	struct stress_timeline *tl;
+	int64_t dt;
+
+	stress_init(fd, timeline, flags);
+	tl = *timeline;
+
+	if (flags & STRESS_FLAGS_SIGNAL_ALL) {
+		/* wait for in-kernel vgem fence 10s timers to expire */
+		tl->dmabuf = prime_handle_to_fd(tl->vgem, tl->vgem_bos[0].handle);
+		igt_until_timeout(11)
+			if (!dmabuf_sync_file_busy(tl->dmabuf, DMA_BUF_SYNC_RW))
+				break;
+		dt = -gettime_ns();
+	} else {
+		int i;
+
+		dt = -gettime_ns();
+		for (i = 0; i < tl->length; i++) {
+			vgem_fence_signal(tl->vgem, tl->vgem_fences[i]);
+			tl->dmabuf = prime_handle_to_fd(tl->vgem, tl->vgem_bos[i].handle);
+			igt_fail_on(dmabuf_sync_file_busy(tl->dmabuf, DMA_BUF_SYNC_RW));
+			close(tl->dmabuf);
+			tl->dmabuf = -1;
+		}
+	}
+	igt_fail_on(syncobj_timeline_wait_err(tl->fd, &tl->syncobj, &tl->length, 1,
+					      MAX(20 * NSECS_PER_SEC - dt, gettime_ns()), 0));
+	dt += gettime_ns();
+
+	igt_info("%s: %ld signals in %ld ns\n", __func__, tl->length, dt);
+}
+
+static void stress_cleanup(struct stress_timeline *timeline)
+{
+	int i;
+
+	if (!timeline)
+		return;
+
+	if (timeline->order)
+		free(timeline->order);
+
+	if (timeline->sync_file >= 0)
+		igt_warn_on(close(timeline->sync_file));
+
+	if (timeline->dmabuf >= 0)
+		igt_warn_on(close(timeline->dmabuf));
+
+	if (timeline->vgem_fences) {
+		for (i = 0; i < timeline->length; i++)
+			if (timeline->vgem_fences[i])
+				igt_ignore_warn(__vgem_fence_signal(timeline->vgem,
+								    timeline->vgem_fences[i]));
+
+		free(timeline->vgem_fences);
+	}
+
+	if (timeline->vgem_bos) {
+		for (i = 0; i < timeline->length; i++)
+			if (timeline->vgem_bos[i].handle)
+				gem_close(timeline->vgem, timeline->vgem_bos[i].handle);
+
+		free(timeline->vgem_bos);
+	}
+
+	if (timeline->vgem >= 0)
+		igt_warn_on(close(timeline->vgem));
+
+	if (timeline->tmp_syncobj)
+		syncobj_destroy(timeline->fd, timeline->tmp_syncobj);
+
+	if (timeline->syncobj)
+		syncobj_destroy(timeline->fd, timeline->syncobj);
+
+	free(timeline);
+}
+
 static bool
 has_syncobj_timeline_wait(int fd)
 {
@@ -1934,6 +2185,22 @@ igt_main
 	igt_subtest("32bits-limit")
 		test_32bits_limit(fd);
 
+	for (unsigned int flags = 0;
+	     flags < (STRESS_FLAGS_SIGNAL_BACKWARD | STRESS_FLAGS_SIGNAL_RANDOM); flags++) {
+		struct stress_timeline *timeline = NULL;
+
+		igt_describe(stress_descriptions[flags]);
+		igt_subtest_f("stress-%s-signal%s-%s",
+			      (flags & STRESS_FLAGS_ENABLE_ALL) ? "enable-all" : "wait-last",
+			      (flags & STRESS_FLAGS_SIGNAL_ALL) ? "-all" : "",
+			      (flags & STRESS_FLAGS_SIGNAL_RANDOM) ? "random" :
+			      (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? "backward" : "forward")
+			test_stress_enable_wait_signal(fd, &timeline, flags);
+
+		igt_fixture
+			stress_cleanup(READ_ONCE(timeline));
+	}
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.51.0

