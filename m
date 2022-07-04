Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B5565BDF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381D10F82A;
	Mon,  4 Jul 2022 16:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0FB10E174;
 Mon,  4 Jul 2022 15:20:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D5B2CE1791;
 Mon,  4 Jul 2022 15:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF2BC341CB;
 Mon,  4 Jul 2022 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656948008;
 bh=EKMqy9UhUzeu4UGTyaN4MYlGMawg+pU7MdD+1PduzY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tn9T80KrveBPSIpC30H3aHzY9JVZzbOHOUaUFN2urhnRbPgKDu64h1sM7rWHxWeBL
 dH1kB7BeN4Cvsr4VhNMPIl9B89BYXTNBI3+bYiw/++2y6iPc3o6cqw4B2dTfnVUKIX
 ro0d138h5N8O6/2eUAOHT3aEqqipE6ccFGbGls//gbkY9OD1odiACsH2ZW8FB6CYVZ
 lu2EhNo5gtkHywXkZn5LT7n2RCoz2AHU74AegOSrJSxeVlYAM6EzXxGwZiExMaR6lV
 frG5Tyhjr14syoXU8oTfxgpzxjhgYPiXZ6lpERWRinwnbcw+o3/nJkfbPqluerPWqh
 /M1bQPpsf9jcg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o8Nrp-009fKW-3V;
 Mon, 04 Jul 2022 16:20:05 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 1/2] drm/i915/gt: Serialize GRDOM access between multiple
 engine resets
Date: Mon,  4 Jul 2022 16:20:03 +0100
Message-Id: <ccc54757d89d38af35e5c5885edfb980c7b227f6.1656921701.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656921701.git.mchehab@kernel.org>
References: <cover.1656921701.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Brost <matthew.brost@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bruce Chang <yu.bruce.chang@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Don't allow two engines to be reset in parallel, as they would both
try to select a reset bit (and send requests to common registers)
and wait on that register, at the same time. Serialize control of
the reset requests/acks using the uncore->lock, which will also ensure
that no other GT state changes at the same time as the actual reset.

Cc: stable@vger.kernel.org # Up to 4.4
Reported-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 0/2] at: https://lore.kernel.org/all/cover.1656921701.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_reset.c | 37 ++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index a5338c3fde7a..c68d36fb5bbd 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -300,9 +300,9 @@ static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
 	return err;
 }
 
-static int gen6_reset_engines(struct intel_gt *gt,
-			      intel_engine_mask_t engine_mask,
-			      unsigned int retry)
+static int __gen6_reset_engines(struct intel_gt *gt,
+				intel_engine_mask_t engine_mask,
+				unsigned int retry)
 {
 	struct intel_engine_cs *engine;
 	u32 hw_mask;
@@ -321,6 +321,20 @@ static int gen6_reset_engines(struct intel_gt *gt,
 	return gen6_hw_domain_reset(gt, hw_mask);
 }
 
+static int gen6_reset_engines(struct intel_gt *gt,
+			      intel_engine_mask_t engine_mask,
+			      unsigned int retry)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&gt->uncore->lock, flags);
+	ret = __gen6_reset_engines(gt, engine_mask, retry);
+	spin_unlock_irqrestore(&gt->uncore->lock, flags);
+
+	return ret;
+}
+
 static struct intel_engine_cs *find_sfc_paired_vecs_engine(struct intel_engine_cs *engine)
 {
 	int vecs_id;
@@ -487,9 +501,9 @@ static void gen11_unlock_sfc(struct intel_engine_cs *engine)
 	rmw_clear_fw(uncore, sfc_lock.lock_reg, sfc_lock.lock_bit);
 }
 
-static int gen11_reset_engines(struct intel_gt *gt,
-			       intel_engine_mask_t engine_mask,
-			       unsigned int retry)
+static int __gen11_reset_engines(struct intel_gt *gt,
+				 intel_engine_mask_t engine_mask,
+				 unsigned int retry)
 {
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t tmp;
@@ -583,8 +597,11 @@ static int gen8_reset_engines(struct intel_gt *gt,
 	struct intel_engine_cs *engine;
 	const bool reset_non_ready = retry >= 1;
 	intel_engine_mask_t tmp;
+	unsigned long flags;
 	int ret;
 
+	spin_lock_irqsave(&gt->uncore->lock, flags);
+
 	for_each_engine_masked(engine, gt, engine_mask, tmp) {
 		ret = gen8_engine_reset_prepare(engine);
 		if (ret && !reset_non_ready)
@@ -612,17 +629,19 @@ static int gen8_reset_engines(struct intel_gt *gt,
 	 * This is best effort, so ignore any error from the initial reset.
 	 */
 	if (IS_DG2(gt->i915) && engine_mask == ALL_ENGINES)
-		gen11_reset_engines(gt, gt->info.engine_mask, 0);
+		__gen11_reset_engines(gt, gt->info.engine_mask, 0);
 
 	if (GRAPHICS_VER(gt->i915) >= 11)
-		ret = gen11_reset_engines(gt, engine_mask, retry);
+		ret = __gen11_reset_engines(gt, engine_mask, retry);
 	else
-		ret = gen6_reset_engines(gt, engine_mask, retry);
+		ret = __gen6_reset_engines(gt, engine_mask, retry);
 
 skip_reset:
 	for_each_engine_masked(engine, gt, engine_mask, tmp)
 		gen8_engine_reset_cancel(engine);
 
+	spin_unlock_irqrestore(&gt->uncore->lock, flags);
+
 	return ret;
 }
 
-- 
2.36.1

