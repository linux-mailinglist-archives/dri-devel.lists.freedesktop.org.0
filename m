Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D3568770D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B702C10E467;
	Thu,  2 Feb 2023 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD64010E467;
 Thu,  2 Feb 2023 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675325597; x=1706861597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xqVYK2aDFwOQUwyYtdXnuPaNSHB+w0A+/uXdVzQDfuA=;
 b=RyPUDczsv1Ih/bpRRwlZOGYjpvkvi+ylfpDVs1Xk5Y1oYMyUVRC6EDem
 3ODVTP7aWgmrSoy6L8xnnPzL4FgoOrlDkUeYoScdHLFc/kxTu/Cdr1Vt3
 d9frKvIX5WoqCmkaVTcUpxiwNZfsw/iSPqlhfQUFYxPIp8uD1kTRi3XVq
 +Kcm5tcah4bg5pVmyIbYog5HNdK67HubOWDQ5wzAwZwoM7R7Zxuatab80
 aOgXaVkNouZWKPz/VoG7GZ/ojelP4Pny1mfFds6cCgqL8ELrhM1agzA2p
 dtJ3bw51tt4tmBhkrh71cyw47rFeOyh8t2tGnO3rTOc0uDANbwd0I0FP5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330521048"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="330521048"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 00:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733860774"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="733860774"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 00:13:16 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pxp: limit drm-errors or warnings on firmware API
 failures
Date: Thu,  2 Feb 2023 00:13:12 -0800
Message-Id: <20230202081312.404394-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MESA driver is creating protected context on every driver handle
initialization to query caps bit for app. So when running CI tests,
they are observing hundreds of drm_errors when enabling PXP
in .config but using SOC or BIOS configuration that cannot support
PXP sessions.

Update error handling codes to be more selective on which errors
are reported as drm_error vs drm_WARN_ONCE vs drm_debug.
Don't completely remove all FW error replies (at least keep them
but use drm_debug) or else cusomers that really needs to know that
content protection failed won't be aware of it when debugging.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 52 ++++++++++++++-----
 3 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
index ae9b151b7cb7..6f6541d5e49a 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
@@ -18,6 +18,9 @@
 enum pxp_status {
 	PXP_STATUS_SUCCESS = 0x0,
 	PXP_STATUS_ERROR_API_VERSION = 0x1002,
+	PXP_STATUS_NOT_READY = 0x100e,
+	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
+	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
 	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
 };
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 448cacb0465d..7de849cb6c47 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -74,7 +74,7 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
 
 	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
 	if (ret) {
-		drm_err(&gt->i915->drm, "arb session failed to go in play\n");
+		drm_dbg(&gt->i915->drm, "arb session failed to go in play\n");
 		return ret;
 	}
 	drm_dbg(&gt->i915->drm, "PXP ARB session is alive\n");
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index d9d248b48093..1c2e4a75a968 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -19,6 +19,23 @@
 #include "intel_pxp_tee.h"
 #include "intel_pxp_types.h"
 
+static const char *
+pxp_fw_err_to_string(u32 type)
+{
+	switch (type) {
+	case PXP_STATUS_ERROR_API_VERSION:
+		return "ERR_API_VERSION";
+	case PXP_STATUS_NOT_READY:
+		return "ERR_NOT_READY";
+	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
+	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
+		return "ERR_PLATFORM_CONFIG";
+	default:
+		break;
+	}
+	return NULL;
+}
+
 static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
 				    void *msg_in, u32 msg_in_size,
 				    void *msg_out, u32 msg_out_max_size,
@@ -307,15 +324,19 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 				       &msg_out, sizeof(msg_out),
 				       NULL);
 
-	if (ret)
-		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
-	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
-		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
-			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
+	if (ret) {
+		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
+	} else if (msg_out.header.status != 0) {
+		if (msg_out.header.status == PXP_STATUS_PLATFCONFIG_KF1_NOVERIF ||
+		    msg_out.header.status == PXP_STATUS_PLATFCONFIG_KF1_BAD)
+			drm_WARN_ONCE(&i915->drm, true,
+				      "Platform BIOS or Fusing won't allow PXP arb creation\n");
+
+		drm_dbg(&i915->drm, "PXP init arb session failed 0x%08x:%s:"
+			"CMD-ID-[0x%08x]:API-Ver-[0x%08x]\n",
+			msg_out.header.status, pxp_fw_err_to_string(msg_out.header.status),
 			msg_in.header.command_id, msg_in.header.api_version);
-	else if (msg_out.header.status != 0x0)
-		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
-			 msg_out.header.status);
+	}
 
 	return ret;
 }
@@ -347,10 +368,17 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 	if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
 		goto try_again;
 
-	if (ret)
+	if (ret) {
 		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
 			session_id, ret);
-	else if (msg_out.header.status != 0x0)
-		drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
-			 session_id, msg_out.header.status);
+	} else if (msg_out.header.status != 0) {
+		if (msg_out.header.status == PXP_STATUS_PLATFCONFIG_KF1_NOVERIF ||
+		    msg_out.header.status == PXP_STATUS_PLATFCONFIG_KF1_BAD)
+			drm_WARN_ONCE(&i915->drm, true,
+				      "Platform BIOS or Fusing won't allow PXP arb creation\n");
+		drm_dbg(&i915->drm, "PXP inv-stream-key-%d failed 0x%08x:%st:\n"
+			"CMD-ID-[0x%08x]:API-Ver-[0x%08x]\n", (int)session_id,
+			msg_out.header.status, pxp_fw_err_to_string(msg_out.header.status),
+			msg_in.header.command_id, msg_in.header.api_version);
+	}
 }
-- 
2.39.0

