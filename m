Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6B396EFE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 10:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0488A6E8B9;
	Tue,  1 Jun 2021 08:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAB26E8B9;
 Tue,  1 Jun 2021 08:30:52 +0000 (UTC)
IronPort-SDR: BSbMcSrUqwupaYxiirTHv45+PoE3U4vNCyiD+bOx46lIOVp5B7g8kwP79flY6A782pgYIwmF8d
 mmrgPQNtlWHQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="267378627"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="267378627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 01:30:51 -0700
IronPort-SDR: 6Ph7GmRJ2lz+nk4+urpSuBL4Tsb9o5ORM624pFmKqDLoq8O/JxC096WVbmMOZ2sKQjDp9hlp+s
 P1xmzua+BF0g==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="479190756"
Received: from slockwoo-mobl.ger.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.213.8.163])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 01:30:49 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add relocation exceptions for two other platforms
Date: Tue,  1 Jun 2021 10:28:47 +0200
Message-Id: <20210601082847.78389-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.26.0
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have established previously we stop using relocations starting
from gen12 platforms with Tigerlake as an exception. We keep this
statement but we want to enable relocations conditionally for
Rocketlake and Alderlake under require_force_probe flag set.

Keeping relocations under require_force_probe flag is interim solution
until IGTs will be rewritten to use softpin.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..c0562dd14837 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -491,16 +491,32 @@ eb_unreserve_vma(struct eb_vma *ev)
 	ev->flags &= ~__EXEC_OBJECT_RESERVED;
 }
 
+static inline bool
+platform_has_relocs_enabled(const struct i915_execbuffer *eb)
+{
+	/*
+	 * Relocations are disallowed starting from gen12 with Tigerlake
+	 * as an exception. We allow temporarily use relocations for Rocketlake
+	 * and Alderlake when require_force_probe flag is set.
+	 */
+
+	if (INTEL_GEN(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
+		return true;
+
+	if (INTEL_INFO(eb->i915)->require_force_probe &&
+		 (IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
+		  IS_ALDERLAKE_P(eb->i915)))
+		return true;
+
+	return false;
+}
+
 static int
 eb_validate_vma(struct i915_execbuffer *eb,
 		struct drm_i915_gem_exec_object2 *entry,
 		struct i915_vma *vma)
 {
-	/* Relocations are disallowed for all platforms after TGL-LP.  This
-	 * also covers all platforms with local memory.
-	 */
-	if (entry->relocation_count &&
-	    INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
+	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
 		return -EINVAL;
 
 	if (unlikely(entry->flags & eb->invalid_flags))
-- 
2.26.0

