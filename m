Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2456422BA8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355846EB98;
	Tue,  5 Oct 2021 15:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E9A6E420;
 Tue,  5 Oct 2021 15:00:52 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633446050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMwVFAHyX10lj5UhM0o3xVoHq1BidWl+lrVSXNw9dK0=;
 b=UABoINfMGhlZPg+cbvtudB+iO4MwYA5eZQ8uP2IXOtJMZkAHcb4z2T+yUPR3b3jne7GHQ2
 LpnmMQXr2U934YJRVgXnXNtFL8oNqjZoRrc2E9puvZyOV12IBiJCxYUJJ7uvxqERUUEoME
 NOv7/Qq0EeC2jVrzc3ellfwqc6QQE/C7uWhtZBvwt0n4uHD/wmjL1WPH9PEB3cq+mtI2sM
 kLkOQc8x4Jq+ND7q8mDeW3ComY8kcB+o9JwZcjrtAI9MHPhYXmMvM0IJFgqogTKIuLs+sG
 F2wKFYhP5383KglM/TFaUUCDsX+l6QcE6UJxybdtPhuDkdLOq2kfr/YVWYcnLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633446050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMwVFAHyX10lj5UhM0o3xVoHq1BidWl+lrVSXNw9dK0=;
 b=76m+LJ9vgge15bbksn0Qg4jrX4XViPk/kPjYaiI4NV+R90R46JvB6L0RsX+MbVrgKKYo1K
 VZxKSC1rf0N5bZCg==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Luca Abeni <lucabe72@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 3/8] drm/i915: Disable tracing points on PREEMPT_RT
Date: Tue,  5 Oct 2021 17:00:41 +0200
Message-Id: <20211005150046.1000285-4-bigeasy@linutronix.de>
In-Reply-To: <20211005150046.1000285-1-bigeasy@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
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

Luca Abeni reported this:
| BUG: scheduling while atomic: kworker/u8:2/15203/0x00000003
| CPU: 1 PID: 15203 Comm: kworker/u8:2 Not tainted 4.19.1-rt3 #10
| Call Trace:
|  rt_spin_lock+0x3f/0x50
|  gen6_read32+0x45/0x1d0 [i915]
|  g4x_get_vblank_counter+0x36/0x40 [i915]
|  trace_event_raw_event_i915_pipe_update_start+0x7d/0xf0 [i915]

The tracing events use trace_i915_pipe_update_start() among other events
use functions acquire spinlock_t locks which are transformed into
sleeping locks on PREEMPT_RT. A few trace points use
intel_get_crtc_scanline(), others use ->get_vblank_counter() wich also
might acquire a sleeping locks on PREEMPT_RT.
At the time the arguments are evaluated within trace point, preemption
is disabled and so the locks must not be acquired on PREEMPT_RT.

Based on this I don't see any other way than disable trace points on
PREMPT_RT.

Reported-by: Luca Abeni <lucabe72@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_trace.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_=
trace.h
index 806ad688274bf..773e7362c4442 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -2,6 +2,10 @@
 #if !defined(_I915_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _I915_TRACE_H_
=20
+#ifdef CONFIG_PREEMPT_RT
+#define NOTRACE
+#endif
+
 #include <linux/stringify.h>
 #include <linux/types.h>
 #include <linux/tracepoint.h>
--=20
2.33.0

