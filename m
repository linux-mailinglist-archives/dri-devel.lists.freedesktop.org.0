Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B060C498
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 09:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B2610E2AD;
	Tue, 25 Oct 2022 07:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBBA10E186;
 Tue, 25 Oct 2022 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666681155; x=1698217155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+XvjNoGLgfl7N1KaK0B2YOTaM2J5nEsqsjqZVE2moE=;
 b=fMKzy6XsQnJ8lhXQ84ulUtRfwjGiyMM/DUlq/2nEqihFoaHoPMS5wSnV
 RCn7ppHnoSgUdOu04NEc93H807RBv0pn3FqBMZvpfWeVEwbv9RO+4vxoy
 +Cd0BTkLrMvdK5g1qSi916Aj1XHMfnZJ92rIng2sx+7OBn36hNEfrCGKt
 8VY2N306/i+fpAm5dNShM0SpLb6ym5wKkDB3pyzjOHdDlyEWat7TtWCQS
 UPJTqoLsOVfXFsZX0ng4Zm+07Dx/danug+7YsVhU5BzMWU5r8TLobwAZG
 uCdsmQ8oOgDPX2av9/iphzM6DU1Fypw8aF02mRgRGEFa9DksOQ1V2gq83 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308697605"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="308697605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 23:59:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806564432"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="806564432"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 23:59:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 14/19] drm/i915/vm_bind: Expose i915_request_await_bind()
Date: Mon, 24 Oct 2022 23:59:00 -0700
Message-Id: <20221025065905.13325-15-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
References: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename __i915_request_await_bind() as i915_request_await_bind()
and make it non-static as it will be used in execbuf3 ioctl path.

v2: add documentation

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c |  8 +-------
 drivers/gpu/drm/i915/i915_vma.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index aa4705246993..f73955aef16a 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1888,18 +1888,12 @@ void i915_vma_revoke_mmap(struct i915_vma *vma)
 		list_del(&vma->obj->userfault_link);
 }
 
-static int
-__i915_request_await_bind(struct i915_request *rq, struct i915_vma *vma)
-{
-	return __i915_request_await_exclusive(rq, &vma->active);
-}
-
 static int __i915_vma_move_to_active(struct i915_vma *vma, struct i915_request *rq)
 {
 	int err;
 
 	/* Wait for the vma to be bound before we start! */
-	err = __i915_request_await_bind(rq, vma);
+	err = i915_request_await_bind(rq, vma);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 04770f8ba815..737ef310d046 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -54,6 +54,22 @@ void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 /* do not reserve memory to prevent deadlocks */
 #define __EXEC_OBJECT_NO_RESERVE BIT(31)
 
+/**
+ * i915_request_await_bind() - Setup request to wait for a vma bind completion
+ * @rq: the request which should wait
+ * @vma: vma whose binding @rq should wait to complete
+ *
+ * Setup the request @rq to asynchronously wait for @vma bind to complete
+ * before starting execution.
+ *
+ * Returns 0 on success, error code on failure.
+ */
+static inline int
+i915_request_await_bind(struct i915_request *rq, struct i915_vma *vma)
+{
+	return __i915_request_await_exclusive(rq, &vma->active);
+}
+
 int __must_check _i915_vma_move_to_active(struct i915_vma *vma,
 					  struct i915_request *rq,
 					  struct dma_fence *fence,
-- 
2.21.0.rc0.32.g243a4c7e27

