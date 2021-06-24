Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708983B2DDD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D412F6EAC3;
	Thu, 24 Jun 2021 11:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5B16EAC3;
 Thu, 24 Jun 2021 11:29:29 +0000 (UTC)
IronPort-SDR: KhN0oItrhy/hinPQRqYpAozMeN5tD5WliDf3CcflaG6ZDcnj+nBWnT4bkPpeu5ZeAINIQVd19N
 U0cjDI3naSuw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="204443493"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="204443493"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:29:26 -0700
IronPort-SDR: jQPUZZpL7ULIuvNEYyenzraWhFLm2dygF8r2JZOWVFjbPKNxU8kIF8oqd0gxvj7ZoVDKlCh75i
 2gQwdGW3jf6g==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="474479278"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:29:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Reinstate the mmap ioctl for some platforms
Date: Thu, 24 Jun 2021 13:29:14 +0200
Message-Id: <20210624112914.311984-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reinstate the mmap ioctl for all current integrated platforms.
The intention was really to have it disabled for discrete graphics
where we enforce a single mmap mode.

Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v2:
- Added a R-B.
- Fixed up the code comment a bit.
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 2fd155742bd2..4f50a508c7a0 100644
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

