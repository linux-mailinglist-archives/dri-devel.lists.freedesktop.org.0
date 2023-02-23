Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FB6A0E7C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 18:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7515910E52D;
	Thu, 23 Feb 2023 17:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B29310E523;
 Thu, 23 Feb 2023 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677172460; x=1708708460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mIqsHD3qishNy2OwCveFwpc43zBbLxjqp6+mO0E4xM=;
 b=dmCgLUpHtUtt/Vf2zHaij1gIJVkHtTTNh0SN9IsnOziL03N8yksyncBL
 sFYBwyEjOyxlGI6RXCMBKbnr+lB89KAX2i2Ustp85Ibtydc7mf80Dv0Vc
 V9eR7HSW+lNbMCbEJ4OR3R9atSgcZVyGEAZZ67fHCCTGqeHpgbPhGcSG0
 i71PTq8dD7N6aRhnxZlU2ytROjs7ctlyxCUAqsrlRGXN7yytiSZCUI/By
 IyaWOqz4wcjw3K3PYq8q8Anlyrare3F9nhBg41kRoewpDIvjLGO4Hbrw0
 dFuNkgVj0+Y+uGjsc4tX8BtNPXH6VPnho7YDa+hyO/+8pYYdYTLKLZQJN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331944937"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="331944937"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 09:14:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001489610"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="1001489610"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 09:14:20 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gsc: Fix race between HW init and GSC FW load
Date: Thu, 23 Feb 2023 09:21:20 -0800
Message-Id: <20230223172120.3304293-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
References: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GSC FW load is a slow process (up to 250 ms), so we defer it to a
dedicated worker to avoid stalling the init flow for that long. However,
we currently start this worker before the HW init is complete, so there
is a chance that the GSC loading code submits to the HW before the
engine initialization has completed. We can easily fix this by starting
the thread later in the gt_resume flow.
From this later spot, the GSC code can still race with the default
submission code; we functionally don't care who wins the race (the GSC
load doesn't need any state), but since the whole point of the separate
worker is to make the main thread faster, we prefer the default
submission code to run first. Therefore, make an exception for driver
probe and only and start the gsc load from uc_init_late.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  5 +++--
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index 92e1571fdc46..2d5b70b3384c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -124,6 +124,25 @@ void intel_gsc_uc_flush_work(struct intel_gsc_uc *gsc)
 	flush_work(&gsc->work);
 }
 
+void intel_gsc_uc_resume(struct intel_gsc_uc *gsc)
+{
+	if (!intel_uc_fw_is_loadable(&gsc->fw))
+		return;
+
+	/*
+	 * we only want to start the GSC worker from here in the actual resume
+	 * flow and not during driver load. This is because GSC load is slow and
+	 * therefore we want to make sure that the default state init completes
+	 * first to not slow down the init thread. A separate call to
+	 * intel_gsc_uc_load_start will ensure that the GSC is loaded during
+	 * driver load.
+	 */
+	if (!gsc_uc_to_gt(gsc)->engine[GSC0]->default_state)
+		return;
+
+	intel_gsc_uc_load_start(gsc);
+}
+
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc)
 {
 	if (!intel_uc_fw_is_loadable(&gsc->fw))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index c8b025343ea6..5f50fa1ff8b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -26,6 +26,7 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
 int intel_gsc_uc_init(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_fini(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_suspend(struct intel_gsc_uc *gsc);
+void intel_gsc_uc_resume(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_flush_work(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 5fa5c0999212..1b7ecd384a79 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -139,6 +139,7 @@ void intel_uc_init_early(struct intel_uc *uc)
 void intel_uc_init_late(struct intel_uc *uc)
 {
 	intel_guc_init_late(&uc->guc);
+	intel_gsc_uc_load_start(&uc->gsc);
 }
 
 void intel_uc_driver_late_release(struct intel_uc *uc)
@@ -543,8 +544,6 @@ static int __uc_init_hw(struct intel_uc *uc)
 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 	}
 
-	intel_gsc_uc_load_start(&uc->gsc);
-
 	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
 	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
@@ -714,6 +713,8 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 		return err;
 	}
 
+	intel_gsc_uc_resume(&uc->gsc);
+
 	return 0;
 }
 
-- 
2.37.3

