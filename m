Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8505732A3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B00A98A95;
	Wed, 13 Jul 2022 09:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3714A98A82;
 Wed, 13 Jul 2022 09:30:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1DF9B81D7A;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6567CC341E0;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=MTo5LFJQmGswJidJuW/ez8S5JqY/AKBuALalK+cXQ8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i6VeyuVSXZZSy5+N68xJ7UWpZDSidffSrdw4xCYZWbZ1dHZz1Py5khbHhDZLWvr6O
 6DMNp8RJ0NKHZ3l9QN4O2WIrIduhDgmLtgo3Pag0KSkdB5kEU8k4bL1k/wmcZOxzTe
 GLQ94XCBNRELc17vCSdYPiiCLjHu5xHZCBalbCkPzC85Z13M3wXjxI7EE5bVJcMvzA
 kjCZJ2fK27RTma6tNZpFTPVrZrkPa4CtAiQ6tEQTXkDZYBI0qOiLTloF0VvkCEqF8o
 Lt6wZhCMdT8rzT1qmB25wyhWM2WY27BnZ0AhU/PA1zqnRRX7Hk7hSEs4Z/4p5XwvMU
 UQucqp0c2+uJg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhI-0050MJ-0i;
 Wed, 13 Jul 2022 10:30:20 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 21/21] drm/i915/guc: document TLB cache invalidation functions
Date: Wed, 13 Jul 2022 10:30:18 +0100
Message-Id: <51f5a4d4e209e27eaf82683d56e7747a183fb051.1657703926.git.mchehab@kernel.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the kAPI functions that do TLB cache
invalidation via GuC.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 52 ++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 98260a7bc90b..173833bc3a62 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -923,7 +923,14 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
 	return err;
 }
 
- /* Full TLB invalidation */
+/**
+ * intel_guc_invalidate_tlb_full - GuC full TLB invalidation
+ *
+ * @guc: the guc
+ * @mode: mode of TLB cache invalidation (heavy or lite)
+ *
+ * Use GuC to do a full TLB cache invalidation if supported.
+ */
 int intel_guc_invalidate_tlb_full(struct intel_guc *guc,
 				  enum intel_guc_tlb_inval_mode mode)
 {
@@ -943,8 +950,17 @@ int intel_guc_invalidate_tlb_full(struct intel_guc *guc,
 	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
 }
 
-/*
- * Selective TLB Invalidation for Address Range:
+/**
+ * intel_guc_invalidate_tlb_page_selective - GuC selective TLB invalidation
+ *	for an address range
+ *
+ * @guc: the guc
+ * @mode: mode of TLB cache invalidation (heavy or lite)
+ * @start: range start
+ * @length: range length
+ *
+ * Use GuC to do a selective TLB invalidation if supported.
+ *
  * TLB's in the Address Range is Invalidated across all engines.
  */
 int intel_guc_invalidate_tlb_page_selective(struct intel_guc *guc,
@@ -978,8 +994,18 @@ int intel_guc_invalidate_tlb_page_selective(struct intel_guc *guc,
 	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
 }
 
-/*
- * Selective TLB Invalidation for Context:
+/**
+ * intel_guc_invalidate_tlb_page_selective_ctx - GuC selective TLB
+ *	invalidation for a context
+ *
+ * @guc: the guc
+ * @mode: mode of TLB cache invalidation (heavy or lite)
+ * @start: range start
+ * @length: range length
+ * @ctxid: context ID
+ *
+ * Use GuC to do a selective TLB invalidation on a context if supported.
+ *
  * Invalidates all TLB's for a specific context across all engines.
  */
 int intel_guc_invalidate_tlb_page_selective_ctx(struct intel_guc *guc,
@@ -1013,8 +1039,13 @@ int intel_guc_invalidate_tlb_page_selective_ctx(struct intel_guc *guc,
 	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
 }
 
-/*
- * Guc TLB Invalidation: Invalidate the TLB's of GuC itself.
+/**
+ * intel_guc_invalidate_tlb_guc - GuC self TLB invalidation
+ *
+ * @guc: the guc
+ * @mode: mode of TLB cache invalidation (heavy or lite)
+ *
+ * Use GuC to invalidate the TLB's of GuC itself.
  */
 int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
 				 enum intel_guc_tlb_inval_mode mode)
@@ -1035,6 +1066,13 @@ int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
 	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
 }
 
+/**
+ * intel_guc_invalidate_tlb_all - GuC global TLB invalidation
+ *
+ * @guc: the guc
+ *
+ * Use GuC to do a complete TLB invalidation on all tables
+ */
 int intel_guc_invalidate_tlb_all(struct intel_guc *guc)
 {
 	u32 action[] = {
-- 
2.36.1

