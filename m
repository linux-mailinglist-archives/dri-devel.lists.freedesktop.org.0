Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D3D40F294
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 08:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA5A6EB9B;
	Fri, 17 Sep 2021 06:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F256EB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=ioOfcV2cVAYpCFAYLbC11PyrwJpIs71yePas0NtDjHM=; 
 b=NXl7vOIIuPsxElLYAVgU00HE0jFyWrPNoKqfB/OlDds+/S33G/IwS4C2+2PkDPygOOxywosNYJp6lD9oEk8cd6vOkYOZ05Q73zI2oAwyaNmsGO4wDAb3TKKm7c13rRem6sPl9X8VnqpwDmI75Sp7L/A2kfIEq9zcUyhS54Xr9yMqHHDeEbpM3m0Fm/p1QWiMYnNhkSDU0CTds3j8zpExGuIT7fa8+8pIIV02Etv7vfXzY8M3ouiPXObdvkGG3CDVvP5BUOX4SRGCsLtWkwgYtUEPDOaORvLkrz1+xgjoGIbrRAoCGGFfkA5OSbmQT1WScG5Cq+rUbOWnlylOIa2npw==;
Received: from 164.49.165.83.dynamic.reverse-mundo-r.com ([83.165.49.164]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mR7bN-0001zL-Vz; Fri, 17 Sep 2021 08:44:02 +0200
Message-ID: <e408d91387fa8d64cfbb42b9df34f9f9aefcf574.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: fix sched job resources cleanup when a job is
 aborted
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Fri, 17 Sep 2021 08:43:52 +0200
In-Reply-To: <20210916212726.2u2psq2egwy2mdva@mail.igalia.com>
References: <20210916212726.2u2psq2egwy2mdva@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

With that said, I don't like how we are doing error handling here, I
think we want to simplify this and try to make it so we centralize
error handling in one place instead of having multiple error exits
paths, each one trying to do the right thing at that point. This is
error prone, as this patch is showing.

Here is a proposal to make this better:

Make job memory allocation part of v3d_job_init. v3d_job init already
handles error conditions nicely. If we do this, we no longer need to
handle allocation errors in ioctls one by one and for any job we only
have two scenarios: v3d_job_init was successul or it failed (in which
case we know it already cleaned up after itself and we should have a
NULL job as a result). If v3d_job_init failed, then we *always* jump to
the fail tag and there we call v3d_job_cleanup for all jobs that can be
created in that ioctl. If a job is NULL then v3d_job_cleanup returns
early, otherwise, we know it is a fully initialized job, so it does 	
drm_sched_job_cleanup + v3d_job_put.

I think that should make error handling in these functions a lot
easier.

Iago


On Thu, 2021-09-16 at 22:27 +0100, Melissa Wen wrote:
> In a cl submission, when bin job initialization fails, sched job
> resources
> were already allocated for the render job. At this point,
> drm_sched_job_init(render) was done in v3d_job_init but the render
> job is
> aborted before drm_sched_job_arm (in v3d_job_push) happens;
> therefore, not
> only v3d_job_put but also drm_sched_job_cleanup should be called (by
> v3d_job_cleanup). A similar issue is addressed for csd and tfu
> submissions.
> 
> The issue was noticed from a review by Iago Toral in a patch that
> touches
> the same part of the code.
> 
> Fixes: 916044fac8623 ("drm/v3d: Move drm_sched_job_init to
> v3d_job_init")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index 1953706bdaeb..ead0be8d48a7 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -567,14 +567,14 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> void *data,
>  	if (args->bcl_start != args->bcl_end) {
>  		bin = kcalloc(1, sizeof(*bin), GFP_KERNEL);
>  		if (!bin) {
> -			v3d_job_put(&render->base);
> +			v3d_job_cleanup(&render->base);
> 
> >  			return -ENOMEM;
>  		}
>  
>  		ret = v3d_job_init(v3d, file_priv, &bin->base,
>  				   v3d_job_free, args->in_sync_bcl,
> V3D_BIN);
>  		if (ret) {
> -			v3d_job_put(&render->base);
> +			v3d_job_cleanup(&render->base);
>  			kfree(bin);
>  			return ret;
>  		}
> @@ -716,7 +716,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  	job->base.bo = kcalloc(ARRAY_SIZE(args->bo_handles),
>  			       sizeof(*job->base.bo), GFP_KERNEL);
>  	if (!job->base.bo) {
> -		v3d_job_put(&job->base);
> +		v3d_job_cleanup(&job->base);
>  		return -ENOMEM;
>  	}
>  
> @@ -810,14 +810,13 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  
>  	clean_job = kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
>  	if (!clean_job) {
> -		v3d_job_put(&job->base);
> -		kfree(job);
> +		v3d_job_cleanup(&job->base);
>  		return -ENOMEM;
>  	}
>  
>  	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0,
> V3D_CACHE_CLEAN);
>  	if (ret) {
> -		v3d_job_put(&job->base);
> +		v3d_job_cleanup(&job->base);
>  		kfree(clean_job);
>  		return ret;
>  	}

