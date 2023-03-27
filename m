Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5267D6CAF44
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 21:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE010E74B;
	Mon, 27 Mar 2023 19:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9516110E745;
 Mon, 27 Mar 2023 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679946991; x=1711482991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kv1qXsjK3cJ0WSb8UD6Ces83ePuvxnNe+FYUmPJa/g=;
 b=YvTEhb/aZJ6kU1/orZuKF1iCPRfccHCH2TRKc3xqy23Lp4DuZoVkZSy0
 jO/GAUCtQ08dKOCJUW7Gj0XIlO+xIobuXAH37tpxH8N9of7hxv4lmGrMa
 BYR64xocqaGh5zgcZwiyd0n3u/PqACIiCUEx05niA7HdT5/RLYfON4RCm
 5Y1Xz3giR6t/VBn9azk6lZb6t0PSnwFiUaeeE3/0ULyHHIfz/K9vUzNlE
 zm7Se5EKOkLcQ1dudRJuY71EonZtY6z3dBTvpN7vemcK2q3tI9EN2UHnL
 pLb8v4/2z/+9P94QCuZESBZ497jmefc3Jt4woF+DWUbXJ7+MZQFvSISUr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405302595"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="405302595"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 12:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807600377"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="807600377"
Received: from mgaucher-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.63.207])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 12:56:28 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 1/2] drm/i915: Sanitycheck MMIO access early in driver load
Date: Mon, 27 Mar 2023 21:55:46 +0200
Message-Id: <20230327195547.356584-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327195547.356584-1-andi.shyti@linux.intel.com>
References: <20230327195547.356584-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
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
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

Andrzej suggested to check the upper 16 bits of the BAR. But
after an offline discussion with Matt, we agreed that reading the
whole 32 bits is a safer choice.

Andi

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

