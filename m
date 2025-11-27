Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0CBC8F6A1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 17:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F3710E092;
	Thu, 27 Nov 2025 16:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F331910E092
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 16:02:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF27176A;
 Thu, 27 Nov 2025 08:02:12 -0800 (PST)
Received: from [10.1.31.95] (unknown [10.1.31.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF2983F73B;
 Thu, 27 Nov 2025 08:02:17 -0800 (PST)
Message-ID: <f0b4ad5b-e202-4981-b4f2-01d78b3dc41f@arm.com>
Date: Thu, 27 Nov 2025 16:02:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Prevent potential UAF in group creation
To: Akash Goel <akash.goel@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251127081239.3744766-1-akash.goel@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251127081239.3744766-1-akash.goel@arm.com>
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

On 27/11/2025 08:12, Akash Goel wrote:
> This commit prevents the possibility of a use after free issue in the
> GROUP_CREATE ioctl function, which arose as pointer to the group is
> accessed in that ioctl function after storing it in the Xarray.
> A malicious userspace can second guess the handle of a group and try
> to call GROUP_DESTROY ioctl from another thread around the same time
> as GROUP_CREATE ioctl.
> 
> To prevent the use after free exploit, this commit uses a mark on an
> entry of group pool Xarray which is added just before returning from
> the GROUP_CREATE ioctl function. The mark is checked for all ioctls
> that specify the group handle and so userspace won't be abe to delete
> a group that isn't marked yet.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I *think* this should have a...

Fixes: d2624d90a0b7 ("drm/panthor: assign unique names to queues")

... as I don't believe it was a problem before the rearrangement that
happened there.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index b834123a6560..a6b8024e1a3c 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -779,6 +779,12 @@ struct panthor_job_profiling_data {
>   */
>  #define MAX_GROUPS_PER_POOL 128
>  
> +/*
> + * Mark added on an entry of group pool Xarray to identify if the group has
> + * been fully initialized and can be accessed elsewhere in the driver code.
> + */
> +#define GROUP_REGISTERED XA_MARK_1
> +
>  /**
>   * struct panthor_group_pool - Group pool
>   *
> @@ -3007,7 +3013,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  		return;
>  
>  	xa_lock(&gpool->xa);
> -	xa_for_each(&gpool->xa, i, group) {
> +	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
>  		guard(spinlock)(&group->fdinfo.lock);
>  		pfile->stats.cycles += group->fdinfo.data.cycles;
>  		pfile->stats.time += group->fdinfo.data.time;
> @@ -3727,6 +3733,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  
>  	group_init_task_info(group);
>  
> +	xa_set_mark(&gpool->xa, gid, GROUP_REGISTERED);
> +
>  	return gid;
>  
>  err_erase_gid:
> @@ -3744,6 +3752,9 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_group *group;
>  
> +	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
> +		return -EINVAL;
> +
>  	group = xa_erase(&gpool->xa, group_handle);
>  	if (!group)
>  		return -EINVAL;
> @@ -3769,12 +3780,12 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  }
>  
>  static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
> -					       u32 group_handle)
> +					       unsigned long group_handle)
>  {
>  	struct panthor_group *group;
>  
>  	xa_lock(&pool->xa);
> -	group = group_get(xa_load(&pool->xa, group_handle));
> +	group = group_get(xa_find(&pool->xa, &group_handle, group_handle, GROUP_REGISTERED));
>  	xa_unlock(&pool->xa);
>  
>  	return group;
> @@ -3861,7 +3872,7 @@ panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
>  		return;
>  
>  	xa_lock(&gpool->xa);
> -	xa_for_each(&gpool->xa, i, group) {
> +	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
>  		stats->resident += group->fdinfo.kbo_sizes;
>  		if (group->csg_id >= 0)
>  			stats->active += group->fdinfo.kbo_sizes;

