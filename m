Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63075375A9D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891456ECEF;
	Thu,  6 May 2021 18:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B716ECE3;
 Thu,  6 May 2021 18:57:10 +0000 (UTC)
IronPort-SDR: 6ONHHoZTVbXYx7EeTFNzi8pm6HYemd40gGbFM/kt80isiYWKolPCmdb+iinfqvqFOh5Cjn4XX6
 8ugRbtzhzb9g==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530986"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530986"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
IronPort-SDR: Pw+9DS18qQfrGBGwbTQP/zR/La5TPopMEnuxYK//J73pvC3pHKv7rEIMm4VoMA1eUVQGSdf5u2
 /Tnx7+wpAc1Q==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583375"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 07/97] drm/i915/guc: Remove sample_forcewake h2g action
Date: Thu,  6 May 2021 12:13:21 -0700
Message-Id: <20210506191451.77768-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

This action is no-op in the GuC side for a few versions already
and it is getting entirely removed soon, in an upcoming version.

Time to remove before we face communication issues.

Cc:  Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 16 ----------------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  4 ----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 ----
 4 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index adae04c47aab..ab2c8fe8cdfa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -469,22 +469,6 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 	return 0;
 }
 
-int intel_guc_sample_forcewake(struct intel_guc *guc)
-{
-	struct drm_i915_private *dev_priv = guc_to_gt(guc)->i915;
-	u32 action[2];
-
-	action[0] = INTEL_GUC_ACTION_SAMPLE_FORCEWAKE;
-	/* WaRsDisableCoarsePowerGating:skl,cnl */
-	if (!HAS_RC6(dev_priv) || NEEDS_WaRsDisableCoarsePowerGating(dev_priv))
-		action[1] = 0;
-	else
-		/* bit 0 and 1 are for Render and Media domain separately */
-		action[1] = GUC_FORCEWAKE_RENDER | GUC_FORCEWAKE_MEDIA;
-
-	return intel_guc_send(guc, action, ARRAY_SIZE(action));
-}
-
 /**
  * intel_guc_auth_huc() - Send action to GuC to authenticate HuC ucode
  * @guc: intel_guc structure
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index bc2ba7d0626c..c20f3839de12 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -128,7 +128,6 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
 			u32 *response_buf, u32 response_buf_size);
 int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 				       const u32 *payload, u32 len);
-int intel_guc_sample_forcewake(struct intel_guc *guc);
 int intel_guc_auth_huc(struct intel_guc *guc, u32 rsa_offset);
 int intel_guc_suspend(struct intel_guc *guc);
 int intel_guc_resume(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 79c560d9c0b6..0f9afcde1d0b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -302,9 +302,6 @@ struct guc_ct_buffer_desc {
 #define GUC_CT_MSG_ACTION_SHIFT			16
 #define GUC_CT_MSG_ACTION_MASK			0xFFFF
 
-#define GUC_FORCEWAKE_RENDER	(1 << 0)
-#define GUC_FORCEWAKE_MEDIA	(1 << 1)
-
 #define GUC_POWER_UNSPECIFIED	0
 #define GUC_POWER_D0		1
 #define GUC_POWER_D1		2
@@ -558,7 +555,6 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_ENTER_S_STATE = 0x501,
 	INTEL_GUC_ACTION_EXIT_S_STATE = 0x502,
 	INTEL_GUC_ACTION_SLPC_REQUEST = 0x3003,
-	INTEL_GUC_ACTION_SAMPLE_FORCEWAKE = 0x3005,
 	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
 	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
 	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 892c1315ce49..ab0789d66e06 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -502,10 +502,6 @@ static int __uc_init_hw(struct intel_uc *uc)
 
 	intel_huc_auth(huc);
 
-	ret = intel_guc_sample_forcewake(guc);
-	if (ret)
-		goto err_log_capture;
-
 	if (intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_enable(guc);
 
-- 
2.28.0

