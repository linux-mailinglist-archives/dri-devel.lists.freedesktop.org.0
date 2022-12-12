Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20564AB77
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C9310E2E1;
	Mon, 12 Dec 2022 23:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BFB10E2B8;
 Mon, 12 Dec 2022 23:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886939; x=1702422939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqE+BWgEHf3+RWEFlHjqr1yTL51SJAbfazyGbd6OQLs=;
 b=G27XQYIfOMeJ13DulNSiccZ0DPkC6qnAFVtR+j+lOFpdscSblY8Btft7
 zWr/afx85Ghg0Kq8wshtUUpRGE5EAwAVmFQwYoIZB3NdibiQ/IMiWwrj2
 V2jwMAPOVYX/v5Tw0Bv2ry1NtxfcXvR1KwNh63NHtFbNDsnBlus4KmmP8
 6YHOtLYBfIwcYmC0NRtVraw4JZwIeJGRH3X73JgiSCw4hcIRkqX2M6JCN
 Is/9IRkDrxyVTW8M6XhXljuNq80x6qZGfSanwEyKIagQHECOiegitmIhv
 WRoRh04KnCBu/1Epwb9Zg/v/RY+ReqerNLPDqHat9RUflUZERvGhwTIB2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196403"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196403"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090362"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090362"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:37 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 18/23] drm/i915/vm_bind: Limit vm_bind mode to
 non-recoverable contexts
Date: Mon, 12 Dec 2022 15:15:22 -0800
Message-Id: <20221212231527.2384-19-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only support vm_bind mode with non-recoverable contexts.
With new vm_bind mode with eb3 submission path, we need not
support older recoverable contexts.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index fb4d2dab5053..9809c58316c2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1617,6 +1617,12 @@ i915_gem_create_context(struct drm_i915_private *i915,
 	INIT_LIST_HEAD(&ctx->stale.engines);
 
 	if (pc->vm) {
+		/* Only non-recoverable contexts are allowed in vm_bind mode */
+		if (i915_gem_vm_is_vm_bind_mode(pc->vm) &&
+		    (pc->user_flags & BIT(UCONTEXT_RECOVERABLE))) {
+			err = -EINVAL;
+			goto err_ctx;
+		}
 		vm = i915_vm_get(pc->vm);
 	} else if (HAS_FULL_PPGTT(i915)) {
 		struct i915_ppgtt *ppgtt;
-- 
2.21.0.rc0.32.g243a4c7e27

