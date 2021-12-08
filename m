Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F4E46CEC9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514DB6E8D8;
	Wed,  8 Dec 2021 08:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4896E8D8;
 Wed,  8 Dec 2021 08:23:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="298577734"
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="298577734"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:23:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="580526454"
Received: from sbogar-mobl2.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.43])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:23:00 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix coredump of perma-pinned vmas
Date: Wed,  8 Dec 2021 09:22:45 +0100
Message-Id: <20211208082245.86933-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When updating the error capture code and introducing vma snapshots,
we introduced code to hold the vma in memory while capturing it,
calling i915_active_acquire_if_busy(). Now that function isn't relevant
for perma-pinned vmas and caused important vmas to be dropped from the
coredump. Like for example the GuC log.

Fix this by instead requiring those vmas to be pinned while capturing.

Tested by running the initial subtests of the gem_exec_capture igt test
with GuC submission enabled and verifying that a GuC log blob appears
in the output.

Fixes: ff20afc4cee7 ("drm/i915: Update error capture code to avoid using the current vma state")
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reported-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 96d2d99f5b98..e06d3aee0017 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1415,18 +1415,15 @@ static struct i915_vma_coredump *
 create_vma_coredump(const struct intel_gt *gt, struct i915_vma *vma,
 		    const char *name, struct i915_vma_compress *compress)
 {
-	struct i915_vma_coredump *ret = NULL;
+	struct i915_vma_coredump *ret;
 	struct i915_vma_snapshot tmp;
-	bool lockdep_cookie;
 
 	if (!vma)
 		return NULL;
 
+	GEM_WARN_ON(!i915_vma_is_pinned(vma));
 	i915_vma_snapshot_init_onstack(&tmp, vma, name);
-	if (i915_vma_snapshot_resource_pin(&tmp, &lockdep_cookie)) {
-		ret = i915_vma_coredump_create(gt, &tmp, compress);
-		i915_vma_snapshot_resource_unpin(&tmp, lockdep_cookie);
-	}
+	ret = i915_vma_coredump_create(gt, &tmp, compress);
 	i915_vma_snapshot_put_onstack(&tmp);
 
 	return ret;
-- 
2.31.1

