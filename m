Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29516489E42
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 18:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A56210FB75;
	Mon, 10 Jan 2022 17:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACE610FB75;
 Mon, 10 Jan 2022 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641835357; x=1673371357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RSeEW/jhnKIRMZnceswrHKG1+Ost86y2fgPuAHifrJU=;
 b=AqB3GuORLHrnIp/clP4Y8RDhDFQ7/vsgJh8EYOD5YKdfoc5+5N3y5nVE
 Gq7OsepZ5R4BP4xNPh58T6+fcoHpSpGJprDZjBsx+vzc3ZQDzc0tRKTW1
 v8P6CngIDSDGuBumsBKh1htNtSuQqSm9dkPSN9hJa83DIkYOUGj8mW2h5
 B/St+j0Dqs1lQXWnwfxTC3iLjsmpML/lmeBiqv8lXiToQJVrUmXHtNEGK
 x0buTH89euGuJPuYGNcDgcMjlwaqk1gOTHXdxZZ6MDUrpuV7h+Jo6rlvt
 Sqm5XR6oha+pMDTtVK9D6nOb1BcW26lApWKc9In+wBv3omYO2E4nSB5rl g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243471507"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="243471507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 09:22:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="514743979"
Received: from pheino-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.41])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 09:22:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 3/6] drm/i915: Don't pin the object pages during pending
 vma binds
Date: Mon, 10 Jan 2022 18:22:16 +0100
Message-Id: <20220110172219.107131-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110172219.107131-1-thomas.hellstrom@linux.intel.com>
References: <20220110172219.107131-1-thomas.hellstrom@linux.intel.com>
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
index 42fff9ddf096..29c770a764aa 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -306,10 +306,8 @@ static void __vma_release(struct dma_fence_work *work)
 {
 	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
 
-	if (vw->pinned) {
-		__i915_gem_object_unpin_pages(vw->pinned);
+	if (vw->pinned)
 		i915_gem_object_put(vw->pinned);
-	}
 
 	i915_vm_free_pt_stash(vw->vm, &vw->stash);
 	i915_vm_put(vw->vm);
@@ -478,7 +476,6 @@ int i915_vma_bind(struct i915_vma *vma,
 
 		work->base.dma.error = 0; /* enable the queue_work() */
 
-		__i915_gem_object_pin_pages(vma->obj);
 		work->pinned = i915_gem_object_get(vma->obj);
 	} else {
 		if (vma->obj) {
-- 
2.31.1

