Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF3A77A68
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5270810E2D1;
	Tue,  1 Apr 2025 12:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NkheP0nk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6E410E2D1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743509444;
 bh=YQ8tu7x+Ukps5x3s4anWDD7Vj6bx89t2M5F/63Ywx3Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NkheP0nk/x6W5AyxAZCzKQJSTd51b47L9ARfS1xcqAWPsb9EQzOuHewB410L4jRwr
 4O0Yrvlj/OoI4JO4JmM8Em1CPACIMKF8jZYlN0Kjt3n/3oivzdQHwlD9cMi2zXs01F
 6nkeH9OTM0X7Ublj6cuI5a2gOzh7wo/KpbM/2PfCQmAGgBTp8fZGmthnO4JcRNqdJZ
 Sz6uwwMh+RAnRxAMMmoAsMQHK+bojroLZhGpQvyyMH9dlUKeGz5iTKWdY7n45Tn+5S
 U7p5vOeA0HqqbG1OyB6xqwG5T25EKI7J5Kxd6yB4RVpWX2QibzLVmfNgOauiMQ3axT
 MXBKD7DdgfOpg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 512D617E0657;
 Tue,  1 Apr 2025 14:10:44 +0200 (CEST)
Date: Tue, 1 Apr 2025 14:10:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, kernel@collabora.com, Daniel Stone
 <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Make the timeout per-queue instead of per-job
Message-ID: <20250401141041.535df992@collabora.com>
In-Reply-To: <20250307155556.173494-1-ashley.smith@collabora.com>
References: <20250307155556.173494-1-ashley.smith@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  7 Mar 2025 15:55:52 +0000
Ashley Smith <ashley.smith@collabora.com> wrote:

> +static void
> +queue_suspend_timeout(struct panthor_queue *queue)
> +{
> +	unsigned long qtimeout, now;
> +	struct panthor_group *group;
> +	struct panthor_job *job;
> +	bool timer_was_active;
> +
> +	spin_lock(&queue->fence_ctx.lock);
> +
> +	/* Already suspended, nothing to do. */
> +	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT)
> +		goto out_unlock;
> +
> +	job = list_first_entry_or_null(&queue->fence_ctx.in_flight_jobs,
> +				       struct panthor_job, node);
> +	group = job ? job->group : NULL;
> +
> +	/* If the queue is blocked and the group is idle, we want the timer to
> +	 * keep running because the group can't be unblocked by other queues,
> +	 * so it has to come from an external source, and we want to timebox
> +	 * this external signalling.
> +	 */
> +	if (group && (group->blocked_queues & BIT(job->queue_idx)) &&
> +	    group_is_idle(group))
> +		goto out_unlock;
> +
> +	now = jiffies;
> +	qtimeout = queue->timeout.work.timer.expires;
> +
> +	/* Cancel the timer. */
> +	timer_was_active = cancel_delayed_work(&queue->timeout.work);

Looks like queue_suspend_timeout() is only called on a state update,
and this won't happen if the group suspension/termination fails (FW
hang), which will leave this delayed work behind, possibly leading
to a UAF or a spurious queue_timeout_work() call when we don't expect
one.

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e96179ed74e6..1106967af0ac 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2784,8 +2784,18 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
                         * automatically terminate all active groups, so let's
                         * force the state to halted here.
                         */
-                       if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
+                       if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
                                csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
+
+                               /* Reset the queue slots manually if the termination
+                                * request failed.
+                                */
+                               for (i = 0; i < group->queue_count; i++) {
+                                       if (group->queues[i])
+                                               cs_slot_reset_locked(ptdev, csg_id, i);
+                               }
+                       }
+
                        slot_mask &= ~BIT(csg_id);
                }
        }
