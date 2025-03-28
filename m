Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC5A7519D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02C510EACE;
	Fri, 28 Mar 2025 20:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/wyY4AA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B5D10EAC8;
 Fri, 28 Mar 2025 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194717; x=1774730717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uPB5OphYqrPK1wfSHf8eGz06pgpyDHehb6JsvFPTtRc=;
 b=j/wyY4AAe2x/oiMkovw6e/Behed0ealgv38d03Lzy8bnUpkPSC0tsUx5
 q4KS+cG3s7kxu7AL3n45au0PbsjVV1ZHVsZyGcD3kaUHqAgvuoa/CT284
 NXnmoF1LY9yLQVr/ahNb+y2JLvOd70epbXNOz8ThKUWrsdMoWzoTs6BR4
 C34+WQG5n2p6fb6hyQC+vaD52Au7lJzQboHCo2KFPX+YUp7C2ZxYODP1x
 kj40/VyZROp6aFNNt5b35K9wuKyFQqENWzrJD5rK9uOOY8tEN4m1UBmYt
 R0KkdssMB1FUuiNw8vlNNokJybyo4FM47wo9PITF+hX7l0rToWj9kdyzJ g==;
X-CSE-ConnectionGUID: Qknb7k8nS7evmp+e6XrTgg==
X-CSE-MsgGUID: vuBac9grSNmEZnJvaya6Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55945080"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55945080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:45:16 -0700
X-CSE-ConnectionGUID: IGcSLxAdSbeD9PDTN4Njag==
X-CSE-MsgGUID: S22GoiqPRZeGcjOK9zLaVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156463087"
Received: from dut4086lnl.fm.intel.com ([10.105.10.92])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:45:16 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com
Subject: [PATCH 3/4] tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY
 validation tests
Date: Fri, 28 Mar 2025 20:45:14 +0000
Message-ID: <20250328204515.158038-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328204515.158038-1-jonathan.cavitt@intel.com>
References: <20250328204515.158038-1-jonathan.cavitt@intel.com>
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

Add tests to xe_vm that exercise the new DRM_IOCTL_XE_VM_GET_PROPERTY
ioctl.  Specifically, add input validation tests that exercise the
return values for improperly formatted ioctl structures.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c1140..536532579f 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2343,6 +2343,72 @@ static void invalid_vm_id(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
 }
 
+/**
+ * SUBTEST: vm-get-property-invalid-reserved
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid reserved returns expected error code
+ *
+ * SUBTEST: vm-get-property-invalid-vm-id
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid vm_id returns expected error code
+ *
+ * SUBTEST: vm-get-property-invalid-size
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid size return expected error code
+ *
+ * SUBTEST: vm-get-property-invalid-property
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid property returns expected error code
+ */
+static void get_property_invalid_reserved(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.reserved[0] = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
+}
+
+static void get_property_invalid_vm_id(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.vm_id = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, ENOENT);
+}
+
+static void get_property_invalid_size(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.vm_id = vm,
+		.property = DRM_XE_VM_GET_PROPERTY_FAULTS,
+		.size = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
+}
+
+static void get_property_invalid_property(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.vm_id = vm,
+		.property = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
+}
+
+static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
+{
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE ||
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	func(fd, vm);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2455,6 +2521,17 @@ igt_main
                 { }
         };
 
+	const struct vm_get_property {
+		const char *name;
+		void (*test)(int fd, uint32_t vm);
+	} xe_vm_get_property_tests[] = {
+		{ "invalid-reserved", get_property_invalid_reserved },
+		{ "invalid-vm-id", get_property_invalid_vm_id },
+		{ "invalid-size", get_property_invalid_size },
+		{ "invalid-property", get_property_invalid_property },
+		{ }
+	};
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -2734,6 +2811,11 @@ igt_main
 	igt_subtest("invalid-vm-id")
 		invalid_vm_id(fd);
 
+	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
+		igt_subtest_f("vm-get-property-%s", f->name)
+			test_get_property(fd, f->test);
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.43.0

