Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7901C37A778
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDEF6EA31;
	Tue, 11 May 2021 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D27B6E519;
 Tue, 11 May 2021 13:26:07 +0000 (UTC)
IronPort-SDR: Rvq0eUMlqdJjc/VKacGKy30dhu3GgKo12pnZzK0ueM+SOCGPYpL6N2g1njggaJ+B3sM5YM5aKr
 /uC5dCVmUUaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196345382"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196345382"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:26:07 -0700
IronPort-SDR: NEYGvOdIkRNBNlKw4oC3AxI4yrfJsnWv+hfUXwkdqrMuT+IotUWWWt5GnmKWbduWH3PT2F6gtX
 OHDNaATxHltw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="468905384"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.168])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:26:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915: Untangle the vma pages_mutex
Date: Tue, 11 May 2021 15:25:19 +0200
Message-Id: <20210511132525.377190-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@intel.com>

Any sleeping dma_resv lock taken while the vma pages_mutex is held
will cause a lockdep splat.
Move the i915_gem_object_pin_pages() call out of the pages_mutex
critical section.

Signed-off-by: Thomas Hellström <thomas.hellstrom@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index a6cd0fa62847..7b1c0f4e60d7 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -800,32 +800,37 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 static int vma_get_pages(struct i915_vma *vma)
 {
 	int err = 0;
+	bool pinned_pages = false;
 
 	if (atomic_add_unless(&vma->pages_count, 1, 0))
 		return 0;
 
+	if (vma->obj) {
+		err = i915_gem_object_pin_pages(vma->obj);
+		if (err)
+			return err;
+		pinned_pages = true;
+	}
+
 	/* Allocations ahoy! */
-	if (mutex_lock_interruptible(&vma->pages_mutex))
-		return -EINTR;
+	if (mutex_lock_interruptible(&vma->pages_mutex)) {
+		err = -EINTR;
+		goto unpin;
+	}
 
 	if (!atomic_read(&vma->pages_count)) {
-		if (vma->obj) {
-			err = i915_gem_object_pin_pages(vma->obj);
-			if (err)
-				goto unlock;
-		}
-
 		err = vma->ops->set_pages(vma);
-		if (err) {
-			if (vma->obj)
-				i915_gem_object_unpin_pages(vma->obj);
+		if (err)
 			goto unlock;
-		}
+		pinned_pages = false;
 	}
 	atomic_inc(&vma->pages_count);
 
 unlock:
 	mutex_unlock(&vma->pages_mutex);
+unpin:
+	if (pinned_pages)
+		__i915_gem_object_unpin_pages(vma->obj);
 
 	return err;
 }
@@ -838,10 +843,10 @@ static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
 	if (atomic_sub_return(count, &vma->pages_count) == 0) {
 		vma->ops->clear_pages(vma);
 		GEM_BUG_ON(vma->pages);
-		if (vma->obj)
-			i915_gem_object_unpin_pages(vma->obj);
 	}
 	mutex_unlock(&vma->pages_mutex);
+	if (vma->obj)
+		i915_gem_object_unpin_pages(vma->obj);
 }
 
 static void vma_put_pages(struct i915_vma *vma)
-- 
2.30.2

