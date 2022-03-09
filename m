Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DF4D2829
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 06:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BD410E932;
	Wed,  9 Mar 2022 05:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA08910E913;
 Wed,  9 Mar 2022 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646803018; x=1678339018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zrIW/ywbGiSxQgZOjhe1dRoR7WOGs+z/hsWey6cW2k=;
 b=E1FkrUw3zrX/bYw2KGw77CH77ePZ3/XQ3Hl+lMXnhzV6lZqhvBTPBb/1
 I+NjRay1rdmhAnnhOnK33FBRAZHfjYaibKCez5Q1v0GZFmVhItJnP96HZ
 QOaLfu8hhJJ5ToLOP42toQSVpR8rJyt+s7SPgu2JwqPkPiLGXUkXq1ViN
 Ehh0s+tk19upIUmS2qon+i1J4RzaB4Y5cXHUXXlH6weht14EnWlNT6mmH
 hY57TiUx5lH4TssM4Qr3CanfFgiy6hGlMVasxyeFoGY/e+qaW2+SerT4L
 Gzz5eiXMzfcCtgHaPwhP/68GqnQsQzhwuplGdZRvCSLxPiLw8ueblZPIk A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255081141"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="255081141"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="711807549"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:55 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/i915/selftest: Clear the output buffers before GPU
 writes
Date: Wed,  9 Mar 2022 10:47:06 +0530
Message-Id: <20220309051708.22644-7-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220309051708.22644-1-ramalingam.c@intel.com>
References: <20220309051708.22644-1-ramalingam.c@intel.com>
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
Cc: lucas.demarchi@intel.com, Chris Wilson <chris@chris-wilson.co.uk>,
 CQ Tang <cq.tang@intel.com>, daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

When testing whether we can get the GPU to leak information about
non-privileged state, we first need to ensure that the output buffer is
set to a known value as the HW may opt to skip the write into memory for
a non-privileged read of a sensitive register. We chose POISON_INUSE (0x5a)
so that is both non-zero and distinct from the poison values used during
the test.

Reported-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 32 ++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 6717ecaed178..d8face764ee4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1430,6 +1430,30 @@ static int compare_isolation(struct intel_engine_cs *engine,
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
+	ptr = i915_gem_object_pin_map(vma->obj, I915_MAP_WC);
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
 static int
 __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
 {
@@ -1449,13 +1473,13 @@ __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
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
@@ -1476,13 +1500,13 @@ __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
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

