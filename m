Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8D4CDA4A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E754910FEE6;
	Fri,  4 Mar 2022 17:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4915710FEBE;
 Fri,  4 Mar 2022 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414663; x=1677950663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I4teDGAH2F/kR2fXzhxSDTT7AXc0LQK3RGUOMr0ZTcQ=;
 b=Zebne9aln3aUwSujJ8t3/rQYlL0JHoi0akc56PQVzs8ai896vzRNP7RV
 g+nhijVzNtAEYIjOI6XKedPvTziHFsl90aKMJ2vb1nUuqe1ikmW3RNz4w
 YTbKk7TiXai+WgJ6LSLEguOjnjgIT4NW2yjueW+P6oUH3RDll9QTYfqOB
 w7VgBCFii518jgMet+6GqBxzurssyaTmFfU7reDpklWEEnA/cjb5O5RuU
 P9ZV3IQuzoLn7WRIijwdq1GE9h11ZYUOMhrvYRYZguc39g6flks7+VivI
 WDmPHuG+EJUF5jTmSr/lgIiFSvJWf20hCZUXVYYaGOM8raNYigFu8XVS1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="252848981"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="252848981"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:23 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631216630"
Received: from vkats-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/i915/display: Check mappable aperture when pinning
 preallocated vma
Date: Fri,  4 Mar 2022 17:23:31 +0000
Message-Id: <20220304172333.991778-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304172333.991778-1-matthew.auld@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
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
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Ap Kamal <kamal.ap@intel.com>, Chris P Wilson <chris.p.wilson@intel.com>,
 CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

When system does not have mappable aperture, ggtt->mappable_end=0. In
this case if we pass PIN_MAPPABLE when pinning vma, the pinning code
will return -ENOSPC. So conditionally set PIN_MAPPABLE if HAS_GMCH().

Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Ap Kamal <kamal.ap@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 5227e5b35206..f797fcef18fc 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -51,6 +51,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	u32 base, size;
+	u64 pinctl;
 
 	if (!mem || plane_config->size == 0)
 		return NULL;
@@ -101,7 +102,10 @@ initial_plane_vma(struct drm_i915_private *i915,
 	if (IS_ERR(vma))
 		goto err_obj;
 
-	if (i915_ggtt_pin(vma, NULL, 0, PIN_MAPPABLE | PIN_OFFSET_FIXED | base))
+	pinctl = PIN_GLOBAL | PIN_OFFSET_FIXED | base;
+	if (HAS_GMCH(i915))
+		pinctl |= PIN_MAPPABLE;
+	if (i915_vma_pin(vma, 0, 0, pinctl))
 		goto err_obj;
 
 	if (i915_gem_object_is_tiled(obj) &&
-- 
2.34.1

