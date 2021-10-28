Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB543E1C8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A786E953;
	Thu, 28 Oct 2021 13:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5BB6E953;
 Thu, 28 Oct 2021 13:13:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227852745"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="227852745"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:01:10 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="665406498"
Received: from malloyd-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.16.73])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:01:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 03/11] drm/i915: Remove gen6_ppgtt_unpin_all
Date: Thu, 28 Oct 2021 13:58:47 +0100
Message-Id: <20211028125855.3281674-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211028125855.3281674-1-matthew.auld@intel.com>
References: <20211028125855.3281674-1-matthew.auld@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

gen6_ppgtt_unpin_all is unused, kill it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 11 -----------
 drivers/gpu/drm/i915/gt/gen6_ppgtt.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index baea9770200a..ae693bf88ef0 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -404,17 +404,6 @@ void gen6_ppgtt_unpin(struct i915_ppgtt *base)
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
2.26.3

