Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1749458268A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 14:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DC2C5E3F;
	Wed, 27 Jul 2022 12:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B565EC5D4F;
 Wed, 27 Jul 2022 12:30:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDE42B82078;
 Wed, 27 Jul 2022 12:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF7FC43470;
 Wed, 27 Jul 2022 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658925000;
 bh=lOE1MGL9bb8yddRydxM1fpZY6tycwyxv4aHoWOD7OZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ESBCJw8vK8aZGD73cSuSmAif9H+WC+AkurHUu18BuZR1aeJbhJxsymz/0keBKJ9pR
 VHSD0tmiKMhV6hTvDoyO63rDqE4UleB2ZYJ/KCpEo1B28+091qu/qpXZcyPJmWkKWI
 G3KD0wU/CVkY8RSXRTolnSLky3yxMoFdReL0PeSandZ5rv3U5o3nd16h3RbjvIpOMX
 1yLwu4UudpUcHHyn9K+uikbxV3NLRBisCclgzR0CDvqpLpQyKakvGgJey/tveSM+7/
 ftQZUhHca7Zb81zIHQgHS7yMz4qxf/EOnIeSlXblk1wTX+E3KuUs/pqb685wu3p27X
 lY1caumfDn5AA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oGgAo-003xmH-9n;
 Wed, 27 Jul 2022 14:29:58 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 3/6] drm/i915/gt: Invalidate TLB of the OA unit at TLB
 invalidations
Date: Wed, 27 Jul 2022 14:29:53 +0200
Message-Id: <59724d9f5cf1e93b1620d01b8332ac991555283d.1658924372.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1658924372.git.mchehab@kernel.org>
References: <cover.1658924372.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Ensure that the TLB of the OA unit is also invalidated
on gen12 HW, as just invalidating the TLB of an engine is not
enough.

Cc: stable@vger.kernel.org
Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 0/6] at: https://lore.kernel.org/all/cover.1658924372.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_gt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index c4d43da84d8e..1d84418e8676 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -11,6 +11,7 @@
 #include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
+#include "i915_perf_oa_regs.h"
 #include "intel_context.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_regs.h"
@@ -969,6 +970,15 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 		awake |= engine->mask;
 	}
 
+	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
+	if (awake &&
+	    (IS_TIGERLAKE(i915) ||
+	     IS_DG1(i915) ||
+	     IS_ROCKETLAKE(i915) ||
+	     IS_ALDERLAKE_S(i915) ||
+	     IS_ALDERLAKE_P(i915)))
+		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
+
 	spin_unlock_irq(&uncore->lock);
 
 	for_each_engine_masked(engine, gt, awake, tmp) {
-- 
2.36.1

