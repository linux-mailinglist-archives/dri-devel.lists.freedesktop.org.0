Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7F5228B9
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 03:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EE210E2AD;
	Wed, 11 May 2022 01:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2210E212;
 Wed, 11 May 2022 01:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652231510; x=1683767510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eac7OTb5myQ/M0qm32GufZrULc5YHPWR/oDB0/s6kdQ=;
 b=HWKWuFg2GzlsP1marP1TR7wR3e8BpQuoAxvXEk15Caon11FgHlP/NxmF
 t04dw5X5sNn2zy2LFfSugc59wAQPGoYg9Q/n2ZnBPHzZvNViqb1tpuhCs
 ttbwKW+l7LjU1HTQyQytcxJ9RIrCS+LWb/UxZxvvJRsTimcV6T3FzXCJj
 +kS4MSKa3F5OabXAiI9ch/Snr7NxhtG6jM37A/xx3yPB/XHKOzSkKCC5h
 QHx6M9/QYH8lMFuLF7k3D1j76u757qauv976gsghppJ1R7eVipv/K2Z4x
 A61K2FLywQ1OfdeSwBtpTukTtGEhslQP196bPjE5T07tIDwVKBOyP5O0W Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249446376"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="249446376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 18:11:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="565924479"
Received: from ymmonter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 18:11:38 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/3] drm/i915/gt: Ignore TLB invalidations on idle engines
Date: Wed, 11 May 2022 03:11:19 +0200
Message-Id: <20220511011121.114226-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511011121.114226-1-andi.shyti@linux.intel.com>
References: <20220511011121.114226-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

As an extension of the current skip TLB invalidations if the device is
powered down, we recognised that prior to any engine activity, all the
TLBs are explicitly invalidated. Thus anytime we know the engine is
asleep, we can skip invalidating the TLBs on that engine.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index bc898df7a48cc..3b1fbce7ea369 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -55,6 +55,10 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
 	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
 
+#define with_intel_gt_pm_if_awake(gt, tmp) \
+	for (tmp = 1, intel_gt_pm_get_if_awake(gt); tmp; \
+	     intel_gt_pm_put(gt), tmp = 0)
+
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
 	return intel_wakeref_wait_for_idle(&gt->wakeref);
-- 
2.36.1

