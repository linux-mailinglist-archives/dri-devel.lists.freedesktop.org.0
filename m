Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA133C40473
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD66810EAD9;
	Fri,  7 Nov 2025 14:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D63310EAD9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:17:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 005B01515;
 Fri,  7 Nov 2025 06:17:16 -0800 (PST)
Received: from [10.57.72.216] (unknown [10.57.72.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 999D93F66E;
 Fri,  7 Nov 2025 06:17:21 -0800 (PST)
Message-ID: <af6bca71-a316-48c7-8b56-ee5dab00b28a@arm.com>
Date: Fri, 7 Nov 2025 14:17:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/panthor: Reset queue slots if termination fails
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, kernel@collabora.com
References: <20251103150154.31056-1-boris.brezillon@collabora.com>
 <20251103150154.31056-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251103150154.31056-3-boris.brezillon@collabora.com>
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

On 03/11/2025 15:01, Boris Brezillon wrote:
> From: Ashley Smith <ashley.smith@collabora.com>
> 
> Make sure the queue slot is reset even if we failed termination so
> we don't have garbage in the CS input interface after a reset. In
> practice that's not a problem because we zero out all RW sections when
> a hangs occurs, but it's safer to reset things manually, in case we
> decide to not conditionally reload RW sections based on the type of
> hang.
> 
> v4: Split the changes in two separate patches
> 
> v5:
> - No changes
> 
> v6:
> - Adjust the explanation in the commit message
> - Drop the Fixes tag
> - Put after the timeout changes and make the two patches independent
>   so one can be backported, and the other not
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

One nit below, but either way:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index b440187798dd..f9a52252b268 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2836,13 +2836,23 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  		while (slot_mask) {
>  			u32 csg_id = ffs(slot_mask) - 1;
>  			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
> +			struct panthor_group *group = csg_slot->group;
>  
>  			/* Terminate command timedout, but the soft-reset will
>  			 * automatically terminate all active groups, so let's
>  			 * force the state to halted here.
>  			 */
> -			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
> -				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
> +			if (group->state != PANTHOR_CS_GROUP_TERMINATED) {
> +				group->state = PANTHOR_CS_GROUP_TERMINATED;
> +
> +				/* Reset the queue slots manually if the termination
> +				 * request failed.
> +				 */
> +				for (i = 0; i < csg_slot->group->queue_count; i++) {
> +					if (csg_slot->group->queues[i])

NIT: You've introduced a "group" variable and used it above, but not here.

Thanks,
Steve

> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}

