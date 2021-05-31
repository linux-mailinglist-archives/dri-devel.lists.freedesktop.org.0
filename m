Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38A3966D9
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB0F6E957;
	Mon, 31 May 2021 17:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8CA6E94B;
 Mon, 31 May 2021 17:22:40 +0000 (UTC)
IronPort-SDR: oDQGoZLmmnVU01ecDhZcxY6oqrxhFHP6Ky1XkKv9a9I8TI/7tc50rJRn9x8siMXLWZaSXTZUDl
 o8Ual8LIAE2w==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="201520187"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="201520187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 10:22:40 -0700
IronPort-SDR: xhQaA3SXDQjcmNfITzuuTwTGeHjWcVMksH0UeDAv0rTtj87RHKxC/tYnuB3HN1ZXzyr/pSssY6
 Td6IMs57Gdew==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="416210944"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.142])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 10:22:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 01/15] drm/i915: Untangle the vma pages_mutex
Date: Mon, 31 May 2021 19:22:14 +0200
Message-Id: <20210531172228.70846-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
References: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
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

