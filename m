Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECEC43B169
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE1B6E817;
	Tue, 26 Oct 2021 11:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C322A6E811;
 Tue, 26 Oct 2021 11:41:09 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635248468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4/fNwiRiJZ9ULVn6oL48P42QKMAyeO05FZDpRjPIJE=;
 b=ECsbcQM5PhqVImWMbGn5/SqVG7h2Ns2IIsPZJ+v8VqgDMMbq4U9s4SHAevBDdCFiOnKoAy
 4OMovOPu2zIyZDnyX1aRCp4sgjpnUZYyTe+z7W09WBiXHOpu8VYTV+n3ePwrRpT7hRcFzn
 HwkPKl73Av4/SH7GyEc1N3SC0DhHEUSlLih6qWYeA5dbX8RJ0zvPrnr6PyHogFEW4m6b1W
 ymPwNKlg7oBW1I3eQ+ecXCkHk+g2V2iyqEJPud1Jr/Xhwz3OWbZi3fqGt818HhBbXV63wm
 lkcFAzYTNcWj3s4Mt3j6AnBkhXeeC/+/qqYxtQd1k9i9YQ646Bslpfjr1F8JSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635248468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4/fNwiRiJZ9ULVn6oL48P42QKMAyeO05FZDpRjPIJE=;
 b=9iYl0++YjM9oimPiYI7Uif/j32CdpkEvgkW3CsQmcYLw8Y1PYrOPzBzBY+0UfJ5cnExYl9
 M+9aWvSDgqgtLDDg==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 9/9] drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
Date: Tue, 26 Oct 2021 13:41:00 +0200
Message-Id: <20211026114100.2593433-10-bigeasy@linutronix.de>
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
index 0f8341ca67385..0aefb14c638ae 100644
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
2.33.1

