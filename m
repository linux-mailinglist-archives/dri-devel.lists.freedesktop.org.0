Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C65535D08
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 11:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED99610EF48;
	Fri, 27 May 2022 09:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A62910EF48;
 Fri, 27 May 2022 09:09:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FE3C61DE6;
 Fri, 27 May 2022 09:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A761C385B8;
 Fri, 27 May 2022 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653642573;
 bh=bES5tOhJ++GeKlJcRtlWQOd/879zYMEsJsfOCJP4Bgs=;
 h=From:To:Cc:Subject:Date:From;
 b=VbS1JMH/Wlp7ysFxnOoANd9rG3VsFEAbhYnbg5CLGGdbSrVHuuztfdEmzQJfmcAK6
 Js/ZGD+gBvq34X4WCURQ5mZGTJT0ZWBrcgUzJDeR4nVPQLSXcc/pX7Flwni2MqfF03
 UHl7/msvaZ+/rK/67ti/ZHPa3yFEuzJn0dkgpJA/IFc9rKlTLbbOrwTQ1qDKIw9ZN3
 W0jjMn4AFYFxKpR+JEy5jFW8TUE71cLiDUR0PdTw5sgIKnSD9/eXPp5Yi5ma0Rc7q+
 n3K7DFRnYibsCiddsToPHvxKh5r/JyTvNQbYggBlBW8DTWnZde8LgqkIQHKbnXA8hP
 3YopCQsW4TVqw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1nuVyM-008KD3-TZ;
 Fri, 27 May 2022 11:09:30 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH] drm/i915: don't flush TLB on GEN8
Date: Fri, 27 May 2022 11:09:29 +0200
Message-Id: <b6417c5bf1b0ee8e093712264f325bd1268ed1e4.1653642514.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, mauro.chehab@linux.intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jon Bloomfield <jon.bloomfield@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915 selftest hangcheck is causing the i915 driver timeouts, as
reported by Intel CI:

	http://gfx-ci.fi.intel.com/cibuglog-ng/issuefilterassoc/24297?query_key=42a999f48fa6ecce068bc8126c069be7c31153b4

When such test runs, the only output is:

	[   68.811639] i915: Performing live selftests with st_random_seed=0xe138eac7 st_timeout=500
	[   68.811792] i915: Running hangcheck
	[   68.811859] i915: Running intel_hangcheck_live_selftests/igt_hang_sanitycheck
	[   68.816910] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
	[   68.841597] i915: Running intel_hangcheck_live_selftests/igt_reset_nop
	[   69.346347] igt_reset_nop: 80 resets
	[   69.362695] i915: Running intel_hangcheck_live_selftests/igt_reset_nop_engine
	[   69.863559] igt_reset_nop_engine(rcs0): 709 resets
	[   70.364924] igt_reset_nop_engine(bcs0): 903 resets
	[   70.866005] igt_reset_nop_engine(vcs0): 659 resets
	[   71.367934] igt_reset_nop_engine(vcs1): 549 resets
	[   71.869259] igt_reset_nop_engine(vecs0): 553 resets
	[   71.882592] i915: Running intel_hangcheck_live_selftests/igt_reset_idle_engine
	[   72.383554] rcs0: Completed 16605 idle resets
	[   72.884599] bcs0: Completed 18641 idle resets
	[   73.385592] vcs0: Completed 17517 idle resets
	[   73.886658] vcs1: Completed 15474 idle resets
	[   74.387600] vecs0: Completed 17983 idle resets
	[   74.387667] i915: Running intel_hangcheck_live_selftests/igt_reset_active_engine
	[   74.889017] rcs0: Completed 747 active resets
	[   75.174240] intel_engine_reset(bcs0) failed, err:-110
	[   75.174301] bcs0: Completed 525 active resets

After that, the machine just silently hangs.

The root cause is that the flush TLB logic is not working as
expected on GEN8.

Tested on an Intel NUC5i7RYB with an i7-5557U Broadwell CPU.

This patch partially reverts the logic by skipping GEN8 from
the TLB cache flush.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: stable@vger.kernel.org # Kernel 5.17 and upper

Fixes: 494c2c9b630e ("drm/i915: Flush TLBs before releasing backing store")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

Patch resent, as the first version was using an old email. That's what happens
when writing patches on old test machines ;-)

 drivers/gpu/drm/i915/gt/intel_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 034182f85501..7965a77e5046 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1191,10 +1191,10 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 	if (GRAPHICS_VER(i915) == 12) {
 		regs = gen12_regs;
 		num = ARRAY_SIZE(gen12_regs);
-	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
+	} else if (GRAPHICS_VER(i915) > 8 && GRAPHICS_VER(i915) <= 11) {
 		regs = gen8_regs;
 		num = ARRAY_SIZE(gen8_regs);
-	} else if (GRAPHICS_VER(i915) < 8) {
+	} else if (GRAPHICS_VER(i915) <= 8) {
 		return;
 	}
 
-- 
2.36.1


