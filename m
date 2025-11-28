Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5AC91606
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835E010E199;
	Fri, 28 Nov 2025 09:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e7EWkZDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9984910E199
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764321157;
 bh=i9WIxtKeAnQZjeiBu8Z/ozSyDBBD7LXEf3gyMC9C//g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e7EWkZDGBbcA4AZmQLOdhzhbcguA1QwdC+M19P1/asPZxOM8QQnw5sOAD/iOGQMuk
 ZlxKo4pvY0Z+SgXzzo8fpbJ0cIymD1HATRTguVeNu9tuSxwkwQEgPWCzck25nmBGED
 glJX3IoYI/0Jz5X3+YPlCLQCOVGt1lpvPBhFQJMU4c/A48gPcueY2ZGnf1FXs3bKs5
 jv6yeOmxSztnqYgWtaSY67n5cnYcboEWst+os4QxvSPZZD4KTFhMl0awMci2UMlexR
 P05MOb+RRgFJqwo6u3iL94jOQMM8vtf4hGGJrtF5AZWdhS7D9OYUw3Z4d5E1VdIE3T
 JncNjmi/mAs2g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BA8AF17E10F6;
 Fri, 28 Nov 2025 10:12:36 +0100 (CET)
Date: Fri, 28 Nov 2025 10:12:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2] drm/panthor: Prevent potential UAF in group creation
Message-ID: <20251128101232.5c18ae0b@fedora>
In-Reply-To: <20251127164912.3788155-1-akash.goel@arm.com>
References: <20251127164912.3788155-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Thu, 27 Nov 2025 16:49:12 +0000
Akash Goel <akash.goel@arm.com> wrote:

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
> v2: Add R-bs and fixes tags
> 
> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Queued to drm-misc-next-fixes.

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

