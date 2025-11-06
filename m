Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD7C3C4F3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B33810E944;
	Thu,  6 Nov 2025 16:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE24D10E94B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:15:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 340F612FC;
 Thu,  6 Nov 2025 08:15:32 -0800 (PST)
Received: from [10.57.72.2] (unknown [10.57.72.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 556863F66E;
 Thu,  6 Nov 2025 08:15:38 -0800 (PST)
Message-ID: <26adee15-1c69-4cb7-96b7-ed5719878f9e@arm.com>
Date: Thu, 6 Nov 2025 16:15:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] drm/panthor: Simplify group idleness tracking
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251106144656.1012274-2-boris.brezillon@collabora.com>
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

On 06/11/2025 14:46, Boris Brezillon wrote:
> csg_slot_sync_queues_state_locked() queries the queues state which can
> then be used to determine if a group is idle or not. Let's base our
> idleness detection logic solely on the {idle,blocked}_queues masks to
> avoid inconsistencies between the group state and the state of its
> subqueues.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Seems reasonable to me.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 31 ++-----------------------
>  1 file changed, 2 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index e74ca071159d..9931f4a6cd96 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -108,15 +108,6 @@ struct panthor_csg_slot {
>  
>  	/** @priority: Group priority. */
>  	u8 priority;
> -
> -	/**
> -	 * @idle: True if the group bound to this slot is idle.
> -	 *
> -	 * A group is idle when it has nothing waiting for execution on
> -	 * all its queues, or when queues are blocked waiting for something
> -	 * to happen (synchronization object).
> -	 */
> -	bool idle;
>  };
>  
>  /**
> @@ -1607,17 +1598,6 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
>  	return (events & (CS_FAULT | CS_TILER_OOM)) != 0;
>  }
>  
> -static void csg_slot_sync_idle_state_locked(struct panthor_device *ptdev, u32 csg_id)
> -{
> -	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
> -	struct panthor_fw_csg_iface *csg_iface;
> -
> -	lockdep_assert_held(&ptdev->scheduler->lock);
> -
> -	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> -	csg_slot->idle = csg_iface->output->status_state & CSG_STATUS_STATE_IS_IDLE;
> -}
> -
>  static void csg_slot_process_idle_event_locked(struct panthor_device *ptdev, u32 csg_id)
>  {
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> @@ -1879,10 +1859,8 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  		if (acked & CSG_STATE_MASK)
>  			csg_slot_sync_state_locked(ptdev, csg_id);
>  
> -		if (acked & CSG_STATUS_UPDATE) {
> +		if (acked & CSG_STATUS_UPDATE)
>  			csg_slot_sync_queues_state_locked(ptdev, csg_id);
> -			csg_slot_sync_idle_state_locked(ptdev, csg_id);
> -		}
>  
>  		if (ret && acked != req_mask &&
>  		    ((csg_iface->input->req ^ csg_iface->output->ack) & req_mask) != 0) {
> @@ -1919,13 +1897,8 @@ tick_ctx_is_full(const struct panthor_scheduler *sched,
>  static bool
>  group_is_idle(struct panthor_group *group)
>  {
> -	struct panthor_device *ptdev = group->ptdev;
> -	u32 inactive_queues;
> +	u32 inactive_queues = group->idle_queues | group->blocked_queues;
>  
> -	if (group->csg_id >= 0)
> -		return ptdev->scheduler->csg_slots[group->csg_id].idle;
> -
> -	inactive_queues = group->idle_queues | group->blocked_queues;
>  	return hweight32(inactive_queues) == group->queue_count;
>  }
>  

