Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3C8B9ED1
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCC210F571;
	Thu,  2 May 2024 16:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QXhaQLTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392A210F571
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714668285;
 bh=DZ7Zrws5+4Ms7ndvTJP15KRfSBe8CguG3TMAlB9enbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QXhaQLTtcIjROu7ft5as3LYu74ScXWDW4tDavuhGu8AmOdocKW+O0DMKcDsW5RIdq
 49HS3s/s1q5vEx9TXqnRpxma1KZOyJg9TVCMM+g8DwuLn13WyseZleOcsKRYSJ3EF3
 8gCnssqBbw427LTwspPsxIfYL3cg4qOatskhBrEb/VccKiZXX0wicRlQifFNoMbNuR
 V43+sXpLURe5Dmrv8mgSVnajKgquU7rGiE4ZVzyTkI7b/im73/Egsk/YDnyq6/n6Ug
 oFsBPucwhCuQzODI9bZN5CIXA56aaxjqSPojjLydamr8t10uR0cIbqayQxzv5keVq2
 Lvajd+OKw2ezw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 347CA3782017;
 Thu,  2 May 2024 16:44:45 +0000 (UTC)
Date: Thu, 2 May 2024 18:44:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] drm/panthor: Make sure we handle 'unknown group
 state' case properly
Message-ID: <20240502184443.77065487@collabora.com>
In-Reply-To: <20240502155248.1430582-1-boris.brezillon@collabora.com>
References: <20240502155248.1430582-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Thu,  2 May 2024 17:52:48 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

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
> v2:
> - Add Steve's R-b
> - Fix commit message
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Suggested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Queued to drm-misc-next-fixes.

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 37 +++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index b3a51a6de523..1a14ee30f774 100644
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
> @@ -1783,6 +1814,7 @@ static bool
>  group_can_run(struct panthor_group *group)
>  {
>  	return group->state != PANTHOR_CS_GROUP_TERMINATED &&
> +	       group->state != PANTHOR_CS_GROUP_UNKNOWN_STATE &&
>  	       !group->destroyed && group->fatal_queues == 0 &&
>  	       !group->timedout;
>  }
> @@ -2557,7 +2589,8 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  
>  		if (csg_slot->group) {
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, i,
> -						CSG_STATE_SUSPEND,
> +						group_can_run(csg_slot->group) ?
> +						CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
>  						CSG_STATE_MASK);
>  		}
>  	}

