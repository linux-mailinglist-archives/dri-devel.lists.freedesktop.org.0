Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B35B64E6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 03:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4C410E278;
	Tue, 13 Sep 2022 01:09:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ECA10E264;
 Tue, 13 Sep 2022 01:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663031340; x=1694567340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S4dsf404vntPnbhWLjBGH7yGnuiBCgJO+x9RyeIUByQ=;
 b=BEU8GkRKdDt4WRQkDpldDSSeiKGWuSlVRnzx6FY5A6fje6XYxc9tyW0g
 6WL+N6Wnp1B+YAqMla+ufUazFmuGFb/7UI8SN7kmLg1Av9SkVTjlswTUd
 X7A1K7a2n3Alidov3dU/VBMYI7JtWsNtTJ4FXdczOBHcaY/1tA362XiH0
 nr2QeMMfhClfeVQ/ixLS+eKlFqHCs5aXs1JkKqQuWrb2WnpJ+sMSq3Yim
 9toV7D6lCszNUj0RLYAU+VMlmfWqrLNMPvhJpZOLWFV/jvafIXVWBKGMN
 j/8SO7Q0w8hF7Vk2EwkyGW1K3lX0YN0LrB3JOetXN9KFno13Lkcnh/eEM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298010158"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="298010158"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 18:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="678341573"
Received: from relo-linux-5.jf.intel.com ([10.165.21.151])
 by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2022 18:08:59 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/1] drm/i915/guc: Fix release build bug in 'remove log size
 module parameters'
Date: Mon, 12 Sep 2022 18:09:29 -0700
Message-Id: <20220913010929.2734885-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913010929.2734885-1-John.C.Harrison@Intel.com>
References: <20220913010929.2734885-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, DRI-Devel@Lists.FreeDesktop.Org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A patch was merged to remove the GuC log size override module
parameters. That patch was broken and caused kernel error messages on
boot in non CONFIG_DEBUG_GUC|GEM builds:
[   12.085121] i915 0000:00:02.0: [drm] *ERROR* Zero GuC log crash dump size!
[   12.092035] i915 0000:00:02.0: [drm] *ERROR* Zero GuC log debug size!

So fit it.

Fixes: f54e515c9180 ("drm/i915/guc: Remove log size module parameters")
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 25 +---------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index b071973ac41c1..55d3ef93e86f8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -36,24 +36,6 @@ struct guc_log_section {
 	const char *name;
 };
 
-static s32 scale_log_param(struct intel_guc_log *log, const struct guc_log_section *section,
-			   s32 param)
-{
-	/* -1 means default */
-	if (param < 0)
-		return section->default_val;
-
-	/* Check for 32-bit overflow */
-	if (param >= SZ_4K) {
-		drm_err(&guc_to_gt(log_to_guc(log))->i915->drm, "Size too large for GuC %s log: %dMB!",
-			section->name, param);
-		return section->default_val;
-	}
-
-	/* Param units are 1MB */
-	return param * SZ_1M;
-}
-
 static void _guc_log_init_sizes(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
@@ -78,15 +60,10 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 			"capture",
 		}
 	};
-	s32 params[GUC_LOG_SECTIONS_LIMIT] = {
-		GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE / SZ_1M,
-		GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE / SZ_1M,
-		GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE / SZ_1M,
-	};
 	int i;
 
 	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
-		log->sizes[i].bytes = scale_log_param(log, sections + i, params[i]);
+		log->sizes[i].bytes = sections[i].default_val;
 
 	/* If debug size > 1MB then bump default crash size to keep the same units */
 	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
-- 
2.37.3

