Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C226DA5BD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C81310EA51;
	Thu,  6 Apr 2023 22:26:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A13210ED3B;
 Thu,  6 Apr 2023 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680820003; x=1712356003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uZTmfq4utfU0dL8rBk/k3Mu6mA/DFJJpFJ0B7slnigI=;
 b=QRU0t15Tw45/BVeqtYUEhJpUfP7HzbeAZsGfq6ErpLAb0YcjQvxmgNJh
 QEOuQLPwRcFIbvqknVzsUWAVnET5Y6DsndXRsafvTsAStgrJ9QQlowWpD
 bx5bwy7pra3aTkLNM6HN3lt3aydF/ojPxyEsjS8rnqBkILwtFRDaJJ1Ra
 d8IkM0uzh9CO3OiVq+q0x/HESDPdS3eQpfjRZmmvVLayVRR77N3806wUh
 gZjIcKiwg9W0MeOLk0hCTpzS8g/lbu2fp6i835+L9kDMQ8Uy9mT0cFELS
 Z/4qnETO+kc1xTxBG8iOAF0J8ISc+yDkcPQVJyo1iBttBjpZ+VCdoyGvA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341604980"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341604980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 15:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776635890"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776635890"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 15:26:42 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/5] drm/i915/guc: Don't capture Gen8 regs on Xe devices
Date: Thu,  6 Apr 2023 15:26:13 -0700
Message-Id: <20230406222617.790484-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230406222617.790484-1-John.C.Harrison@Intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A pair of pre-Xe registers were being included in the Xe capture list.
GuC was rejecting those as being invalid and logging errors about
them. So, stop doing it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: dce2bd542337 ("drm/i915/guc: Add Gen9 registers for GuC error state capture.")
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index cf49188db6a6e..e0e793167d61b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -31,12 +31,14 @@
 	{ FORCEWAKE_MT,             0,      0, "FORCEWAKE" }
 
 #define COMMON_GEN9BASE_GLOBAL \
-	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
-	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }, \
 	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
 	{ DONE_REG,                 0,      0, "DONE_REG" }, \
 	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
 
+#define GEN9_GLOBAL \
+	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
+	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
+
 #define COMMON_GEN12BASE_GLOBAL \
 	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
 	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
@@ -142,6 +144,7 @@ static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
 static const struct __guc_mmio_reg_descr default_global_regs[] = {
 	COMMON_BASE_GLOBAL,
 	COMMON_GEN9BASE_GLOBAL,
+	GEN9_GLOBAL,
 };
 
 static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
-- 
2.39.1

