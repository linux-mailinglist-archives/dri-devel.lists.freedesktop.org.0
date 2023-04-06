Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92996DA5C7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837210ED5A;
	Thu,  6 Apr 2023 22:26:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ECA10ED3E;
 Thu,  6 Apr 2023 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680820003; x=1712356003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehUYVdgEXbKe+2tzAZ6KndZkZojpkdqIN/P/1PqW8hE=;
 b=JVVa8R64TmjMqkEglw9DSJl/h54c87mSi1ULH+mRk1Yjw2UvhNUj760m
 h8g0++kmIq98NJe0zq3qkLLO41pVCFkc3kZUk/IdowmpJ22D9m6nNGv9Z
 DKRIZQnGO0R87MCOaHcrf4z4jZyqKpZ52Z/wj5ymvvXQXjAYg/LcooTV8
 MFdRNL5j+w5kpaw+Fe7dyBG6K1hgvnfS/VvySSmUD/9e+ZH3HkQHDhR2A
 EcTuP0OHQ3JT/R3mgihFhKlL79KBTlifeLm+k6vYxIO6Qxs1IvUhPHBxM
 +LeKYnf0nIpJ4bj9YAjEvOjquVYoAyIWFKhIhZpKWFbQ1SXWWvQfvu3gk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341604984"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341604984"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 15:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776635910"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776635910"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 15:26:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/5] drm/i915/guc: Capture list clean up - 4
Date: Thu,  6 Apr 2023 15:26:17 -0700
Message-Id: <20230406222617.790484-6-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Don't use GEN9 as a prefix for register lists that contain all GEN8
registers.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index fbd0be4afc6d5..c1a75a2d17f1e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -30,12 +30,12 @@
 #define COMMON_BASE_GLOBAL \
 	{ FORCEWAKE_MT,             0,      0, "FORCEWAKE" }
 
-#define COMMON_GEN9BASE_GLOBAL \
+#define COMMON_GEN8BASE_GLOBAL \
 	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
 	{ DONE_REG,                 0,      0, "DONE_REG" }, \
 	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
 
-#define GEN9_GLOBAL \
+#define GEN8_GLOBAL \
 	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
 	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
 
@@ -99,7 +99,7 @@
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_BASE_GLOBAL,
-	COMMON_GEN9BASE_GLOBAL,
+	COMMON_GEN8BASE_GLOBAL,
 	COMMON_GEN12BASE_GLOBAL,
 };
 
@@ -140,11 +140,11 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* GEN9 - Global */
+/* GEN8 - Global */
 static const struct __guc_mmio_reg_descr default_global_regs[] = {
 	COMMON_BASE_GLOBAL,
-	COMMON_GEN9BASE_GLOBAL,
-	GEN9_GLOBAL,
+	COMMON_GEN8BASE_GLOBAL,
+	GEN8_GLOBAL,
 };
 
 static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
-- 
2.39.1

