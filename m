Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143E861DAA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8D810E03D;
	Fri, 23 Feb 2024 20:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIIrf52E";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1965810ECBB;
 Fri, 23 Feb 2024 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708720453; x=1740256453;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ys7nx0WtswABEz14/5q+9BUYa4SR42MP+vqWfCuSQfk=;
 b=MIIrf52EhVd6lnUypsbZm/fOEXSKgyf3uE+ht9HZebWOGaqLr9U5w0tS
 mdkAt2BVvQXxMDgCz0qaFcWfOnanIaiHuxcEeBC0Oc0qrAQfFIl2e6YWb
 R7h8PHM2Gf81oMZrL9vo6ClNkjGDsKCL9NYkafrTjuPmvO9vA9n5mb4fe
 gQkBe3nIIvd4995ka4rTzisoRCGGY1KWJ3SlOMFT78UNYjK+AjnP+QGvd
 QFg2IEdzCBLWL+LG5EsTLCjnriUkZUVyDGr1pSjX/KroG6t2AI/xpSi5f
 IbKyIzWBsJmiRX4jYZfj1SIZGAMa9TexaJHBaZ1AkO7Q32g1UF2Si7weu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="14186545"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="14186545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="43471177"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa001.jf.intel.com with ESMTP; 23 Feb 2024 12:34:13 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/guc: Correct capture of EIR register on hang
Date: Fri, 23 Feb 2024 12:32:04 -0800
Message-ID: <20240223203204.1533410-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
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

The EIR register (0x20B0) was being included in the engine class list
for render and compute as the absolute register address. However, it
is actually a ring register available on all engines at an offset of
(base) + 0xB0. As it was included as an RCS engine but with the
absolute address, GuC was adding on another 0x2000 and coming out at
an invalid location. Thus it would reject the register and complain
about only managing a partial capture.

So update the list to use the RING_EIR version of the register and
include it for all engines.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index a1cd40d805178..0cb5f22a173cb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -51,6 +51,7 @@
 	{ RING_ESR(0),              0,      0, "ESR" }, \
 	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
 	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
+	{ RING_EIR(0),              0,      0, "EIR" }, \
 	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
 	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
 	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
@@ -80,9 +81,6 @@
 	{ GEN8_RING_PDP_LDW(0, 3),  0,      0, "PDP3_LDW" }, \
 	{ GEN8_RING_PDP_UDW(0, 3),  0,      0, "PDP3_UDW" }
 
-#define COMMON_BASE_HAS_EU \
-	{ EIR,                      0,      0, "EIR" }
-
 #define COMMON_BASE_RENDER \
 	{ GEN7_SC_INSTDONE,         0,      0, "GEN7_SC_INSTDONE" }
 
@@ -105,7 +103,6 @@ static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 
 /* XE_LP Render / Compute Per-Class */
 static const struct __guc_mmio_reg_descr xe_lp_rc_class_regs[] = {
-	COMMON_BASE_HAS_EU,
 	COMMON_BASE_RENDER,
 	COMMON_GEN12BASE_RENDER,
 };
@@ -148,7 +145,6 @@ static const struct __guc_mmio_reg_descr gen8_global_regs[] = {
 };
 
 static const struct __guc_mmio_reg_descr gen8_rc_class_regs[] = {
-	COMMON_BASE_HAS_EU,
 	COMMON_BASE_RENDER,
 };
 
-- 
2.43.0

