Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C57D6ECB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC410E67E;
	Wed, 25 Oct 2023 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167A310E67E;
 Wed, 25 Oct 2023 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698244557; x=1729780557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKhNo3xkOu+KDMllJea7P9gelSTaD7LtzofpUpH1yaI=;
 b=XlfBZotyFJ6QYy9UT6pScZPxoX+dZokX1OU7cK/ZhYwo/UrXPHfbDJ2s
 3iJ4v7PFZrVyNM37pt0glkFkjMg/d/40XE7PJzqm3lG+uaG/TpEpGMXEO
 JYejs49L+DFG+EZrypT0OEpRQZpY3xpkNqNuOuUVVzMa6IlpIU9NinoLJ
 lrfN2F+uoMOuoSDgdrUJiERqI15uEou62b51ZfMdgvKdob4VYSPG/XHzh
 6uGnhmyMtl/aDSX4K+8+0uFjoitDQfxHJzVPJ4oe0KITNNOENWB58cKU1
 +Qbosvd4PfGhiBC7Bb8EM+/8ambRY4y9Svi968IgbUovCFao5e2L4zv6E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453787548"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="453787548"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1090245662"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1090245662"
Received: from marlonpr-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:54 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 4/5] drm/i915: Use the new gt_to_guc() wrapper
Date: Wed, 25 Oct 2023 16:35:14 +0200
Message-ID: <20231025143515.254468-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025143515.254468-1-andi.shyti@linux.intel.com>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the guc reference from the gt using the gt_to_guc() helper.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs_params.c               | 5 +++--
 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 614bde321589..8a385c57c0fe 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -38,10 +38,11 @@ static int i915_param_int_open(struct inode *inode, struct file *file)
 
 static int notify_guc(struct drm_i915_private *i915)
 {
+	struct intel_gt *gt = to_gt(i915);
 	int ret = 0;
 
-	if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
-		ret = intel_guc_global_policies_update(&to_gt(i915)->uc.guc);
+	if (intel_uc_uses_guc_submission(&gt->uc))
+		ret = intel_guc_global_policies_update(gt_to_guc(gt));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index 2990dd4d4a0d..d9d8f0336702 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -65,7 +65,7 @@ int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 	if (!intel_engine_uses_guc(engine))
 		return 0;
 
-	err = intel_guc_global_policies_update(&engine->gt->uc.guc);
+	err = intel_guc_global_policies_update(gt_to_guc(engine->gt));
 	if (err)
 		intel_selftest_restore_policy(engine, saved);
 
@@ -84,7 +84,7 @@ int intel_selftest_restore_policy(struct intel_engine_cs *engine,
 	if (!intel_engine_uses_guc(engine))
 		return 0;
 
-	return intel_guc_global_policies_update(&engine->gt->uc.guc);
+	return intel_guc_global_policies_update(gt_to_guc(engine->gt));
 }
 
 int intel_selftest_wait_for_rq(struct i915_request *rq)
-- 
2.42.0

