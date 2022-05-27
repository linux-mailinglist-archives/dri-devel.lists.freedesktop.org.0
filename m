Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C12535B2A
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 10:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8312B10EEB1;
	Fri, 27 May 2022 08:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E3A10EEB1;
 Fri, 27 May 2022 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653639028; x=1685175028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NRE9AGXZ/Uw3ZbTAShqDI6FsB4jE9OS/i0zfFDO9KFo=;
 b=T0UAT9byM0Pxy6Vn3zPaWyv844FXpzdsop4qCd7vd6bpFWP13BEA16N1
 1sC7uasCtw9L13ycL+heHSGiaCbuywbdZAVS43Bt3Vim2ZsbUG0XvrgXy
 8UAhwrtrnFb0tTsrJw5UNxzYv6pzl7igRtM47b5daENbIofI8wD/YYMbt
 65lKZ2NTDou1d0KbmgsbX0aCbXdO+MlEIj3U7n//W5lNI807cprgDYYY3
 n4hNd0wK10aUZfhp0CzFdsH9RhfdHfv0L3LXNhyq2GPtJqLWkfYtNqQRt
 kvuk9iXQI5R53KVpCzxXZlUgF3hapypEB9oNDt9730v37clLFYVBWJpBG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="274517166"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="274517166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 01:10:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="610124225"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 01:10:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI] Revert "drm/i915: Add relocation exceptions for two other
 platforms"
Date: Fri, 27 May 2022 01:10:46 -0700
Message-Id: <20220527081046.2692809-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: zbigniew.kempczynski@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit bcefacd359f07dee18795dd80f834acb47fd21eb.

IGT conversion is ready, so these execptions can already be removed.
Once CI is clean, this commit will actually be removed from
topic/core-for-CI.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 21 +++++--------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b279588c0672..c326bd2b444f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -492,27 +492,16 @@ eb_unreserve_vma(struct eb_vma *ev)
 	ev->flags &= ~__EXEC_OBJECT_RESERVED;
 }
 
-static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
-{
-	/*
-	 * Relocations are disallowed starting from gen12 with Tigerlake
-	 * as an exception. To unblock CI, we are temporarily allowing it
-	 * for Rocketlake and Alderlake.
-	 */
-	if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915) ||
-	    IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
-	    IS_ALDERLAKE_P(eb->i915))
-		return true;
-
-	return false;
-}
-
 static int
 eb_validate_vma(struct i915_execbuffer *eb,
 		struct drm_i915_gem_exec_object2 *entry,
 		struct i915_vma *vma)
 {
-	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
+	/* Relocations are disallowed for all platforms after TGL-LP.  This
+	 * also covers all platforms with local memory.
+	 */
+	if (entry->relocation_count &&
+	    GRAPHICS_VER(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
 		return -EINVAL;
 
 	if (unlikely(entry->flags & eb->invalid_flags))
-- 
2.36.1

