Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C3C4D80A4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 12:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D2C10E5EF;
	Mon, 14 Mar 2022 11:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C622410E5FC;
 Mon, 14 Mar 2022 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647257348; x=1678793348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yI2i3xzOMFFDc+RyRyerXPEEZVPhrMHjaBdIzAwM5AE=;
 b=jtDePbmawFoUhCGvGYoXS093BAat+r+ZZEVIIOaV+27nhLGD+wWYeU/N
 yknfys7aLGlctzE0xbd2eBmfnUsJIWrzCVZ6qc4yAkQkh6YmVuunpW4xB
 6H11Ciskpn2dD4fGh+gv1vFnr6ArNYrxayDV3/0knHFyah4B6NQ92nxxU
 oz5dcxflJCAb4h7hkxR2nVT7WjdirhWN6eKs4kwDs3UQqAvA9CIrC0tjQ
 rzdu7QlY0TTOsBa4AaV+8dwYYQ4BZirZcybR2S7zQBA3Yv4rT89xh7Nxb
 +58Z1sTrv6wgBm1ZzHQdOdjazSKVCAXyNO3eJN90dok7kmOGPZO9joNeo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="243448266"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="243448266"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="556374368"
Received: from znagyx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915/display: Check mappable aperture when pinning
 preallocated vma
Date: Mon, 14 Mar 2022 11:28:36 +0000
Message-Id: <20220314112837.352931-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314112837.352931-1-matthew.auld@intel.com>
References: <20220314112837.352931-1-matthew.auld@intel.com>
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
 Nirmoy Das <nirmoy.das@linux.intel.com>, CQ Tang <cq.tang@intel.com>,
 dri-devel@lists.freedesktop.org
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
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

