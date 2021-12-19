Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBFE479E8D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 01:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9D71128C4;
	Sun, 19 Dec 2021 00:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307D1128C4;
 Sun, 19 Dec 2021 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639873474; x=1671409474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kjOwRStuTJQk0uvje5Z73Zv6ytIByxzsC+2+3AEqydY=;
 b=cDr2r1YMI0ARrjhwL9ldyxCm0Zc3eGBjHy0rAH+y77Ds1X4N3hk4rKID
 RyBEWV6PHqaL5RxvG1RaO6eD2EUdGfDx3WFJRR35WbGDs3wDz0ycvVb3l
 JAQj9wIVjnbgwe3jgdcGubIX6pVZFGf+rAj58cznN+S3y9mTGrMHfytY6
 HW1TC9J6CkSsGQkgDbACpYiV4FkB/q8KR/Gr3GhuAjml6MXiTmtlXTekg
 rL/yKWafd4xQ6E1wIPmeLKwWQtWmUlBaylDNF3Cqc/KWlruRA5cw8YdR2
 GJjPNrEF6FHS6IWWOeqs/EfPuaIBFffUSxAWWbgJ/1hJ1NymMAEWtpkag Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="240185615"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="240185615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2021 16:24:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="683805943"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2021 16:24:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Fix possible uninitialized variable in parallel
 extension
Date: Sat, 18 Dec 2021 16:19:09 -0800
Message-Id: <20211219001909.24348-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'prev_engine' was declared inside the output loop and checked in the
inner after at least 1 pass of either loop. The variable should be
declared outside both loops as it needs to be persistent across the
entire loop structure.

Fixes: e5e32171a2cf ("drm/i915/guc: Connect UAPI to GuC multi-lrc interface")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 347dab952e90..97d2ac22ae55 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -564,6 +564,7 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 		container_of_user(base, typeof(*ext), base);
 	const struct set_proto_ctx_engines *set = data;
 	struct drm_i915_private *i915 = set->i915;
+	struct i915_engine_class_instance prev_engine;
 	u64 flags;
 	int err = 0, n, i, j;
 	u16 slot, width, num_siblings;
@@ -629,7 +630,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	/* Create contexts / engines */
 	for (i = 0; i < width; ++i) {
 		intel_engine_mask_t current_mask = 0;
-		struct i915_engine_class_instance prev_engine;
 
 		for (j = 0; j < num_siblings; ++j) {
 			struct i915_engine_class_instance ci;
-- 
2.33.1

