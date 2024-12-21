Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129479F9DAA
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 02:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427F610E16B;
	Sat, 21 Dec 2024 01:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMQwk4RW";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FF210E032;
 Sat, 21 Dec 2024 01:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734743966; x=1766279966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HT5oNXIC8G2r9GAxLf6wpI6XceRBBTwxfeMmS9pENGA=;
 b=lMQwk4RWHEuZVnudgK/Si6nyKRDcWUQjoE+zMG5dl/8VwIPSY6FaN3qC
 tAyrDbUMnlS4Vcwy2dUUXRKtCstZN06gQLJkUNZwDNSGwla+WiP8MrAuF
 eWkIwwtLy2JiB4KlG/aveHHoorB9t/ma1e+7HFSaflScGxqay5xT+03YO
 OMC0UaNzB2DtBWrKTxgFfG7Vi4jNGDHDs7pkmHOrYiJCybCTp8cR782X/
 OrWREOo+e/DLS/N2WST615PfbC8CXFfOuquei2PT7v2fMkkYE0qLPwW8P
 xSNlVNV8M0rNs+r+1dHHI+IIQdnHpYhfhNoMe2tcFZNLa4Sr18OGSqVkv w==;
X-CSE-ConnectionGUID: s+IjrmjRQCuz6HPx2SFnDA==
X-CSE-MsgGUID: YeHpKoqoQt6Gpea+wX6ahQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38140592"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="38140592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 17:19:25 -0800
X-CSE-ConnectionGUID: NdSuGUU0R9WqeuFM5G1gww==
X-CSE-MsgGUID: PwlyD3KrStug8R0tmO73cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129613636"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2024 17:19:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915: Add debug print about hw config table size
Date: Fri, 20 Dec 2024 17:19:25 -0800
Message-ID: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
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

Add debug info to help investigate a very rare bug:
  https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index b67a15f742762..868195c33f5b3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -7,6 +7,7 @@
 #include "gt/intel_hwconfig.h"
 #include "i915_drv.h"
 #include "i915_memcpy.h"
+#include "intel_guc_print.h"
 
 /*
  * GuC has a blob containing hardware configuration information (HWConfig).
@@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
 	};
 	int ret;
 
+	guc_dbg(guc, "Querying HW config table: size = %d, offset = 0x%08X\n",
+		ggtt_size, ggtt_offset);
 	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 	if (ret == -ENXIO)
 		return -ENOENT;
-- 
2.47.0

