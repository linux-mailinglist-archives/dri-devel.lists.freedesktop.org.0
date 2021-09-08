Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25A6403F5E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 21:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870136E2B8;
	Wed,  8 Sep 2021 19:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Wed, 08 Sep 2021 19:04:51 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD0C6E296;
 Wed,  8 Sep 2021 19:04:51 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uojuMhK8EFqg62qCIyHIniDCbF3TH69reqpSG63YWT0=;
 b=F1L/ndDQDV6uDNe9gJlyb5O9Ww3altx4PMFmNewqMQrxFjRyzKpJo4FReeBdwjyZtZuzpt
 5NG5NAoJbJ8K89xHjE1ka+0HUHWplx+xaSu88aAgBoK4bwHzQYfR9mXN7pFoZZvQLBlLzc
 i0U8JGuEf4Vq+aqOzIQvK3O2ogNUhSDyQTv7F88Z6fcy+WhQjcKylHV0lADAVGdAsWy6qo
 +DvG1yu5Wr2LLvqf+Lg1tStvfaLxz+Gd8hOeeuPaMS7DpEW3jBHVUfjITJQU6hcOiB7uWF
 rhRIQpC4W4xQAkQjah3obbkx41wdTtB6QxzrRQuNJlzkELHVtQMxsA8k0haf6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uojuMhK8EFqg62qCIyHIniDCbF3TH69reqpSG63YWT0=;
 b=lxdFr/YJDauQKuNKOf4Ph1bxaENUVYRVp/729ws38DPEqjzPRzDnWvEKTwjd805AYCcopS
 t7TDe2ogcO+H2jDg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Clark Williams <williams@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/2] drm/i915/gt: Queue and wait for the irq_work item.
Date: Wed,  8 Sep 2021 20:57:02 +0200
Message-Id: <20210908185703.2989414-2-bigeasy@linutronix.de>
In-Reply-To: <20210908185703.2989414-1-bigeasy@linutronix.de>
References: <20210908185703.2989414-1-bigeasy@linutronix.de>
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

Disabling interrupts and invoking the irq_work function directly breaks
on PREEMPT_RT.
PREEMPT_RT does not invoke all irq_work from hardirq context because
some of the user have spinlock_t locking in the callback function.
These locks are then turned into a sleeping locks which can not be
acquired with disabled interrupts.

Using irq_work_queue() has the benefit that the irqwork will be invoked
in the regular context. In general there is "no" delay between enqueuing
the callback and its invocation because the interrupt is raised right
away on architectures which support it (which includes x86).

Use irq_work_queue() + irq_work_sync() instead invoking the callback
directly.

Reported-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/=
i915/gt/intel_breadcrumbs.c
index 38cc42783dfb2..594dec2f76954 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -318,10 +318,9 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs=
 *b)
 	/* Kick the work once more to drain the signalers, and disarm the irq */
 	irq_work_sync(&b->irq_work);
 	while (READ_ONCE(b->irq_armed) && !atomic_read(&b->active)) {
-		local_irq_disable();
-		signal_irq_work(&b->irq_work);
-		local_irq_enable();
+		irq_work_queue(&b->irq_work);
 		cond_resched();
+		irq_work_sync(&b->irq_work);
 	}
 }
=20
--=20
2.33.0

