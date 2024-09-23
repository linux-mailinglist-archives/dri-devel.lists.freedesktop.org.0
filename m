Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496697E915
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A635D10E3C8;
	Mon, 23 Sep 2024 09:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2047910E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:51:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B90FEC;
 Mon, 23 Sep 2024 02:52:24 -0700 (PDT)
Received: from [10.57.79.18] (unknown [10.57.79.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4391E3F71A;
 Mon, 23 Sep 2024 02:51:52 -0700 (PDT)
Message-ID: <537f5ff6-deb7-404a-8159-e544e5701ff3@arm.com>
Date: Mon, 23 Sep 2024 10:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add csg_priority to panthor_group
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240918085056.24422-2-mary.guillemard@collabora.com>
 <20240918085056.24422-3-mary.guillemard@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240918085056.24422-3-mary.guillemard@collabora.com>
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

On 18/09/2024 09:50, Mary Guillemard wrote:
> Keep track of the csg priority in panthor_group when the group is
> scheduled/active.
> 
> This is useful to know the actual priority in use in the firmware
> group slot.
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 86908ada7335..f15abeef4ece 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -574,6 +574,13 @@ struct panthor_group {
>  	 */
>  	int csg_id;
>  
> +	/**
> +	 * @csg_id: Priority of the FW group slot.

kerneldoc name is wrong: s/csg_id/csg_priority/

Otherwise this looks reasonable, but see my reply to the second patch.

Thanks,
Steve

> +	 *
> +	 * -1 when the group is not scheduled/active.
> +	 */
> +	int csg_priority;
> +
>  	/**
>  	 * @destroyed: True when the group has been destroyed.
>  	 *
> @@ -894,11 +901,12 @@ group_get(struct panthor_group *group)
>   * group_bind_locked() - Bind a group to a group slot
>   * @group: Group.
>   * @csg_id: Slot.
> + * @csg_priority: Priority of the slot.
>   *
>   * Return: 0 on success, a negative error code otherwise.
>   */
>  static int
> -group_bind_locked(struct panthor_group *group, u32 csg_id)
> +group_bind_locked(struct panthor_group *group, u32 csg_id, u32 csg_priority)
>  {
>  	struct panthor_device *ptdev = group->ptdev;
>  	struct panthor_csg_slot *csg_slot;
> @@ -917,6 +925,7 @@ group_bind_locked(struct panthor_group *group, u32 csg_id)
>  	csg_slot = &ptdev->scheduler->csg_slots[csg_id];
>  	group_get(group);
>  	group->csg_id = csg_id;
> +	group->csg_priority = csg_priority;
>  
>  	/* Dummy doorbell allocation: doorbell is assigned to the group and
>  	 * all queues use the same doorbell.
> @@ -956,6 +965,7 @@ group_unbind_locked(struct panthor_group *group)
>  	slot = &ptdev->scheduler->csg_slots[group->csg_id];
>  	panthor_vm_idle(group->vm);
>  	group->csg_id = -1;
> +	group->csg_priority = -1;
>  
>  	/* Tiler OOM events will be re-issued next time the group is scheduled. */
>  	atomic_set(&group->tiler_oom, 0);
> @@ -2193,8 +2203,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  
>  			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  			csg_slot = &sched->csg_slots[csg_id];
> -			group_bind_locked(group, csg_id);
> -			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
> +			group_bind_locked(group, csg_id, new_csg_prio);
> +			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio);
> +			new_csg_prio--;
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
>  						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
>  						CSG_STATE_RESUME : CSG_STATE_START,
> @@ -3111,6 +3122,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	kref_init(&group->refcount);
>  	group->state = PANTHOR_CS_GROUP_CREATED;
>  	group->csg_id = -1;
> +	group->csg_priority = -1;
>  
>  	group->ptdev = ptdev;
>  	group->max_compute_cores = group_args->max_compute_cores;

