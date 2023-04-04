Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF66D6B49
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A749610E1E1;
	Tue,  4 Apr 2023 18:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5A510E03C;
 Tue,  4 Apr 2023 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680632037; x=1712168037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3TanXdNSW1kaFx2rNK8Huej8nEHS2+vcj0qxt0ahZ4M=;
 b=iFGYrFhNq2yXDUXNy1LBYLrsF5sr9IYCO4DQPWppevM1KSMMqBysE9RS
 QOia5zZ1TkKpPzLYxXw1gR1CqML7G9Lmnfjslwk9bIw8vHL8tGANIk4Rt
 icH7HBVK53Bkp0KbR7YBKrM1OC9WIlJECxcDBk/N+BduYrsf1CY8XoN3F
 DViN84MCxWfwtOYOLiujtlUoJwwMm7/xBRbsIMtY1JTKEpjQPmrETIE3Z
 kYlhDpIw2fn06wKqMEJNuf0e722T7+POLhpOd+ub3ThZLc7+E/eLu5ZYR
 zXc4pf1Mzl6XPPlTsUTuPXEvOBN1/LPImPd89Hp1+ltflk6bOSQbs4M0X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="321926122"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="321926122"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="810352981"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="810352981"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:13:53 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/mtl: Disable stolen memory backed FB for A0
Date: Tue,  4 Apr 2023 20:13:42 +0200
Message-Id: <20230404181342.23362-1-nirmoy.das@intel.com>
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
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
v3: use revid as we want to target SOC stepping(Radhakrishna)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 8ac376c24aa2..ee492d823f1b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -535,6 +535,14 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	/* Basic memrange allocator for stolen space. */
 	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
 
+	/*
+	 * Access to stolen lmem beyond certain size for MTL A0 stepping
+	 * would crash the machine. Disable stolen lmem for userspace access
+	 * by setting usable_size to zero.
+	 */
+	if (IS_METEORLAKE(i915) && INTEL_REVID(i915) == 0x0)
+		i915->dsm.usable_size = 0;
+
 	return 0;
 }
 
-- 
2.39.0

