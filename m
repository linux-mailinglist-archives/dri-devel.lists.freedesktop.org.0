Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CC6528BE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 23:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CDB10E416;
	Tue, 20 Dec 2022 22:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DCA10E044;
 Tue, 20 Dec 2022 22:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671574147; x=1703110147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t8p6yD2DgGKWzoxqI2joXuLTLa4pC7jtwHUjrJo4Ijc=;
 b=RAXhGjIgZKXYWx05FofnBN6HpHgCU0o2QS8bdSJvyIFO0enc9j5ji8Zm
 jcYJ1ZRqHbx9c4vJ/T6QnuDdDPkh39Tb+e6sS8o+fMAE6AnFzZrb3jXSn
 i8jLckPR9jWVxuBJjVQhNqXdoBXoWgncuh327tgVIbzcLLB+Tr8/h9E15
 xN54vUF58ezWY+S/qHQuKDAzEcSRp33iZXqlihNWBwf4BQukXjSGMYWx0
 jOYqR3U9HOrdfANKPyyyYntRBEkzT7LO4+R4jis+D7MZZ8+fKsDbNPean
 cEi6zdnxeU+Jf6VhS4SZtXc/ayD9xBpL4M4hcroKpnrlDZR2U1ETuqtDC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="381955220"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="381955220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 14:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="601264522"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="601264522"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 20 Dec 2022 14:09:06 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/i915/pxp: Use drm_dbg if arb session failed due to
 fw version
Date: Tue, 20 Dec 2022 14:11:58 -0800
Message-Id: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If PXP arb-session is being attempted on older hardware SKUs or
on hardware with older, unsupported, firmware versions, then don't
report the failure with a drm_error. Instead, look specifically for
the API-version error reply and drm_dbg that reply. In this case, the
user-space will eventually get a -ENODEV for the protected context
creation which is the correct behavior and we don't create unnecessary
drm_error's in our dmesg (for what is unsupported platforms).

Changes from prio revs:
   v1 : - print incorrect version from input packet, not output.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h | 1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
index c2f23394f9b8..aaa8187a0afb 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
@@ -17,6 +17,7 @@
  */
 enum pxp_status {
 	PXP_STATUS_SUCCESS = 0x0,
+	PXP_STATUS_ERROR_API_VERSION = 0x1002,
 	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
 };
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index d50354bfb993..9d084ed9cc50 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -298,6 +298,11 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 
 	if (ret)
 		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
+
+	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
+		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
+			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
+			msg_in.header.command_id, msg_in.header.api_version);
 	else if (msg_out.header.status != 0x0)
 		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
 			 msg_out.header.status);

base-commit: cc44a1e87ea6b788868878295119398966f98a81
-- 
2.34.1

