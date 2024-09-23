Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A297EA01
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135510E3D6;
	Mon, 23 Sep 2024 10:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VqyDxwv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6D610E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727088060;
 bh=/hdnpwt3CjNPj3yLoAFpp/q7hlN4Wtp7+q0xKtzqBSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VqyDxwv5apq9nG3k92Jeizroo7kWlURJWzk1BBZgYV7GZgEyAVqG1OZDsjeMoMUBL
 tixKRnpuw7hXR9ktUBk7p5Za//rL7upJSsG5KoSKdcse8XgsdsCx+V6En1h4IoXJcV
 W2cTrTAPjmoWPR9ohvgp/B5Ih5OyoDw6Rc7W5kcYQay/pFTTdxNL01cg1TMdf121rB
 +6aCuoz22V3xNawoKwRDb4X02fENnEp3S+pvh/sg7DRclJrjkymh+mJvqXR2fgx6UR
 tcNuPCBDIqMRyz1SJOZRhoJaFSSxFOYx+j0hEBR/aM3uZqp6t7PlMl0ODyy+veLQS7
 BF78USFJnX5uQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 522C917E1134;
 Mon, 23 Sep 2024 12:41:00 +0200 (CEST)
Date: Mon, 23 Sep 2024 12:40:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panthor: Fix race when converting group handle to
 group object
Message-ID: <20240923124056.5abbf64f@collabora.com>
In-Reply-To: <20240923103406.2509906-1-steven.price@arm.com>
References: <20240923103406.2509906-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 23 Sep 2024 11:34:06 +0100
Steven Price <steven.price@arm.com> wrote:

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

Uh, nice catch!

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

