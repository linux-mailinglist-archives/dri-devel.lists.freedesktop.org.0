Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076F474453
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74E710E53A;
	Tue, 14 Dec 2021 14:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334CC10E48B;
 Tue, 14 Dec 2021 14:03:13 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh/7UFfBch5SSyqRuaFviWKciryzGNdklJoJwVS23Fw=;
 b=thc0iS+vTpbCGfq61xMnk2whHFya75y2GloqPTOmrlZWow2XZKWonu4jVriQbcIt6P8L5/
 qnMA/I6ImoLpVJQV+cN0/I9Dp/FB1YdbY6SrxIb8zpOPBYSUKdD0fkhZHemaAVIzcSSJMr
 pDmFe5Z6pwLRPKva7kjdVGw3FNLM6TfZlautLgNAA9ZYonH3Jpg7YLvRqlluga/GywYGPO
 qLmnfmDHGc0BgGQuvRz8arBxF7BMnE7k8ixpA08uVUFa4pH24EoxZytFd0dhcHcViHXByU
 Xjx7pB6eLIvpcS4TdGuw1I2NQAfFNZUlMr3NKjNgeu64Uw9Jdd/Oeu0tC9b4nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh/7UFfBch5SSyqRuaFviWKciryzGNdklJoJwVS23Fw=;
 b=txPrm5X8mt5LcVNbN3NIknigGNWpUBYGWhypg7htCp6FXjPkDmqQ1F3Gk5AAet56D00Xv7
 ZWkTevpbdIJ6QdAg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
Date: Tue, 14 Dec 2021 15:03:01 +0100
Message-Id: <20211214140301.520464-9-bigeasy@linutronix.de>
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
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
index 64c3fa7cc05df..89a4089bc4baf 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -823,7 +823,7 @@ DEFINE_EVENT(i915_request, i915_request_add,
 	     TP_ARGS(rq)
 );
=20
-#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
+#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS) && !defined(NOTRACE)
 DEFINE_EVENT(i915_request, i915_request_guc_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
--=20
2.34.1

