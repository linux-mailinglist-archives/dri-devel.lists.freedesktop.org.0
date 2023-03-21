Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30766C37F2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 18:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A1810E0E9;
	Tue, 21 Mar 2023 17:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAEE10E0E5;
 Tue, 21 Mar 2023 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679418799; x=1710954799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12D5X5s+1qw1W+tePxORrVcP9Ucznxxt2uEsp64GXLI=;
 b=CldyASPB/W7iJ3dvPAYBzNRQiHaMIJUzJTdr+v3MeIM8IIv6wfDd5zQ2
 /qQFfkoB1kLaGxnK9afXxRD+THeyjyFfU9sKKQuIWTOnOWSOzNc7CXauK
 7eqjUyijIRRXQWZPqaPa6tA/BbbrGJtPBjoMOFHfnkmDlLQge6tUPVf6H
 ousE7Cg0m2+DaAXrsGm4uUp3TYPGqVGWZmurqiSzNRMS25osRHOfqnfzD
 DqIZGQZQUfJX+q2hi5iKUwbpHdaEOjsATXWYJi3X9wOPCvM2Sy8laI3DV
 QAeGdy/mF7IFebhXExDsnaLEs/NAgVWmtEx/vBDjhsExKcG1DNuWUdU7J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425290339"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="425290339"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="745943987"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="745943987"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:10:17 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/2] drm/i915: Sanitycheck MMIO access early in driver load
Date: Tue, 21 Mar 2023 18:09:35 +0100
Message-Id: <20230321170936.478631-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321170936.478631-1-andi.shyti@linux.intel.com>
References: <20230321170936.478631-1-andi.shyti@linux.intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

We occasionally see the PCI device in a non-accessible state at the
point the driver is loaded.  When this happens, all BAR accesses will
read back as 0xFFFFFFFF.  Rather than reading registers and
misinterpreting their (invalid) values, let's specifically check for
0xFFFFFFFF in a register that cannot have that value to see if the
device is accessible.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e1e1f34490c8e..0b69081d6d285 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2602,11 +2602,46 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
 	return 0;
 }
 
+static int sanity_check_mmio_access(struct intel_uncore *uncore)
+{
+	struct drm_i915_private *i915 = uncore->i915;
+	int ret;
+
+	if (GRAPHICS_VER(i915) < 8)
+		return 0;
+
+	/*
+	 * Sanitycheck that MMIO access to the device is working properly.  If
+	 * the CPU is unable to communcate with a PCI device, BAR reads will
+	 * return 0xFFFFFFFF.  Let's make sure the device isn't in this state
+	 * before we start trying to access registers.
+	 *
+	 * We use the primary GT's forcewake register as our guinea pig since
+	 * it's been around since HSW and it's a masked register so the upper
+	 * 16 bits can never read back as 1's if device access is operating
+	 * properly.
+	 *
+	 * If MMIO isn't working, we'll wait up to 2 seconds to see if it
+	 * recovers, then give up.
+	 */
+	ret = intel_wait_for_register_fw(uncore, FORCEWAKE_MT, 0, 0, 2000000);
+	if (ret == -ETIMEDOUT) {
+		drm_err(&i915->drm, "Device is non-operational; MMIO access returns 0xFFFFFFFF!\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 int intel_uncore_init_mmio(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
 	int ret;
 
+	ret = sanity_check_mmio_access(uncore);
+	if (ret)
+		return ret;
+
 	/*
 	 * The boot firmware initializes local memory and assesses its health.
 	 * If memory training fails, the punit will have been instructed to
-- 
2.39.2

