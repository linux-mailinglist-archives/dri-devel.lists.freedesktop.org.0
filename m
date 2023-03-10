Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B16B3B2D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CDF10E9B7;
	Fri, 10 Mar 2023 09:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E739899C7;
 Fri, 10 Mar 2023 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678441552; x=1709977552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6tUfr7Ceqnyx6bIommdTSmmq1DTiPGnCmoFnTxd9KpU=;
 b=JebW1Ct+ufwL3VDgg9jhbPXMDku602cCfs0cck7YNvhOIB4d7LPirUQf
 3ETxA5jFSLdjBKQh6IJ89HePQTZ3cN4Y4fXscM/UN6nE15DMD4TZp6y8a
 fh6azclinhTLhxky+ewCL/hB3ZLu8qfLXVQ6OYF4dR0ModH+SWgr58wwT
 PpiSNH9YK9nyItlb9vHptahKJw5e6pxmF8D12EB+YuMlytQ7Z10bg6ofQ
 q8E5ZGPphajrYpnzO/PY6AHewmHg3KeAwMEjwUw9dl9IhpR+AD3It1sEf
 wTC1Ull29Xf5oPfl//YJ0dBr/4j4nlql9VVJuqhljepzL6bqxT728UfeU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="335388760"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="335388760"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820987522"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="820987522"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:45:49 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/mtl: Disable stolen memory backed FB for A0
Date: Fri, 10 Mar 2023 10:45:44 +0100
Message-Id: <20230310094544.3865-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stolen memory is not usable for MTL A0 stepping beyond
certain access size and we have no control over userspace
access size of /dev/fb which can be backed by stolen memory.
So disable stolen memory backed fb by setting i915->dsm.usable_size
to zero.

v2: remove hsdes reference and fix commit message(Andi)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index d8e06e783e30..bf0f0a5f2a5c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -535,6 +535,15 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	/* Basic memrange allocator for stolen space. */
 	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
 
+	/*
+	 * Access to stolen lmem beyond certain size for MTL A0 stepping
+	 * would crash the machine. Disable stolen lmem for userspace access
+	 * by setting usable_size to zero.
+	 */
+	if (IS_MTL_GRAPHICS_STEP(i915, M, STEP_A0, STEP_B0) ||
+	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0))
+		i915->dsm.usable_size = 0;
+
 	return 0;
 }
 
-- 
2.39.0

