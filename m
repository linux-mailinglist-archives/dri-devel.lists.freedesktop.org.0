Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9231E452E
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 16:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D158999E;
	Wed, 27 May 2020 14:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F978999E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 14:05:44 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Myevl-1ioaSD1TtV-00z0dt; Wed, 27 May 2020 16:05:28 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH 1/3] drm/i915/pmu: avoid an maybe-uninitialized warning
Date: Wed, 27 May 2020 16:05:08 +0200
Message-Id: <20200527140526.1458215-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:iA/oVTFZbT0EcafqZRx1usz2+oWll8ShFOXyKlbH3L+E47gvF24
 rqK1c0Xjr6CQW/9Sy+2v5OER+rRGSk92oqcKN3TTYYe1sGIBdezAIm9CdYAHoiZtdDxhMQI
 s6KkiyxtAAfHu/e/ASnv9FV7L+EgSb4wsnxyLn0niqe6JnEiNM7wwJk2MjrmrOK2vTbuPmB
 ObhVD+c+lb9Xai3ZpB3eA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n4SCQDCGfV4=:ogzOYkn3538mcJo7f6pEXn
 KqUMsB2e549l4uTNcu0TMs57ViYWWma7nnmTkQUgk5pirC0JZJ8I9o1d/3GnQuN90omKJ8/in
 f6WvQv5vfh1kF6kkMNB8TdkmDJiiWWxQsD+aDh8oa7aLUvTFBopx/gGolFh67VhzpalNT4kYK
 5io+ssP/9LSgE173ood5obfWLOz3uPkNzRM//eq3ImMu1sPQAhVYjU97FUs8+7HDjg3hnAnnc
 VGNSKc0IDaNLcFif0+39tHVzQyECePxPsAI6XrVD4DS9h2sMSEyYhb08Fx3sXMBqTdeJ8Esn0
 gHAtyuS2nxpp0womDgWcqxjT8QMMMgZdhrpQudjek57HqwqYpdzsMNdZ0lL2dK1babZq2ZHBV
 R3RpfJr/uNRK6n12I3hSn8PVptJ1YMquHWlh5EhSwfFyJJXrV2C1jgoj+eUHixetnQHYTArum
 mGfEc/Szlj/C810ABru1nVLtHhIapRHTL8jZdaWyiut5bvbgvIt6ZcjP+uHnY/NAojhI0wOnY
 reFYaK6g0U0s52KSBorCrVz6HZtO3N3RGLFiDjRuAJOzIj9wPFxiLR/IjJeehijl1rUw9eDLD
 1YLh45rAQQjojtxacOLrpj1oPPbOJU0Eb4umkPMHbVQh9wFnNGtNVKoqbuv9KyWZjFrOSOv/7
 Mudl4HiW8d4AUmEwLrXvD1gCO40Vi5hhkSs/ZmEq9nYBxFyukyckpsn7q4w9jB00vOP/uZT8n
 CbjVviFDTK9qvvXXLv6ZHukjL2YT/aETMODlRWwbqbKN5KJFcgfoHU2msQ/UYzw8t63mesWnI
 27fZW9RLueux46y0revxiSAGcH0BbUJminol69qJsIw52HXlh8=
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
Cc: Andi Shyti <andi.shyti@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conditional spinlocks make it hard for gcc and for lockdep to
follow the code flow. This one causes a warning with at least
gcc-9 and higher:

In file included from include/linux/irq.h:14,
                 from drivers/gpu/drm/i915/i915_pmu.c:7:
drivers/gpu/drm/i915/i915_pmu.c: In function 'i915_sample':
include/linux/spinlock.h:289:3: error: 'flags' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  289 |   _raw_spin_unlock_irqrestore(lock, flags); \
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/i915_pmu.c:288:17: note: 'flags' was declared here
  288 |   unsigned long flags;
      |                 ^~~~~

Split out the part between the locks into a separate function
for readability and to let the compiler figure out what the
logic actually is.

Fixes: d79e1bd676f0 ("drm/i915/pmu: Only use exclusive mmio access for gen7")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have no idea why I see three separate issues like this pop up in i915,
there are not a lot of them elsewhere.

 drivers/gpu/drm/i915/i915_pmu.c | 84 ++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index e991a707bdb7..962ded9ce73f 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -269,12 +269,48 @@ static bool exclusive_mmio_access(const struct drm_i915_private *i915)
 	return IS_GEN(i915, 7);
 }
 
+static void engine_sample(struct intel_engine_cs *engine, unsigned int period_ns)
+{
+	struct intel_engine_pmu *pmu = &engine->pmu;
+	bool busy;
+	u32 val;
+
+	val = ENGINE_READ_FW(engine, RING_CTL);
+	if (val == 0) /* powerwell off => engine idle */
+		return;
+
+	if (val & RING_WAIT)
+		add_sample(&pmu->sample[I915_SAMPLE_WAIT], period_ns);
+	if (val & RING_WAIT_SEMAPHORE)
+		add_sample(&pmu->sample[I915_SAMPLE_SEMA], period_ns);
+
+	/* No need to sample when busy stats are supported. */
+	if (intel_engine_supports_stats(engine))
+		return;
+
+	/*
+	 * While waiting on a semaphore or event, MI_MODE reports the
+	 * ring as idle. However, previously using the seqno, and with
+	 * execlists sampling, we account for the ring waiting as the
+	 * engine being busy. Therefore, we record the sample as being
+	 * busy if either waiting or !idle.
+	 */
+	busy = val & (RING_WAIT_SEMAPHORE | RING_WAIT);
+	if (!busy) {
+		val = ENGINE_READ_FW(engine, RING_MI_MODE);
+		busy = !(val & MODE_IDLE);
+	}
+	if (busy)
+		add_sample(&pmu->sample[I915_SAMPLE_BUSY], period_ns);
+}
+
 static void
 engines_sample(struct intel_gt *gt, unsigned int period_ns)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
+	unsigned long flags;
 
 	if ((i915->pmu.enable & ENGINE_SAMPLE_MASK) == 0)
 		return;
@@ -283,53 +319,17 @@ engines_sample(struct intel_gt *gt, unsigned int period_ns)
 		return;
 
 	for_each_engine(engine, gt, id) {
-		struct intel_engine_pmu *pmu = &engine->pmu;
-		spinlock_t *mmio_lock;
-		unsigned long flags;
-		bool busy;
-		u32 val;
-
 		if (!intel_engine_pm_get_if_awake(engine))
 			continue;
 
-		mmio_lock = NULL;
-		if (exclusive_mmio_access(i915))
-			mmio_lock = &engine->uncore->lock;
-
-		if (unlikely(mmio_lock))
-			spin_lock_irqsave(mmio_lock, flags);
-
-		val = ENGINE_READ_FW(engine, RING_CTL);
-		if (val == 0) /* powerwell off => engine idle */
-			goto skip;
-
-		if (val & RING_WAIT)
-			add_sample(&pmu->sample[I915_SAMPLE_WAIT], period_ns);
-		if (val & RING_WAIT_SEMAPHORE)
-			add_sample(&pmu->sample[I915_SAMPLE_SEMA], period_ns);
-
-		/* No need to sample when busy stats are supported. */
-		if (intel_engine_supports_stats(engine))
-			goto skip;
-
-		/*
-		 * While waiting on a semaphore or event, MI_MODE reports the
-		 * ring as idle. However, previously using the seqno, and with
-		 * execlists sampling, we account for the ring waiting as the
-		 * engine being busy. Therefore, we record the sample as being
-		 * busy if either waiting or !idle.
-		 */
-		busy = val & (RING_WAIT_SEMAPHORE | RING_WAIT);
-		if (!busy) {
-			val = ENGINE_READ_FW(engine, RING_MI_MODE);
-			busy = !(val & MODE_IDLE);
+		if (exclusive_mmio_access(i915)) {
+			spin_lock_irqsave(&engine->uncore->lock, flags);
+			engine_sample(engine, period_ns);
+			spin_unlock_irqrestore(&engine->uncore->lock, flags);
+		} else {
+			engine_sample(engine, period_ns);
 		}
-		if (busy)
-			add_sample(&pmu->sample[I915_SAMPLE_BUSY], period_ns);
 
-skip:
-		if (unlikely(mmio_lock))
-			spin_unlock_irqrestore(mmio_lock, flags);
 		intel_engine_pm_put_async(engine);
 	}
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
