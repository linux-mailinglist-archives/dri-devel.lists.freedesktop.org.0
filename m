Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F811C3786D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 20:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF79D10E0D0;
	Wed,  5 Nov 2025 19:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="flSJsdDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D73510E0D0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 19:43:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC7E140991;
 Wed,  5 Nov 2025 19:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359BDC4CEF5;
 Wed,  5 Nov 2025 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762371788;
 bh=AUFy5GuBYkH+VL7Srm0AtXx8Hzt2VmGSak6WgKWlRTw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=flSJsdDruhfK1i2/GpmuFwidjvY62sKLi8e/NB/c1Hi9EBFPDz8oQBaA9wp0H5p+B
 EHYI5hov+mOh1h44X4xLnv4cZfFOhslVyN1wj+9HL8G76RfoXjSxTOYvhbb2+w3aob
 34gHGcWGpvFEKIweAIEMEYHcmgFTB+qF4+ZnWsvku9pKQibQdBqyGVk8qv0OO3aKU+
 vnIbmWkkJWQUXEGtSwiR08EukOHqtZn13bcrc59ymQhyxOONhDqi+CRlbukQxwe0Iq
 F5m8oW99n7LkY9MLAjzB4LvOLo2i6uAodPKafgmS3cul26ddYwFh4XX/4EJ00UMweQ
 XEqnAe9UIQTrQ==
Message-ID: <5e341c1b-4cb1-46b3-a8b2-2c6758017988@kernel.org>
Date: Wed, 5 Nov 2025 13:43:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Fix dma_fence leak when job is canceled
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251105194140.1004314-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251105194140.1004314-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 11/5/2025 1:41 PM, Lizhi Hou wrote:
> Currently, dma_fence_put(job->fence) is called in job notification
> callback. However, if a job is canceled, the notification callback is never
> invoked, leading to a memory leak. Move dma_fence_put(job->fence)
> to the job cleanup function to ensure the fence is always released.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_ctx.c    | 1 -
>   drivers/accel/amdxdna/amdxdna_ctx.c | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 2b51c5211c2d..e9dd9e03ef07 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -189,7 +189,6 @@ aie2_sched_notify(struct amdxdna_sched_job *job)
>   
>   	up(&job->hwctx->priv->job_sem);
>   	job->job_done = true;
> -	dma_fence_put(fence);
>   	mmput_async(job->mm);
>   	aie2_job_put(job);
>   }
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 878cc955f56d..d17aef89a0ad 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -422,6 +422,7 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job)
>   	trace_amdxdna_debug_point(job->hwctx->name, job->seq, "job release");
>   	amdxdna_arg_bos_put(job);
>   	amdxdna_gem_put_obj(job->cmd_bo);
> +	dma_fence_put(job->fence);
>   }
>   
>   int amdxdna_cmd_submit(struct amdxdna_client *client,

