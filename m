Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D18435F23
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011D26EC43;
	Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118A56E42A;
 Thu, 21 Oct 2021 10:36:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 06/28] drm/i915: Remove gen6_ppgtt_unpin_all
Date: Thu, 21 Oct 2021 12:35:43 +0200
Message-Id: <20211021103605.735002-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gen6_ppgtt_unpin_all is unused, kill it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 11 -----------
 drivers/gpu/drm/i915/gt/gen6_ppgtt.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 890191f286e3..9fdbd9d3372b 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -405,17 +405,6 @@ void gen6_ppgtt_unpin(struct i915_ppgtt *base)
 		i915_vma_unpin(ppgtt->vma);
 }
 
-void gen6_ppgtt_unpin_all(struct i915_ppgtt *base)
-{
-	struct gen6_ppgtt *ppgtt = to_gen6_ppgtt(base);
-
-	if (!atomic_read(&ppgtt->pin_count))
-		return;
-
-	i915_vma_unpin(ppgtt->vma);
-	atomic_set(&ppgtt->pin_count, 0);
-}
-
 struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
 {
 	struct i915_ggtt * const ggtt = gt->ggtt;
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.h b/drivers/gpu/drm/i915/gt/gen6_ppgtt.h
index 6a61a5c3a85a..ab0eecb086dd 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.h
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.h
@@ -71,7 +71,6 @@ static inline struct gen6_ppgtt *to_gen6_ppgtt(struct i915_ppgtt *base)
 
 int gen6_ppgtt_pin(struct i915_ppgtt *base, struct i915_gem_ww_ctx *ww);
 void gen6_ppgtt_unpin(struct i915_ppgtt *base);
-void gen6_ppgtt_unpin_all(struct i915_ppgtt *base);
 void gen6_ppgtt_enable(struct intel_gt *gt);
 void gen7_ppgtt_enable(struct intel_gt *gt);
 struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt);
-- 
2.33.0

