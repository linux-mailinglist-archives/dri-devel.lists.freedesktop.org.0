Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C45A77AA1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138DF10E57D;
	Tue,  1 Apr 2025 12:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcIqLApK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B412310E2DE;
 Tue,  1 Apr 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743509954; x=1775045954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFzN17CpzAgXFVrWu0W8hh/yV1WzMbFtltLzk/8/ZTQ=;
 b=lcIqLApKKmK0Z5o4jOXwd7flIhTmcIC6dSum4kbjVJt/UuLdwhIHY3gY
 qBYs8+Gi5XnfJtoiLheJvuOp5tRCOPUhSu6R0KkmxRtzQXN3CSG4+NKdF
 kOxOUQNSpGONoq5tKSqv7b/7Z5sZigytuaqR1NcVk5gnHq+SgbjpsI8Iz
 Z1je3ZP+PjEmLgsW7he1Z3E7FyksIlZjyYOmQwrAWXuDXa7intVJU/lJe
 BCom/HRvrRyGI3+jdglwH9/nKH0lfwuRiVE0TMv9THKKqmMfY3Mm0lcl8
 hjMqbWIJVXcpT0R6bBOidvaLTRWZj5hd4aoxKTJfq7OX5wbPBh7QZZrgj w==;
X-CSE-ConnectionGUID: siBkG9mlSWa9NXRuXbD/YQ==
X-CSE-MsgGUID: 4xzuUe5uQYio65tkpLQ6+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44981737"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44981737"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:19:13 -0700
X-CSE-ConnectionGUID: uuGqDkIjS5imSGGyJCXT/A==
X-CSE-MsgGUID: QrIX/9gaTQGGnEU7Cm054Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="157365129"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:19:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, Masahiro Yamada <masahiroy@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] kbuild: hdrtest: place header test files in .hdrtest
 subdirectories
Date: Tue,  1 Apr 2025 15:18:29 +0300
Message-Id: <20250401121830.21696-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401121830.21696-1-jani.nikula@intel.com>
References: <20250401121830.21696-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The header tests track whether headers have been checked using empty
*.hdrtest files in the build tree. This pollutes the build directories,
as the files live in the same "name space" as the real output files,
messing with TAB completion among other things.

Hide the disgusting turds by placing them in .hdrtest subdirectories.

Note that it would be somewhat nicer to have the basename of the
.hdrtest files be dot-prefixed instead of using subdirectories. However,
it's challenging to come up with a pattern rule for that, as we can list
headers to test in the subdirectories of $(src) too, without requiring
Makefiles and kbuild to descend to each of them.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
---
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index e3d6b03527fe..4fb574fd3fec 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -71,7 +71,7 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 no-header-test += asm-generic/%
 
-always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
+always-y := $(patsubst $(obj)/%.h,.hdrtest/%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
@@ -81,7 +81,7 @@ quiet_cmd_hdrtest = HDRTEST $<
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@
 
-$(obj)/%.hdrtest: $(obj)/%.h FORCE
+$(obj)/.hdrtest/%.hdrtest: $(obj)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 # Since GNU Make 4.3, $(patsubst $(obj)/%/,%,$(wildcard $(obj)/*/)) works.
-- 
2.39.5

