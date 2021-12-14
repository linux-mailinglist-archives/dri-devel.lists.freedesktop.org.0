Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC7474455
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD310E535;
	Tue, 14 Dec 2021 14:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2010E455;
 Tue, 14 Dec 2021 14:03:13 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78RmYywlYeFpLA4zEe6NDOWQn/5nT4A5D3elN1GcEx4=;
 b=EwCUnC4F1/G4OtZaG2pwMn6tyOg830OhIQz9HkLRGx+O62p/AxwWAj9p9R6KGl5qYy5svc
 LSElGj8fVcuaKMYn6MW+cllyu7JWecLAXka6e+MbXZoAXdkbUQA51+WnTeCX3C+MIxAm7A
 avI2FK8Az33ah3BZOhicfJnaP6Ca75jM1Lpkoke4mW2D4mO/tuPk6Xts/XplDKSanTlskt
 uKN9gvgRUK9lpSI0IBBX8E/NHXDuzdXpwzoKtvPxurrBXf4zrdWanhilDqCe+1tg2MKEVQ
 psyF/jCbs+PmedOsp7H6jmRlmQzKabQ4zmvHIaqXDuI/Yg5PempLGFcoBFaTyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78RmYywlYeFpLA4zEe6NDOWQn/5nT4A5D3elN1GcEx4=;
 b=rSx8wtgKzekPGO5QDXXCDyGlMJSjzSMdW1y0Xl0rHqgoVpsDpNhwtwc1NAOKujZ7vR/At3
 85FXV4UPml06ZwAg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/i915: Don't check for atomic context on PREEMPT_RT
Date: Tue, 14 Dec 2021 15:02:59 +0100
Message-Id: <20211214140301.520464-7-bigeasy@linutronix.de>
In-Reply-To: <20211214140301.520464-1-bigeasy@linutronix.de>
References: <20211214140301.520464-1-bigeasy@linutronix.de>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
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
2.34.1

