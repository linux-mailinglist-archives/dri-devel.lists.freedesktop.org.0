Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF607286D7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 20:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBE010E068;
	Thu,  8 Jun 2023 18:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91B510E02A;
 Thu,  8 Jun 2023 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686247534; x=1717783534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zCTJdtnkcpmOancjphQjoi8Fc52zspwZt/0opV21MRw=;
 b=Ysmywu7eZ/FXq7XRxrEeI5ubi/qes8idlBfD0n4aHNyv/oJ5iMW7CHya
 qsoqEor4nHUkW5u7b1oJCW8DtPcA1wIwvQKCuaINPZxuJ5xmBsZQvwKzQ
 967M6CrHn6BogGf2EiGXp0cGRObOPeXUNInWPfR4ufT3X/c8nyRMCzc8/
 +EWZuW7l/1Wnap1osldO9Vh+2yt07s+kWx4l+4b894uMZdojoX1tCyZDt
 6539CrLjM979iIGQTUWVi65uNOVGKShIzhEXI4vjExE9NF/d88ShE9t1k
 HHOgq527uqb9MlFMq0JX+EvI0XEd54HfTODyduIXiQrtn0X8JiDJq5m3b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337746634"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="337746634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="687444617"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="687444617"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 11:04:06 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1] drm/i915/gsc: take a wakeref for the proxy-init-completion
 check
Date: Thu,  8 Jun 2023 11:04:05 -0700
Message-Id: <20230608180405.3059026-1-alan.previn.teres.alexis@intel.com>
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

Ensure intel_gsc_uc_fw_init_done and intel_gsc_uc_fw_proxy_init
takes a wakeref before reading GSC Shim registers.

NOTE: another patch in review also adds a call from selftest to
this same function. (https://patchwork.freedesktop.org/series/117713/)
which is why i am adding the wakeref inside the callee, not the
caller.

Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index f46eb17a7a98..1e5a8b2bdac9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -27,7 +27,11 @@ static bool gsc_is_in_reset(struct intel_uncore *uncore)
 bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
 {
 	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
-	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
+	intel_wakeref_t wakeref;
+	u32 fw_status;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
 
 	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
 	       GSC_FW_PROXY_STATE_NORMAL;
@@ -36,7 +40,11 @@ bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
 bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
 {
 	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
-	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
+	intel_wakeref_t wakeref;
+	u32 fw_status;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
 
 	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
 }

base-commit: 27187d09511e1d47dbaaf91c7332319551a8edab
-- 
2.39.0

