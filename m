Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B3394173
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1786F590;
	Fri, 28 May 2021 10:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F18E6E3DA;
 Fri, 28 May 2021 10:57:56 +0000 (UTC)
IronPort-SDR: 7NLZregfLPiYVnwooBkdYyVfQs0uiYWcAIyfYb5rk/G0L4/7SeSPixsMjPfhcsYAUKGSsFUCHx
 dwGIsgVvZadg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266821809"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="266821809"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:57:56 -0700
IronPort-SDR: BfUBvM659MLOcbdbsALSgK1QASsfyB5uO0xatPJFO7nl5oAr4Xgb9xGri88RH7+rxUrGCxJB0p
 V4t7xJWJEjIw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="477885183"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.92])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:57:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 01/15] drm/i915: Untangle the vma pages_mutex
Date: Fri, 28 May 2021 12:57:30 +0200
Message-Id: <20210528105744.58271-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
References: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
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

