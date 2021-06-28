Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7963B5B27
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E216E372;
	Mon, 28 Jun 2021 09:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EAB6E372;
 Mon, 28 Jun 2021 09:21:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="206093120"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="206093120"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:21:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="640831888"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:21:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Reinstate the mmap ioctl for some platforms
Date: Mon, 28 Jun 2021 11:21:06 +0200
Message-Id: <20210628092106.55270-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
 matthew.auld@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reinstate the mmap ioctl for all current integrated platforms.
The intention was really to have it disabled for discrete graphics
where we enforce a single mmap mode.

This fixes media on rkl/adl.

v2:
- Added a R-B.
- Fixed up the code comment a bit.
v3:
- Added an A-B.
- Point out in the commit message that there was an issue with media on
  rkl/adl.

Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 6497a2dbdab9..a90f796e85c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -62,10 +62,11 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_object *obj;
 	unsigned long addr;
 
-	/* mmap ioctl is disallowed for all platforms after TGL-LP.  This also
-	 * covers all platforms with local memory.
+	/*
+	 * mmap ioctl is disallowed for all discrete platforms,
+	 * and for all platforms with GRAPHICS_VER > 12.
 	 */
-	if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915))
+	if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
 		return -EOPNOTSUPP;
 
 	if (args->flags & ~(I915_MMAP_WC))
-- 
2.31.1

