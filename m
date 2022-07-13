Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2D5732AB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4121198AB5;
	Wed, 13 Jul 2022 09:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581C498A72;
 Wed, 13 Jul 2022 09:30:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97258B81D74;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57759C385A9;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=YZ+rekclkz0PmGszpxR0kr32E1UilqxXVk+khwXJKBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8IOZ3Ei1SBs13Sjy4Qij9irRpN3hW3b5vUuhYpTdLu9YQnrMZ+KvNs9AvdvMe6UI
 NHuwsSDqWB7ri0Bx0sQy1ijNvoPVuEpGfcZ5r6byyZFgRjrEP3yLbfmWG5e9GcgHqw
 7ZvxwqkQ8W1a0Ad4N0MD+8Jkv+Ult97rVKirgOazolj+OCq67AiBex+zn1KiqYiByF
 Q0Ka+07d8H8G70Mh19WMggzLLZ5Varl8kkO3Q+O0Vcdx5lC0b5nQMrTGCNmQVvcU2P
 mKtdOGXdcUuyAeKlnp4T1QwuF+zAiHcmpLM2E8mynyFRN6v1K74ToaWjd/0oLykTUV
 ji0jhwbdFgdrg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050MB-Vc;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 19/21] drm/i915/gt: document TLB cache invalidation functions
Date: Wed, 13 Jul 2022 10:30:16 +0100
Message-Id: <de44277b998031453b7d69d73dbbd07b52a138b9.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a description for the kAPI functions inside intel_tlb.c.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_tlb.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
index 15ed83226676..aa2e0086ae88 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -146,6 +146,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
 }
 
+/**
+ * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
+ * @gt: GT structure
+ * @seqno: sequence number
+ *
+ * Do a full TLB cache invalidation if the @seqno is bigger than the last
+ * full TLB cache invalidation.
+ *
+ * Note:
+ * The TLB cache invalidation logic depends on GEN-specific registers.
+ * It currently supports GEN8 to GEN12 and GuC-based TLB cache invalidation.
+ */
 void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
 {
 	intel_wakeref_t wakeref;
@@ -220,6 +232,17 @@ static bool mmio_invalidate_range(struct intel_gt *gt, u64 start, u64 length)
 	return err == 0;
 }
 
+/**
+ * intel_gt_invalidate_tlb_range - do full TLB cache invalidation
+ * @gt: GT structure
+ * @start: range start
+ * @length: range length
+ *
+ * Do a selected TLB cache invalidation on a range pointed by @start
+ * with @length size.
+ *
+ * Only some GuC-based GPUs can do a selective cache invalidation.
+ */
 bool intel_gt_invalidate_tlb_range(struct intel_gt *gt,
 				   u64 start, u64 length)
 {
@@ -247,12 +270,25 @@ bool intel_gt_invalidate_tlb_range(struct intel_gt *gt,
 	return true;
 }
 
+/**
+ * intel_gt_init_tlb - initialize TLB-specific vars
+ * @gt: GT structure
+ *
+ * TLB cache invalidation logic internally uses some resources that require
+ * initialization. Should be called before doing any TLB cache invalidation.
+ */
 void intel_gt_init_tlb(struct intel_gt *gt)
 {
 	mutex_init(&gt->tlb.invalidate_lock);
 	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
 }
 
+/**
+ * intel_gt_fini_tlb - initialize TLB-specific vars
+ * @gt: GT structure
+ *
+ * Frees any resources needed by TLB cache invalidation logic.
+ */
 void intel_gt_fini_tlb(struct intel_gt *gt)
 {
 	mutex_destroy(&gt->tlb.invalidate_lock);
-- 
2.36.1

