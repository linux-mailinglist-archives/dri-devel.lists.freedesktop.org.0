Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7724B592CB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514B910E770;
	Tue, 16 Sep 2025 09:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKpYc+72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5810E770;
 Tue, 16 Sep 2025 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758016730; x=1789552730;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BoBRufdjWN6e8RDEwTyNXc2bNJaDAQEaiZ2QCwPxzKg=;
 b=LKpYc+72UjmpT26qgAmIMZRIGttqsWxrjh4JURfloQr2aZGLzS+Vwe5d
 3T92SwmhQs1v9kK5JxMMv8BL5LW63mgHAWsaoHOCXOyeYLqSmPVRsXidn
 gq59bATw3Q34biP2n94eS9u+5wcSFaA7K2uCsf6pKERKM0GoJcs6rMcco
 vu8VRPB8APDRhaiIBL9IF1lYeVjdCpybc8p3XlcC3ctz3dwEF15fKEjf2
 x+E1pUBRO/yhp6ab/CQBn/C8gb0hK8GQdVlkgfH4KWcx/2/cAhj0+pVXq
 vC79b1asB61yXeQc17i8wg2+MWsN38MqKQBFVr+Bwn67dyrBoMnrPG4ug A==;
X-CSE-ConnectionGUID: EpJRery4TsqnlS8b1fWBfQ==
X-CSE-MsgGUID: r68K4QE3S8qg69WGqlfLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71715796"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="71715796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 02:58:49 -0700
X-CSE-ConnectionGUID: S+lsAEP6RcC4vmbaMXR/RA==
X-CSE-MsgGUID: r+pQ+KggR16rmNDNs9oamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="205685526"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.186])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 02:58:46 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t] tests/syncobj_timeline: Exercise signaling of awaited
 points
Date: Tue, 16 Sep 2025 11:55:57 +0200
Message-ID: <20250916095707.918819-2-janusz.krzysztofik@linux.intel.com>
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
one that signals them all in one shot with one system call.

For more comprehensive testing, also implement the _forward and _random
scenarios from the original selftest, as well as simplified variants that
don't enable signaling on each link of the dma-fence chain, and yet others
that not only enable but also wait on every link of the chain.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/syncobj_timeline.c | 289 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index a77896ec1d..80c5970687 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -427,6 +427,61 @@
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
+ *
+ * SUBTEST: stress-wait-all-signal-forward
+ * Description: Signals each fence of a large timeline while another thread is waiting on each point of that timeline
+ *
+ * SUBTEST: stress-wait-all-signal-backward
+ * Description: Signals each fence of a large timeline in reversed order while another thread is waiting on each point of that timeline
+ *
+ * SUBTEST: stress-wait-all-signal-random
+ * Description: Signals each fence of a large timeline in random order while another thread is waiting on each point of that timeline
+ *
+ * SUBTEST: stress-wait-all-signal-all-forward
+ * Description: Signals all fences of a large timeline while another thread is waiting on each point of that timeline
+ *
+ * SUBTEST: stress-wait-all-signal-all-backward
+ * Description: Signals all fences of a large reversed ordered timeline while another thread is waiting on each point of that timeline
+ *
+ * SUBTEST: stress-wait-all-signal-all-random
+ * Description: Signals all fences of a large randomly ordered timeline while another thread is waiting on each point of that timeline
+ *
  */
 
 IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
@@ -1675,6 +1730,217 @@ test_32bits_limit(int fd)
 	close(timeline);
 }
 
+#define STRESS_FLAGS_WAIT_ALL		DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL
+#define STRESS_FLAGS_ENABLE_ALL		(STRESS_FLAGS_WAIT_ALL << 1)
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
+	/* stress-wait-all-signal-forward */
+	[STRESS_FLAGS_WAIT_ALL] =
+		"Signals each fence of a large timeline while another thread is waiting on each point of that timeline",
+	/* stress-wait-all-signal-backward */
+	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
+		"Signals each fence of a large timeline in reversed order while another thread is waiting on each point of that timeline",
+	/* stress-wait-all-signal-random */
+	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
+		"Signals each fence of a large timeline in random order while another thread is waiting on each point of that timeline",
+	/* stress-wait-all-signal-all-forward */
+	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL] =
+		"Signals all fences of a large timeline while another thread is waiting on each point of that timeline",
+	/* stress-wait-all-signal-all-backward */
+	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
+		"Signals all fences of a large reversed ordered timeline while another thread is waiting on each point of that timeline",
+	/* stress-wait-all-signal-all-random */
+	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
+		"Signals all fences of a large randomly ordered timeline while another thread is waiting on each point of that timeline",
+};
+
+#define TL_LENGTH 4096
+
+struct stress_timeline {
+	int fd;
+	int swsync;
+	uint32_t syncobj;
+	int tmp_fence;
+	uint32_t *syncobjs;
+	uint64_t *points;
+	unsigned int length;
+	unsigned int flags;
+	pthread_t thread;
+	int retval;
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
+	tl->tmp_fence = -1;
+	tl->length = TL_LENGTH;
+	tl->flags = flags;
+
+	tl->swsync = sw_sync_timeline_create();
+	tl->syncobj = syncobj_create(fd, 0);
+
+	tl->syncobjs = calloc(tl->length, sizeof(*tl->syncobjs));
+	igt_assert(tl->syncobjs);
+
+	tl->points = calloc(tl->length, sizeof(*tl->points));
+	igt_assert(tl->points);
+
+	for (i = 0; i < tl->length; i++)
+		tl->points[i] = (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? tl->length - 1 : i + 1;
+	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
+		igt_permute_array(tl->points, tl->length, igt_exchange_int64);
+
+	for (i = 0; i < tl->length; i++) {
+		tl->tmp_fence = sw_sync_timeline_create_fence(tl->swsync, tl->points[i]);
+		tl->syncobjs[i] = syncobj_create(fd, 0);
+
+		syncobj_import_sync_file(fd, tl->syncobjs[i], tl->tmp_fence);
+		close(tl->tmp_fence);
+		tl->tmp_fence = -1;
+
+		syncobj_binary_to_timeline(fd, tl->syncobj, i + 1, tl->syncobjs[i]);
+		syncobj_destroy(fd, tl->syncobjs[i]);
+
+		tl->syncobjs[i] = tl->syncobj;
+		tl->points[i] = i + 1;
+	}
+
+	if (flags & STRESS_FLAGS_ENABLE_ALL)
+		igt_assert_eq(syncobj_timeline_wait_err(tl->fd, tl->syncobjs,
+							tl->points, tl->length, 0,
+							DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL), -ETIME);
+
+	syncobj_timeline_query(fd, &tl->syncobj, &point, 1);
+	igt_assert_eq(point, 0);
+}
+
+static void *stress_wait_syncobj_thread_func(void *data)
+{
+	struct stress_timeline *tl = data;
+	unsigned int count = (tl->flags & STRESS_FLAGS_WAIT_ALL) ? tl->length : 1;
+	uint64_t *points = &tl->points[tl->length - count];
+
+	tl->retval = -EINPROGRESS;
+
+	/* Wait for the timeline signaled */
+	tl->retval = syncobj_timeline_wait_err(tl->fd, tl->syncobjs, points, count,
+					       gettime_ns() + 600 * NSECS_PER_SEC,
+					       tl->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL);
+
+	return &tl->retval;
+}
+
+static void test_stress_enable_wait_signal(int fd, struct stress_timeline **timeline,
+					   unsigned int flags)
+{
+	struct stress_timeline *tl;
+	int64_t dt;
+	int i;
+
+	stress_init(fd, timeline, flags);
+	tl = *timeline;
+
+	tl->retval = 0;
+	igt_assert_eq(pthread_create(&tl->thread, NULL,
+				     stress_wait_syncobj_thread_func, tl), 0);
+	igt_assert_eq(sched_yield(), 0);
+	while (READ_ONCE(tl->retval) != -EINPROGRESS)
+		;
+	igt_assert_eq(sched_yield(), 0);
+
+	dt = -gettime_ns();
+	if (flags & STRESS_FLAGS_SIGNAL_ALL)
+		sw_sync_timeline_inc(tl->swsync, tl->length);
+	else
+		for (i = 0; i < tl->length; i++)
+			sw_sync_timeline_inc(tl->swsync, 1);
+	dt += gettime_ns();
+	igt_info("%s: %d signals in %ld ns\n", __func__, tl->length, dt);
+
+	igt_assert_eq(pthread_join(tl->thread, NULL), 0);
+	tl->thread = 0;
+	igt_assert_eq(tl->retval, 0);
+}
+
+static void stress_cleanup(struct stress_timeline *timeline)
+{
+	if (!timeline)
+		return;
+
+	if (timeline->thread)
+		igt_warn_on(pthread_join(timeline->thread, NULL));
+
+	if (timeline->points)
+		free(timeline->points);
+
+	if (timeline->syncobjs) {
+		int i;
+
+		for (i = 0; i < timeline->length; i++)
+			if (timeline->syncobjs && timeline->syncobjs[i] != timeline->syncobj)
+				syncobj_destroy(timeline->fd, timeline->syncobjs[i]);
+		free(timeline->syncobjs);
+	}
+
+	if (timeline->tmp_fence >= 0)
+		igt_warn_on(close(timeline->tmp_fence));
+
+	if (timeline->syncobj)
+		syncobj_destroy(timeline->fd, timeline->syncobj);
+
+	if (timeline->swsync >= 0)
+		igt_warn_on(close(timeline->swsync));
+
+	free(timeline);
+}
+
 static bool
 has_syncobj_timeline_wait(int fd)
 {
@@ -1934,6 +2200,29 @@ igt_main
 	igt_subtest("32bits-limit")
 		test_32bits_limit(fd);
 
+	for (unsigned int flags = 0;
+	     flags < (STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL |
+		      STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM);
+	     flags++) {
+		struct stress_timeline *timeline = NULL;
+
+		if (flags & STRESS_FLAGS_ENABLE_ALL && flags & STRESS_FLAGS_WAIT_ALL)
+			continue;
+
+		igt_describe(stress_descriptions[flags]);
+		igt_subtest_f("stress-%s-%s-signal%s-%s",
+			      (flags & STRESS_FLAGS_ENABLE_ALL) ? "enable" : "wait",
+			      (flags & (STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_ENABLE_ALL)) ? "all" :
+											    "last",
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

