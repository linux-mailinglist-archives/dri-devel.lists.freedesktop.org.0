Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2A6C37F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 18:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779F10E26B;
	Tue, 21 Mar 2023 17:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A25210E0E5;
 Tue, 21 Mar 2023 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679418800; x=1710954800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8buKxJBw0bIXoKN08CE5SXbtFLq5tdE6W+113z8jGLI=;
 b=DDHomeqyTOupWOCriGr0Izh3WroynaQnPAuU8pZg8A2eRNUBbtHPETXg
 pya8tsLEYa2wSZXrKIrMNE3mZJEwQh3C9BlPE13x3wb93SMqxt5Aj8R3t
 gSNqG2l4wZ28g9HQlCwacTRnRmkz1nQ2KqN/+KRqkL57XyPMnjbME0/Ut
 /LEqiPSLaikpkxpak9o906G1Xb5QfIdLOs3bYSdqFne/StyUl1M60C/jK
 /Dph/By2uDuTfKCqUuyFFJ20g+mRUhy5gFGdgp6oB4mXBn+K7kZXiNKq8
 1L405a31wV2zsOyCVHCVwX7fONI0w9sIvbERYpBiqWuomV8aaBhAmpM3O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425290364"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="425290364"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="745944124"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="745944124"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:10:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/2] drm/i915: Check for unreliable MMIO during forcewake
Date: Tue, 21 Mar 2023 18:09:36 +0100
Message-Id: <20230321170936.478631-3-andi.shyti@linux.intel.com>
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
index 0b69081d6d285..303a5d38c93a5 100644
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

