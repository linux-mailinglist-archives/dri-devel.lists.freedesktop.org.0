Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317076E2E0E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F42310EEEE;
	Sat, 15 Apr 2023 00:57:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CF810EEE3;
 Sat, 15 Apr 2023 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681520241; x=1713056241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qEVykQuCU4qYs8pwv812hV238FG8h1DKyF8MbGmwpGA=;
 b=dXqiVJ4XPCXnU6qh+WkY4tJBDZ2P3bruwHIr1DGsh5DwavfxstMh1ezl
 1J0uA1gA0sa0Q3rUJevpiwuJ85jn7B72k7ow/IghMyOH/IFZM1sG8SeHK
 0B8BZesMk6rEXN9nm64H+Q5gTiIJnjrYXsLpAu8t8AHzg2/PY7bRZC4Ar
 Z3i1PkgcC7+6kukVPd3indf3T+SBgKmdEgKnJjiHQ2ZpmXL3X/rr5Eeh7
 iC/psKn2PaXqaJYeFg/3CpEUvcRC/IDQzY/C/yeYPdZnIl7ehpgUo4FXu
 Szotd+eRKIZ1tm3V/WwSVb8hkjUURH2cZK69t0f+MHenr2MWjUN+UQffe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372471780"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="372471780"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722643201"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="722643201"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/5] drm/i915/guc: Decode another GuC load failure case
Date: Fri, 14 Apr 2023 17:57:02 -0700
Message-Id: <20230415005706.4135485-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
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

Explain another potential firmware failure mode and early exit the
long wait if hit.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c       | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index bcb1129b36102..dabeaf4f245f3 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -44,6 +44,7 @@ enum intel_guc_load_status {
 enum intel_bootrom_load_status {
 	INTEL_BOOTROM_STATUS_NO_KEY_FOUND                 = 0x13,
 	INTEL_BOOTROM_STATUS_AES_PROD_KEY_FOUND           = 0x1A,
+	INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE       = 0x2B,
 	INTEL_BOOTROM_STATUS_RSA_FAILED                   = 0x50,
 	INTEL_BOOTROM_STATUS_PAVPC_FAILED                 = 0x73,
 	INTEL_BOOTROM_STATUS_WOPCM_FAILED                 = 0x74,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 6fda3aec5c66a..0ff088a5e51a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -129,6 +129,7 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
 	case INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
 	case INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT:
 	case INTEL_BOOTROM_STATUS_EXCEPTION:
+	case INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
 		*success = false;
 		return true;
 	}
@@ -219,6 +220,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
 			guc_info(guc, "firmware signature verification failed\n");
 			ret = -ENOEXEC;
 			break;
+
+		case INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+			guc_info(guc, "firmware production part check failure\n");
+			ret = -ENOEXEC;
+			break;
 		}
 
 		switch (ukernel) {
-- 
2.39.1

