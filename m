Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DCC32E7C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 21:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A7B10E66A;
	Tue,  4 Nov 2025 20:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dWLH4L4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89810E669;
 Tue,  4 Nov 2025 20:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762288162; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KGbevHylRA7JG1SfsPI99GfNvitpmznrUfdL/ZnO0HeAv867tFb5zPVQVM1/ze5H9o9Vxhb7jP6lUtr67k9nAkv4qVBgarLoZA5DS4TrsEV1PLKgZqknOYxGf1Ou+q7AI6UIHMByo0cdArD7eDL5dC4TeNGCyIgZYM+RphGuUSs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762288162;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=x9bYf2wdNdxyJskF0gLXXkIN3piWLbgK2RkbkCL/+fI=; 
 b=iusMvbab5l3JSJqmCSi3uY2ElT+TqaI6bq+qcCr1Frxdho/fbwy2ZmQR7S0df0qNFRv8XguLTK1489+AO4fiW0E/X7TYJqICeNK+cuVv5vEeprFbjQ4SD9s3wbwOtFcIA6mThrsNAqDEvDcJVgw6kX5OIyuUOn415jMoBjBTcaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762288162; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=x9bYf2wdNdxyJskF0gLXXkIN3piWLbgK2RkbkCL/+fI=;
 b=dWLH4L4XDTDDKxHENen3yaIH52+4DvPYoOFsXkTl5IotynxLenJTdaHJTYQw4uWe
 1WYm+DvCMssYbCb3brQ6FuwQae0lmFZ7YeUrRB7sGWT7SZGOg5KSK2d+oS8i2/r5wxW
 DAC6XbZsshBQOtUCdJmlV56ZbGCAefnEBtFUxaps=
Received: by mx.zohomail.com with SMTPS id 1762288161058484.57807869501835;
 Tue, 4 Nov 2025 12:29:21 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t v3 2/3] panthor: add initial infrastructure
Date: Tue,  4 Nov 2025 17:28:42 -0300
Message-ID: <20251104202845.2879460-3-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251104202845.2879460-1-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
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

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 lib/igt_panthor.c             |  41 ++++++++
 lib/igt_panthor.h             | 193 ++++++++++++++++++++++++++++++++++
 lib/meson.build               |   1 +
 meson.build                   |   8 ++
 tests/meson.build             |   2 +
 tests/panthor/meson.build     |  12 +++
 tests/panthor/panthor_query.c |  29 +++++
 7 files changed, 286 insertions(+)
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
index 000000000..6f94b8f79
--- /dev/null
+++ b/lib/igt_panthor.h
@@ -0,0 +1,193 @@
+/* SPDX-License-Identifier: MIT */
+/* SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd. */
+
+#ifndef IGT_PANTHOR_H
+#define IGT_PANTHOR_H
+
+#include <stddef.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
+
+enum cs_opcode {
+	CS_OPCODE_NOP = 0,
+	CS_OPCODE_MOVE48 = 1,
+	CS_OPCODE_MOVE32 = 2,
+	CS_OPCODE_WAIT = 3,
+	CS_OPCODE_STM = 21,
+	CS_OPCODE_FLUSH_CACHE = 36,
+};
+
+enum cs_flush_mode {
+	CS_FLUSH_MODE_NONE = 0,
+	CS_FLUSH_MODE_CLEAN = 1,
+	CS_FLUSH_MODE_INVALIDATE = 2,
+	CS_FLUSH_MODE_CLEAN_AND_INVALIDATE = 3,
+};
+
+/* There's no plan to support big endian in the UMD, so keep
+ * things simple and don't bother supporting it here either.
+ */
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+#error "big endian not supported"
+#endif
+
+struct cs_instr {
+	union {
+		struct {
+			uint64_t data: 56;
+			uint64_t opcode: 8;
+		} any;
+		struct {
+			uint64_t unused: 56;
+			uint64_t opcode: 8;
+		} nop;
+		struct {
+			uint64_t immediate: 48;
+			uint64_t dest: 8;
+			uint64_t opcode: 8;
+		} move48;
+		struct {
+			uint64_t immediate: 32;
+			uint64_t unused: 16;
+			uint64_t dest: 8;
+			uint64_t opcode: 8;
+		} move32;
+		struct {
+			uint64_t unused0: 16;
+			uint64_t wait_mask: 16;
+			uint64_t progress_inc: 1;
+			uint64_t unused1: 23;
+			uint64_t opcode: 8;
+		} wait;
+		struct {
+			uint64_t offset: 16;
+			uint64_t mask: 16;
+			uint64_t unused: 8;
+			uint64_t address: 8;
+			uint64_t src: 8;
+			uint64_t opcode: 8;
+		} stm;
+		struct {
+			uint64_t l2_mode: 4;
+			uint64_t lsc_mode: 4;
+			uint64_t other_mode: 4;
+			uint64_t unused0: 4;
+			uint64_t wait_mask: 16;
+			uint64_t unused1: 8;
+			uint64_t flush_id: 8;
+			uint64_t signal_slot: 4;
+			uint64_t unused2: 4;
+			uint64_t opcode: 8;
+		} flush;
+		uint64_t raw;
+	};
+};
+
+static inline uint64_t
+cs_nop(void)
+{
+	struct cs_instr instr = {
+		.nop = {
+			.opcode = CS_OPCODE_NOP,
+		},
+	};
+
+	return instr.raw;
+}
+
+static inline uint64_t
+cs_mov48(uint8_t dst, uint64_t imm)
+{
+	struct cs_instr instr = {
+		.move48 = {
+			.opcode = CS_OPCODE_MOVE48,
+			.dest = dst,
+			.immediate = (uint64_t)imm & 0xffffffffffffull,
+		},
+	};
+
+	return instr.raw;
+}
+
+static inline uint64_t
+cs_mov32(uint8_t dst, uint32_t imm)
+{
+	struct cs_instr instr = {
+		.move32 = {
+			.opcode = CS_OPCODE_MOVE32,
+			.dest = dst,
+			.immediate = (uint32_t)imm,
+		},
+	};
+
+	return instr.raw;
+}
+
+static inline uint64_t
+cs_wait(uint16_t wait_mask, bool progress_inc)
+{
+	struct cs_instr instr = {
+		.wait = {
+			.opcode = CS_OPCODE_WAIT,
+			.wait_mask = wait_mask,
+			.progress_inc = progress_inc,
+		},
+	};
+
+	return instr.raw;
+}
+
+static inline uint64_t
+cs_stm(uint8_t address, uint8_t src, uint16_t mask, int16_t offset)
+{
+	struct cs_instr instr = {
+		.stm = {
+			.opcode = CS_OPCODE_STM,
+			.offset = (uint16_t)offset,
+			.mask = mask,
+			.src = src,
+			.address = address,
+		},
+	};
+
+	return instr.raw;
+}
+
+static inline uint64_t
+cs_stm32(uint8_t address, uint8_t src, int16_t offset)
+{
+	return cs_stm(address, src, 0x1, offset);
+}
+
+static inline uint64_t
+cs_stm64(uint8_t address, uint8_t src, int16_t offset)
+{
+	return cs_stm(address, src, 0x3, offset);
+}
+
+static inline uint64_t
+cs_flush(enum cs_flush_mode l2_mode,
+	 enum cs_flush_mode lsc_mode,
+	 enum cs_flush_mode other_mode,
+	 uint16_t wait_mask,
+	 uint8_t flush_id,
+	 uint8_t signal_slot)
+{
+	struct cs_instr instr = {
+		.flush = {
+			.l2_mode = l2_mode,
+			.lsc_mode = lsc_mode,
+			.other_mode = other_mode,
+			.wait_mask = wait_mask,
+			.flush_id = flush_id,
+			.signal_slot = signal_slot,
+			.opcode = CS_OPCODE_FLUSH_CACHE,
+		},
+	};
+
+	return instr.raw;
+}
+
+#endif /* IGT_PANTHOR_H */
diff --git a/lib/meson.build b/lib/meson.build
index 725a46e98..707ce6ff9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -106,6 +106,7 @@ lib_sources = [
 	'igt_kmod.c',
 	'igt_ktap.c',
 	'igt_panfrost.c',
+	'igt_panthor.c',
 	'igt_v3d.c',
 	'igt_vc4.c',
 	'igt_vmwgfx.c',
diff --git a/meson.build b/meson.build
index db6e09a94..bfcffbb9a 100644
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
index f2267bc09..e1fdac2cf 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -490,6 +490,8 @@ subdir('msm')
 
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
index 000000000..81c2ebd23
--- /dev/null
+++ b/tests/panthor/panthor_query.c
@@ -0,0 +1,29 @@
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
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_PANTHOR);
+	}
+
+	igt_describe("Query GPU information from ROM.");
+	igt_subtest("query") {
+		struct drm_panthor_gpu_info gpu = {};
+
+		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
+
+		igt_assert_neq(gpu.gpu_id, 0);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
-- 
2.51.0

