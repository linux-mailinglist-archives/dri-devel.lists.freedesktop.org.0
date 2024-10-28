Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2E9B34F0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2610E4F4;
	Mon, 28 Oct 2024 15:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59D4410E4F3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:31:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90FB116F2;
 Mon, 28 Oct 2024 08:31:53 -0700 (PDT)
Received: from [10.57.87.236] (unknown [10.57.87.236])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EB3F3F73B;
 Mon, 28 Oct 2024 08:31:21 -0700 (PDT)
Message-ID: <564021d1-9846-4b9e-b045-0d965c47639d@arm.com>
Date: Mon, 28 Oct 2024 15:31:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panthor: Report innocent group kill
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20241028114815.3793855-1-boris.brezillon@collabora.com>
 <20241028114815.3793855-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241028114815.3793855-4-boris.brezillon@collabora.com>
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

On 28/10/2024 11:48, Boris Brezillon wrote:
> Groups can be killed during a reset even though they did nothing wrong.
> That usually happens when the FW is put in a bad state by other groups,
> resulting in group suspension failures when the reset happens.
> 
> If we end up in that situation, flag the group innocent and report
> innocence through a new DRM_PANTHOR_GROUP_STATE flag.

Sadly I don't see any code to return that new flag... Shouldn't there be
a change to panthor_get_get_state()?

> 
> Bump the minor driver version to reflect the uAPI change.
> 
> Changes in v2:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++++
>  include/uapi/drm/panthor_drm.h          |  9 +++++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ac7e53f6e3f0..f1dff7e0173d 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1507,7 +1507,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.desc = "Panthor DRM driver",
>  	.date = "20230801",
>  	.major = 1,
> -	.minor = 2,
> +	.minor = 3,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index ef4bec7ff9c7..bb4a8c522fdc 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -610,6 +610,16 @@ struct panthor_group {
>  	 */
>  	bool timedout;
>  
> +	/**
> +	 * @innocent: True when the group becomes unusable because the group suspension
> +	 * failed during a reset.
> +	 *
> +	 * Sometimes the FW was put in a bad state by other groups, causing the group
> +	 * suspension happening in the reset path to fail. In that case, we consider the
> +	 * group innocent.
> +	 */
> +	bool innocent;
> +
>  	/**
>  	 * @syncobjs: Pool of per-queue synchronization objects.
>  	 *
> @@ -2690,6 +2700,12 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  			u32 csg_id = ffs(slot_mask) - 1;
>  			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
>  
> +			/* If the group was still usable before that point, we consider
> +			 * it innocent.
> +			 */
> +			if (group_can_run(csg_slot->group))
> +				csg_slot->group->innocent = true;
> +
>  			/* We consider group suspension failures as fatal and flag the
>  			 * group as unusable by setting timedout=true.
>  			 */
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 87c9cb555dd1..b99763cbae48 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -923,6 +923,15 @@ enum drm_panthor_group_state_flags {
>  	 * When a group ends up with this flag set, no jobs can be submitted to its queues.
>  	 */
>  	DRM_PANTHOR_GROUP_STATE_FATAL_FAULT = 1 << 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_GROUP_STATE_INNOCENT: Group was killed during a reset caused by other
> +	 * groups.
> +	 *
> +	 * This flag can only be set if DRM_PANTHOR_GROUP_STATE_TIMEDOUT is set and
> +	 * DRM_PANTHOR_GROUP_STATE_FATAL_FAULT is not.
> +	 */
> +	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
>  };
>  
>  /**

