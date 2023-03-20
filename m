Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35356C2286
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13F510E662;
	Mon, 20 Mar 2023 20:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2F810E64E;
 Mon, 20 Mar 2023 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679343848; x=1710879848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3dCqcFyFG/fACxCjySSjXusWYgaQZyRy/40ttC+ldw=;
 b=gHsyW9VTAenZQ83a48NtsVflvfsw8rQzrZLdFDRMW8XXK6JK3K557hU1
 cDQn4CDyfdWOfaAI/MaMtDFP4exdkNqC5fxzJl4u4z8yX67NFpXaJQzhT
 ID1hire1PpUaT6LjByBqeqZeJaRz/DX+aWSPDkwTXHM4J3qkU66UUyiQV
 Pa4fi8kmPjeFXVw5JVMD9lO+0rCEFasko/uLLEh+jXu2moyGzi59OLyp6
 W75dEMsRPbzORtarXBmLy9EV4Q+dtENRorYSMdTT4XporSx+oD5pO056l
 aNLmXgolxvsFCevhU+0AyaYMLUgEPDulaIxFze1ma0gA3IgokiWhL9+Al w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401343263"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="401343263"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="805025626"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="805025626"
Received: from ivolodix-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.62.92])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:24:06 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/i915: Check for unreliable MMIO during forcewake
Date: Mon, 20 Mar 2023 21:23:26 +0100
Message-Id: <20230320202326.296498-3-andi.shyti@linux.intel.com>
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

Although we now sanitycheck MMIO access during driver load to make sure
the MMIO BAR isn't returning all 0xFFFFFFFF, there have been a few cases
where (temporarily?) unreliable MMIO access has happened after GPU
resets or power events.  We'll often notice this on our next GT register
access since forcewake handling will fail; let's change our handling
slightly so that when this happens we print a more meaningful message
clarifying that the problem is the MMIO access, not forcewake
specifically.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 14ec45e6facfa..8b40a9772df5f 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -178,9 +178,15 @@ static inline void
 fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
 {
 	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
-		drm_err(&d->uncore->i915->drm,
-			"%s: timed out waiting for forcewake ack to clear.\n",
-			intel_uncore_forcewake_domain_to_str(d->id));
+		if (fw_ack(d) == ~0)
+			drm_err(&d->uncore->i915->drm,
+				"%s: MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
+				intel_uncore_forcewake_domain_to_str(d->id));
+		else
+			drm_err(&d->uncore->i915->drm,
+				"%s: timed out waiting for forcewake ack to clear.\n",
+				intel_uncore_forcewake_domain_to_str(d->id));
+
 		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
 	}
 }
-- 
2.39.2

