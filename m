Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E67619F9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0910E3CF;
	Tue, 25 Jul 2023 13:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07C810E3CF;
 Tue, 25 Jul 2023 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690291797; x=1721827797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7PaAeH1auRhSSbzeWKOgTSpHq7Ypc+OO1v7czgix8lU=;
 b=MAct05XbW+o6xP5GhoHEL0w9DqkMo/GABVlPyVfm+gpgPyhUaUYzUyp3
 bC+lDk5exVO5C6CQn3rNVzx4gOEcQJH/cPsUSLV+5l12V7KyS/LcY8e3G
 ewNpZ+J82a1LviS3KHvw1owPuET883aaWYUFqpAt6S6UIW+Xuehniditm
 z+y/ODZzt+HJb57UT0Ir+w1h7mEKtjHipYtPD/R8PxjcSaJQVNz0lYHYb
 Jkeyc9WhcDn+Bs2rKgtBEq+RkbxFv+D/rELSh835hreXypu0xvOfDB3ql
 X1s5YRFXa/ul2GgIwPLtwWH8s+bq1gqWeoE0zEFYV0OdJmkEB3tECh8rq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454101876"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="454101876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761216135"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="761216135"
Received: from grdarcy-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.4])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:29:55 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Avoid GGTT flushing on non-GGTT paths of
 i915_vma_pin_iomap
Date: Tue, 25 Jul 2023 14:29:46 +0100
Message-Id: <20230725132946.1539075-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
References: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, stable@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
added a code path which does not map via GGTT, but was still setting the
ggtt write bit, and so triggering the GGTT flushing.

Fix it by not setting that bit unless the GGTT mapping path was used, and
replace the flush with wmb() in i915_vma_flush_writes().

This also works for the i915_gem_object_pin_map path added in
d976521a995a ("drm/i915: extend i915_vma_pin_iomap()").

It is hard to say if the fix has any observable effect, given that the
write-combine buffer gets flushed from intel_gt_flush_ggtt_writes too, but
apart from code clarity, skipping the needless GGTT flushing could be
beneficial on platforms with non-coherent GGTT. (See the code flow in
intel_gt_flush_ggtt_writes().)

v2:
 * Improve comment in i915_vma_flush_writes(). (Andi)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: <stable@vger.kernel.org> # v5.14+
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ffb425ba591c..7788b03b86d6 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -602,7 +602,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 	if (err)
 		goto err_unpin;
 
-	i915_vma_set_ggtt_write(vma);
+	if (!i915_gem_object_is_lmem(vma->obj) &&
+	    i915_vma_is_map_and_fenceable(vma))
+		i915_vma_set_ggtt_write(vma);
 
 	/* NB Access through the GTT requires the device to be awake. */
 	return page_mask_bits(ptr);
@@ -615,8 +617,19 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 
 void i915_vma_flush_writes(struct i915_vma *vma)
 {
+	/*
+	 * i915_vma_iomap() could have mapped the underlying memory in one
+	 * of the three ways, depending on which we have to choose the most
+	 * appropriate flushing mechanism.
+	 *
+	 * If the mapping method was via the aperture the appropriate flag will
+	 * be set via i915_vma_set_ggtt_write(), and if not then we know it is
+	 * enough to simply flush the CPU side write-combine buffer.
+	 */
 	if (i915_vma_unset_ggtt_write(vma))
 		intel_gt_flush_ggtt_writes(vma->vm->gt);
+	else
+		wmb();
 }
 
 void i915_vma_unpin_iomap(struct i915_vma *vma)
-- 
2.39.2

