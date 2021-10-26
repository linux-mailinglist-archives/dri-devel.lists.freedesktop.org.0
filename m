Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242E43B163
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8246E595;
	Tue, 26 Oct 2021 11:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5986E563;
 Tue, 26 Oct 2021 11:41:07 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635248465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LA+90sHRZNpkk1aLLF2Masb7U0Mao+Pu/ydbc5UfYUo=;
 b=r4yecKMV13TAA5Va4ZX+PhCLo3gzrWGlIHu4dAd/1O8YnYc+sALWmeD99zk+v0iM+huwgV
 cDX7LHLpVvVAj9BQHefGXAQFEPkTLBkKqrRQ1FsHLnj2H/E1s3f5R7sKybtbF1CcbulsRR
 CMyLw2brqdByTzkYlmAewRZ9VYuy1uXywkLnbuy6dwiBYzXtvcfQv9JYyUSuUffVERfhly
 Gc77GKBouQ+YvGPD5bGSAZ0h9xrf/ZAsJ4fYxBaqBUUSBd7wNfx/5VePxN/JuJQZ3Ox6Ef
 hVRhZedMsU5Q1K+Y/kyXVEBvT2aAPHxB2rPU9PBW8Oy0oo9WqUDH7mbXNMZmog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635248465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LA+90sHRZNpkk1aLLF2Masb7U0Mao+Pu/ydbc5UfYUo=;
 b=ZH4PmHt50tqJOByqB3AB7KqMqdVo51sZAkdXShFANH/gSQASkCvkBM39Prav/cTzRwG4Vu
 +gZWcNVxnFWcIXAg==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 0/9] drm/i915: PREEMPT_RT related fixups.
Date: Tue, 26 Oct 2021 13:40:51 +0200
Message-Id: <20211026114100.2593433-1-bigeasy@linutronix.de>
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

the following patches are from the PREEMPT_RT queue. It is mostly about
disabling interrupts/preemption which leads to problems. Patches 1-4 are
independent of PREEMPT_RT.

Unfortunately DRM_I915_LOW_LEVEL_TRACEPOINTS had to be disabled because
it acquires locks from within trace points. It has been pointed out in
the previous post that this makes any kind of debugging impossible.
Making the uncore.lock a raw_spinlock_t doubles the latencies in my
limited testing [0]. I don't know the difference on other hardware. Also
it worries me a little that wait_for_atomic() has 50ms as the upper
spin/wait limit if the condition does not become true.

I tested it on a SandyBridge with built-in i915 by using X, OpenGL and
playing videos without noticing any warnings. However, some code paths
were not entered.

[0] https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.=
de/

Sebastian


