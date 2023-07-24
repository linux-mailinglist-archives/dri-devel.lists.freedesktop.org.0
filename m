Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC275F76F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 14:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35010E2F1;
	Mon, 24 Jul 2023 12:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0D10E2E4;
 Mon, 24 Jul 2023 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690203404; x=1721739404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cKQb0hHyw62+3w8EDhb99A3vugN+bsNLMvCSG6tr08s=;
 b=IGw1i88cd1uvzkVRMVmOcFQGUMeL7B3TBFlkmes4lF2jqC8xG9uIsuHb
 47ruxm3dzR2S1Rzm0iKqkcDs41fDNCtuOVdSiP+zzNzbtZUC26WN1ttfm
 CHTalFn43T7IZn1VbFtzFKmT7ufO0Se1tIDnIpNLMutCzahR1WYlotqiX
 746kcrk/0CBWSdYXOJ18ksaP5I98Z/0xbeVU7FtAdxHIiLC93SkIj/DnK
 jOzuJruzHsZmb3nF+Bn6A4FpvUaeAB0WsWFMe+bAy1f7BJgHdHihmRpLy
 NWg1QinBZpnsjNOtuv6fnEXHFrV+YyGt+978yTXsNeczXATygGRDnEsDa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370099781"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="370099781"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 05:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849625005"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="849625005"
Received: from srichara-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.170.186])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 05:56:42 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT paths of
 i915_vma_pin_iomap
Date: Mon, 24 Jul 2023 13:56:33 +0100
Message-Id: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
 stable@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: <stable@vger.kernel.org> # v5.14+
---
 drivers/gpu/drm/i915/i915_vma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ffb425ba591c..f2b626cd2755 100644
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
@@ -617,6 +619,8 @@ void i915_vma_flush_writes(struct i915_vma *vma)
 {
 	if (i915_vma_unset_ggtt_write(vma))
 		intel_gt_flush_ggtt_writes(vma->vm->gt);
+	else
+		wmb(); /* Just flush the write-combine buffer. */
 }
 
 void i915_vma_unpin_iomap(struct i915_vma *vma)
-- 
2.39.2

