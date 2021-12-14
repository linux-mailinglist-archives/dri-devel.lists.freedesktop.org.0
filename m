Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE46474451
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA5C10E538;
	Tue, 14 Dec 2021 14:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E9710E49A;
 Tue, 14 Dec 2021 14:03:13 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRHAs/uzahnAA5+Nw2tOKbmdd9Sj5qBHbGJNI8etFHY=;
 b=Qtb8r+ktywmfcI34lOP/azxk1XssHiDv48zXXazIm8x4IElKm6bnhZbZwYHb3z4dZZbS9r
 cwysum3zBAPbh6Fs6t/PMgVoOFBRf/Qa319/oysZRD6jHFD9ZMaZUwNAXT3fXvP401mSfe
 49ecPPzni15Xl0B7YPe9ekPlxviVGoFij+kf6KGFqIUHicdDitJIKDSLxFPm9CuXb5LqC3
 zn4yD2JcgZkqHFCVgp86Hqo63ZZvmOa8tFGt5J8S7xtdjgl5bDfZkibaA7EzsHsp1trzUN
 hGQlP5H3vKmANMMERsbEuvP4ot8oTiOL03/OLOa+tueOwnEhB4YhmhFztKokgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRHAs/uzahnAA5+Nw2tOKbmdd9Sj5qBHbGJNI8etFHY=;
 b=9jxIp8YbXiDaOYDpk3u6u6l/3IVUZxEmQPWRi2gEDxRBYdellQYJLbuvBWQpoArXFr+Bya
 x56vBh+F4L+9lnAw==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915: Disable tracing points on PREEMPT_RT
Date: Tue, 14 Dec 2021 15:03:00 +0100
Message-Id: <20211214140301.520464-8-bigeasy@linutronix.de>
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
 Luca Abeni <lucabe72@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
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
index 8104981a66044..64c3fa7cc05df 100644
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
2.34.1

