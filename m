Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEEB571133
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 06:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E64814B424;
	Tue, 12 Jul 2022 04:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B958611B3FF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 04:23:12 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 c21-20020a624e15000000b0052abf43401fso1653135pfb.14
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 21:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=4htvJMwk9Uq3+H7F7oT1uH3l+HozdkoS/P4WOYTuXyA=;
 b=Gn4PWW33xaYPLR1oWicT6XyTa/Ua0WKtB4gfnmNOEdWNwe4iE8ZncGu6ZHaJtebdKb
 9IhkYU0FIUh7IOAvfk/YqAI4iguG3td7S5738WODO0cG40sL4Or8GHPNzsjg8bwNBlaB
 MSFmirwqwVd5Hw7eyr6/YVKXbq+wGAO6Z3NTHQil2xhUFrSwx1wjjjQ2sK64ZswAItL1
 Y/Px8MqzjtyeTuXOcCeUqEwOJ04iRjx1lLmbG3eNOj3SilURf8mue+MdlbuCEvE5D2W5
 cBgySFI4TN6LfIImg1JGn4NRCdKecXHYjMmLtJrZRJ4bgWvSSuiCu0KH0r/NllCDOAZS
 zmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=4htvJMwk9Uq3+H7F7oT1uH3l+HozdkoS/P4WOYTuXyA=;
 b=5c14MxvCxzg3NZDzgnVD9tsAsHC6+ZnszZ7/4nZNmZsm00Gaa/a3wryEbT8ESzStzj
 XihtsHshUjh5hJCJ5LWq3EkXKSrTYaeTajyegsyr32lkkmnb1s2bDPz5PsNqIUDhtsNC
 3+FxF+pFfb4F7u7rdORrUMWPfYgdKEaUqMiuCqddyLWiC/CvLxe6HMxPcA8ZTi1LzRAL
 E/ibYfdKpZuG0NrHhtnGffa3NPjXVs7I9jIAQ0NxLQoJte6Rs/VN25f1pXsR5ospbP1V
 NV4C5cO2uRu0OyVmJkJAloToe7hE2WJSMo5PLIgUo9GWbDGVKYV4hw8FlfA8dUvCu3QS
 I8zg==
X-Gm-Message-State: AJIora9cn1zrK1I/iajrYrq/Q7ue2febfAxsNz9U6jLZ1cFOIhvpcXdl
 8MP4AR75o3q1Nqe0dJRMf5KEoC+0yFk=
X-Google-Smtp-Source: AGRyM1sG9B1CZuCS6xNO+jhPk7/+wEuEnNCCupd2mBpfCEvvZ0PbP2OCJ/8SCYyoLjxoJTJlwJHJqzikcNbY
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:aa7:9afa:0:b0:528:bbf7:e444 with SMTP id
 y26-20020aa79afa000000b00528bbf7e444mr22532953pfp.71.1657599791895; Mon, 11
 Jul 2022 21:23:11 -0700 (PDT)
Date: Tue, 12 Jul 2022 04:22:58 +0000
In-Reply-To: <20220712042258.293010-1-jstultz@google.com>
Message-Id: <20220712042258.293010-3-jstultz@google.com>
Mime-Version: 1.0
References: <20220712042258.293010-1-jstultz@google.com>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [RFC][PATCH 3/3] kselftest: Add drm_syncobj API test tool
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An initial pass at a drm_syncobj API test.

Currently covers trivial use of:
  DRM_IOCTL_SYNCOBJ_CREATE
  DRM_IOCTL_SYNCOBJ_DESTROY
  DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
  DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE
  DRM_IOCTL_SYNCOBJ_WAIT
  DRM_IOCTL_SYNCOBJ_RESET
  DRM_IOCTL_SYNCOBJ_SIGNAL
  DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT
  DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL

And demonstrates how the userspace API can be used, along with
some fairly simple bad parameter checking.

The patch includes a few helpers taken from libdrm, as at least
on the VM I was testing with, I didn't have a new enough libdrm
to support the *_TIMELINE_* ioctls. Ideally the ioctl-helper bits
can be dropped at a later time.

Feedback would be appreciated!

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Chunming Zhou <david1.zhou@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shuah Khan <shuah@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <jstultz@google.com>
---
 .../drivers/gpu/drm_syncobj/Makefile          |  11 +
 .../drivers/gpu/drm_syncobj/ioctl-helper.c    |  85 ++++
 .../drivers/gpu/drm_syncobj/ioctl-helper.h    |  74 ++++
 .../drivers/gpu/drm_syncobj/syncobj-test.c    | 410 ++++++++++++++++++
 4 files changed, 580 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/Makefil=
e
 create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-h=
elper.c
 create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-h=
elper.h
 create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj=
-test.c

diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/Makefile b/too=
ls/testing/selftests/drivers/gpu/drm_syncobj/Makefile
new file mode 100644
index 000000000000..6576d9b2006c
--- /dev/null
+++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+CFLAGS +=3D -I/usr/include/libdrm/
+LDFLAGS +=3D -pthread -ldrm
+
+TEST_GEN_FILES=3D syncobj-test
+
+include ../../../lib.mk
+
+$(OUTPUT)/syncobj-test: syncobj-test.c ioctl-helper.c
+EXTRA_CLEAN =3D $(OUTPUT)/ioctl-helper.o
+
diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c=
 b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c
new file mode 100644
index 000000000000..e5c59c9bed36
--- /dev/null
+++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: MIT
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <time.h>
+#include <errno.h>
+#include <libdrm/drm.h>
+#include <xf86drm.h>
+#include "ioctl-helper.h"
+
+#ifndef DRM_CAP_SYNCOBJ_TIMELINE
+/*
+ * The following is nabbed from libdrm's xf86drm.c as the
+ * installed libdrm doesn't yet include these definitions
+ *
+ *
+ * \author Rickard E. (Rik) Faith <faith@valinux.com>
+ * \author Kevin E. Martin <martin@valinux.com>
+ */
+/*
+ * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
+ * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the ne=
xt
+ * paragraph) shall be included in all copies or substantial portions of t=
he
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR O=
THER
+ * DEALINGS IN THE SOFTWARE.
+ */
+int drmSyncobjTimelineSignal(int fd, const uint32_t *handles,
+			     uint64_t *points, uint32_t handle_count)
+{
+	struct drm_syncobj_timeline_array args;
+	int ret;
+
+	memset(&args, 0, sizeof(args));
+	args.handles =3D (uintptr_t)handles;
+	args.points =3D (uintptr_t)points;
+	args.count_handles =3D handle_count;
+
+	ret =3D drmIoctl(fd, DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL, &args);
+	return ret;
+}
+
+int drmSyncobjTimelineWait(int fd, uint32_t *handles, uint64_t *points,
+			   unsigned int num_handles,
+			   int64_t timeout_nsec, unsigned int flags,
+			   uint32_t *first_signaled)
+{
+	struct drm_syncobj_timeline_wait args;
+	int ret;
+
+	memset(&args, 0, sizeof(args));
+	args.handles =3D (uintptr_t)handles;
+	args.points =3D (uintptr_t)points;
+	args.timeout_nsec =3D timeout_nsec;
+	args.count_handles =3D num_handles;
+	args.flags =3D flags;
+
+	ret =3D drmIoctl(fd, DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, &args);
+	if (ret < 0)
+		return -errno;
+
+	if (first_signaled)
+		*first_signaled =3D args.first_signaled;
+	return ret;
+}
+
+#endif
diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h=
 b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h
new file mode 100644
index 000000000000..b0c1025034b5
--- /dev/null
+++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __IOCTL_HELPER_H__
+#define __IOCTL_HELPER_H__
+
+/* Bits pulled from libdrm's include/drm/drm.h */
+#ifndef DRM_CAP_SYNCOBJ_TIMELINE
+/*
+ * Header for the Direct Rendering Manager
+ *
+ * Author: Rickard E. (Rik) Faith <faith@valinux.com>
+ *
+ * Acknowledgments:
+ * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic cmpxchg.
+ */
+
+/*
+ * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
+ * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
+ * All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the ne=
xt
+ * paragraph) shall be included in all copies or substantial portions of t=
he
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+struct drm_syncobj_timeline_wait {
+	__u64 handles;
+	/* wait on specific timeline point for every handles*/
+	__u64 points;
+	/* absolute timeout */
+	__s64 timeout_nsec;
+	__u32 count_handles;
+	__u32 flags;
+	__u32 first_signaled; /* only valid when not waiting all */
+	__u32 pad;
+};
+
+
+#define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0)
+struct drm_syncobj_timeline_array {
+	__u64 handles;
+	__u64 points;
+	__u32 count_handles;
+	__u32 flags;
+};
+
+#define DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT DRM_IOWR(0xCA, struct drm_syncobj_=
timeline_wait)
+#define DRM_IOCTL_SYNCOBJ_QUERY         DRM_IOWR(0xCB, struct drm_syncobj_=
timeline_array)
+#define DRM_IOCTL_SYNCOBJ_TRANSFER      DRM_IOWR(0xCC, struct drm_syncobj_=
transfer)
+#define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL       DRM_IOWR(0xCD, struct drm_=
syncobj_timeline_array)
+
+int drmSyncobjTimelineSignal(int fd, const uint32_t *handles,
+			     uint64_t *points, uint32_t handle_count);
+int drmSyncobjTimelineWait(int fd, uint32_t *handles, uint64_t *points,
+			   unsigned int num_handles,
+			   int64_t timeout_nsec, unsigned int flags,
+			   uint32_t *first_signaled);
+#endif
+#endif /*__IOCTL_HELPER_H__*/
+
diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c=
 b/tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c
new file mode 100644
index 000000000000..21474b0d3b9e
--- /dev/null
+++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This test exercises basic syncobj ioctl interfaces from
+ * userland via the libdrm helpers.
+ *
+ * Copyright (C) 2022, Google LLC.
+ *
+ * Currently covers trivial use of:
+ *   DRM_IOCTL_SYNCOBJ_CREATE
+ *   DRM_IOCTL_SYNCOBJ_DESTROY
+ *   DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
+ *   DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE
+ *   DRM_IOCTL_SYNCOBJ_WAIT
+ *   DRM_IOCTL_SYNCOBJ_RESET
+ *   DRM_IOCTL_SYNCOBJ_SIGNAL
+ *   DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT
+ *   DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL
+ *
+ * TODO: Need coverage for the following ioctls:
+ *   DRM_IOCTL_SYNCOBJ_QUERY
+ *   DRM_IOCTL_SYNCOBJ_TRANSFER
+ * As well as more complicated use of interface (like
+ * signal/wait with multiple handles, etc), and sync_file
+ * import/export.
+ */
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <time.h>
+#include <poll.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <pthread.h>
+#include <linux/dma-buf.h>
+#include <libdrm/drm.h>
+#include <xf86drm.h>
+
+#include "ioctl-helper.h"
+
+
+#define NSEC_PER_SEC 1000000000ULL
+static uint64_t get_abs_timeout(uint64_t rel_nsec)
+{
+	struct timespec ts;
+	uint64_t ns;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	ns =3D ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
+	ns +=3D rel_nsec;
+	return ns;
+}
+
+struct test_arg {
+	int	dev_fd;
+	uint32_t handle;
+	int	handle_fd;
+};
+#define TEST_TIMES 5
+
+void *syncobj_signal_reset(void *arg)
+{
+	struct test_arg *d =3D (struct test_arg *)arg;
+	int ret;
+	int i;
+
+	for (i =3D 0; i < TEST_TIMES; i++) {
+		sleep(3);
+		printf("%s: sending signal!\n", __func__);
+		ret =3D drmSyncobjSignal(d->dev_fd, &d->handle, 1);
+		if (ret)
+			printf("Signal failed %i\n", ret);
+	}
+	return NULL;
+}
+
+static int syncobj_wait_reset(struct test_arg *d)
+{
+	uint64_t abs_timeout;
+	int ret;
+	int i;
+
+	for (i =3D 0; i < TEST_TIMES; i++) {
+		abs_timeout =3D get_abs_timeout(10*NSEC_PER_SEC);
+		printf("%s calling drmSyncobjWait\n", __func__);
+		ret =3D drmSyncobjWait(d->dev_fd, &d->handle, 1, abs_timeout,
+				     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
+				     NULL);
+		if (ret) {
+			printf("Error: syncobjwait failed %i\n", ret);
+			break;
+		}
+		printf("%s: drmSyncobjWait returned!\n", __func__);
+
+		ret =3D drmSyncobjReset(d->dev_fd, &d->handle, 1);
+		if (ret) {
+			printf("Error: syncobjreset failed\n");
+			break;
+		}
+	}
+	return ret;
+}
+
+void *syncobj_signal_timeline(void *arg)
+{
+	struct test_arg *d =3D (struct test_arg *)arg;
+	uint64_t point =3D 0;
+	int ret;
+
+	for (point =3D 0; point <=3D (TEST_TIMES-1)*5; point++) {
+		sleep(1);
+		printf("%s: sending signal %lld!\n", __func__, point);
+		ret =3D drmSyncobjTimelineSignal(d->dev_fd, &d->handle, &point, 1);
+		if (ret)
+			printf("Signal failed %i\n", ret);
+	}
+	return NULL;
+}
+
+
+int syncobj_timeline_wait(struct test_arg *d)
+{
+	uint64_t abs_timeout;
+	uint64_t point;
+	int ret;
+	int i;
+
+	for (i =3D 0; i < TEST_TIMES; i++) {
+		abs_timeout =3D get_abs_timeout(10*NSEC_PER_SEC);
+
+		point =3D i * 5;
+		printf("%s: drmSyncobjTimelineWait waiting on %lld!\n", __func__, point)=
;
+		ret =3D drmSyncobjTimelineWait(d->dev_fd, &d->handle, &point, 1,
+					     abs_timeout,
+					     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
+					     NULL);
+		if (ret) {
+			printf("Error: syncobjwait failed %i\n", ret);
+			return ret;
+		}
+		printf("%s: drmSyncobjTimelineWait got %lld!\n", __func__, point);
+	}
+	return 0;
+}
+
+
+static int test_thread_signal_wait(int devfd, void *(*signal_fn)(void *),
+				   int (*wait_fn)(struct test_arg *))
+{
+	uint32_t handle;
+	struct test_arg d;
+	pthread_t pth;
+	int ret;
+
+	ret =3D drmSyncobjCreate(devfd, 0, &handle);
+	if (ret) {
+		printf("Error: Couldn't create syncobj\n");
+		return ret;
+	}
+
+	d.dev_fd =3D devfd;
+	d.handle =3D handle;
+
+	pthread_create(&pth, 0, signal_fn, &d);
+	ret =3D wait_fn(&d);
+	pthread_join(pth, NULL);
+	drmSyncobjDestroy(devfd, handle);
+
+	return ret;
+}
+
+static int test_fork_signal_wait(int devfd, void *(*signal_fn)(void *),
+				 int (*wait_fn)(struct test_arg *))
+{
+	uint32_t handle;
+	struct test_arg p, c;
+	pid_t id;
+	int ret;
+
+	ret =3D drmSyncobjCreate(devfd, 0, &handle);
+	if (ret) {
+		printf("Error: Couldn't create syncobj\n");
+		return ret;
+	}
+
+	p.dev_fd =3D devfd;
+	p.handle =3D 0;
+	p.handle_fd =3D 0;
+	c =3D p;
+	p.handle =3D handle;
+
+	ret =3D drmSyncobjHandleToFD(devfd, handle, &c.handle_fd);
+	if (ret) {
+		printf("Error: Couldn't convert handle to fd\n");
+		goto out;
+	}
+
+	id =3D fork();
+	if (id =3D=3D 0) {
+		ret =3D drmSyncobjFDToHandle(c.dev_fd, c.handle_fd, &c.handle);
+		if (ret) {
+			printf("Error: Couldn't convert fd to handle\n");
+			exit(-1);
+		}
+		close(c.handle_fd);
+		signal_fn((void *)&c);
+		exit(0);
+	} else {
+		ret =3D wait_fn(&p);
+		waitpid(id, 0, 0);
+	}
+
+out:
+	if (c.handle_fd)
+		close(c.handle_fd);
+	drmSyncobjDestroy(devfd, handle);
+
+	return ret;
+}
+
+
+static int test_badparameters(int devfd)
+{
+	uint32_t handle1, handle2;
+	int ret, fail =3D 0;
+
+	/* create bad fd */
+	ret =3D drmSyncobjCreate(-1, 0, &handle1);
+	if (!ret || errno !=3D EBADF) {
+		printf("drmSyncobjCreate - bad fd fails! (%i !=3D EBADF)\n", errno);
+		fail =3D 1;
+	}
+	/* destroy bad fd */
+	ret =3D drmSyncobjDestroy(-1, handle1);
+	if (!ret || errno !=3D EBADF) {
+		printf("drmSyncobjDestroy - bad fd fails! (%i !=3D EBADF)\n", errno);
+		fail =3D 1;
+	}
+
+	/* TODO: Bad flags */
+
+	ret =3D drmSyncobjCreate(devfd, 0,  &handle1);
+	if (ret) {
+		printf("drmSyncobjCreate - unexpected failure!\n");
+		fail =3D 1;
+	}
+
+	/* Destroy zeroed handle */
+	handle2 =3D 0;
+	ret =3D drmSyncobjDestroy(devfd, handle2);
+	if (!ret || errno !=3D EINVAL) {
+		printf("drmSyncobjDestroy - zero'ed handle! (%i !=3D EINVAL)\n", errno);
+		fail =3D 1;
+	}
+	/* Destroy invalid handle */
+	handle2 =3D -1;
+	ret =3D drmSyncobjDestroy(devfd, handle2);
+	if (!ret || errno !=3D EINVAL) {
+		printf("drmSyncobjDestroy - invalid handle! (%i !=3D EINVAL)\n", errno);
+		fail =3D 1;
+	}
+
+	/* invalid timeouts */
+	ret =3D drmSyncobjWait(devfd, &handle1, 1, 1000,
+			     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
+			     NULL);
+	if (!ret || errno !=3D ETIME) {
+		printf("drmSyncobjWait - invalid timeout (relative)! (%i !=3D ETIME)\n",=
 errno);
+		fail =3D 1;
+	}
+
+	ret =3D drmSyncobjWait(devfd, &handle1, 1, -1,
+			     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
+			     NULL);
+	if (!ret || errno !=3D ETIME) {
+		printf("drmSyncobjWait - invalid timeout (-1)! (%i !=3D ETIME)\n", errno=
);
+		fail =3D 1;
+	}
+
+	ret =3D drmSyncobjDestroy(devfd, handle1);
+	if (ret) {
+		printf("drmSyncobjDestroy - unexpected failure!\n");
+		fail =3D 1;
+	}
+
+
+	return fail;
+}
+
+
+#define NAME_LEN 16
+static int check_device(int fd)
+{
+	drm_version_t version =3D { 0 };
+	char name[NAME_LEN];
+	uint32_t handle;
+	int ret;
+
+	memset(name, 0, NAME_LEN);
+	version.name_len =3D NAME_LEN;
+	version.name =3D name;
+
+	ret =3D ioctl(fd, DRM_IOCTL_VERSION, &version);
+	if (ret)
+		return -1;
+
+	printf("%s name: %s\n", __func__, name);
+
+	ret =3D drmSyncobjCreate(fd, 0,  &handle);
+	if (!ret) {
+		drmSyncobjDestroy(fd, handle);
+		printf("%s selected: %s\n", __func__, name);
+	}
+	return ret;
+}
+
+static int find_device(void)
+{
+	int i, fd;
+	const char *drmstr =3D "/dev/dri/card";
+
+	fd =3D -1;
+	for (i =3D 0; i < 16; i++) {
+		char name[80];
+
+		snprintf(name, 80, "%s%u", drmstr, i);
+
+		fd =3D open(name, O_RDWR);
+		if (fd < 0)
+			continue;
+
+		if (check_device(fd)) {
+			close(fd);
+			fd =3D -1;
+			continue;
+		} else {
+			break;
+		}
+	}
+	return fd;
+}
+
+int main(int argc, char **argv)
+{
+	int devfd =3D find_device();
+	char *testname;
+	int ret;
+
+	if (devfd < 0) {
+		printf("Error: Couldn't find supported drm device\n");
+		return devfd;
+	}
+
+	testname =3D "Bad parameters test";
+	printf("\n%s\n", testname);
+	printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
+	ret =3D test_badparameters(devfd);
+	if (ret)
+		printf("%s: FAILED\n", testname);
+	else
+		printf("%s: PASSED\n", testname);
+
+
+	testname =3D "Threaded reset test";
+	printf("\n%s\n", testname);
+	printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
+	ret =3D test_thread_signal_wait(devfd, &syncobj_signal_reset, &syncobj_wa=
it_reset);
+	if (ret)
+		printf("%s: FAILED\n", testname);
+	else
+		printf("%s: PASSED\n", testname);
+
+	testname =3D "Threaded timeline test";
+	printf("\n%s\n", testname);
+	printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
+	ret =3D test_thread_signal_wait(devfd, &syncobj_signal_timeline, &syncobj=
_timeline_wait);
+	if (ret)
+		printf("%s: FAILED\n", testname);
+	else
+		printf("%s: PASSED\n", testname);
+
+
+	testname =3D "Forked reset test";
+	printf("\n%s\n", testname);
+	printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
+	ret =3D test_fork_signal_wait(devfd, &syncobj_signal_reset, &syncobj_wait=
_reset);
+	if (ret)
+		printf("\n%s: FAILED\n", testname);
+	else
+		printf("\n%s: PASSED\n", testname);
+
+	testname =3D "Forked timeline test";
+	printf("\n%s\n", testname);
+	printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
+	ret =3D test_fork_signal_wait(devfd, &syncobj_signal_timeline, &syncobj_t=
imeline_wait);
+	if (ret)
+		printf("\n%s: FAILED\n", testname);
+	else
+		printf("\n%s: PASSED\n", testname);
+
+
+	close(devfd);
+	return 0;
+}
--=20
2.37.0.144.g8ac04bfd2-goog

