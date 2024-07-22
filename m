Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19C939519
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E55C10E316;
	Mon, 22 Jul 2024 21:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayq0eLm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F74910E31A;
 Mon, 22 Jul 2024 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682422; x=1753218422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLDzciEero0wXQ8D8VOvwQtfDeWAgDoyzgMa/VmjAO0=;
 b=ayq0eLm4dOQ63UgybPcMuIHMPb/jgpaz2xDrK7y9Ik3iqg2XmYd8z3g/
 8MecdBh9THoI9NMNFF1vcYaSZA+ZmQgxG+jfOX6lFob2uEOk9afyUeFEw
 bx/Ypcxe9rfYFIoA3pUYSmwu/mShofVZg/k2kitYwNu2lo7L0maY5Gs2E
 nHrL0PCtcmxr0LmhMHw4iY8NFD/GOZakVuMUr9BH8kCH4h5DoPOSgGqUs
 TXLOTOPUoYURDiTEyHPcS6NHGsrcTGPEPQ3ZtuEbNIE/SsvNLRb32NdSo
 6vJEmF2Dbki+FWnX/R4yxABdBCDxjE4NyhjBhrJ4Ysh3tq2PLUItdepF7 A==;
X-CSE-ConnectionGUID: 8yi4m6pfQaGqGC5Sy+CXkw==
X-CSE-MsgGUID: me2r1/LpTKSgkO0uNv6HJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428303"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:01 -0700
X-CSE-ConnectionGUID: hu99ZmEUQSqsTKwyznoSWg==
X-CSE-MsgGUID: Nmi7OYq1T/WIR85QVowNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653292"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/7] drm/i915/pmu: Use event_to_pmu()
Date: Mon, 22 Jul 2024 14:06:44 -0700
Message-ID: <20240722210648.80892-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722210648.80892-1-lucas.demarchi@intel.com>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915 pointer is not needed in this function and all the others simply
calculate the i915_pmu container based on the event->pmu. Follow the
same logic as in other functions.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index cb5f6471ec6e..3a8bd11b87e7 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -820,15 +820,14 @@ static void i915_pmu_event_start(struct perf_event *event, int flags)
 
 static void i915_pmu_event_stop(struct perf_event *event, int flags)
 {
-	struct drm_i915_private *i915 =
-		container_of(event->pmu, typeof(*i915), pmu.base);
-	struct i915_pmu *pmu = &i915->pmu;
+	struct i915_pmu *pmu = event_to_pmu(event);
 
 	if (pmu->closed)
 		goto out;
 
 	if (flags & PERF_EF_UPDATE)
 		i915_pmu_event_read(event);
+
 	i915_pmu_disable(event);
 
 out:
-- 
2.43.0

