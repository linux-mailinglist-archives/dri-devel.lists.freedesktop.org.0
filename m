Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5828B1E29
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACA811A323;
	Thu, 25 Apr 2024 09:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0D9C11A323
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:37:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571DA1007;
 Thu, 25 Apr 2024 02:37:45 -0700 (PDT)
Received: from [10.57.56.40] (unknown [10.57.56.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04BF23F64C;
 Thu, 25 Apr 2024 02:37:15 -0700 (PDT)
Message-ID: <5946423a-ea13-442a-8dc7-9021ef6f4bc3@arm.com>
Date: Thu, 25 Apr 2024 10:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Make sure we handled the unknown group state
 properly
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240425084612.703603-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240425084612.703603-1-boris.brezillon@collabora.com>
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

On 25/04/2024 09:46, Boris Brezillon wrote:
> When we check for state values returned by the FW, we only cover part of
> the 0:7 range. Make sure we catch FW inconsistencies by adding a default
> to the switch statement, and flagging the group state as unknown in that
> case.
> 
> When an unknown state is detected, we trigger a reset, and consider the
> group as unusable after that point, to prevent the potential corruption
> from creeping in other places if we continue executing stuff on this
> context.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Suggested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks for doing this up - I can tick it off my todo list ;)

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 37 +++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 6de8c0c702cb..fad4678ca4c8 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -490,6 +490,18 @@ enum panthor_group_state {
>  	 * Can no longer be scheduled. The only allowed action is a destruction.
>  	 */
>  	PANTHOR_CS_GROUP_TERMINATED,
> +
> +	/**
> +	 * @PANTHOR_CS_GROUP_UNKNOWN_STATE: Group is an unknown state.
> +	 *
> +	 * The FW returned an inconsistent state. The group is flagged unusable
> +	 * and can no longer be scheduled. The only allowed action is a
> +	 * destruction.
> +	 *
> +	 * When that happens, we also schedule a FW reset, to start from a fresh
> +	 * state.
> +	 */
> +	PANTHOR_CS_GROUP_UNKNOWN_STATE,
>  };
>  
>  /**
> @@ -1127,6 +1139,7 @@ csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
>  	struct panthor_fw_csg_iface *csg_iface;
>  	struct panthor_group *group;
>  	enum panthor_group_state new_state, old_state;
> +	u32 csg_state;
>  
>  	lockdep_assert_held(&ptdev->scheduler->lock);
>  
> @@ -1137,7 +1150,8 @@ csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
>  		return;
>  
>  	old_state = group->state;
> -	switch (csg_iface->output->ack & CSG_STATE_MASK) {
> +	csg_state = csg_iface->output->ack & CSG_STATE_MASK;
> +	switch (csg_state) {
>  	case CSG_STATE_START:
>  	case CSG_STATE_RESUME:
>  		new_state = PANTHOR_CS_GROUP_ACTIVE;
> @@ -1148,11 +1162,28 @@ csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
>  	case CSG_STATE_SUSPEND:
>  		new_state = PANTHOR_CS_GROUP_SUSPENDED;
>  		break;
> +	default:
> +		/* The unknown state might be caused by a FW state corruption,
> +		 * which means the group metadata can't be trusted anymore, and
> +		 * the SUSPEND operation might propagate the corruption to the
> +		 * suspend buffers. Flag the group state as unknown to make
> +		 * sure it's unusable after that point.
> +		 */
> +		drm_err(&ptdev->base, "Invalid state on CSG %d (state=%d)",
> +			csg_id, csg_state);
> +		new_state = PANTHOR_CS_GROUP_UNKNOWN_STATE;
> +		break;
>  	}
>  
>  	if (old_state == new_state)
>  		return;
>  
> +	/* The unknown state might be caused by a FW issue, reset the FW to
> +	 * take a fresh start.
> +	 */
> +	if (new_state == PANTHOR_CS_GROUP_UNKNOWN_STATE)
> +		panthor_device_schedule_reset(ptdev);
> +
>  	if (new_state == PANTHOR_CS_GROUP_SUSPENDED)
>  		csg_slot_sync_queues_state_locked(ptdev, csg_id);
>  
> @@ -1789,6 +1820,7 @@ static bool
>  group_can_run(struct panthor_group *group)
>  {
>  	return group->state != PANTHOR_CS_GROUP_TERMINATED &&
> +	       group->state != PANTHOR_CS_GROUP_UNKNOWN_STATE &&
>  	       !group->destroyed && group->fatal_queues == 0 &&
>  	       !group->timedout;
>  }
> @@ -2563,7 +2595,8 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  
>  		if (csg_slot->group) {
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, i,
> -						CSG_STATE_SUSPEND,
> +						group_can_run(csg_slot->group) ?
> +						CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
>  						CSG_STATE_MASK);
>  		}
>  	}

