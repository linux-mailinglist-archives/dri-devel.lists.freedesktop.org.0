Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9604841E4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 13:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DEB10E26C;
	Tue,  4 Jan 2022 12:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D61710E19D;
 Tue,  4 Jan 2022 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641300708; x=1672836708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0q3VtHevy6J29DWr1xPafQh2zYlv0AlDdd8Bz47sDGk=;
 b=I+ZWzccerOSrvLHF7vhil/2LWE1yVU691jUcO4uDIrU+TTEzv2wWPCDL
 VIsmPCtuAZux7iulDv+67CAXzoB3IpTkQ2dIYZSgmHcdBtR8hSJ4Pf3ie
 qLB1Ev6DuHUksAh0GDbISsj4AG5EEHFw8tohjICke60x8Lx/i8Frzm2bj
 dYeKNm0fTZUveYwG+BsuN/AvYN8rZBdu1P0X9FoVyWWgcvvZ/GImOJ9/G
 j7OaRtGpI+k5W9Mun7251VjClJEX2R3xTuqWgtZ1UIU6mONIFkKmCBrBf
 6CJD2YYLuAkPFETW/YoYxlt4t+juO9D4i03ExtMd8VZh7alJ70VbUPp0w w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242174373"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242174373"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 04:51:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="688557604"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 04:51:46 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/6] drm/i915: Don't pin the object pages during pending
 vma binds
Date: Tue,  4 Jan 2022 13:51:29 +0100
Message-Id: <20220104125132.35179-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
References: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
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

