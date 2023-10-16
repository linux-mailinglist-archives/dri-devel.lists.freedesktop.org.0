Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD297CB3BA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8164810E0C6;
	Mon, 16 Oct 2023 20:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5E10E0C6;
 Mon, 16 Oct 2023 20:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 105396114A;
 Mon, 16 Oct 2023 20:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542AFC433C8;
 Mon, 16 Oct 2023 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697487018;
 bh=IP5/MhvOpJ22HR71PavNc9y5Lf1zUiBmMsVX1ID6KQ8=;
 h=From:To:Cc:Subject:Date:From;
 b=SHWV1KIhS0Yb/wjRj3WQ40LVlhMleM5nkDCeZsHluZwuliokMnSM9uUwBHXjTZvF0
 pmUYwySK4LPu0w5Dx5ic4Kbv3fejLNKmPi7LNvJM+BSkzuU/9G4oWUNwU2oqI2z8Aw
 pSZ4fIx0PfSrNM7cdS8zbPzuj1fiUHLDmNYqcSC09BfoYgJWu3U31IEbDRu8423NvU
 EDvPeNIbenW5x4qughRz//+E4TSzKr0RhFXphJbiO7sr6pfoMJBwmDSf+TZryOQtgw
 jGVqKrGL3EuQ/Pu/I48WX2Ij5kITGsyNiluM5wwGYpcAl223Otnl2tyRcY8GKVH9S9
 nkhKNxCu14y4A==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH] drm/i915/mtl: avoid stringop-overflow warning
Date: Mon, 16 Oct 2023 22:10:04 +0200
Message-Id: <20231016201012.1022812-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The newly added memset() causes a warning for some reason I could not figure out:

In file included from arch/x86/include/asm/string.h:3,
                 from drivers/gpu/drm/i915/gt/intel_rc6.c:6:
In function 'rc6_res_reg_init',
    inlined from 'intel_rc6_init' at drivers/gpu/drm/i915/gt/intel_rc6.c:610:2:
arch/x86/include/asm/string_32.h:195:29: error: '__builtin_memset' writing 16 bytes into a region of size 0 overflows the destination [-Werror=stringop-overflow=]
  195 | #define memset(s, c, count) __builtin_memset(s, c, count)
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/intel_rc6.c:584:9: note: in expansion of macro 'memset'
  584 |         memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
      |         ^~~~~~
In function 'intel_rc6_init':

Change it to an normal initializer and an added memcpy() that does not have
this problem.

Fixes: 4bb9ca7ee0745 ("drm/i915/mtl: C6 residency and C state type for MTL SAMedia")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/gt/intel_rc6.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 8b67abd720be8..7090e4be29cb6 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -581,19 +581,23 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
 
 static void rc6_res_reg_init(struct intel_rc6 *rc6)
 {
-	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
+	i915_reg_t res_reg[INTEL_RC6_RES_MAX] = {
+		[0 ... INTEL_RC6_RES_MAX - 1] = INVALID_MMIO_REG,
+	};
 
 	switch (rc6_to_gt(rc6)->type) {
 	case GT_MEDIA:
-		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
+		res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
 		break;
 	default:
-		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
-		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
-		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
-		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
+		res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
+		res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
+		res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
+		res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
 		break;
 	}
+
+	memcpy(rc6->res_reg, res_reg, sizeof(res_reg));
 }
 
 void intel_rc6_init(struct intel_rc6 *rc6)
-- 
2.39.2

