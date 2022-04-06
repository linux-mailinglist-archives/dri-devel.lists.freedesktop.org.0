Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F14F69E5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B16E10E0B1;
	Wed,  6 Apr 2022 19:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FC910E0B1;
 Wed,  6 Apr 2022 19:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649273449; x=1680809449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgfgHxTj+X1PwaBmMx+iMlnINvUkoG1uNFCY7781CUA=;
 b=SBTb2tf+4j0SgRN/UbAWjq0qAJlq6xw1NlEiOrSC0+S7e9NSUJJDLhk7
 4EAuJRa+wrXDylRWs+IPri00Jd9JCBFBU1tNbPbWmTlNfn8vM8SekG6rF
 MRtuB0N+wb1WsOe4uplmmHvc2RI5zkSVbf9FAuivG9yyHt34gaUnd1uEr
 +WrpY1zM9cLbQzk96rorTePmEwEjl+o8KVmzKaLTaAtsklgs8z4AJTrtA
 LjQVZwSScQjEG4ofloWE+fIEqt3YivAR0TuXU/ZhOLc5/yH4T3Rdwx1vs
 96kJ4e1Yet+jLk42kWtKgq86LwNI7IuwSpVA5HyoOpneKf6HNwFbDu+1r g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="261316792"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="261316792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:30:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="549690342"
Received: from amoneill-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:30:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/selftests: tweak the misaligned_case
Date: Wed,  6 Apr 2022 20:30:37 +0100
Message-Id: <20220406193037.1060769-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406193037.1060769-1-matthew.auld@intel.com>
References: <20220406193037.1060769-1-matthew.auld@intel.com>
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

