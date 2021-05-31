Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F5395A52
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA846E8FB;
	Mon, 31 May 2021 12:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB5A6E8F0;
 Mon, 31 May 2021 12:20:00 +0000 (UTC)
IronPort-SDR: MefHmMxqde0Ok7VOWhK8626g/kezDoju/1Fo/bclIOG0rsnaW1OctuKjPLsOUA66BFgpEH8QoI
 wmzBfjCK1AfA==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="183027444"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="183027444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:00 -0700
IronPort-SDR: 5Lv/6mrVuQfGaJPOyhSNNgW0dT5UmXUNySWu/KDsaG9Z19Ekx1J4X7fhtHv/dbOjt307B/PykP
 gAKPLQKAuIeg==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="473903747"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:19:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 01/15] drm/i915: Untangle the vma pages_mutex
Date: Mon, 31 May 2021 14:19:26 +0200
Message-Id: <20210531121940.267032-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
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

