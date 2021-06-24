Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD13B2CF7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 12:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE476EB57;
	Thu, 24 Jun 2021 10:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240526EB57;
 Thu, 24 Jun 2021 10:53:51 +0000 (UTC)
IronPort-SDR: ncd2qx+zflViNkzGB/AT7gaHyySQGYCtiuQv74e0i2j+bk0CJazkKJnxzyXIJEgzNAR2tAZypT
 SQwOnQtXnt+g==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="271292823"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="271292823"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 03:53:50 -0700
IronPort-SDR: PzZzIoUyODME44ZvOWzHNBiict5S/yyV2OBfC4qEHOWDo7JMKXl2vfocXWHsQH5HIIRfYhTgcc
 ZGEiCORV8gtQ==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="624149104"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 03:53:48 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Reinstate the mmap ioctl for some platforms
Date: Thu, 24 Jun 2021 12:53:37 +0200
Message-Id: <20210624105337.296520-1-thomas.hellstrom@linux.intel.com>
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
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 2fd155742bd2..09b5ed018aaf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -62,10 +62,11 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_object *obj;
 	unsigned long addr;
 
-	/* mmap ioctl is disallowed for all platforms after TGL-LP.  This also
-	 * covers all platforms with local memory.
+	/*
+	 * mmap ioctl is disallowed for all discrete platforms, and for
+	 * and for all platforms with GRAPHICS_VER > 12.
 	 */
-	if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915))
+	if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
 		return -EOPNOTSUPP;
 
 	if (args->flags & ~(I915_MMAP_WC))
-- 
2.31.1

