Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF74DEA78
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C2310EDF9;
	Sat, 19 Mar 2022 19:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FFE10ED56;
 Sat, 19 Mar 2022 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647718954; x=1679254954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UtiFpo1NYUdBTvqYNUMfEBhl7p51GV3Ajxz/WaRbs1Q=;
 b=CcFSBh34jZiXkK3qceo9FKRyreAzBxM916Bgla/Q/VbAxjt/SL3dP0nU
 kLCi8VFMYcdmdnVkZbAvpiszuEGhMWvTVtZBwfQrIQijrwePSmghFeqPr
 Xzmh0TQmkCxTj8MNaUzD6JPyZAh+AiJa68WLQli3/g77menExc5wdBbEV
 7vF6wDuGnjQjI+gAR6yH377i0DVmXB8obGQPdbtnoO78K6QGjo0iYZu58
 JpSJ5lRpljV0Y+5q0Oz7sSd7s+qvqvkmp+QaBV6+J8xbduqvyZS0GFq1l
 230fxEU/KHwePw6972l4oLFhf5O6sInt23dMNjsvvE5VvVtNl2sI9goN2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="282145185"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="282145185"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="600019687"
Received: from jpulito-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.255.231.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:33 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] i915/gem: Revert i915_gem_freeze to previous logic
Date: Sat, 19 Mar 2022 12:42:26 -0700
Message-Id: <20220319194227.297639-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220319194227.297639-1-michael.cheng@intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, thomas.hellstrom@linux.intel.com,
 michael.cheng@intel.com, wayne.boyer@intel.com, daniel.vetter@ffwll.ch,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch reverts i915_gem_freeze to previous logic [1] to avoid using
wbinvd_on_all_cpus.

[1]. https://patchwork.freedesktop.org/patch/415007/?series=86058&rev=2

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 3f20961bb59b..f78f2f004d6c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -212,13 +212,18 @@ int i915_gem_freeze_late(struct drm_i915_private *i915)
 	 * the objects as well, see i915_gem_freeze()
 	 */
 
-	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
-		i915_gem_shrink(NULL, i915, -1UL, NULL, ~0);
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+	i915_gem_shrink(NULL, i915, -1UL, NULL, ~0);
 	i915_gem_drain_freed_objects(i915);
 
-	wbinvd_on_all_cpus();
-	list_for_each_entry(obj, &i915->mm.shrink_list, mm.link)
-		__start_cpu_write(obj);
+	list_for_each_entry(obj, &i915->mm.shrink_list, mm.link) {
+		i915_gem_object_lock(obj, NULL);
+		drm_WARN_ON(&i915->drm,
+			i915_gem_object_set_to_cpu_domain(obj, true));
+		i915_gem_object_unlock(obj);
+	}
+
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 
 	return 0;
 }
-- 
2.25.1

