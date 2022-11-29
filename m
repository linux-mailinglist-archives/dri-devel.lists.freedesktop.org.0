Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027F63BAB6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55910E389;
	Tue, 29 Nov 2022 07:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B0E10E375;
 Tue, 29 Nov 2022 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669706809; x=1701242809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Uf6O0aPEoiD8593NE9Dm4Dug55V5lyxlyaIPU0TWDY=;
 b=iasqGMcATKWGEcnyXyR5YBOmXU3zPiRwAP75eNqgbdW6DU+lKR2GQDqT
 YuGBfe9TYFJgfNEg0IagaPkyP4NBe2PdlF5hrBfaK7/dcdmI51hh1LqZ9
 Ui+101FoIXAxpKsD7YmtDnWn4aQKJpt6qGGbOhKkkaKckcHB4nFmivRf0
 A2VqFQSPzryfJPcHFCNAsOc5lQKHl5Bg7jr039JzBQ57ePbna7tLDMJHZ
 C5nMOYsfucqfxQ6Ojl8oft/7tukjmhZLKupDuvcG0oflipVcCavSrsIVu
 5fhh4v7rlrw5Xf6EcwS7RggFlhqWCXBHEYOxkf8k4rEAFahkiDCLwzreg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295418368"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295418368"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674525596"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="674525596"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 14/22] drm/i915/vm_bind: Expose i915_request_await_bind()
Date: Mon, 28 Nov 2022 23:26:27 -0800
Message-Id: <20221129072635.847-15-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
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
index e382c8a6cac4..931277dfe706 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1893,18 +1893,12 @@ void i915_vma_revoke_mmap(struct i915_vma *vma)
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
index 9a411a79badd..1ecc71cf2698 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -55,6 +55,22 @@ void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define __EXEC_OBJECT_NO_RESERVE BIT(31)
 #define __EXEC_OBJECT_NO_REQUEST_AWAIT BIT(30)
 
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

