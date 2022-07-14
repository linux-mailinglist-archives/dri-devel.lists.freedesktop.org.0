Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA124574CED
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E019A112988;
	Thu, 14 Jul 2022 12:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E511128B7;
 Thu, 14 Jul 2022 12:06:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BAA461E51;
 Thu, 14 Jul 2022 12:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DAFC341CD;
 Thu, 14 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657800390;
 bh=EJ+Eu+AlHvcZJVhLfS1AaAv6RAV4GPKJyWGwKlKkeUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KhQqg2fSnkzof9xdkPDLEW0SuUqmT21eCNQ0W/On3Zoj6IPEGrRx7Mwrlvk5Pw8qG
 aaKmh/3yvCyuTcW4g4obnqgHongo+eGO1FP3irUqMPEZCi6K6VAsuK3t3JYfM+W9TG
 1FQkM1kL2E34CpzmVmG5MjgiX4kb+g1N4gKIyEpy+1eAx9Ax4qjS0fnN8jYdb+XDvu
 FTPLlzQi2Z44DGXLjSUXRpzencFzneG6K8lfSKmymglJPJSc3rvTHJXWkvWbfpK+aC
 hh9InPeX8QGT9+10ANez2nYyuMvIg2WUW4/PkBa8twpioubgnq5K7KndGnYmYhYxVL
 7vtPeRfygHsoQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBxbw-0059sz-0o;
 Thu, 14 Jul 2022 13:06:28 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 11/21] drm/i915/guc: document the TLB invalidation struct
 members
Date: Thu, 14 Jul 2022 13:06:16 +0100
Message-Id: <f308a3545cb5ca5e18357547b74a0f26510648f8.1657800199.git.mchehab@kernel.org>
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/

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

