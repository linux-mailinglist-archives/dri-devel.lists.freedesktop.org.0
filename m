Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFEAE1A1B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 13:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B92610E222;
	Fri, 20 Jun 2025 11:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jNh4RC7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A106E10E222;
 Fri, 20 Jun 2025 11:36:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6282BA51353;
 Fri, 20 Jun 2025 11:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A012C4CEE3;
 Fri, 20 Jun 2025 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750419410;
 bh=KMV6pV/kGxSzG8IdFs7/nXJZ+xMhJveIsIX/RawZA4o=;
 h=From:To:Cc:Subject:Date:From;
 b=jNh4RC7lwRhwHCxEGVdG3PS/1a/mttemmrnH4Zv4FxMJjNVyRFYEXIg1C4c7cOh95
 HarbS94f0MzwTeEH1bkbOA80EpE3PidriD8+V+r79fS30nCfZhmBnmHzYKlMH7vamw
 0A2mho1nNx8oyTqbK5vH0XWQN9oHZYoK6O1uLoxlnPYJVPizbh4eSz/R0V+ffxKtB3
 RoQ69taf3255fQT4cGhCAH1FZdp65OiAKAJH4z1HYV83aRNEBqpgVaV8qSKW7XuslB
 b1PDCiX6chfwd+YnmDZHBn6BoOOr6qEzv/lf/QEUEj9w6yzxWztC3F0xHpCct23T4X
 mDmk9r4Rw9JBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Nitin Gote <nitin.r.gote@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 renjun wang <renjunw0@foxmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: reduce stack usage in igt_vma_pin1()
Date: Fri, 20 Jun 2025 13:36:38 +0200
Message-Id: <20250620113644.3844552-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The igt_vma_pin1() function has a rather high stack usage, which gets
in the way of reducing the default warning limit:

In file included from drivers/gpu/drm/i915/i915_vma.c:2285:
drivers/gpu/drm/i915/selftests/i915_vma.c:257:12: error: stack frame size (1288) exceeds limit (1280) in 'igt_vma_pin1' [-Werror,-Wframe-larger-than]

There are two things going on here:

 - The on-stack modes[] array is really large itself and gets constructed
   for every call, using around 1000 bytes itself depending on the configuration.

 - The call to i915_vma_pin() gets inlined and adds another 200 bytes for
   the i915_gem_ww_ctx structure since commit 7d1c2618eac5 ("drm/i915: Take
   reservation lock around i915_vma_pin.")

The second one is easy enough to change, by moving the function into the
appropriate .c file. Since it is already large enough to not always be
inlined, this seems like a good idea regardless, reducing both the code size
and the internal stack usage of each of its 67 callers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/i915_vma.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h | 22 ++--------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 632e316f8b05..25e97031d76e 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1607,6 +1607,26 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	return err;
 }
 
+int i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
+{
+	struct i915_gem_ww_ctx ww;
+	int err;
+
+	i915_gem_ww_ctx_init(&ww, true);
+retry:
+	err = i915_gem_object_lock(vma->obj, &ww);
+	if (!err)
+		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&ww);
+		if (!err)
+			goto retry;
+	}
+	i915_gem_ww_ctx_fini(&ww);
+
+	return err;
+}
+
 static void flush_idle_contexts(struct intel_gt *gt)
 {
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 6a6be8048aa8..14ccbd0636bb 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -289,26 +289,8 @@ int __must_check
 i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		u64 size, u64 alignment, u64 flags);
 
-static inline int __must_check
-i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
-{
-	struct i915_gem_ww_ctx ww;
-	int err;
-
-	i915_gem_ww_ctx_init(&ww, true);
-retry:
-	err = i915_gem_object_lock(vma->obj, &ww);
-	if (!err)
-		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
-	if (err == -EDEADLK) {
-		err = i915_gem_ww_ctx_backoff(&ww);
-		if (!err)
-			goto retry;
-	}
-	i915_gem_ww_ctx_fini(&ww);
-
-	return err;
-}
+int __must_check
+i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags);
 
 int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		  u32 align, unsigned int flags);
-- 
2.39.5

