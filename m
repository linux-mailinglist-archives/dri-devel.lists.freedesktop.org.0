Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D86B0D0F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361A310E624;
	Wed,  8 Mar 2023 15:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F210E616;
 Wed,  8 Mar 2023 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678289991; x=1709825991;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wG3vf2+xlpzOKdj5dCj9/rgBBguHqYIRNINuZ3j1/Dc=;
 b=B/H5xVnw5dK5S0V3k4FIXXu51SOH/RcZ6clyaFwkzkky976nDUTTtiNT
 o+kqaPE9Z8Pncd/1OnJO9OBzPX4hqBcFtqWZaN2rzVJVfguGUmhGr7GQc
 FOfo73djKMCU5nHS2c1U4ADQLxuBXOGZZkeB7or10O5t4kB+tSDUGbQAY
 pfgCcZDm8JITYqo2pGGYAnbvqx8rYBnSKQzMzDEpHJiR/ILKd9ZzMrGmj
 sL2Ee8/kWuiBToy9EGIugZ/MYTv1c520AzMFTNoU01ArqvADdQ/JjwU9B
 UTGSsDQjZ0CBOaEGehanxf+IdM9MKzhbT4NtzEiZ97PYMSNPvys3zSHyu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337703577"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337703577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787160279"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787160279"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:49 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 08 Mar 2023 16:39:05 +0100
Subject: [PATCH v5 3/4] drm/i915/selftests: use nop_clear_range instead of
 local function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-guard_error_capture-v5-3-6d1410d13540@intel.com>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
In-Reply-To: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since nop_clear_range is visible it can be used here.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/selftests/mock_gtt.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index ece97e4faacb97..89119e3970279f 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -57,11 +57,6 @@ static void mock_cleanup(struct i915_address_space *vm)
 {
 }
 
-static void mock_clear_range(struct i915_address_space *vm,
-			     u64 start, u64 length)
-{
-}
-
 struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 {
 	struct i915_ppgtt *ppgtt;
@@ -80,7 +75,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 	ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
 	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
-	ppgtt->vm.clear_range = mock_clear_range;
+	ppgtt->vm.clear_range = nop_clear_range;
 	ppgtt->vm.insert_page = mock_insert_page;
 	ppgtt->vm.insert_entries = mock_insert_entries;
 	ppgtt->vm.cleanup = mock_cleanup;
@@ -119,7 +114,7 @@ void mock_init_ggtt(struct intel_gt *gt)
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
 	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
-	ggtt->vm.clear_range = mock_clear_range;
+	ggtt->vm.clear_range = nop_clear_range;
 	ggtt->vm.insert_page = mock_insert_page;
 	ggtt->vm.insert_entries = mock_insert_entries;
 	ggtt->vm.cleanup = mock_cleanup;

-- 
2.34.1
