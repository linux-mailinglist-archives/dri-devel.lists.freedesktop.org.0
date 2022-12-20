Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13826528A0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 23:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79C10E0DF;
	Tue, 20 Dec 2022 22:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED9410E0DE;
 Tue, 20 Dec 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671573614; x=1703109614;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8dCGaT0pcLDlSjWzsIeUUf3Mu8KteGcPIaW2WGG8F14=;
 b=bv+/19J/CUhtphYydkl6lfmxOKdnQd4fhO5k/Iteegw4bxltHJTD+/7v
 eNTfMASM3d0A62MiXLadXYhX3RQEz8dNwgr6e0vuH7Hg0Kpa1tY8UX2zV
 qc2WaffZRDD4+oLeu9NZzN/WcgFk30Jh109RmbYsBqqOvvNaTw3Rxlp//
 ti6Es3ArjFgUjVqQ0Ve1ljmHkbDDjOcbdWwzlR1/vbHwJfB9WJ72A2kXN
 xZnW8TpECkRp8KlcZaoXipAEn66m/cG69GLYFhfAA0IKauqAQ6loqBxaD
 HulzQ3JbM+h6/B/KKCC1sIMrAhEL+qJV23CokS3Ar+qzqBYVhW/bpQBZO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="317364311"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="317364311"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 14:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="793476374"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="793476374"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2022 14:00:13 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/pxp: Use drm_dbg if arb session failed due to fw
 version
Date: Tue, 20 Dec 2022 14:03:04 -0800
Message-Id: <20221220220304.2383273-1-alan.previn.teres.alexis@intel.com>
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
index d50354bfb993..1e2fef39a675 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -298,6 +298,11 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 
 	if (ret)
 		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
+
+	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
+		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
+			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
+			msg_in.header.command_id, msg_out.header.api_version);
 	else if (msg_out.header.status != 0x0)
 		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
 			 msg_out.header.status);

base-commit: cc44a1e87ea6b788868878295119398966f98a81
-- 
2.34.1

