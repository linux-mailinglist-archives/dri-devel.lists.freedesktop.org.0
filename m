Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC0458FD3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8289E08;
	Mon, 22 Nov 2021 13:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4DF89DD2;
 Mon, 22 Nov 2021 13:58:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="214815549"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="214815549"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 05:58:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="589348644"
Received: from aalazizi-mobl1.amr.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.249.159])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 05:58:08 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/i915/dmabuf: fix broken build"
Date: Mon, 22 Nov 2021 13:57:58 +0000
Message-Id: <20211122135758.85444-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This reverts commit 777226dac058d119286b4081953cb5aa2cb7394b.

Approach taken in the patch was rejected by Linus and the upstream tree
now already contains the required include directive via 304ac8032d3f
("Merge tag 'drm-next-2021-11-12' of git://anongit.freedesktop.org/drm/drm").

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 777226dac058 ("drm/i915/dmabuf: fix broken build")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f291cf4c3886..1b526039a60d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -17,13 +17,6 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
-#if defined(CONFIG_X86)
-#include <asm/smp.h>
-#else
-#define wbinvd_on_all_cpus() \
-	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
-#endif
-
 I915_SELFTEST_DECLARE(static bool force_different_devices;)
 
 static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
-- 
2.32.0

