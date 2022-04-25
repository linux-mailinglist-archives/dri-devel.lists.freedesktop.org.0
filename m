Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390150DF89
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90DB10E5AF;
	Mon, 25 Apr 2022 11:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90E210E5AF;
 Mon, 25 Apr 2022 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650887861; x=1682423861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AAeCVLq67fbPpU2hdLLfqt87mXaUOFhdwYJlRnNQsdY=;
 b=E/HZWF5mSRYmL5kdXwnOG/UzNov7Pbe4j7vyTb5jDugKBLzOz45CjIeX
 46KEz/lWcmLzlwOej/9phYe7IVe98CPA0b4p2B7hKOa31JhYAF6rr2VHm
 DHUw2BgVmNyEw6pgezNVI5wMlD22i0jpH8OsHpiyR3fQFlXMzSmDSM5q7
 IeSt71nhMw/YzxccvDcf1eV9RK+uSgNgRZftSFfk9NuilK0S06jjLzTJC
 ivyoiYHSF73mm1gV4eMo4GYDhfOXpbCPB8AtRuJ+CiUj1TYtlS91SGWmi
 LU7+pEKIkZtwPnYzvpQZjGDQkRAAVZhOznNa80yhDP9ZEG0et+aMW0MN3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="290363143"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="290363143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:57:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="557695921"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:57:39 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/4] drm/i915/selftest: Clear the output buffers before GPU
 writes
Date: Mon, 25 Apr 2022 17:28:28 +0530
Message-Id: <20220425115828.21473-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220425115828.21473-1-ramalingam.c@intel.com>
References: <20220425115828.21473-1-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

When testing whether we can get the GPU to leak information about
non-privileged state, we first need to ensure that the output buffer is
set to a known value as the HW may opt to skip the write into memory for
a non-privileged read of a sensitive register. We chose POISON_INUSE (0x5a)
so that is both non-zero and distinct from the poison values used during
the test.

v2:
  Use i915_gem_object_pin_map_unlocked

Reported-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: CQ Tang <cq.tang@intel.com>
cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 32 ++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 51e4b7092d4f..9c8e8321c633 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1346,6 +1346,30 @@ static int compare_isolation(struct intel_engine_cs *engine,
 	return err;
 }
 
+static struct i915_vma *
+create_result_vma(struct i915_address_space *vm, unsigned long sz)
+{
+	struct i915_vma *vma;
+	void *ptr;
+
+	vma = create_user_vma(vm, sz);
+	if (IS_ERR(vma))
+		return vma;
+
+	/* Set the results to a known value distinct from the poison */
+	ptr = i915_gem_object_pin_map_unlocked(vma->obj, I915_MAP_WC);
+	if (IS_ERR(ptr)) {
+		i915_vma_put(vma);
+		return ERR_CAST(ptr);
+	}
+
+	memset(ptr, POISON_INUSE, vma->size);
+	i915_gem_object_flush_map(vma->obj);
+	i915_gem_object_unpin_map(vma->obj);
+
+	return vma;
+}
+
 static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 {
 	u32 *sema = memset32(engine->status_page.addr + 1000, 0, 1);
@@ -1364,13 +1388,13 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 		goto err_A;
 	}
 
-	ref[0] = create_user_vma(A->vm, SZ_64K);
+	ref[0] = create_result_vma(A->vm, SZ_64K);
 	if (IS_ERR(ref[0])) {
 		err = PTR_ERR(ref[0]);
 		goto err_B;
 	}
 
-	ref[1] = create_user_vma(A->vm, SZ_64K);
+	ref[1] = create_result_vma(A->vm, SZ_64K);
 	if (IS_ERR(ref[1])) {
 		err = PTR_ERR(ref[1]);
 		goto err_ref0;
@@ -1392,13 +1416,13 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 	}
 	i915_request_put(rq);
 
-	result[0] = create_user_vma(A->vm, SZ_64K);
+	result[0] = create_result_vma(A->vm, SZ_64K);
 	if (IS_ERR(result[0])) {
 		err = PTR_ERR(result[0]);
 		goto err_ref1;
 	}
 
-	result[1] = create_user_vma(A->vm, SZ_64K);
+	result[1] = create_result_vma(A->vm, SZ_64K);
 	if (IS_ERR(result[1])) {
 		err = PTR_ERR(result[1]);
 		goto err_result0;
-- 
2.20.1

