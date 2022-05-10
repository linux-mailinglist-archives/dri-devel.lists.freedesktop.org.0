Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD152265F
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 23:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85BF10E1AE;
	Tue, 10 May 2022 21:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040010E174;
 Tue, 10 May 2022 21:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652218413; x=1683754413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bIlEdmCPlaX2gZe1NITcJ2yrFM0j4MtDdH8jCnz9COE=;
 b=GQzJ8uFVQyXfs8hKtKx24Iwp6+K3cu2faGbNkpeypeHmmal70wD+IPwx
 u1cf8V6SpmBorVJXB0NRW5V536I40fGm3C3YjQbbjQg95uh3p2+RR45Oz
 sChqVNeDDGkitDm3n2BCE0AUsqygV3ZO5q/LiMQ6B8ZQEL6CAVe7O8gtL
 sU145Gqs8JdHXWTyq002F9uvn1B4nK8k+ZJu9CBMwl8CWRr6WtGOYC4K3
 I2BNPM5ME43dUfv9qK2HtOWMdlYagZ+4hfBHhKlgCdSHwf0RcrMWNa04E
 uh6CXFMNXwj7nFOLW8Z9sbZR04VqKVh5gqGzygjOnorJjuKs0siFaAyQ3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="268350062"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="268350062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 14:33:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="593769236"
Received: from brauta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 14:33:29 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/i915/gt: Ignore TLB invalidations on idle engines
Date: Tue, 10 May 2022 23:33:02 +0200
Message-Id: <20220510213304.101055-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510213304.101055-1-andi.shyti@linux.intel.com>
References: <20220510213304.101055-1-andi.shyti@linux.intel.com>
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
index bc898df7a48cc..2654133b39f22 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -55,6 +55,10 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
 	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
 
+#define with_intel_gt_pm_if_awake(gt, wf) \
+	for (tmp = 1, intel_gt_pm_get_if_awake(gt); tmp; \
+	     intel_gt_pm_put(gt), tmp = 0)
+
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
 	return intel_wakeref_wait_for_idle(&gt->wakeref);
-- 
2.36.0

