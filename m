Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D303A297F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 12:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156AE6ECC3;
	Thu, 10 Jun 2021 10:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F956E499;
 Thu, 10 Jun 2021 10:40:21 +0000 (UTC)
IronPort-SDR: J7YIBuNnB5cqi/kB9c8RYBqi4LpuxwzxA80hxoBnipT1QHT9FDsaCoAE6+IYCaS/4R7gsRHDWx
 hQnplg2MknuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="269125146"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="269125146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 03:40:18 -0700
IronPort-SDR: nDsp7ngTXPj8MCume9uDc80QRr2jtf1hP+wuNkrtyIMtoKYnXkq7t45fIBPSGZRjfVc9U0Eg7I
 dsNsybanBXiQ==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="448672052"
Received: from jmotowid-mobl.ger.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.213.30.122])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 03:40:17 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add relocation exceptions for two other platforms
Date: Thu, 10 Jun 2021 12:39:55 +0200
Message-Id: <20210610103955.67802-1-zbigniew.kempczynski@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
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

v3: change to GRAPHICS_VER() (Zbigniew)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index a8abc9af5ff4..30c4f0549ea0 100644
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
+	if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
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
-	    GRAPHICS_VER(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
+	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
 		return -EINVAL;
 
 	if (unlikely(entry->flags & eb->invalid_flags))
-- 
2.26.0

