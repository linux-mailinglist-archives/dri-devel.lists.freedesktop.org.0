Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0297D02D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B0B10E6FD;
	Fri, 20 Sep 2024 03:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgSbHy0J";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EAE10E77B;
 Fri, 20 Sep 2024 03:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802408; x=1758338408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgTYRvbNN6vtdOgxWqXoi+clJRO6dmTcyaYBqjo+4BA=;
 b=PgSbHy0JTewcof+Dto5FZCfis34Jg0Cf0KofRAl3bZYYZknQdxYr4oyF
 4VyUIh7oU7CsMGVftun/u66/AbWew537bE7Ms1qBPAZg+BDAiZbRso/NR
 RLfP/E5MfXCo2XNDLQBvtZK3vvTSk1KBREHNkwCnxORs6ZkgUi1GKakqL
 4wExGMxIDQ3SWtYzrk4LlXWNsczHHRx8bVNWKpQrgDp/1pe2jtFKBmMhA
 2bk/1FYojHo6+w46PPa03eMNTazKjgfEIjtVlUvRKNulZ9Ib4xpRD5XNX
 SZyO6TppB1mZKYc/YEeRkrOtTMYzXVAKd60yKvi/bWFd0MrMCHXeFBV2/ g==;
X-CSE-ConnectionGUID: n+GcdtAZRJOGZpvfk6U3Tw==
X-CSE-MsgGUID: SOGVxyBJQK+9uY3aXYkOaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269800"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:08 -0700
X-CSE-ConnectionGUID: hNFn6fGSRUiqIuNh0HRIrA==
X-CSE-MsgGUID: B+PmJOz2THGp0g/2Lmz2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746176"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:08 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v8 03/11] drm/xe/devcoredump: Improve section headings and add
 tile info
Date: Thu, 19 Sep 2024 20:19:58 -0700
Message-ID: <20240920032007.629624-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920032007.629624-1-John.C.Harrison@Intel.com>
References: <20240920032007.629624-1-John.C.Harrison@Intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The xe_guc_exec_queue_snapshot is not really a GuC internal thing and
is definitely not a GuC CT thing. So give it its own section heading.
The snapshot itself is really a capture of the submission backend's
internal state. Although all it currently prints out is the submission
contexts. So label it as 'Contexts'. If more general state is added
later then it could be change to 'Submission backend' or some such.

Further, everything from the GuC CT section onwards is GT specific but
there was no indication of which GT it was related to (and that is
impossible to work out from the other fields that are given). So add a
GT section heading. Also include the tile id of the GT, because again
significant information.

Lastly, drop a couple of unnecessary line feeds within sections.

v2: Add GT section heading, add tile id to device section.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 5 +++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 ++-
 drivers/gpu/drm/xe/xe_device.c            | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c        | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         | 1 -
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d23719d5c2a3..2690f1d1cde4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -96,8 +96,13 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
+	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
+	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
+
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->ct, &p);
+
+	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
 	drm_puts(&p, "\n**** Job ****\n");
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 440d05d77a5a..3cc2f095fdfb 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -37,7 +37,8 @@ struct xe_devcoredump_snapshot {
 	/* GuC snapshots */
 	/** @ct: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
-	/** @ge: Guc Engine snapshot */
+
+	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 
 	/** @hwe: HW Engine snapshot array */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..178e5346979c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -955,6 +955,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 
 	for_each_gt(gt, xe, id) {
 		drm_printf(p, "GT id: %u\n", id);
+		drm_printf(p, "\tTile: %u\n", gt->tile->id);
 		drm_printf(p, "\tType: %s\n",
 			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
 		drm_printf(p, "\tIP ver: %u.%u.%u\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a98b85129076..4bc5793f627b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2209,7 +2209,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	if (!snapshot)
 		return;
 
-	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
 	drm_printf(p, "\tName: %s\n", snapshot->name);
 	drm_printf(p, "\tClass: %d\n", snapshot->class);
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a7abc4b67e67..3ae3713f503b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1057,7 +1057,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
-	drm_puts(p, "\n");
 }
 
 /**
-- 
2.46.0

