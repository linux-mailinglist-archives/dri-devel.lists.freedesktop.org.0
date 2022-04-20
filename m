Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B5508F3C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676EF10F155;
	Wed, 20 Apr 2022 18:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80A910F155;
 Wed, 20 Apr 2022 18:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650478590; x=1682014590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XgWYKSlRoBFsnGMiweFrdME+zGMs8Ncq7SNAO5Rl3iY=;
 b=adUCo9K+V1bztbY6DZZiLom4y4zVP5TUXe4mRCDN9qfFs4c2BsGIVmD+
 5oTn0Fy4d8vcRZnEhljgIc7JkCsnPY/XVMv+kAMmcxsjyeT4nxxrYM8sn
 nvLYZ+6eTmXY+NOJJxs5kmBKoescxrmDmnFSo4WBvEa+URkU56sApl7My
 InpjEpPoMVH/nuozqKhpL/flHQWmSf1AxIN1bdpCCVV3ADpn8anl2Z4Je
 BspNwDj/ylfk+RtSn2URY4A+CwTjoVQ+tDoCu8cVZpw8ue9G7o8cuIJla
 Yt9pnIzK64NXzX7uldcY2OS3i1lDetyZnC3nW0Zpfpxi1LJ4NheCNhiTq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261723170"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="261723170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="593286128"
Received: from briansim-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 4/4] drm/i915/selftests: tweak the misaligned_case
Date: Wed, 20 Apr 2022 19:16:13 +0100
Message-Id: <20220420181613.70033-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420181613.70033-1-matthew.auld@intel.com>
References: <20220420181613.70033-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The compact-pt layout restrictions should only apply to the ppGTT. Also
make this play nice on platforms that only have the 64K GTT restriction,
and not the compact-pt thing.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index bccc49a8ab5e..8633bec18fa7 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1112,10 +1112,16 @@ static int misaligned_case(struct i915_address_space *vm, struct intel_memory_re
 	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
 	expected_node_size = expected_vma_size;
 
-	if (NEEDS_COMPACT_PT(vm->i915) && i915_gem_object_is_lmem(obj)) {
-		/* compact-pt should expand lmem node to 2MB */
+	if (HAS_64K_PAGES(vm->i915) && i915_gem_object_is_lmem(obj)) {
+		/*
+		 * The compact-pt should expand lmem node to 2MB for the ppGTT,
+		 * for all other cases we should only expect 64K.
+		 */
 		expected_vma_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
-		expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
+		if (NEEDS_COMPACT_PT(vm->i915) && !i915_is_ggtt(vm))
+			expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
+		else
+			expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
 	}
 
 	if (vma->size != expected_vma_size || vma->node.size != expected_node_size) {
-- 
2.34.1

