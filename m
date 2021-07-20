Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB563D0309
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B566E532;
	Tue, 20 Jul 2021 20:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644966E527;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885378"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885378"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906094"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 34/42] drm/i915: Store batch index in struct
 i915_execbuffer
Date: Tue, 20 Jul 2021 13:57:54 -0700
Message-Id: <20210720205802.39610-35-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will help with upcoming extensions where more than 1 batch can be
submitted in a single execbuf IOCTL.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 40311583f03d..1f1f477e46b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -252,6 +252,9 @@ struct i915_execbuffer {
 	struct eb_vma *batch; /** identity of the batch obj/vma */
 	struct i915_vma *trampoline; /** trampoline used for chaining */
 
+	/* batch_index in vma list */
+	unsigned int batch_index;
+
 	/** actual size of execobj[] as we may extend it for the cmdparser */
 	unsigned int buffer_count;
 
@@ -361,6 +364,11 @@ static int eb_create(struct i915_execbuffer *eb)
 		eb->lut_size = -eb->buffer_count;
 	}
 
+	if (eb->args->flags & I915_EXEC_BATCH_FIRST)
+		eb->batch_index = 0;
+	else
+		eb->batch_index = eb->args->buffer_count - 1;
+
 	return 0;
 }
 
@@ -735,14 +743,6 @@ static int eb_reserve(struct i915_execbuffer *eb)
 	} while (1);
 }
 
-static unsigned int eb_batch_index(const struct i915_execbuffer *eb)
-{
-	if (eb->args->flags & I915_EXEC_BATCH_FIRST)
-		return 0;
-	else
-		return eb->buffer_count - 1;
-}
-
 static int eb_select_context(struct i915_execbuffer *eb)
 {
 	struct i915_gem_context *ctx;
@@ -852,7 +852,6 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
 static int eb_lookup_vmas(struct i915_execbuffer *eb)
 {
 	struct drm_i915_private *i915 = eb->i915;
-	unsigned int batch = eb_batch_index(eb);
 	unsigned int i;
 	int err = 0;
 
@@ -873,7 +872,7 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 			goto err;
 		}
 
-		eb_add_vma(eb, i, batch, vma);
+		eb_add_vma(eb, i, eb->batch_index, vma);
 
 		if (i915_gem_object_is_userptr(vma->obj)) {
 			err = i915_gem_object_userptr_submit_init(vma->obj);
-- 
2.28.0

