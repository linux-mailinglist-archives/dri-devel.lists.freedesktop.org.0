Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6B3D031E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49C96E50D;
	Tue, 20 Jul 2021 20:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE556E530;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190909014"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190909014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906089"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 30/42] i915/drm: Move secure execbuf check to execbuf2
Date: Tue, 20 Jul 2021 13:57:50 -0700
Message-Id: <20210720205802.39610-31-matthew.brost@intel.com>
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

Goal is to remove all input sanity checks from the core submission.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 1ed7475de454..70d352fc543f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3184,19 +3184,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	eb.num_fences = 0;
 
 	eb.batch_flags = 0;
-	if (args->flags & I915_EXEC_SECURE) {
-		if (GRAPHICS_VER(i915) >= 11)
-			return -ENODEV;
-
-		/* Return -EPERM to trigger fallback code on old binaries. */
-		if (!HAS_SECURE_BATCHES(i915))
-			return -EPERM;
-
-		if (!drm_is_current_master(file) || !capable(CAP_SYS_ADMIN))
-			return -EPERM;
-
+	if (args->flags & I915_EXEC_SECURE)
 		eb.batch_flags |= I915_DISPATCH_SECURE;
-	}
 	if (args->flags & I915_EXEC_IS_PINNED)
 		eb.batch_flags |= I915_DISPATCH_PINNED;
 
@@ -3414,6 +3403,18 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
+	if (args->flags & I915_EXEC_SECURE) {
+		if (GRAPHICS_VER(i915) >= 11)
+			return -ENODEV;
+
+		/* Return -EPERM to trigger fallback code on old binaries. */
+		if (!HAS_SECURE_BATCHES(i915))
+			return -EPERM;
+
+		if (!drm_is_current_master(file) || !capable(CAP_SYS_ADMIN))
+			return -EPERM;
+	}
+
 	err = i915_gem_check_execbuffer(args);
 	if (err)
 		return err;
@@ -3430,8 +3431,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			   u64_to_user_ptr(args->buffers_ptr),
 			   sizeof(*exec2_list) * count)) {
 		drm_dbg(&i915->drm, "copy %zd exec entries failed\n", count);
-		kvfree(exec2_list);
-		return -EFAULT;
+		err = -EFAULT;
+		goto err_copy;
 	}
 
 	err = i915_gem_do_execbuffer(dev, file, args, exec2_list);
@@ -3476,6 +3477,12 @@ end:;
 
 	args->flags &= ~__I915_EXEC_UNKNOWN_FLAGS;
 	kvfree(exec2_list);
+
+	return err;
+
+err_copy:
+	kvfree(exec2_list);
+
 	return err;
 }
 
-- 
2.28.0

