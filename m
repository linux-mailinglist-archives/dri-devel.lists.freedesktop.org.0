Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A664CBAEA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5280010EC8A;
	Thu,  3 Mar 2022 10:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77710EC32;
 Thu,  3 Mar 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646301758; x=1677837758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bFt5L7BW9E8L+tKcz0qk4BFN0X5Bigw9w6LIkZEqiHY=;
 b=A1RSD5qxgxVuL/B8nSGyfNmX8H752HwTt3ft3v7WrnLKhO53aivPcONw
 VRJIvlaE2niKVCjxNzHzePwIZ/YaG5uHYRgGrw5QbEHpBDQHlMd59dbs7
 EExMZvVlvmKWHMapxvwrblXyCqQIUKSPycGg6EqjWPCUAm5H05m3lsBmq
 ui8pj/p0fiSZA9UpEtYdLOa4aizz1nO2wNYxoA6I5i4Mi+snZeI7Fa6dl
 K5YrpELeU0gEhU//NoLV60HzO/a99EPGdbA0ieuhu+eJRJtJ8+OwBSzDw
 gMoj+OySoN/t41mFPMM8Zxb5cR9eSxfeXElZ89MEDqoj6JCafj36LVfd+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="314350215"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="314350215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:02:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="642061679"
Received: from telordan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.86])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:02:36 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gtt: reduce overzealous alignment constraints for
 GGTT
Date: Thu,  3 Mar 2022 10:02:29 +0000
Message-Id: <20220303100229.839282-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently this will enforce both 2M alignment and padding for any LMEM
pages inserted into the GGTT. However, this was only meant to be applied
to the compact-pt layout with the ppGTT. For the GGTT we can reduce the
alignment and padding to 64K.

Bspec: 45015
Fixes: 87bd701ee268 ("drm/i915: enforce min GTT alignment for discrete cards")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Robert Beckett <bob.beckett@collabora.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 4bcdfcab3642..a5f5b2dda332 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -234,7 +234,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
 		 ARRAY_SIZE(vm->min_alignment));
 
-	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915)) {
+	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915) &&
+	    subclass == VM_CLASS_PPGTT) {
 		vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
 		vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
 	} else if (HAS_64K_PAGES(vm->i915)) {
-- 
2.34.1

