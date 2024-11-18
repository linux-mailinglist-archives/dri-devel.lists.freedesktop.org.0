Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258EE9D1BF8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D59D10E5AF;
	Mon, 18 Nov 2024 23:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9lxWxRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9C010E568;
 Mon, 18 Nov 2024 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973046; x=1763509046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Qy8SJVx/z7VFxY+3ybgTb8glU6XUs0SKy5CimmDh9I=;
 b=f9lxWxRF+dyy9hn47uymIc+fcWnBLa1AXXcYtrjvi65BYda7d+sD4GSK
 HAZgXXVaBIcXFzUEQnSaJY78Bc8TnwLKkC+kAB/qNRyZDsUswXagVVIVq
 UaxmhO35SNyMkllI8Qjlllx93c+nSRCMlwoko8ZLuiBnH5IwovwBgY+cE
 ItANxgQzk2MBhwvOJLhvH9xR5ZLhA7F6hvnVi6m0PtBkZFBaNi50KlZqT
 kAAdQFAhp5aiydARu9crOgbyS7iV+DU10pIVlXSIo0JF/iosedmBMCwQd
 fUcRsCteJ/kunP9B1sbSh5wQVPVAMiBgCaJRlMBxhJm1z4Q6xtVEKSjjj w==;
X-CSE-ConnectionGUID: +YqRBx5ITc6XYG++eZkE1w==
X-CSE-MsgGUID: QWXwwLRQS5it1MeKEVXJNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878922"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
X-CSE-ConnectionGUID: 89kf0iVVR6SpOAFfSNa1Lg==
X-CSE-MsgGUID: DkgWOua1TO+ZjRgO7vhCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521712"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 12/29] drm/xe: Add exec queue post init extension
 processing
Date: Mon, 18 Nov 2024 15:37:40 -0800
Message-Id: <20241118233757.2374041-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Add exec queue post init extension processing which is needed for more
complex extensions in which data is returned to the user.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aab9e561153d..f402988b4fc0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -33,6 +33,8 @@ enum xe_exec_queue_sched_prop {
 
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
+static int exec_queue_user_extensions_post_init(struct xe_device *xe, struct xe_exec_queue *q,
+						u64 extensions, int ext_number);
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
@@ -446,6 +448,10 @@ static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] =
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
 };
 
+static const xe_exec_queue_user_extension_fn exec_queue_user_extension_post_init_funcs[] = {
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = NULL,
+};
+
 #define MAX_USER_EXTENSIONS	16
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number)
@@ -480,6 +486,42 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
+static int exec_queue_user_extensions_post_init(struct xe_device *xe, struct xe_exec_queue *q,
+						u64 extensions, int ext_number)
+{
+	u64 __user *address = u64_to_user_ptr(extensions);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
+		return -E2BIG;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >=
+			 ARRAY_SIZE(exec_queue_user_extension_post_init_funcs)))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.name,
+				 ARRAY_SIZE(exec_queue_user_extension_post_init_funcs));
+	if (exec_queue_user_extension_post_init_funcs[idx]) {
+		err = exec_queue_user_extension_post_init_funcs[idx](xe, q, extensions);
+		if (XE_IOCTL_DBG(xe, err))
+			return err;
+	}
+
+	if (ext.next_extension)
+		return exec_queue_user_extensions_post_init(xe, q,
+							    ext.next_extension,
+							    ++ext_number);
+
+	return 0;
+}
+
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -647,6 +689,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 	q->xef = xe_file_get(xef);
 
+	if (args->extensions) {
+		err = exec_queue_user_extensions_post_init(xe, q, args->extensions, 0);
+		if (err)
+			goto kill_exec_queue;
+	}
+
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	if (err)
-- 
2.34.1

