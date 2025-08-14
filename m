Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA8B27321
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 01:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8710E326;
	Thu, 14 Aug 2025 23:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nogP06os";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B09010E232;
 Thu, 14 Aug 2025 23:48:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E056A5C6FCD;
 Thu, 14 Aug 2025 23:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D75C4CEED;
 Thu, 14 Aug 2025 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755215335;
 bh=J2pOmDG+0oiYVuABnzLpk0FXLDrvf8TG3nt5h0zb8Wc=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=nogP06oslO7URh1TMZmmDCnc0s7XptzWzvQrNbaa5my3Xl7uQMYaj5rv3Qy3ygMua
 pru3uNCkv3Q5ukA56dwBTHaG1B4kHdPspMyxzIYiFRpMMH/UUaYTfHgVhHvQem9y/s
 d/f0MpKWkE2Z0dpqSfygQDBx2ElwFfMxGWdbU663kQISXjlOrI9CkAYAz9MOh5SIjK
 ZxbCxMubhnpqVA+uSGzvAFoLLT4WXOYFPAI0LNNbgZX4fmHTvBNo7oAi2WT0ib787f
 LBDuDEXNjUrdehRjHWMgWAjzI5pq5yuZswGdrAVM4pgJ7Vuy38hMVX4nVcNTGtNdDs
 yjlclV3hr8MgA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 19419CE0ADB; Thu, 14 Aug 2025 16:48:54 -0700 (PDT)
Date: Thu, 14 Aug 2025 16:48:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
Message-ID: <00f16170-93ca-4dac-a01f-4c5e0c60ff4c@paulmck-laptop>
References: <20250807131058.1013858-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807131058.1013858-1-sashal@kernel.org>
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
Reply-To: paulmck@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 07, 2025 at 09:10:58AM -0400, Sasha Levin wrote:
> Split the vmbind case into a separate helper function
> submit_lock_objects_vmbind() to fix objtool warning:
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
> 
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Tested-by: Paul E. McKenney <paulmck@kernel.org>

> ---
> 
> Changes since v1:
>  - Extract helper submit_lock_objects_vmbind() instead of refactoring
>    single loop
> 
>  drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5f8e939a5906..1ce90e351b7a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>  	return ret;
>  }
>  
> -/* This is where we make sure all the bo's are reserved and pin'd: */
> -static int submit_lock_objects(struct msm_gem_submit *submit)
> +static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>  {
> -	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> +	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES;
>  	struct drm_exec *exec = &submit->exec;
> -	int ret;
> +	int ret = 0;
>  
> -	if (msm_context_is_vmbind(submit->queue->ctx)) {
> -		flags |= DRM_EXEC_IGNORE_DUPLICATES;
> +	drm_exec_init(&submit->exec, flags, submit->nr_bos);
>  
> -		drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +	drm_exec_until_all_locked (&submit->exec) {
> +		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> +		drm_exec_retry_on_contention(exec);
> +		if (ret)
> +			break;
>  
> -		drm_exec_until_all_locked (&submit->exec) {
> -			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> -			drm_exec_retry_on_contention(exec);
> -			if (ret)
> -				return ret;
> +		ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> +		drm_exec_retry_on_contention(exec);
> +		if (ret)
> +			break;
> +	}
>  
> -			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> -			drm_exec_retry_on_contention(exec);
> -			if (ret)
> -				return ret;
> -		}
> +	return ret;
> +}
>  
> -		return 0;
> -	}
> +/* This is where we make sure all the bo's are reserved and pin'd: */
> +static int submit_lock_objects(struct msm_gem_submit *submit)
> +{
> +	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> +	int ret = 0;
> +
> +	if (msm_context_is_vmbind(submit->queue->ctx))
> +		return submit_lock_objects_vmbind(submit);
>  
>  	drm_exec_init(&submit->exec, flags, submit->nr_bos);
>  
> @@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  					drm_gpuvm_resv_obj(submit->vm));
>  		drm_exec_retry_on_contention(&submit->exec);
>  		if (ret)
> -			return ret;
> +			break;
>  		for (unsigned i = 0; i < submit->nr_bos; i++) {
>  			struct drm_gem_object *obj = submit->bos[i].obj;
>  			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
>  			drm_exec_retry_on_contention(&submit->exec);
>  			if (ret)
> -				return ret;
> +				break;
>  		}
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int submit_fence_sync(struct msm_gem_submit *submit)
> -- 
> 2.39.5
> 
