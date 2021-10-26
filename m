Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7BF43B16F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85036E833;
	Tue, 26 Oct 2021 11:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B936E5A4;
 Tue, 26 Oct 2021 11:41:08 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635248467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16LhI+4TK6S3ciJa1zXFgSSoRr47T7KSWkrj5hZ8Xv4=;
 b=xY0vT4oX9+I02HcPeO3vpxNvalYG+rYh+7HUF+p7c424m+6mPLSXvQs16qhFLMZ80HSGaq
 fC1mBrBjsQ9JnYTN71Utspu0JIw2KJ32Doz8dLOdFKSrIDrQAgEgeXq0tGm+2d/Q0p4i7u
 YbHuBf1tqd/fYGWYyyCyAxYFCe3yLyFEQ/vO6E/NpowiTAj9yloIeZPNCYehI1xpSNDCWj
 n7S7J+zojzU0jcqRbL1g1ar1h8A1X74OzvXW73nBv9uqEyEHsUZsoD8bvS8/Dwpo0aQXnF
 B1ex/g8D/bpeJvDbbPhjbyq3swfELvuusu6n/K0enUMMC0FOtvvLZW0l6zopEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635248467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16LhI+4TK6S3ciJa1zXFgSSoRr47T7KSWkrj5hZ8Xv4=;
 b=R6RBOHFHD5OMxLBU4KxK9ocjzGzGYr+85zREXZtFcV3i9ulBOCss/7KG33eq8+/9wf30PY
 27xYGVRz0cVTnCDg==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 7/9] drm/i915: Don't check for atomic context on PREEMPT_RT
Date: Tue, 26 Oct 2021 13:40:58 +0200
Message-Id: <20211026114100.2593433-8-bigeasy@linutronix.de>
In-Reply-To: <20211026114100.2593433-1-bigeasy@linutronix.de>
References: <20211026114100.2593433-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

The !in_atomic() check in _wait_for_atomic() triggers on PREEMPT_RT
because the uncore::lock is a spinlock_t and does not disable
preemption or interrupts.

Changing the uncore:lock to a raw_spinlock_t doubles the worst case
latency on an otherwise idle testbox during testing. Therefore I'm
currently unsure about changing this.

Link: https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutroni=
x.de/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_=
utils.h
index 7a5925072466a..b7b56fb1e2fc7 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -344,7 +344,7 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_=
jiffies, int to_wait_ms)
 #define wait_for(COND, MS)		_wait_for((COND), (MS) * 1000, 10, 1000)
=20
 /* If CONFIG_PREEMPT_COUNT is disabled, in_atomic() always reports false. =
*/
-#if defined(CONFIG_DRM_I915_DEBUG) && defined(CONFIG_PREEMPT_COUNT)
+#if defined(CONFIG_DRM_I915_DEBUG) && defined(CONFIG_PREEMPT_COUNT) && !de=
fined(CONFIG_PREEMPT_RT)
 # define _WAIT_FOR_ATOMIC_CHECK(ATOMIC) WARN_ON_ONCE((ATOMIC) && !in_atomi=
c())
 #else
 # define _WAIT_FOR_ATOMIC_CHECK(ATOMIC) do { } while (0)
--=20
2.33.1

