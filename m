Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4D37A228
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572B36E9FA;
	Tue, 11 May 2021 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09CA6E9FB;
 Tue, 11 May 2021 08:32:22 +0000 (UTC)
IronPort-SDR: zlzrQYh7lHgdYF7gpbHcWcEEs0P9PJfgQLDn/q4Cj/QmW5mAv+bnuDgSqe7Q+f6sB6L3BfSnYh
 xNnuLk3Tx1Yg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179651136"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179651136"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:32:21 -0700
IronPort-SDR: w+iIbNQnjIB14dxuwNOmIJ33exvw/vVkF1kPPMYxqsy7e9n8/4APwne3krV9+DUzQ8qhKd7Tzo
 U2/8n4bc8wfw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="471058871"
Received: from dartyukh-mobl2.ger.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.213.3.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:32:00 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add relocation exceptions for two other platforms
Date: Tue, 11 May 2021 10:31:39 +0200
Message-Id: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
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
from gen12 platforms with Tigerlake as an exception. Unfortunately
we need extend transition period and support relocations for two
other igfx platforms - Rocketlake and Alderlake.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..f80da1d6d9b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -496,11 +496,15 @@ eb_validate_vma(struct i915_execbuffer *eb,
 		struct drm_i915_gem_exec_object2 *entry,
 		struct i915_vma *vma)
 {
-	/* Relocations are disallowed for all platforms after TGL-LP.  This
-	 * also covers all platforms with local memory.
+	/*
+	 * Relocations are disallowed starting from gen12 with some exceptions
+	 * - TGL/RKL/ADL.
 	 */
 	if (entry->relocation_count &&
-	    INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
+	    INTEL_GEN(eb->i915) >= 12 && !(IS_TIGERLAKE(eb->i915) ||
+					   IS_ROCKETLAKE(eb->i915) ||
+					   IS_ALDERLAKE_S(eb->i915) ||
+					   IS_ALDERLAKE_P(eb->i915)))
 		return -EINVAL;
 
 	if (unlikely(entry->flags & eb->invalid_flags))
-- 
2.26.0

