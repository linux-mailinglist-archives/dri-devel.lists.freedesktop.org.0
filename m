Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B684878E1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 15:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE1411B5E4;
	Fri,  7 Jan 2022 14:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBE411B1E1;
 Fri,  7 Jan 2022 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641565440; x=1673101440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wt/8pwtlChm/mpB3OghNIIbQgWaHbJO5bulT4o+JVuw=;
 b=KvqCbBk2l98b290Ef8gDhJ35iyLbQ/geBFQ3RlpwqOaRRRhdk9SYsocE
 ruqfeNfcXnbelA2xxGd48McJtAC9fThkpSc+rF1zciXOah4bCXikPe/ZD
 ZBFxvkY/XwevJtQ0jfyBcBoJ6h8MbXUETTrjQgo6HBS6prSOIzgXJsw4v
 JutDkilnZTBRKuet3aB/5x16F01mKScwp8AZq37OuUrxlXlalkloebw1J
 JpKpUKTRMmkcnAc5PXpMDTKqn2brZVILgU0GCFnjGCpP+34AdV4UVZAEm
 gTY3yHlnJRRFRbi0K5li6xm0qqzD+MnPiPQ46SgvtD9IsKsUqhopAyVFL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230214622"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="230214622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 06:24:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="473331647"
Received: from skofoed-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 06:23:58 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/6] drm/i915: Don't pin the object pages during pending
 vma binds
Date: Fri,  7 Jan 2022 15:23:40 +0100
Message-Id: <20220107142343.56811-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107142343.56811-1-thomas.hellstrom@linux.intel.com>
References: <20220107142343.56811-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A pin-count is already held by vma->pages so taking an additional pin
during async binds is not necessary.

When we introduce async unbinding we have other means of keeping the
object pages alive.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 1d4e448d22d9..8fa3e0b2fe26 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -305,10 +305,8 @@ static void __vma_release(struct dma_fence_work *work)
 {
 	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
 
-	if (vw->pinned) {
-		__i915_gem_object_unpin_pages(vw->pinned);
+	if (vw->pinned)
 		i915_gem_object_put(vw->pinned);
-	}
 
 	i915_vm_free_pt_stash(vw->vm, &vw->stash);
 	i915_vm_put(vw->vm);
@@ -477,7 +475,6 @@ int i915_vma_bind(struct i915_vma *vma,
 
 		work->base.dma.error = 0; /* enable the queue_work() */
 
-		__i915_gem_object_pin_pages(vma->obj);
 		work->pinned = i915_gem_object_get(vma->obj);
 	} else {
 		if (vma->obj) {
-- 
2.31.1

