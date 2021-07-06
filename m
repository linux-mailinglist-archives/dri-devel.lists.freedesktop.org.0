Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C33BC848
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B543189D4A;
	Tue,  6 Jul 2021 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF189D4A;
 Tue,  6 Jul 2021 09:07:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="230810019"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="230810019"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:07:11 -0700
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="486078866"
Received: from yunhanch-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.214.173.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:07:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: prefer dma_fence_might_wait in wait_migration
Date: Tue,  6 Jul 2021 10:05:59 +0100
Message-Id: <20210706090559.1589544-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210706090559.1589544-1-matthew.auld@intel.com>
References: <20210706090559.1589544-1-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence_might_wait is more interesting here, since it also teaches
lockdep about the fence critical section and wait_migration dependency.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..190e221eaf81 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -305,7 +305,7 @@ i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
 				   unsigned int flags)
 {
-	might_sleep();
+	dma_fence_might_wait();
 	/* NOP for now. */
 	return 0;
 }
-- 
2.26.3

