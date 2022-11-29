Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172763BAB5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826EE10E386;
	Tue, 29 Nov 2022 07:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FD110E370;
 Tue, 29 Nov 2022 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669706809; x=1701242809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FLKS9U5L6bisPpFiYZNfrGnPiLJZAQ6Bp+c8pRM5A3k=;
 b=mbSVn7XwEaZ+8+yRM46BNNx5kRnCzis1y3vfOS9FQJrBJbQ3oPI3JfwQ
 IM8SN+HgaOht7CeT5lMhf2+2LDM1JZ0fyBagbhkqCs+CLP6JTPyQrThpM
 k75w05ngvBMM3CWnf4jK+47OsGHJOi+FucaVpaP1nIE8j6FkVo3bJTGDY
 /TjYsUEP4RnfD0oGBLLIKbW7ARi65ILW6n3ffW0HPPsqwJzWVf/rFMRzi
 +AEUz1uI8qt24hduYZTVrQ35AevdP2P3L1JkMUKbJ8msH0WCP2ZrNmNEG
 1sEi2CbfMDPBHLwbhlmcxX50grwmGN86H3/M/46szh88sWmOQ5uXVYR81 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295418379"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295418379"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674525605"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="674525605"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:46 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 17/22] drm/i915/vm_bind: Limit vm_bind mode to
 non-recoverable contexts
Date: Mon, 28 Nov 2022 23:26:30 -0800
Message-Id: <20221129072635.847-18-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
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
index 7d3366975e6d..a048bf463916 100644
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

