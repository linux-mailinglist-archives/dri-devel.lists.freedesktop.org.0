Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01143B16C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721566E82B;
	Tue, 26 Oct 2021 11:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8686E591;
 Tue, 26 Oct 2021 11:41:07 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635248465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlN4Xoy0Y/M8Q0M1CpxcAL0AiL8ioioqGfsGYxp3KAc=;
 b=atXGj1vAT2SVLpL9o+7T+qCHeniN4MO+Jb8n1niIcFQX0zuyAJriCmlOUGAKQo8NnAVWWH
 V6T3v30rZGObcV5FSb1/YqivN4AF+MZJAg6LVRyku+iH2hlGOq9rNlLy0XsejZ01tWcxVJ
 +IqBukAQZ+bwUPdTw/tjbDyF+ObldKIBXGH2fY5MY5K02xYKaesyBbnGH9AanCw3UjmqZK
 2cTftsufV3T3DMW5HzYtYnaJ6p3TmaMybPgrrCARwfm5ing9ZoqLRSkQqSY9x9baBGJmQY
 20km7Ve34sa5oFtDsGNj8ahggLBIOHffOVghIGR088scgdGVGctCU5bT7hchHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635248465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlN4Xoy0Y/M8Q0M1CpxcAL0AiL8ioioqGfsGYxp3KAc=;
 b=6WqCafDxfmfNMkeDd6oA8r7n4+femnKxhZd4FrZBNXUgphStAYU0Y0hve035wDRPfgMsmS
 N8XjkXdHYkLVwnAg==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <williams@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/9] drm/i915/gt: Queue and wait for the irq_work item.
Date: Tue, 26 Oct 2021 13:40:53 +0200
Message-Id: <20211026114100.2593433-3-bigeasy@linutronix.de>
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
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/=
i915/gt/intel_breadcrumbs.c
index 209cf265bf746..6e1b9068d944c 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -311,10 +311,9 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs=
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
2.33.1

