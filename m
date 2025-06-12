Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45312AD6AD1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79A10E7B1;
	Thu, 12 Jun 2025 08:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnVJcQfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878F910E7B1;
 Thu, 12 Jun 2025 08:30:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8334D629E5;
 Thu, 12 Jun 2025 08:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C4CC4CEEA;
 Thu, 12 Jun 2025 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749717055;
 bh=mSPz4JyDiTbHlIZY2LoFchrSDTmvR2H2ufTA+zC7mXY=;
 h=From:To:Cc:Subject:Date:From;
 b=bnVJcQfGHwR78iMhMGJ3/c5moT+Bn2Ma2Q6g2tWpN6A90vUf3ykTM/Z5mq/OLFJ2w
 e8S8Y5lPnV454HZORUiUUUITukB5zxDoAcPrs3eRl9QXwABr2M+o5Y0MmU/Y+7+5m+
 vYpCBJeqgNYlyaTbucxJZ9lSv7W2ONvRf0XsDiyVYkqdTmkOYSkMF7w/j2pCUi+ZWf
 n7Bqwrg6Vl7SSRm33QP+IPAyMJqwZqGLeIEyXSkl/PXTaxrKnQnTU4UdEv6VvjMPWr
 N+iHNHH6i9K9qHAjHpljGaQDXOStzWTqUqs+lA0FjVk4jObixznLx9LY+r6O84fxD7
 W6OXF/irQpwNw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net
Cc: airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, tzungbi@kernel.org
Subject: [PATCH v2] drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled
Date: Thu, 12 Jun 2025 08:30:23 +0000
Message-ID: <20250612083023.562585-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_pmu.c may fail to build with GCOV and AutoFDO enabled.

../drivers/gpu/drm/i915/i915_pmu.c:116:3: error: call to '__compiletime_assert_487' declared with 'error' attribute: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
  116 |                 BUILD_BUG_ON(bit >
      |                 ^

Here is a way to reproduce the issue:
$ git checkout v6.15
$ mkdir build
$ ./scripts/kconfig/merge_config.sh -O build -n -m <(cat <<EOF
CONFIG_DRM=y
CONFIG_PCI=y
CONFIG_DRM_I915=y

CONFIG_PERF_EVENTS=y

CONFIG_DEBUG_FS=y
CONFIG_GCOV_KERNEL=y
CONFIG_GCOV_PROFILE_ALL=y

CONFIG_AUTOFDO_CLANG=y
EOF
)
$ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
       olddefconfig
$ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
       CLANG_AUTOFDO_PROFILE=...PATH_TO_SOME_AFDO_PROFILE... \
       drivers/gpu/drm/i915/i915_pmu.o

Although not super sure what happened, by reviewing the code, it should
depend on `__builtin_constant_p(bit)` directly instead of assuming
`__builtin_constant_p(config)` makes `bit` a builtin constant.

Also fix a nit, to reuse the `bit` local variable.

Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
(https://patchwork.freedesktop.org/patch/656115/?series=149617&rev=1)
- Collect R-b tag from Nathan.
- Rebase to v6.16-rc1.

 drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index e5a188ce3185..990bfaba3ce4 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -112,7 +112,7 @@ static u32 config_mask(const u64 config)
 {
 	unsigned int bit = config_bit(config);
 
-	if (__builtin_constant_p(config))
+	if (__builtin_constant_p(bit))
 		BUILD_BUG_ON(bit >
 			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
 							 enable)) - 1);
@@ -121,7 +121,7 @@ static u32 config_mask(const u64 config)
 			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
 							 enable)) - 1);
 
-	return BIT(config_bit(config));
+	return BIT(bit);
 }
 
 static bool is_engine_event(struct perf_event *event)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

