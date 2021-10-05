Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C28422BAC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3602E6F5E1;
	Tue,  5 Oct 2021 15:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821FC6E422;
 Tue,  5 Oct 2021 15:00:52 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633446051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swdtSGybUF+hM1+gEZyqBgLEE/zkwh1sMjOuuHLJsS8=;
 b=eTs2qRmk+as86cx1BJfDhz6w2GT21pN93zvo+NZssZNI5z9ohZtcOm9xfDwoimldE7GUAp
 PG6xmnoFJ2nRiIXlu5nCXz5mPMDnpDAmMzW68MU7ka9mMKwJ/wXpotKIUOB/l4nrIiWvyI
 r8PuVl/XYsojH/QKCHdeJDAioomRcebu41hxl1vLWL4NjQEPxWVBkLPQl2pgmLtkjoHagl
 RbfI/c6U2Xx9oOgZ0dyfZCth11oITufIIq7CXTrKgXY+i71nlsPut/r0oaQxaJdueExzqf
 UiorMbqnQsbyrTEQ+wOMNG49JQEUsRNO5q8PXTZEDaZ2HluNy2eXj1l7zGr45g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633446051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swdtSGybUF+hM1+gEZyqBgLEE/zkwh1sMjOuuHLJsS8=;
 b=zjRvyW+eqBhuYuWg5IvituDSI6BgeNvIlBcn/49+QyZhbzaleC7fbudPIk7iUFiduRz9jL
 yZropuobftY1j8Ag==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 4/8] drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
Date: Tue,  5 Oct 2021 17:00:42 +0200
Message-Id: <20211005150046.1000285-5-bigeasy@linutronix.de>
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

The order of the header files is important. If this header file is
included after tracepoint.h was included then the NOTRACE here becomes a
nop. Currently this happens for two .c files which use the tracepoitns
behind DRM_I915_LOW_LEVEL_TRACEPOINTS.

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpu/drm/i915/i915_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_=
trace.h
index 773e7362c4442..5ff6c0a37fdfa 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -826,7 +826,7 @@ DEFINE_EVENT(i915_request, i915_request_add,
 	     TP_ARGS(rq)
 );
=20
-#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
+#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS) && !defined(NOTRACE)
 DEFINE_EVENT(i915_request, i915_request_guc_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
--=20
2.33.0

