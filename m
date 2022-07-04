Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE04565B92
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA8B10F083;
	Mon,  4 Jul 2022 16:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490F910E00A;
 Mon,  4 Jul 2022 08:09:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CFC461196;
 Mon,  4 Jul 2022 08:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BC9C385A5;
 Mon,  4 Jul 2022 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656922176;
 bh=D5q5Dno29GppKOQ4ew8H36+AhOTbVVxHP3lYtieRXwI=;
 h=From:To:Cc:Subject:Date:From;
 b=Rt9N2X9DLYlkxitVXy4r2YmnjlAVgKS3pMkFFca2T7LESc7nWaOcUDH+pdUhNJ1Gk
 Pe6J/79+S6KbN7D68GNqUfDRcced0npvnGAYJGbXhyOsoNozsi2LMVUk86V7IV+qn9
 fvOtNnGmRxRZYmvgBrNzA1htJxc2SS3gejPLBtcaRW0HdYtqNeQUWYzMDONrIWStG1
 ExYMdaQxD5HD3bUAZg2Lz/tTCRPL+1DCIhy51Ze8y/OyOlsAAe43kNb+Lpnu0OQghB
 zZ57sB+JWEZ7VyAT+nSrwGb25Hxu96mb0yGSTiS807hPdOYM5HoNe3/bWQQ95Irh47
 6kj3sJkEmEuXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o8H9A-009OaV-Qi;
 Mon, 04 Jul 2022 09:09:32 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 0/2] Fix TLB invalidate issues with Broadwell
Date: Mon,  4 Jul 2022 09:09:27 +0100
Message-Id: <cover.1656921701.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915 selftest hangcheck is causing the i915 driver timeouts, as reported
by Intel CI bot:

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

Bisecting the issue, the patch that introduced the regression is:

    7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")

Reverting it fix the issues, but introduce other problems, as TLB
won't be invalidated anymore. So, instead, let's fix the root cause.

It turns that the TLB flush logic ends conflicting with i915 reset,
which is called during selftest hangcheck. So, the TLB cache should
be serialized together with i915 reset.

Tested on an Intel NUC5i7RYB with an i7-5557U Broadwell CPU.

v3:
- Removed the logic that would check if the engine is awake before doing
  TLB flush invalidation as backporting PM logic up to Kernel 4.x could be
  too painful. After getting this one merged, I'll submit a separate patch
  with the PM awake logic.

v2:

- Reduced to bare minimum fixes, as this shoud be backported deeply
  into stable.


Chris Wilson (2):
  drm/i915/gt: Serialize GRDOM access between multiple engine resets
  drm/i915/gt: Serialize TLB invalidates with GT resets

 drivers/gpu/drm/i915/gt/intel_gt.c    | 15 ++++++++++-
 drivers/gpu/drm/i915/gt/intel_reset.c | 37 ++++++++++++++++++++-------
 2 files changed, 42 insertions(+), 10 deletions(-)

-- 
2.36.1


