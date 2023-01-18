Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1D6714E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C80810E6DB;
	Wed, 18 Jan 2023 07:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A275210E6AA;
 Wed, 18 Jan 2023 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026176; x=1705562176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JziwCgGBwyULjqZvRR3vZCY7Jxoih1R36f/OsXPn7M=;
 b=YB48sGnBPZvsDepOa+yJTTuBBWnjllcTs1qeIUjgfCHu9APwcqZY41qI
 GqofJEdoKUcR0j2iOu3hePbAaDkLuLSDIbL3s+OJ6DWe4a88pTWvJsoev
 AeDHtJUc8kNKAyYzH3/8p9rbxf5+hoCZBciorW6oml7oDK+5VTzMm5X5z
 H9chdotsLAzpNS1pmTfQ2b+lsH4XzX9mB8STFmmEwdY2FFw9WyooF4gQp
 6OvSxvgTCaXIa78eK94e7BTL1jB34tkVY9umPt2dTy2RoxoEQfSwWzz3C
 xFDyIqB/Di3iAgZVT5JK3vQwYN3oHfdkJcOv6JH/rdwQ4JXsbePR3ZEzJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482067"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661610011"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661610011"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:15 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 15/23] drm/i915/vm_bind: Expose i915_request_await_bind()
Date: Tue, 17 Jan 2023 23:16:01 -0800
Message-Id: <20230118071609.17572-16-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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
index 804f01b9002d..8fc93f20f70d 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1923,18 +1923,12 @@ void i915_vma_revoke_mmap(struct i915_vma *vma)
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
index 1f25e45a6325..d6c05227fb04 100644
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

