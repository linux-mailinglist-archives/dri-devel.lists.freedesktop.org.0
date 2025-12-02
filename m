Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C855C9BC10
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 15:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE4910E661;
	Tue,  2 Dec 2025 14:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E24C10E661
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 14:20:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45EDD1477
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:20:31 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 69DDE3F73B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:20:38 -0800 (PST)
Date: Tue, 2 Dec 2025 14:20:14 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 1/3] drm/panthor: Drop a WARN_ON() in group_free_queue()
Message-ID: <aS71noYF2jWZcoIh@e142607>
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
 <20251202133538.83078-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202133538.83078-2-boris.brezillon@collabora.com>
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

On Tue, Dec 02, 2025 at 02:35:36PM +0100, Boris Brezillon wrote:
> It appears the timeout can still be enabled when we reach that point,
> because of the asynchronous progress check done on queues that resets
> the timer when jobs are still in-flight, but progress was made.
> We could add more checks to make sure the timer is not re-enabled when
> a group can't run anymore, but we don't have a group to pass to
> queue_check_job_completion() in some context.
> 
> It's just as safe (we just want to be sure the timer is stopped before
> we destroy the queue) and simpler to drop the WARN_ON() in
> group_free_queue().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 389d508b3848..203f6a0a6b9a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -893,9 +893,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  	if (IS_ERR_OR_NULL(queue))
>  		return;
>  
> -	/* This should have been disabled before that point. */
> -	drm_WARN_ON(&group->ptdev->base,
> -		    disable_delayed_work_sync(&queue->timeout.work));
> +	/* Disable the timeout before tearing down drm_sched components. */
> +	disable_delayed_work_sync(&queue->timeout.work);
>  
>  	if (queue->entity.fence_context)
>  		drm_sched_entity_destroy(&queue->entity);
> -- 
> 2.51.1
> 
