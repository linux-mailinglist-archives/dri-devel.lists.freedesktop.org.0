Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD997D034
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487D810E78B;
	Fri, 20 Sep 2024 03:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITxe1YUI";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830A410E77B;
 Fri, 20 Sep 2024 03:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802409; x=1758338409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=svjqtNycWUjcFbHa53MfFoJaAUhKPxpQkMolZrtJ/WM=;
 b=ITxe1YUItpSKY1+uGE4L8bUXcxmo5uoTy8dYyADcVNnkXsfYq8CwB25V
 kE/S/gJsYzyZ03S0qPre+7fraMwNRAsT1c2lWBe2lBeM0IFNHGiRS5Dkl
 p2NJJcNO47NmyjzEPZA+b6AgsmpPyIbZxXvN2g1xM5oLFGGm+maoKhaht
 TLppt95LFoyGBq2k0M18xO8ywlVBmU5FvVqn5bxKIVpxnrTFnjuFMVGPe
 B2rHY/RiCNhcZPhEKoPL2B3EReXH+yU1uOl3GK8TffvLWAW6rvZxOfQjG
 5Np4vb/1hMgw6E+bW/CDFj/6ut1ZHK/J2iCFqGw130ba+jHSjOtdg0jPi g==;
X-CSE-ConnectionGUID: woF2EBtQSCOYaXrbAzGXSQ==
X-CSE-MsgGUID: /9KuSlPURZaIVdM8irdVSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269810"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:09 -0700
X-CSE-ConnectionGUID: a6VtKzd7SDeRdLQdVI5DXw==
X-CSE-MsgGUID: Qv6b1u+tT7a94gM+qECc4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746200"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:09 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 11/11] drm/xe/guc: Add a helper function for dumping GuC
 log to dmesg
Date: Thu, 19 Sep 2024 20:20:06 -0700
Message-ID: <20240920032007.629624-12-John.C.Harrison@Intel.com>
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

Create a helper function that can be used to dump the GuC log to dmesg
in a manner that is reliable for extraction and decode. The intention
is that calls to this can be added by developers when debugging
specific issues that require a GuC log but do not allow easy capture
of the log - e.g. failures in selftests and failues that lead to
kernel hangs.

Also note that this is really a temporary stop-gap. The aim is to
allow on demand creation and dumping of devcoredump captures (which
includes the GuC log and much more). Currently this is not possible as
much of the devcoredump code requires a 'struct xe_sched_job' and
those are not available at many places that might want to do the dump.

v2: Add kerneldoc - review feedback from Michal W.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 24564624e91e..d7be69f20af4 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -214,6 +214,24 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+/**
+ * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
+ * @log: GuC log structure
+ */
+void xe_guc_log_print_dmesg(struct xe_guc_log *log)
+{
+	struct xe_gt *gt = log_to_gt(log);
+	static int g_count;
+	struct drm_printer ip = xe_gt_info_printer(gt);
+	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
+
+	drm_printf(&lp, "Dumping GuC log for %ps...\n", __builtin_return_address(0));
+
+	xe_guc_log_print(log, &lp);
+
+	drm_printf(&lp, "Done.\n");
+}
+
 /**
  * xe_guc_log_print - dump a copy of the GuC log to some useful location
  * @log: GuC log structure
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 949d2c98343d..1fb2fae1f4e1 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -39,6 +39,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
-- 
2.46.0

