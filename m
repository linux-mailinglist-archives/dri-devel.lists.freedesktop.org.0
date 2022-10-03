Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD35F287C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 08:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A456A10E247;
	Mon,  3 Oct 2022 06:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA7910E20D;
 Mon,  3 Oct 2022 06:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664777600; x=1696313600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6N/2h70CbCsl2VdF0lGHvDEHm3DZsC24maZAA3D8kTM=;
 b=ExiVCbOR3SAY6nuFfG0QNy+xuYY/7qn5YuTYPRRAsxOU8BQ/3VNjQ0H1
 /mitNnWtpD9MAopXYZDSKPUAGZ/uq2uvIF6eA7gsJ/0I5rqZBbFZihPpG
 mju+GLX2H2UKW9Nj9kusXnZRq0QVVq4SbFtLIrxtoORv2O7jtpy/oBK7Y
 hnRPCFQPh384OJjgpVNAOZLnQzFlT+Y26I98CijVVR87izY1LmT1vV71e
 ZV2bhJDNYQIOOzrDi83B9elKLHjhDMFgbMTiqVUnRMJZ50K7xt/ohJdxg
 r0vUIQw9d+3GOn1dHz3DBcfLS1qh4jyCgOx32uo/Y7KCSZIH+pEzBKDD4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="300159080"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="300159080"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2022 23:13:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574516848"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="574516848"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Oct 2022 23:13:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/17] drm/i915/vm_bind: Expose i915_request_await_bind()
Date: Sun,  2 Oct 2022 23:12:42 -0700
Message-Id: <20221003061245.12716-15-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
References: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 8 +-------
 drivers/gpu/drm/i915/i915_vma.h | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 492a00d09cf3..9e8f30022721 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1889,18 +1889,12 @@ void i915_vma_revoke_mmap(struct i915_vma *vma)
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
index 04770f8ba815..19e57e12b956 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -54,6 +54,12 @@ void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 /* do not reserve memory to prevent deadlocks */
 #define __EXEC_OBJECT_NO_RESERVE BIT(31)
 
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

