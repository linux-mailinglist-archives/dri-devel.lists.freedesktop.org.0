Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28A96D5AF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 12:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD5F10E852;
	Thu,  5 Sep 2024 10:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2393810E852
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 10:19:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C0D81063;
 Thu,  5 Sep 2024 03:20:01 -0700 (PDT)
Received: from [10.1.29.28] (e122027.cambridge.arm.com [10.1.29.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5C73F73F;
 Thu,  5 Sep 2024 03:19:33 -0700 (PDT)
Message-ID: <64da0d37-6881-4b34-8f35-f6454681fd4e@arm.com>
Date: Thu, 5 Sep 2024 11:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Don't declare a queue blocked if deferred
 operations are pending
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 stable@vger.kernel.org
References: <20240905071914.3278599-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240905071914.3278599-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 05/09/2024 08:19, Boris Brezillon wrote:
> If deferred operations are pending, we want to wait for those to
> land before declaring the queue blocked on a SYNC_WAIT. We need
> this to deal with the case where the sync object is signalled through
> a deferred SYNC_{ADD,SET} from the same queue. If we don't do that
> and the group gets scheduled out before the deferred SYNC_{SET,ADD}
> is executed, we'll end up with a timeout, because no external
> SYNC_{SET,ADD} will make the scheduler reconsider the group for
> execution.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 41260cf4beb8..201d5e7a921e 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1103,7 +1103,13 @@ cs_slot_sync_queue_state_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs
>  			list_move_tail(&group->wait_node,
>  				       &group->ptdev->scheduler->groups.waiting);
>  		}
> -		group->blocked_queues |= BIT(cs_id);
> +
> +		/* The queue is only blocked if there's no deferred operation
> +		 * pending, which can be checked through the scoreboard status.
> +		 */
> +		if (!cs_iface->output->status_scoreboards)
> +			group->blocked_queues |= BIT(cs_id);
> +
>  		queue->syncwait.gpu_va = cs_iface->output->status_wait_sync_ptr;
>  		queue->syncwait.ref = cs_iface->output->status_wait_sync_value;
>  		status_wait_cond = cs_iface->output->status_wait & CS_STATUS_WAIT_SYNC_COND_MASK;

