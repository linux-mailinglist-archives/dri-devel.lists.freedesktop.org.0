Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2AA7A8DC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEA710EA57;
	Thu,  3 Apr 2025 17:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqQUrIRe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B0B10EA4D;
 Thu,  3 Apr 2025 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743702538; x=1775238538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uPB5OphYqrPK1wfSHf8eGz06pgpyDHehb6JsvFPTtRc=;
 b=iqQUrIReUr7biqKZe9Tz/1Vi7ZlgAuNpCSZPK0IEwC4TboIOn/QuzncC
 XyzwK2vppGN1tEIahqdswCCOzc8z6LsXkZMzOq5Et74VhbOEGDxRrsKQX
 qUC1kWA4MWWhnusv5HdyFlhrx7/FPSn2tdrBo1EWqThsSjK6EGQkrH7JF
 CIc4ZcSe2B8pE9bxeGvwT3hw9xvpgdOjjAvWIVHuILKMryrIq6x2ujCyZ
 GJNt9bDtkEXb95vRfuqL37kuKEEOvgrPFX1lx2IRvW9rI8rbiRiloCxK1
 JHczm4PTUSIK0YNTrqJl2aVx63klciU4z30OerYRnkQ+I3tOLNTUPSscp w==;
X-CSE-ConnectionGUID: 6SbXKqduSNyg5X86ARXesA==
X-CSE-MsgGUID: cck870P9SJS+Ih/zoDsuwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55758513"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55758513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:58 -0700
X-CSE-ConnectionGUID: xsWjHTwORMSL0srfUW9jPA==
X-CSE-MsgGUID: iVOo8TlwRWGRGdFN/CxbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="158057929"
Received: from dut138lnl.fm.intel.com ([10.105.23.23])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:58 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com,
 ivan.briano@intel.com
Subject: [PATCH v3 3/4] tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY
 validation tests
Date: Thu,  3 Apr 2025 17:48:55 +0000
Message-ID: <20250403174856.75458-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403174856.75458-1-jonathan.cavitt@intel.com>
References: <20250403174856.75458-1-jonathan.cavitt@intel.com>
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

