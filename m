Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03D724E22
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF7610E3B4;
	Tue,  6 Jun 2023 20:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1610E00D;
 Tue,  6 Jun 2023 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686083296; x=1717619296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s+K+vxUE+t/ISNlBl0LenW79AMapYZsPQdTU2l40Vzk=;
 b=nFk+wApo5EnoRdlHmlfUWY2+ZU5uU2G0gdiKIIqJ5Lb10St6kC1HtaWW
 GzHXZuGzcw6tEocWa/mP97d896LiKlFA3FW+Br/mjjUtaA27EnhNdPBDG
 lLHo+9k531vTMrXVs0jTud4iS7W6R1b/Eohd42M+CEkSbnalpdIXySyaD
 LT2wd97S7k95oo2uZC/vqXHZ+yLpbf/jLOP4PUGfNSitOn+4WADQndOli
 GDziNWzewxrAiVtqf1rTQT/saEzM6rkkHZMgYvulhJIiRjAGYekXHwvld
 d3blf88oPyX3Keo0CHhzvLjYp4bUYD/M1IaJPNv8pYKQ47pGh3RQLLfNR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356803662"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="356803662"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686667627"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="686667627"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:28:01 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Fix a VMA UAF for multi-gt platform
Date: Tue,  6 Jun 2023 22:27:55 +0200
Message-Id: <20230606202755.8719-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure correct handling of closed VMAs on multi-gt platforms to prevent
Use-After-Free. Currently, when GT0 goes idle, closed VMAs that are
exclusively added to GT0's closed_vma link (gt->closed_vma) and
subsequently freed by i915_vma_parked(), which assumes the entire GPU is
idle. However, on platforms with multiple GTs, such as MTL, GT1 may
remain active while GT0 is idle. This causes GT0 to mistakenly consider
the closed VMAs in its closed_vma list as unnecessary, potentially
leading to Use-After-Free issues if a job for GT1 attempts to access a
freed VMA.

Although we do take a wakeref for GT0 but it happens later, after
evaluating VMAs. To mitigate this, it is necessary to hold a GT0 wakeref
early.

v2: Use gt id to detect multi-tile(Andi)
    Fix the incorrect error path.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Tested-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 3aeede6aee4d..c2a67435acfa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2683,6 +2683,7 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
+	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2706,10 +2707,16 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb->num_batches = ce->parallel.number_children + 1;
+	gt = ce->engine->gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
 	intel_gt_pm_get(ce->engine->gt);
+	/* Keep GT0 active on MTL so that i915_vma_parked() doesn't
+	 * free VMAs while execbuf ioctl is validating VMAs.
+	 */
+	if (gt->info.id)
+		intel_gt_pm_get(to_gt(gt->i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2748,6 +2755,9 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
+	if (gt->info.id)
+		intel_gt_pm_put(to_gt(gt->i915));
+
 	intel_gt_pm_put(ce->engine->gt);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2761,6 +2771,8 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb->context->vm);
+	if (eb->gt->info.id)
+		intel_gt_pm_put(to_gt(eb->gt->i915));
 	intel_gt_pm_put(eb->gt);
 	for_each_child(eb->context, child)
 		intel_context_put(child);
-- 
2.39.0

