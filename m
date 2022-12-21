Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E651465358C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 18:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730C210E087;
	Wed, 21 Dec 2022 17:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2C310E087;
 Wed, 21 Dec 2022 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671644771; x=1703180771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zoL/MWRZwNqyL+88mGin9OeAtSawzozdWK099m/s/e0=;
 b=nMcKP1WxvfH3wBefEZghJgfI2bKy2QuM8xw/Oy7yFmsthWz2qZ+iBQ4m
 xdXNRuOX2SZojlkbxNCLAGbP9ndCH8x+B9XMRzvrPIXiJvI7DJHvIIzBu
 dE7QAPGu2aG0XW1SR1PNjL/tyV3DDBVAUwcw2rvDJARnmrzoGFu9qOyq4
 Tt//lx/uGojNYdgRpEUywMCaksMyeXIgyLFa80ctFJJ1H7rPZTWeOFdvn
 mIdHGz6kzdSFJqEvqsNVSUJGPK6y8a6Mw+5FBuQkOv7e5pwMobpKCCurG
 tgtk9U69ht5wMEcE1PIJCK5HtYoDXV/FlJtRJaY6r1PAwIC9/V6jbozxR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="406173491"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="406173491"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 09:46:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="683876443"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="683876443"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga001.jf.intel.com with ESMTP; 21 Dec 2022 09:46:10 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/i915/pxp: Use drm_dbg if arb session failed due to
 fw version
Date: Wed, 21 Dec 2022 09:49:01 -0800
Message-Id: <20221221174901.2703954-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
References: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
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
   v2 : - remove unnecessary newline. (Jani)
   v1 : - print incorrect version from input packet, not output.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h | 1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 4 ++++
 2 files changed, 5 insertions(+)

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
index d50354bfb993..73aa8015f828 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -298,6 +298,10 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 
 	if (ret)
 		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
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

