Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972CD49CE14
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D5710E960;
	Wed, 26 Jan 2022 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3107010E920;
 Wed, 26 Jan 2022 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210548; x=1674746548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fparZ78zY0Pmi87QQb7BA4qfSj7a1A87qnVdiLYTjxI=;
 b=RQ7WrkGeNr2eqIwVCjd6RaHFEzmUcRktFtzHq8XqNhk17sKzrpBWbU4J
 +7vkVCsZkMu8B4VhpnvwRetPOy/Y15l88juX5ben7TLhJPYD6KnD9mex4
 No+OtfDJIgfDEIqELh+49LMqmZ/3W1ZCKrigXakpxH+hffY43tP7T42zj
 TYHbZjBEMpxELBc7UjDWSTis1WEpiD8iRXCaMj/FeAxMRVT8F8cNqYISM
 oMnVT6Ts2GYzxrKWsgcC6OLhH/LWnc3Ump+wdcv6tLOZhPdnX0hRRHEEP
 6UEZipX/9WbmEieAJaRrQEXbRuyCg+6DAFp1vQ5wIsjMV6vQrEXskPwPo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885289"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386322"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/20] drm/i915/uapi: forbid ALLOC_TOPDOWN for error capture
Date: Wed, 26 Jan 2022 15:21:53 +0000
Message-Id: <20220126152155.3070602-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On platforms where there might be non-mappable LMEM, force userspace to
mark the buffers with the correct hint. When dumping the BO contents
during capture we need CPU access. Note this only applies to buffers
that can be placed in LMEM, and also doesn't impact DG1.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 498b458fd784..3c8083852620 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1965,7 +1965,7 @@ eb_find_first_request_added(struct i915_execbuffer *eb)
 #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
 
 /* Stage with GFP_KERNEL allocations before we enter the signaling critical path */
-static void eb_capture_stage(struct i915_execbuffer *eb)
+static int eb_capture_stage(struct i915_execbuffer *eb)
 {
 	const unsigned int count = eb->buffer_count;
 	unsigned int i = count, j;
@@ -1978,6 +1978,9 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
 		if (!(flags & EXEC_OBJECT_CAPTURE))
 			continue;
 
+		if (vma->obj->flags & I915_BO_ALLOC_TOPDOWN)
+			return -EINVAL;
+
 		for_each_batch_create_order(eb, j) {
 			struct i915_capture_list *capture;
 
@@ -1990,6 +1993,8 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
 			eb->capture_lists[j] = capture;
 		}
 	}
+
+	return 0;
 }
 
 /* Commit once we're in the critical path */
@@ -3418,7 +3423,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	}
 
 	ww_acquire_done(&eb.ww.ctx);
-	eb_capture_stage(&eb);
+	err = eb_capture_stage(&eb);
+	if (err)
+		goto err_vma;
 
 	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
 	if (IS_ERR(out_fence)) {
-- 
2.34.1

