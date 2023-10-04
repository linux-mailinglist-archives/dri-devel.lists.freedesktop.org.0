Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E0A7B7C86
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 11:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A443E10E35E;
	Wed,  4 Oct 2023 09:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37910E0F0;
 Wed,  4 Oct 2023 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696412660; x=1727948660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=85rzEJpftgMTkqSyS1PGwBnT/UNSKB6BVDUjA6tAkCE=;
 b=NEtFcFhFSGauxPlKSxUEbrkqcxoCcCACeAoiNAPsIM7DHfcRH5KdxnIf
 xD8VDVJblpP63mbTK19NvFQOU+LAUlpQg+2w/RU28DVT57kCmO0G8V+7h
 L9oWUq/7oABfOWLFnFWYmuSIXR4e+iVN9HxzdKZ2caoJH2nRdtB0Enbdz
 VT2WNeWsSFYr8ksf/8TOucnVCIDvzy5zCrAXUf8Q+MVRhJWot+cOSLdRv
 QtZHq9CIF91WLIqZoHypxO+5BDv9uIN8NKPMGc7uvwQSIdxAulfiE4kmE
 TP9bUl4JbNoP6Acg270ZBBTMD8wwPJo/FtGtN/rgNYlSEnRgtEfUYLKZD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362469503"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="362469503"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 02:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744880645"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="744880645"
Received: from azainola-mobl3.gar.corp.intel.com (HELO intel.com)
 ([10.214.163.167])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 02:44:12 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH] drm/i915/gt: Do not treat MCR locking timeouts as errors
Date: Wed,  4 Oct 2023 11:43:57 +0200
Message-Id: <20231004094357.634895-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: gregory.f.germano@intel.com, Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MCR steering semaphore is a shared lock entry between i915
and various firmware components.

Getting the lock might sinchronize on some shared resources.
Sometimes though, it might happen that the firmware forgets to
unlock causing unnecessary noise in the driver which keeps doing
what was supposed to do, ignoring the problem.

Do not consider this failure as an error, but just print a debug
message stating that the MCR locking has been skipped.

On the driver side we still have spinlocks that make sure that
the access to the resources is serialized.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 326c2ed1d99b..51eb693df39b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
 	 * would indicate some hardware/firmware is misbehaving and not
 	 * releasing it properly.
 	 */
-	if (err == -ETIMEDOUT) {
-		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
-		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
-	}
+	if (err == -ETIMEDOUT)
+		gt_dbg(gt, "hardware MCR steering semaphore timed out");
 }
 
 /**
-- 
2.40.1

