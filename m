Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06094D6191
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D61410E962;
	Fri, 11 Mar 2022 12:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA6210E960;
 Fri, 11 Mar 2022 12:30:46 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1647001844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4G8akgUa9jCEUhZnTTe8VSqD7DwM4uu9SxRJBZp1fY=;
 b=OVtRWUOPbcaae1PnsieQuLEoPeD2d024oeAZgW/NAR6wi+7N6tPGVYbOocS0BOQtchaC5W
 8LzLgRInDb9wC3Kutv1/2kSPcqvI4Szwz1+G+wuVmroK2wlqDOKEn9M4rvixJoqTvDpD1k
 47CVXAZK7f+rq8EE4hpYZnijZkN9U/JFEpuaoItTgqTC4aJXlEZ3imZe+KrhL1nDcokkhh
 f6glSXRltm45XMNyFm5i4dxZemGtkFzujvm3zptjmXxY6fSUTSsyMeKX1A+24pOGAsIbAV
 pVb/L2VEOzsbOpoPK5zlWSIXcp3YAX/nWPZJiRzv6nfBZsV2uaPzod+PgowEFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1647001844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4G8akgUa9jCEUhZnTTe8VSqD7DwM4uu9SxRJBZp1fY=;
 b=c9THJTz3V5JvEJzQ8qGudsCTludNxLtOlY65VJY2+HBhmEcfFCEKCByPHvwAyVc44lP16B
 L2SyWA7uZW2ScGAA==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gt: Queue and wait for the irq_work item.
Date: Fri, 11 Mar 2022 13:30:31 +0100
Message-Id: <20220311123032.4078431-2-bigeasy@linutronix.de>
In-Reply-To: <20220311123032.4078431-1-bigeasy@linutronix.de>
References: <20220311123032.4078431-1-bigeasy@linutronix.de>
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
 Clark Williams <williams@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
index 209cf265bf746..98efeb97a6ba6 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -311,9 +311,8 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs =
*b)
 	/* Kick the work once more to drain the signalers, and disarm the irq */
 	irq_work_sync(&b->irq_work);
 	while (READ_ONCE(b->irq_armed) && !atomic_read(&b->active)) {
-		local_irq_disable();
-		signal_irq_work(&b->irq_work);
-		local_irq_enable();
+		irq_work_queue(&b->irq_work);
+		irq_work_sync(&b->irq_work);
 		cond_resched();
 	}
 }
--=20
2.35.1

