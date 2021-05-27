Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93439314D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD466EB49;
	Thu, 27 May 2021 14:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3811C6EB0E;
 Thu, 27 May 2021 14:47:24 +0000 (UTC)
IronPort-SDR: F2tBkwiSZ8qGu1/ixMkMiZMdbJNmFV/LHENJ95QGrtr181l9ZMhZll5vzykWcdtag2DZvN5i5/
 mHsOiUI56Olg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202515557"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202515557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:47:24 -0700
IronPort-SDR: JAR2oi1wuLalCLjcIzgMcxvp8noUVPfDbaAF5HzhW1keB0byKJKTXNTN35vwzA7eIa418bZZ1R
 SCi86YR36YJA==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="443597800"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:47:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/15] drm/i915: Untangle the vma pages_mutex
Date: Thu, 27 May 2021 16:46:56 +0200
Message-Id: <20210527144710.1975553-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
References: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any sleeping dma_resv lock taken while the vma pages_mutex is held
will cause a lockdep splat.
Move the i915_gem_object_pin_pages() call out of the pages_mutex
critical section.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index b319fd3f91cc..0f227f28b280 100644
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
-- 
2.31.1

