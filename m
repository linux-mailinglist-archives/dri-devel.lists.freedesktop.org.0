Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F449E1AC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FC010E485;
	Thu, 27 Jan 2022 11:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF2210E444;
 Thu, 27 Jan 2022 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643284593; x=1674820593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lAfO1xUvD/2JnooBgwHet/YfseDienykJcje6rfi16w=;
 b=CUSCSvTTI147mmG/NTk8grqIVbgkR4y02cOkORHq/1Ge8E0t/tQpYijD
 9WQ1RD6V166qPZJ+VqtaRTPXxSAZofUq3HAFeL6zq8vZ+B7XpBecVRqJY
 HoPpT4TSz6DpG7fMS4N3hz657qxWVqkEiBSh8WwArQ3P5VQEEkfg2dLlM
 GLV8sybYuCuoBSSfY9s0250VQ4jdJ04s83WuFA3xPnOhtKgW3auQnzj8A
 3X99I3NxkYIl0pd43Gsj3TwfTTKUZ9duh2C6MMCVEEjb+zqmWlX4R9QvO
 Rleu15x1xUSDqnAHa3BJglfAkcMK8c9JsQVKO/OCbI+9DtjicShHWqese Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333182742"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="333182742"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:56:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="533082560"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.207])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:56:31 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix a race between vma / object destruction and
 unbinding
Date: Thu, 27 Jan 2022 12:56:22 +0100
Message-Id: <20220127115622.302970-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

The vma destruction code was using an unlocked advisory check for
drm_mm_node_allocated() to avoid racing with eviction code unbinding
the vma.

This is very fragile and prohibits the dereference of non-refcounted
pointers of dying vmas after a call to __i915_vma_unbind(). It also
prohibits the dereference of vma->obj of refcounted pointers of
dying vmas after a call to __i915_vma_unbind(), since even if a
refcount is held on the vma, that won't guarantee that its backing
object doesn't get destroyed.

So introduce an unbind under the vm mutex at object destroy time,
removing all weak references of the vma and its object from the
object vma list and from the vm bound list.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 1a9e1f940a7d..e03e362d320b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -280,6 +280,12 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 			GEM_BUG_ON(vma->obj != obj);
 			spin_unlock(&obj->vma.lock);
 
+			/* Verify that the vma is unbound under the vm mutex. */
+			mutex_lock(&vma->vm->mutex);
+			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+			__i915_vma_unbind(vma);
+			mutex_unlock(&vma->vm->mutex);
+
 			__i915_vma_put(vma);
 
 			spin_lock(&obj->vma.lock);
-- 
2.34.1

