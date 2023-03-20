Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DD6C2284
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83210E660;
	Mon, 20 Mar 2023 20:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0341D10E65E;
 Mon, 20 Mar 2023 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679343844; x=1710879844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h5p7kbd5yUNPfOeWM80IMyGXZBKhemAYLileuX/U6yg=;
 b=mdpmikIXdD1euISw0VODNHGWa1ZwZgD8prq9SG0v9iGTYkPWUTJgE/Ou
 HJv6BuuwtvaL6EIvRN/Fp7dCCu7iG/jJULxcPketWG36Qd/G2o6cZvJ0h
 K5q1JzoniVLaYTIBNfH+xu+Jd/KqGnZSmZlo8IcCrCgfm0O8hNmFiLPXF
 BVGICWRlUvUyOdoZ2k+Cf7A0DRp0I4MqOUxSGLoz3QwN7HjnGz9nY3Fbq
 QX82E5OuwpoG4+E3fJsD+vhw8VWIKjDJNqUXWrNd6FiwiltEU0YECQpSl
 odkFL37VIsfo9bgc5eew/YPgEpq4MZCdmEdK00iqDvghgKsl3OFVwlYlr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401343212"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="401343212"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="805025615"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="805025615"
Received: from ivolodix-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.62.92])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:24:01 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/i915: Sanitycheck MMIO access early in driver load
Date: Mon, 20 Mar 2023 21:23:25 +0100
Message-Id: <20230320202326.296498-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320202326.296498-1-andi.shyti@linux.intel.com>
References: <20230320202326.296498-1-andi.shyti@linux.intel.com>
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
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/intel_uncore.c | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e1e1f34490c8e..14ec45e6facfa 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2602,11 +2602,45 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
 	return 0;
 }
 
+static int sanity_check_mmio_access(struct intel_uncore *uncore)
+{
+	struct drm_i915_private *i915 = uncore->i915;
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
+#define COND (__raw_uncore_read32(uncore, FORCEWAKE_MT) != ~0)
+	if (wait_for(COND, 2000) == -ETIMEDOUT) {
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

