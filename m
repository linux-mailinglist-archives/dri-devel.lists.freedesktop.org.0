Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA47796FD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 20:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83A10E6DF;
	Fri, 11 Aug 2023 18:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45510E6D5;
 Fri, 11 Aug 2023 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691778016; x=1723314016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TATJCZJmuRoU5HWEYF1oD5R8Kof9lSVkDwzbvT4icTk=;
 b=hfXRSZ7vJgHXLp0Ty/belgAKXTKZEOCl2BNYI5uy31c50jqLL6dVlrBD
 2uVqsgirYHIWdln4fkx/2oHBMqceAnWEaSR97d6MRvz3kkYr1ImypHwzl
 HaQhuinX5R9i1xHi12HUgPRdQm83kQeZvApTZMSsX67Z9LjUTP2gMQ57P
 Apcct/O5Xv20vcRGOStGPmlag3yDCXMxxXjjOmNte8qP3iW0t1/bxSZmU
 EUPXCNc+8UadyK0evVr8ctAWDxf++pY1Vol5Vv7alGDhIksmRs+Ox4SxT
 DbzpB0ZEopmU/XRItEX9Z8r4Lkazleh2pvY5aWcpTJ+3GAjhUHgZZzpAI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369202384"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="369202384"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 11:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682618907"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="682618907"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 11:20:15 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Date: Fri, 11 Aug 2023 11:20:11 -0700
Message-Id: <20230811182011.546026-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This attempts to avoid circular locking dependency between flush delayed
work and intel_gt_reset.
When intel_gt_reset was called, task will hold a lock.
To cacel delayed work here, the _sync version will also acquire a lock,
which might trigger the possible cirular locking dependency warning.
When intel_gt_reset called, reset_in_progress flag will be set, add code
to check the flag, call async verion if reset is in progress.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a0e3ef1c65d2..600388c849f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
 
 static void guc_cancel_busyness_worker(struct intel_guc *guc)
 {
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	/*
+	 * When intel_gt_reset was called, task will hold a lock.
+	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
+	 * trigger the possible cirular locking dependency warning.
+	 * Check the reset_in_progress flag, call async verion if reset is in progress.
+	 */
+	if (guc_to_gt(guc)->uc.reset_in_progress)
+		cancel_delayed_work(&guc->timestamp.work);
+	else
+		cancel_delayed_work_sync(&guc->timestamp.work);
 }
 
 static void __reset_guc_busyness_stats(struct intel_guc *guc)
-- 
2.34.1

