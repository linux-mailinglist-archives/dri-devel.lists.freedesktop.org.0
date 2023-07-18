Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCA757DE3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EF310E35A;
	Tue, 18 Jul 2023 13:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A9910E356;
 Tue, 18 Jul 2023 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689687588; x=1721223588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2W2zKhuiUy4tAQUfR6m0wffGeonAOUDkEcVecjin+SI=;
 b=Z3t6iDqVDSPXtJCDsViZhsTRf0WvHFLoVUnRDOfSimDYDdMkiSGDew8n
 8IEztKrS/aPuiTJcH0GwDlv8n6u38j78AlQf+P0t7JvSpHmESMmLVdGqe
 UUq/yPwI58rIRC3OriVa5ojiSZvwLFW75Vgv1NjZupZz56B4t+/Pg7T2+
 M5sa2vTNqJ624o2JHFirzwp4Syk1oHn/w29heTYDpmKSdwfaob8wYJfHQ
 YpmYs9H3vJGRnAa9Lqd/AmwUQwTTFosyNvPoLrtH2j9j76+e/psW3g7Cq
 Y3CzzbGDUqoC0IPqNDfFt4+WFSKPVCs8YXTVvHmKyp4yrfLLxcKmzWjlJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345800228"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="345800228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847706302"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="847706302"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:39:26 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 4/9] drm/i915/gt: Ensure memory quiesced before invalidation
Date: Tue, 18 Jul 2023 15:38:31 +0200
Message-Id: <20230718133836.574781-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230718133836.574781-1-andi.shyti@linux.intel.com>
References: <20230718133836.574781-1-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

All memory traffic must be quiesced before requesting
an aux invalidation on platforms that use Aux CCS.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 0d4d5e0407a2d..6fd1f254b84a2 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -202,7 +202,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
-	if (mode & EMIT_FLUSH) {
+	/*
+	 * Aux invalidations on Aux CCS platforms require
+	 * memory traffic is quiesced prior.
+	 */
+	if (mode & EMIT_FLUSH || HAS_AUX_CCS(engine->i915)) {
 		u32 flags = 0;
 		int err;
 		u32 *cs;
-- 
2.40.1

