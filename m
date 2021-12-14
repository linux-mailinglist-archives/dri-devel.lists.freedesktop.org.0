Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A341547444F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9283910E49B;
	Tue, 14 Dec 2021 14:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C576010E48B;
 Tue, 14 Dec 2021 14:03:11 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFezZHCyUYSLlKE7IFiMAf/PHL9o7ULb702E3pVQC18=;
 b=igFg6QSHqfV+EVO+fDlhTRJOgsAO8/fu6Sn2Q/ItRu+Gq6VQOaYy16tUg0Zj/W4Z/nrieZ
 yjTtMyz10kAMpZQ/thn3Iw7Dyd4q8pDNiRRkEggJ2vhptSjmbcjnptataignk/QJ3d9yJs
 xunCjNnC8LoFUxajT7nMOINKupwyD1WnQ22XQaUQujv+TxxzpqwTTSbIIrQ6MQLHcvBlT8
 HqkvSDzLVv6v6FSE81XbjY+NrFwOS04KqDFIpHZzmmQpUU+Zjt5+DSKiGxaHsnsvO6YBbK
 jKGHDvLZWmR4xvkZLOwccR6wMvdFgV+2/vhwa8CQH9npCex01iiCPzUPubGOXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFezZHCyUYSLlKE7IFiMAf/PHL9o7ULb702E3pVQC18=;
 b=+ahUbuXAq5WyNL1IPpC4HqEOxoW8bLULDgP2Jx+yrWbFFQTZjhaIKmq/k218pV0aQl8HNN
 v9li1UczBdLVyKBA==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915: Drop the irqs_disabled() check
Date: Tue, 14 Dec 2021 15:02:54 +0100
Message-Id: <20211214140301.520464-2-bigeasy@linutronix.de>
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

The !irqs_disabled() check triggers on PREEMPT_RT even with
i915_sched_engine::lock acquired. The reason is the lock is transformed
into a sleeping lock on PREEMPT_RT and does not disable interrupts.

There is no need to check for disabled interrupts. The lockdep
annotation below already check if the lock has been acquired by the
caller and will yell if the interrupts are not disabled.

Remove the !irqs_disabled() check.

Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_request.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i91=
5_request.c
index fe682b6902aae..304565d567a1a 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -581,7 +581,6 @@ bool __i915_request_submit(struct i915_request *request)
=20
 	RQ_TRACE(request, "\n");
=20
-	GEM_BUG_ON(!irqs_disabled());
 	lockdep_assert_held(&engine->sched_engine->lock);
=20
 	/*
@@ -690,7 +689,6 @@ void __i915_request_unsubmit(struct i915_request *reque=
st)
 	 */
 	RQ_TRACE(request, "\n");
=20
-	GEM_BUG_ON(!irqs_disabled());
 	lockdep_assert_held(&engine->sched_engine->lock);
=20
 	/*
--=20
2.34.1

