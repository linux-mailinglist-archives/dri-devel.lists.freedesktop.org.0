Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E7574CE0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D297112947;
	Thu, 14 Jul 2022 12:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172E1128ED;
 Thu, 14 Jul 2022 12:06:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9CDA61E93;
 Thu, 14 Jul 2022 12:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D899DC36AEA;
 Thu, 14 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657800390;
 bh=l/GB5qX/2omcZ+N/TSC07fnT3MCn1CCDsBQ+wUVwIL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cGp39QqOVzRiFAmlrAlssMmW8PTqmnFiYCO3uw/XVWmBkJkqewpPVSvzNhlboXLal
 DqhMIk9OIoe8IL2SyjTZLO9O+u595OgVpSj4vlTRHWcI0NzzagdN3l7mgAlO5BY3jH
 jFx/ThDJMhOMOZsJTHlj22tQdSYHIfAcH2b7L5BlC22l0p4iLg4c1raTeAdNnsFIBz
 4SWQEwtvL5anWwme5rVeXpMBgZnIUMhFR3Iuz4ygdjSUM/g9MdTWPkdiwWpyQPgIk2
 jtHe6YlAFqvq6Rs/4AziV5x7vP7CmJswP8spy6qsFqKN5+T7Sm4rM+lER3D3cE1qLZ
 hAtqKRyF8ve7A==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBxbw-0059tY-89;
 Thu, 14 Jul 2022 13:06:28 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 21/21] drm/i915/guc: document TLB cache invalidation
 functions
Date: Thu, 14 Jul 2022 13:06:26 +0100
Message-Id: <e64285be6cfed36da59864bb25dad9d9b29d30d2.1657800199.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657800199.git.mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/

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

