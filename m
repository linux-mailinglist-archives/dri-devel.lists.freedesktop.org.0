Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E96714D2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5449B10E6C4;
	Wed, 18 Jan 2023 07:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106910E69D;
 Wed, 18 Jan 2023 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026177; x=1705562177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqE+BWgEHf3+RWEFlHjqr1yTL51SJAbfazyGbd6OQLs=;
 b=Obxopn4295CpeBIUyIc9pqE+8oTp5cpo06ruU+LzxNJ41YLGz2DK+EVB
 9XOCMSCFqNI3VRrzJa+nxyH3Vf3tWUB26ePSU8rIL/pHGL2Grknc0kWGI
 JtA5sXfFY26Lb25DkBa7BTrHHo4Ru6jPfOS9mS0TqMpgzaDzgvQb+Qare
 60sJfMsMO8Ma1aklh3yc6Hf1gAC+L1kePR7w1wPiAbYw00nUC+CgEoJ3P
 RSvNufxb2wHjhshRsukMJbLQl2245kWoM04XAiGhB+2LmG/N6Zoj0Rxay
 qPqW7cIO8ezD/Pi4v7J2rjuv5Z9qUamC73oK9geYAg5PyJMswqiLMq3cm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482079"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482079"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661610021"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661610021"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:15 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 18/23] drm/i915/vm_bind: Limit vm_bind mode to
 non-recoverable contexts
Date: Tue, 17 Jan 2023 23:16:04 -0800
Message-Id: <20230118071609.17572-19-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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

