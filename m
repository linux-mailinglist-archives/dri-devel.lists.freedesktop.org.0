Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFF8AA5C53
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7D10E033;
	Thu,  1 May 2025 08:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pPOajMsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD410E033
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HuOCUV3ZYd3s7vZC68iy5c6u9cQMhDH1ugkKmi7yDZI=; b=pPOajMsZd0TvfCXMTMWNGDKirP
 wPYuLuMNtL2obHX6hXS8sVijDhYNOZa0nP9O6znUSUaNV6ijpTIiOQzmVFg8Jl3o/kyuyLc75RuMq
 9lJHJEqSt/w+J3mjc30MiPsHKChEb+/0StS3zi9t20qZgCDEk8ZQ2b+CGjHp+n/uU/PUAQ/uvf9OG
 TdJWnX+I6VmZQMSsd9Io/wwuAhNqIQa3fRE/OtIVa5TnvD7vUeg/luPD25TMNFIGHnPT/zBPbiwvB
 yH3xXOlX/d1QDkciGnVVh64iMyp+9ddA4l/amQwX5cuTz61lRtYsHLjwwcIYOSGoY+0G7wggPwvw3
 8P3mDlqg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uAPZF-001RQ9-GT; Thu, 01 May 2025 10:48:11 +0200
Message-ID: <4cd1c241-ee17-46b2-aa47-43722e8dac5b@igalia.com>
Date: Thu, 1 May 2025 09:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/v3d: Add job to pending list if the reset was
 skipped
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 stable@vger.kernel.org, Daivik Bhatia <dtgs1208@gmail.com>
References: <20250430210643.57924-1-mcanal@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250430210643.57924-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 30/04/2025 21:51, Maíra Canal wrote:
> When a CL/CSD job times out, we check if the GPU has made any progress
> since the last timeout. If so, instead of resetting the hardware, we skip
> the reset and let the timer get rearmed. This gives long-running jobs a
> chance to complete.
> 
> However, when `timedout_job()` is called, the job in question is removed
> from the pending list, which means it won't be automatically freed through
> `free_job()`. Consequently, when we skip the reset and keep the job
> running, the job won't be freed when it finally completes.
> 
> This situation leads to a memory leak, as exposed in [1] and [2].
> 
> Similarly to commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler when
> GPU is still active"), this patch ensures the job is put back on the
> pending list when extending the timeout.
> 
> Cc: stable@vger.kernel.org # 6.0
> Reported-by: Daivik Bhatia <dtgs1208@gmail.com>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/12227 [1]
> Closes: https://github.com/raspberrypi/linux/issues/6817 [2]
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> ---
> 
> Hi,
> 
> While we typically strive to avoid exposing the scheduler's internals
> within the drivers, I'm proposing this fix as an interim solution. I'm aware
> that a comprehensive fix will need some adjustments on the DRM sched side,
> and I plan to address that soon.
> 
> However, it would be hard to justify the backport of such patches to the
> stable branches and this issue is affecting users in the moment.
> Therefore, I'd like to push this patch to drm-misc-fixes in order to
> address this leak as soon as possible, while working in a more generic
> solution.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> 
> Best Regards,
> - Maíra
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20250427202907.94415-2-mcanal@igalia.com/
> 
> - Protect the pending list by using its spinlock.
> - Add the URL of another downstream issue related to this patch.
> 
>   drivers/gpu/drm/v3d/v3d_sched.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index b3be08b0ca91..c612363181df 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -734,11 +734,16 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
> -/* If the current address or return address have changed, then the GPU
> - * has probably made progress and we should delay the reset.  This
> - * could fail if the GPU got in an infinite loop in the CL, but that
> - * is pretty unlikely outside of an i-g-t testcase.
> - */
> +static void
> +v3d_sched_skip_reset(struct drm_sched_job *sched_job)
> +{
> +	struct drm_gpu_scheduler *sched = sched_job->sched;
> +
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&sched_job->list, &sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
>   static enum drm_gpu_sched_stat
>   v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>   		    u32 *timedout_ctca, u32 *timedout_ctra)
> @@ -748,9 +753,16 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>   	u32 ctca = V3D_CORE_READ(0, V3D_CLE_CTNCA(q));
>   	u32 ctra = V3D_CORE_READ(0, V3D_CLE_CTNRA(q));
>   
> +	/* If the current address or return address have changed, then the GPU
> +	 * has probably made progress and we should delay the reset. This
> +	 * could fail if the GPU got in an infinite loop in the CL, but that
> +	 * is pretty unlikely outside of an i-g-t testcase.
> +	 */
>   	if (*timedout_ctca != ctca || *timedout_ctra != ctra) {
>   		*timedout_ctca = ctca;
>   		*timedout_ctra = ctra;
> +
> +		v3d_sched_skip_reset(sched_job);
>   		return DRM_GPU_SCHED_STAT_NOMINAL;
>   	}
>   
> @@ -790,11 +802,13 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>   	struct v3d_dev *v3d = job->base.v3d;
>   	u32 batches = V3D_CORE_READ(0, V3D_CSD_CURRENT_CFG4(v3d->ver));
>   
> -	/* If we've made progress, skip reset and let the timer get
> -	 * rearmed.
> +	/* If we've made progress, skip reset, add the job to the pending
> +	 * list, and let the timer get rearmed.
>   	 */
>   	if (job->timedout_batches != batches) {
>   		job->timedout_batches = batches;
> +
> +		v3d_sched_skip_reset(sched_job);
>   		return DRM_GPU_SCHED_STAT_NOMINAL;
>   	}
>   

