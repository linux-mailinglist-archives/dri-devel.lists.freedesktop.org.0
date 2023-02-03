Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73462688B88
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B923E10E6C1;
	Fri,  3 Feb 2023 00:11:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1443610E6B1;
 Fri,  3 Feb 2023 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675383102; x=1706919102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQvqbkvPulDnNgO8Gu13UNytQ4xrMpjPquh/b/NPgsA=;
 b=fy7jdF5aIktfXsqpFdNzJbakqxMHYK3SVul3gvspY6qD//u9GDe4uDrp
 bs78ycZfXx6kQLBjrfV+lDiCR90AxG1vou1RFZv0tJSW5IZBjK3pyG2HU
 wzhxGMVafzXYuFbspPXsrc15ApXBQIHYWWqJLqlsad3NjBVTCUL5hRoPx
 hjXlll6DzZo9Dic2fuFK58zG3FOSEnbn5sQUDQT43Zggoe7rnWB4plg79
 Ix2ObpMiuDVwMqdW+nbbbwZDSj7X58AZkoain7y1Kss1XJQYWvPXiXDh2
 hqrGhzWw8d88XgM0WfitMGxTU3i4krWVluSlZtmGatr3yWuB6sf3QbTBX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393204049"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="393204049"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789487446"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="789487446"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 16:11:40 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 6/6] drm/i915/guc: More debug print updates - GuC logging
Date: Thu,  2 Feb 2023 16:11:43 -0800
Message-Id: <20230203001143.3323433-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Update a bunch more debug prints to use the new GT based scheme.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_print.h     | 3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c   | 3 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
index 5d9da355ce242..55a336a9ff061 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_print.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
@@ -28,6 +28,9 @@
 #define gt_err_ratelimited(_gt, _fmt, ...) \
 	drm_err_ratelimited(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
+#define gt_notice_ratelimited(_gt, _fmt, ...) \
+	dev_notice_ratelimited((_gt)->i915->drm.dev, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
 #define gt_probe_error(_gt, _fmt, ...) \
 	do { \
 		if (i915_error_injected()) \
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index c3792ddeec802..818e9e0e66a83 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -333,8 +333,7 @@ bool intel_guc_check_log_buf_overflow(struct intel_guc_log *log,
 			log->stats[type].sampled_overflow += 16;
 		}
 
-		dev_notice_ratelimited(guc_to_gt(log_to_guc(log))->i915->drm.dev,
-				       "GuC log buffer overflow\n");
+		guc_notice_ratelimited(log_to_guc(log), "log buffer overflow\n");
 	}
 
 	return overflow;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
index e75989d4ba067..2465d05638b40 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
@@ -30,6 +30,9 @@
 #define guc_err_ratelimited(_guc, _fmt, ...) \
 	guc_printk((_guc), err_ratelimited, _fmt, ##__VA_ARGS__)
 
+#define guc_notice_ratelimited(_guc, _fmt, ...) \
+	guc_printk((_guc), notice_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define guc_probe_error(_guc, _fmt, ...) \
 	guc_printk((_guc), probe_error, _fmt, ##__VA_ARGS__)
 
-- 
2.39.1

