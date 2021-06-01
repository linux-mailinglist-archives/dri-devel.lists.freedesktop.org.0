Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E07397562
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 16:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91E06E04B;
	Tue,  1 Jun 2021 14:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7DC6E04B;
 Tue,  1 Jun 2021 14:24:58 +0000 (UTC)
IronPort-SDR: twwUHNl65zvYI1ynIEEcD4BNZY8DL3sHPT5h9fz3eaAJAonnLwDsjFCibKqTR9QDS2RorLW79H
 /yWbTxYq+n5A==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="183916918"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="183916918"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 07:24:57 -0700
IronPort-SDR: KUsqdJ+lCObmz8/PjzA9oVX+nAtEcyZ0F+ioM+CUvZSdy9DjStaowjBDRZsJ9lV0WhV2wis0nf
 A1Xfxc3JoBfw==
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="479299490"
Received: from slockwoo-mobl.ger.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.213.8.163])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 07:24:54 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add relocation exceptions for two other platforms
Date: Tue,  1 Jun 2021 16:24:42 +0200
Message-Id: <20210601142442.100754-1-zbigniew.kempczynski@intel.com>
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

v2: - remove inline from function definition (Jani)
    - fix indentation

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..78b86a7bc39a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -491,16 +491,30 @@ eb_unreserve_vma(struct eb_vma *ev)
 	ev->flags &= ~__EXEC_OBJECT_RESERVED;
 }
 
+static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
+{
+	/*
+	 * Relocations are disallowed starting from gen12 with Tigerlake
+	 * as an exception. We allow temporarily use relocations for Rocketlake
+	 * and Alderlake when require_force_probe flag is set.
+	 */
+	if (INTEL_GEN(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
+		return true;
+
+	if (INTEL_INFO(eb->i915)->require_force_probe &&
+	    (IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
+	     IS_ALDERLAKE_P(eb->i915)))
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

