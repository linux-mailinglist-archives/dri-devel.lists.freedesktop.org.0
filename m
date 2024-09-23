Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143F97EA30
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFC810E120;
	Mon, 23 Sep 2024 10:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 176CF10E120
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:53:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04EF41007
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 03:53:47 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DE7F3F71A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 03:53:17 -0700 (PDT)
Date: Mon, 23 Sep 2024 11:53:14 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panthor: Fix race when converting group handle to
 group object
Message-ID: <ZvFImqKv96uAieJL@e110455-lin.cambridge.arm.com>
References: <20240923103406.2509906-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923103406.2509906-1-steven.price@arm.com>
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

On Mon, Sep 23, 2024 at 11:34:06AM +0100, Steven Price wrote:
> XArray provides it's own internal lock which protects the internal array
> when entries are being simultaneously added and removed. However there
> is still a race between retrieving the pointer from the XArray and
> incrementing the reference count.
> 
> To avoid this race simply hold the internal XArray lock when
> incrementing the reference count, this ensures there cannot be a racing
> call to xa_erase().
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 42afdf0ddb7e..0dbeebcf23b4 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3242,6 +3242,18 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  	return 0;
>  }
>  
> +static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
> +					       u32 group_handle)
> +{
> +	struct panthor_group *group;
> +
> +	xa_lock(&pool->xa);
> +	group = group_get(xa_load(&pool->xa, group_handle));
> +	xa_unlock(&pool->xa);
> +
> +	return group;
> +}
> +
>  int panthor_group_get_state(struct panthor_file *pfile,
>  			    struct drm_panthor_group_get_state *get_state)
>  {
> @@ -3253,7 +3265,7 @@ int panthor_group_get_state(struct panthor_file *pfile,
>  	if (get_state->pad)
>  		return -EINVAL;
>  
> -	group = group_get(xa_load(&gpool->xa, get_state->group_handle));
> +	group = group_from_handle(gpool, get_state->group_handle);
>  	if (!group)
>  		return -EINVAL;
>  
> @@ -3384,7 +3396,7 @@ panthor_job_create(struct panthor_file *pfile,
>  	job->call_info.latest_flush = qsubmit->latest_flush;
>  	INIT_LIST_HEAD(&job->node);
>  
> -	job->group = group_get(xa_load(&gpool->xa, group_handle));
> +	job->group = group_from_handle(gpool, group_handle);
>  	if (!job->group) {
>  		ret = -EINVAL;
>  		goto err_put_job;
> -- 
> 2.39.5
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
