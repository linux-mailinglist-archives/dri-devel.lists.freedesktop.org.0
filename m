Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCC55508B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71F410E331;
	Wed, 22 Jun 2022 15:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831D410E06D;
 Wed, 22 Jun 2022 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655913577; x=1687449577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+oWawLW5x76eQ8FSPMfpqs+KiYOP18G37bBE13XEY3c=;
 b=fCwKjesB+mU0DiHwIbGt+qi6PaaEwYn2JQVFYz+meTUIYjNSA3hyShQw
 UFl2A/jPJdhFfUOTPvJBpNwJChncg4vYmhvX1hx4IeQjr5jKiNZqHzrE2
 JeNk6W4yqrR9UgOrqC5wO7jqUFY3zq5MWPkBCCE4Fw9TyfSXvJDK3pGft
 3z7fBk/J2Vgrj4OBgdwpRXfMghuoYKFkICvlfPHsVM7ssROFV2cpywFQp
 I516/z//enEN7Q/T7m8IOORledrVgAMSMi+yhG8Y8vWf7MGkrdrcVtjOE
 gjJErZjvW4aooE2SiVo/DVEgL9dbZlRP0sco2DeO4lrpN3GLbHGhapCkh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="366780722"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="366780722"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 08:59:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="677620734"
Received: from conormag-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.201.124])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 08:59:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: tweak the ordering in cpu_write_needs_clflush
Date: Wed, 22 Jun 2022 16:59:19 +0100
Message-Id: <20220622155919.355081-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
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
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For imported dma-buf objects we leave the object as cache_coherent = 0
across all platforms, which is reasonable given that have no clue what
the memory underneath is, and its not like the driver can ever manually
clflush the pages anyway (like with i915_gem_clflush_object) for such
objects. However on discrete we choose to treat cache_dirty = true as a
programmer error, leading to a warning. The simplest fix looks to be to
just change the ordering in cpu_write_needs_clflush to prevent ever
setting cache_dirty for dma-buf objects on discrete.

Fixes: d028a7690d87 ("drm/i915/dmabuf: Fix prime_mmap to work when using LMEM")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5266
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 3e5d6057b3ef..1674b0c5802b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -35,12 +35,12 @@ bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 	if (obj->cache_dirty)
 		return false;
 
-	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
-		return true;
-
 	if (IS_DGFX(i915))
 		return false;
 
+	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
+		return true;
+
 	/* Currently in use by HW (display engine)? Keep flushed. */
 	return i915_gem_object_is_framebuffer(obj);
 }
-- 
2.36.1

