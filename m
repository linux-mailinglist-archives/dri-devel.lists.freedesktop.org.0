Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665BB555F8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F2410ECC8;
	Fri, 12 Sep 2025 18:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KXUyuKBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6246F10ECC7;
 Fri, 12 Sep 2025 18:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757701200; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Yihls2jRX8fNgYWqb4VqxkB9dWtWDw4sjPYS3+IckN6yh0bybFGbtwQye0A93e5rSXsKVdSinyfKmqQbxcvO17RIpHqWwUYx3Sp0dq41YWaKJtWgneMiUXdcCYmNOuF8kUc6KCks9LuunrLIJaMoRURSPb2OYv7HDbZFjh1oBO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757701200;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CVhKP/RBpidFvInkirFH8+8uvNKMTI2kqZrEUVmXJkM=; 
 b=FGQqYgK/zImSHYMsyE8EkJiUBTo//ypPFwQPJsLEreCGFNz373Oezs3RWUBVGaSAeLjsU+WkP+olkxdTt0c/4ghVWjqjaFyKzCyE0ahHdbdBHAkGuvTBJlOtKsFHxDkEWyi1kwvIsqsEFBc9vntPuhCS7Vtr0l8FgVxYlgb6jEM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757701200; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CVhKP/RBpidFvInkirFH8+8uvNKMTI2kqZrEUVmXJkM=;
 b=KXUyuKBqupipaNcuAYm71Qmv5TP4RqqENM9kE70CSE+AjIEmW3KX38sODHUwXy2T
 4cQtd74Ht5bPCs9uwiKSWo04AqTDD81KA8GRwtRB+8zEpPQ8yvhesEAn2G1ukhIyggE
 36dalMf/v+IKBLhXJUElQ5X3/MSYMn4pEG7razJU=
Received: by mx.zohomail.com with SMTPS id 1757701198800968.1818999685237;
 Fri, 12 Sep 2025 11:19:58 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/3] panthor: add initial infrastructure
Date: Fri, 12 Sep 2025 15:19:29 -0300
Message-ID: <20250912181931.3738444-3-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912181931.3738444-1-daniel.almeida@collabora.com>
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Add the necessary code needed to compile panthor tests as well as the
basic infrastructure that will be used by the Panthor tests themselves.

To make sure everything is in order, add a basic test in
panthor_query.c.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 lib/igt_panthor.c             | 41 +++++++++++++++++++++++++++++++++++
 lib/igt_panthor.h             | 12 ++++++++++
 lib/meson.build               |  1 +
 meson.build                   |  8 +++++++
 tests/meson.build             |  2 ++
 tests/panthor/meson.build     | 12 ++++++++++
 tests/panthor/panthor_query.c | 25 +++++++++++++++++++++
 7 files changed, 101 insertions(+)
 create mode 100644 lib/igt_panthor.c
 create mode 100644 lib/igt_panthor.h
 create mode 100644 tests/panthor/meson.build
 create mode 100644 tests/panthor/panthor_query.c

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
new file mode 100644
index 000000000..0b690f796
--- /dev/null
+++ b/lib/igt_panthor.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include "drmtest.h"
+#include "igt_panthor.h"
+#include "ioctl_wrappers.h"
+#include "panthor_drm.h"
+
+/**
+ * SECTION:igt_panthor
+ * @short_description: Panthor support library
+ * @title: Panthor
+ * @include: igt.h
+ *
+ * This library provides various auxiliary helper functions for writing Panthor
+ * tests.
+ */
+
+/**
+ * igt_panthor_query:
+ * @fd: device file descriptor
+ * @type: query type (e.g., DRM_PANTHOR_DEV_QUERY_GPU_INFO)
+ * @data: pointer to a struct to store the query result
+ * @size: size of the result struct
+ * @err: expected error code, or 0 for success
+ *
+ * Query GPU information.
+ */
+void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
+{
+	struct drm_panthor_dev_query query = {
+		.type = type,
+		.pointer = (uintptr_t)data,
+		.size = size,
+	};
+
+	if (err)
+		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query, err);
+	else
+		do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
+}
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
new file mode 100644
index 000000000..a99b7102d
--- /dev/null
+++ b/lib/igt_panthor.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/* SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd. */
+
+#ifndef IGT_PANTHOR_H
+#define IGT_PANTHOR_H
+
+#include <stddef.h>
+#include <stdint.h>
+
+void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
+
+#endif /* IGT_PANTHOR_H */
diff --git a/lib/meson.build b/lib/meson.build
index f50a8d44b..4ccf3ee04 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -105,6 +105,7 @@ lib_sources = [
 	'igt_kmod.c',
 	'igt_ktap.c',
 	'igt_panfrost.c',
+	'igt_panthor.c',
 	'igt_v3d.c',
 	'igt_vc4.c',
 	'igt_vmwgfx.c',
diff --git a/meson.build b/meson.build
index f7ae427b3..56ef8730e 100644
--- a/meson.build
+++ b/meson.build
@@ -288,6 +288,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
+panthordir = join_paths(libexecdir, 'panthor')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vkmsdir = join_paths(libexecdir, 'vkms')
@@ -341,6 +342,12 @@ if get_option('use_rpath')
 	endforeach
 	panfrost_rpathdir = join_paths(panfrost_rpathdir, libdir)
 
+	panthor_rpathdir = '$ORIGIN'
+	foreach p : panthordir.split('/')
+		panthor_rpathdir = join_paths(panthor_rpathdir, '..')
+	endforeach
+	panthor_rpathdir = join_paths(panthor_rpathdir, libdir)
+
 	v3d_rpathdir = '$ORIGIN'
 	foreach p : v3ddir.split('/')
 		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
@@ -370,6 +377,7 @@ else
 	amdgpudir_rpathdir = ''
 	msm_rpathdir = ''
 	panfrost_rpathdir = ''
+	panthor_rpathdir = ''
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vkms_rpathdir = ''
diff --git a/tests/meson.build b/tests/meson.build
index a7b9375ed..0b61561a4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -486,6 +486,8 @@ subdir('msm')
 
 subdir('panfrost')
 
+subdir('panthor')
+
 subdir('v3d')
 
 subdir('vc4')
diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
new file mode 100644
index 000000000..ce13aebaa
--- /dev/null
+++ b/tests/panthor/meson.build
@@ -0,0 +1,12 @@
+panthor_progs = [
+	'panthor_query'
+]
+
+foreach prog : panthor_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : panthordir,
+				       install_rpath : panthor_rpathdir,
+				       install : true)
+	test_list += join_paths('panthor', prog)
+endforeach
diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
new file mode 100644
index 000000000..7c1055763
--- /dev/null
+++ b/tests/panthor/panthor_query.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_panthor.h"
+#include "panthor_drm.h"
+#include <stdint.h>
+
+igt_main {
+	int fd;
+
+	igt_fixture { fd = drm_open_driver(DRIVER_PANTHOR); }
+
+	igt_describe("Query GPU information from ROM.");
+	igt_subtest("query") {
+		struct drm_panthor_gpu_info gpu = {};
+
+		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
+
+		igt_assert(gpu.gpu_id != 0);
+	}
+
+	igt_fixture { drm_close_driver(fd); }
+}
-- 
2.51.0

