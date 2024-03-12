Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7C87930A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 12:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C1E112DBE;
	Tue, 12 Mar 2024 11:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJn0bGo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAEC112DBE;
 Tue, 12 Mar 2024 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710243121; x=1741779121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e7os3fwmmpXoH7mUmwlV/+xeTsyev0r7sRha/9HpS/U=;
 b=iJn0bGo3qu+z6e0r6wF/CkN6pVMzCFbXQr/PSpbx25XYab+UOnHyMFkk
 biK6jmSPJfIQallDXbGlc0Yz9pEqyBM5dkhOGF2bVQia/c9gI8hqBLI8a
 YEh0c5qLcKrqWYyyCt/OW//tAc7tqjbPAWDrtWfaN1jODZfOcIcOme0Pm
 wHJklWKTZweuRMa9mv5uT5WmAjndcP07t1fsPtRoSL3KaUWMO3R1XdJbG
 cCg9UohgkZn+RIuO/MPdkotcheprW4KZGLE/Mt3wa+cihy36mto2J6w4L
 by4s7OesfBsY/Q/1ysbMBmPuPIs20E1lBy9wwuU+G61aQCLuD4tfg1H/e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7891553"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7891553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 04:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42437730"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 04:31:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/i915/selftests: Pick correct caching mode.
Date: Tue, 12 Mar 2024 12:18:15 +0100
Message-ID: <20240312111815.18083-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Caching mode is HW dependent so pick a correct one using
intel_gt_coherent_map_type().

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10249
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index d684a70f2c04..65a931ea80e9 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -7,6 +7,7 @@
 #include "i915_drv.h"
 #include "i915_selftest.h"
 #include "gem/i915_gem_context.h"
+#include "gt/intel_gt.h"
 
 #include "mock_context.h"
 #include "mock_dmabuf.h"
@@ -155,6 +156,7 @@ static int verify_access(struct drm_i915_private *i915,
 	struct file *file;
 	u32 *vaddr;
 	int err = 0, i;
+	unsigned int mode;
 
 	file = mock_file(i915);
 	if (IS_ERR(file))
@@ -194,7 +196,8 @@ static int verify_access(struct drm_i915_private *i915,
 	if (err)
 		goto out_file;
 
-	vaddr = i915_gem_object_pin_map_unlocked(native_obj, I915_MAP_WB);
+	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
+	vaddr = i915_gem_object_pin_map_unlocked(native_obj, mode);
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
 		goto out_file;
-- 
2.42.0

