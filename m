Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49D74B661
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6CC10E04A;
	Fri,  7 Jul 2023 18:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BFD10E04A;
 Fri,  7 Jul 2023 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688754868; x=1720290868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tYzX7AvtaLN8r0LJRm6F428zAfCoAO3AaD/NRf6LyFk=;
 b=UAEQydJzx2UUHgduvgtkQ4tMiOzaWTczcPWJxoprbaRrhS7ekTtJcbrB
 HNIVhlNuD41iic3VeTDFhwUz0yh6YVD60gpKLMPSXXjA2MfPcVi6zOGQ2
 kZm4zSOnF6qeewz9BynUeHIkzFe+ifiTkhACQD2oUF/fVoW/S1rLuXRR5
 GscWgpqJj8y/tAUe60zP3UsSC85b9jeT3q5VS+5Cm0GHphlGSTJWaX/W4
 XiR82/EsB2K+PbxNqhTXf2634pFyGPjLnZqHYZksvfCCe1DMPeaxDZpZk
 8+1GKBu/3u5zEBxCh8EOMK7oKmrBL4clVLJ+aiqEjlvXr1tGPUIlQPmri A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="353800411"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="353800411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 11:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864648082"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="864648082"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 11:34:27 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1] drm/i915/pxp/mtl: Update gsc-heci cmd size and timeout
Date: Fri,  7 Jul 2023 11:34:26 -0700
Message-Id: <20230707183426.1952655-1-alan.previn.teres.alexis@intel.com>
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

Update the max GSC-HECI packet size and the max firmware
response timeout to match internal fw specs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 0165d38fbead..c242b89ef31e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -15,7 +15,7 @@
 #define PXP43_CMDID_INIT_SESSION 0x00000036
 
 /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
-#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
+#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K + SZ_4K)
 
 /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
 #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 298ad38e6c7d..a950d1e582d1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -10,9 +10,9 @@
 
 struct intel_pxp;
 
-#define GSC_REPLY_LATENCY_MS 210
+#define GSC_REPLY_LATENCY_MS 360
 /*
- * Max FW response time is 200ms, to which we add 10ms to account for overhead
+ * Max FW response time is 350ms, to which we add 10ms to account for overhead
  * such as request preparation, GuC submission to hw and pipeline completion times.
  */
 #define GSC_PENDING_RETRY_MAXCOUNT 40

base-commit: 8f40aae3b99ac28dd81d00933f5dc9124dbfc881
-- 
2.39.0

