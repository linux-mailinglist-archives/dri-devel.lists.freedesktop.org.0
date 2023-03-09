Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3BF6B2B25
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE4310E055;
	Thu,  9 Mar 2023 16:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AB10E8B5;
 Thu,  9 Mar 2023 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678380552; x=1709916552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dGMZF9NM5OAZWGjh6UHkbozuxgPQC7SthnRUjariVqg=;
 b=No9Us70aSUNloEljZEg7Ump41as17Hpj8sP12YAQnouN7wR9rFN0Xpaf
 LY1Q95uv+dU6FGRdgIN+QYoOP8qnoamuev2JoxcWyp7X/kDrS/yYTojWg
 PVWYkaOn2XvdyHsUGHcl1IEIhR65zffcAKfL7O90hE1JvpZxpOXefBHE+
 eMBQPvx07pMKZ4c2lkHXMrgUPXGzz6okjkScNrWW4BhTRc34qE/Fcm+vV
 oCSepOrsWpf1OHSjS1yt2HyBPtkMVgTvpPUU8Nvza+ACQH/iJoG83+jQK
 jXB2pfxfhSM1XyvLTD53+GzGzU4tsmeTpK67Y8//Q2RrgaLvZvNmxUM6H A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364139635"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="364139635"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 08:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="679839987"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="679839987"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 08:49:10 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Disable stolen memory backed FB for A0
Date: Thu,  9 Mar 2023 17:49:05 +0100
Message-Id: <20230309164905.828-1-nirmoy.das@intel.com>
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index d8e06e783e30..56ccfcbdbce1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -535,6 +535,16 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	/* Basic memrange allocator for stolen space. */
 	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
 
+	/*
+	 * Access to stolen lmem beyond certain size for MTL A0 stepping
+	 * would crash the machine. Disable stolen lmem for userspace access
+	 * by setting usable_size to zero.
+	 * hsdes: 22016134735
+	 */
+	if (IS_MTL_GRAPHICS_STEP(i915, M, STEP_A0, STEP_B0) ||
+	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0))
+		i915->dsm.usable_size = 0;
+
 	return 0;
 }
 
-- 
2.39.0

