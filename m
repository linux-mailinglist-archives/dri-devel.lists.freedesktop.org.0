Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A277754CCD3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 17:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A7E112241;
	Wed, 15 Jun 2022 15:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8A4112185;
 Wed, 15 Jun 2022 15:27:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EF2DB81F0C;
 Wed, 15 Jun 2022 15:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDEDC34115;
 Wed, 15 Jun 2022 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655306866;
 bh=d5dFQ9NHsAkSm+gLQzVN8kPNqSNsxZsVoyo0jFhjNL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LXQf8xhEcd/2SP9lwnz0ukumi2OpBNyaaWzqoWEweJNDGmokgwGwt3y1sppwNHyQ7
 Rzxzuq4qly/kJRh9TpXSJs/vZ4SSwYySPo6oCtR3lSb9i2ZGukCYt4ukqKgYmFIxCi
 4RYwiBl2BDFOyJEqVGqfPdTjg/wDJ2XcvxfPYlQ/2GwAx3ebFWcSy330pPk76hRvDv
 m1eLCgWxxKsmve7jSKKvt972JvLb/DQ1dXV3QlwxS2UNwbNxjFozXlJyyu8o8WPTFV
 KO/BfNu64ZOcJb9+Gdm3qMvPUeiwovYMC/uqNJ7oIVn1Y+/K4J48asEamxxyleAP/i
 6fvv0mYBklH9w==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o1Uvm-00A4Jj-EX;
 Wed, 15 Jun 2022 16:27:42 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 3/6] drm/i915/gt: Skip TLB invalidations once wedged
Date: Wed, 15 Jun 2022 16:27:37 +0100
Message-Id: <9d9e663ca8e97becf04e1d4c8cb8a9a1f397a5f1.1655306128.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655306128.git.mchehab@kernel.org>
References: <cover.1655306128.git.mchehab@kernel.org>
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, mauro.chehab@linux.intel.com,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Skip all further TLB invalidations once the device is wedged and
had been reset, as, on such cases, it can no longer process instructions
on the GPU and the user no longer has access to the TLB's in each engine.

Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1655306128.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_gt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 61b7ec5118f9..fb4fd5273ca4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1226,6 +1226,9 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
 		return;
 
+	if (intel_gt_is_wedged(gt))
+		return;
+
 	if (GRAPHICS_VER(i915) == 12) {
 		regs = gen12_regs;
 		num = ARRAY_SIZE(gen12_regs);
-- 
2.36.1

