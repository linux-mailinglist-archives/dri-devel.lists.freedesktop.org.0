Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0580D573289
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1149A98A87;
	Wed, 13 Jul 2022 09:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236FC98A6F;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8802961CB4;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A02C341D9;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=numqK226xRmWDfGwHz4d5UBb1H2QKPgM+SkFWYMj/wI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SAbvoxeX0Ggt9W/GCv9SVYOeovlGpOZD7jsBImb7PhuMpPL2NV8AhwQ++WOQu4lrB
 SUFyClvGEs4Jh5lWKYfxQh10iKBOLOeePFezzCpaFRTjbNYFrfs1Hk1hfPScgpx01h
 U8CkhvAz/xu6hzblOMsgFz0qlGbul9WvQZjHYE3/1RpfcMB1Qlr+P02h3BFpKqcjHS
 sS20FeC369U3qu6cIZ6Dgj4d1dEaOEH60H2bj5eHrKshkRYqww6UBRRXQOn1GXeKyr
 Eyf4Z9cki4QvvUYKZtXqo8fxAGZXuhkmnP5p4jUvpuEuQAuv9m7PFCVY4bfaWGQw+k
 FPVMJi2zh3RpQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050Lg-PO;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 11/21] drm/i915/guc: document the TLB invalidation struct
 members
Date: Wed, 13 Jul 2022 10:30:08 +0100
Message-Id: <b2475a1e10f643124c2bd60747051eb319fa15b4.1657703926.git.mchehab@kernel.org>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the 3 new members of struct intel_guc
that are used to handle TLB cache invalidation logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index f82a121b0838..73c46d405dc4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -76,11 +76,23 @@ struct intel_guc {
 	 */
 	atomic_t outstanding_submission_g2h;
 
-	/** @interrupts: pointers to GuC interrupt-managing functions. */
+	/**
+	 * @tlb_lookup: TLB cache invalidation lookup table.
+	 */
 	struct xarray tlb_lookup;
+
+	/**
+	 * @serial_slot: index to the latest allocated element at the
+	 * @tlb_lookup xarray.
+	 */
 	u32 serial_slot;
+
+	/**
+	 * @next_seqno: next index to be allocated at the @tlb_lookup xarray.
+	 */
 	u32 next_seqno;
 
+	/** @interrupts: pointers to GuC interrupt-managing functions. */
 	struct {
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
-- 
2.36.1

