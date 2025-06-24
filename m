Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DCAE606B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E99910E0D9;
	Tue, 24 Jun 2025 09:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PqzidIKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE3689FD4;
 Tue, 24 Jun 2025 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yzL8Uifc+rzD8qaTrVT/O7hLL73vXjI3lloUG7iwRts=; b=PqzidIKmk7zti1YwkxZqeyzcfy
 PPgxj3Fcrm53PSXpn9rM0ZtIZ6W90nlmI0tDJswoVD4yGDcw/zZ6n/zbb6ZKHs2q4b8cDPkmm3Vak
 i0l7So8JC6JxFmote9vu69SXsyfWZKk/SGFa2taaVpZhvJtVhn/DI0Uc2fTWE/74i8FLAmHQDEMkH
 hzB8muYeXWAQVTPZFyR8O6eVzSLHFWbaKkxwylX4wUjuJHISLGpoGboi04fa4yQ/SPd0zadBGXBnL
 rkxVGAUb+rNH+yFnPmgqMz6pE6jo/jTfo5SMuhZRVzQFLiCZrmBPZ/yieOrBqFWKDzlmWrXKcEmTF
 qiN7dTVA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uTzjc-007vna-5G; Tue, 24 Jun 2025 11:14:32 +0200
Message-ID: <8016b15f-237b-40cd-b9f7-2e5878401941@igalia.com>
Date: Tue, 24 Jun 2025 10:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-5-8be5cca2725d@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250618-sched-skip-reset-v3-5-8be5cca2725d@igalia.com>
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


On 18/06/2025 15:47, Maíra Canal wrote:
> When a CL/CSD job times out, we check if the GPU has made any progress
> since the last timeout. If so, instead of resetting the hardware, we skip
> the reset and allow the timer to be rearmed. This gives long-running jobs
> a chance to complete.
> 
> Instead of manipulating scheduler's internals, inform the scheduler that
> the job did not actually timeout and no reset was performed through
> the new status code DRM_GPU_SCHED_STAT_NO_HANG.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 16 ++--------------
>   1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index e2b7f24d528e773968daea0f5b31c869584bb692..cc85f1b19ac405146a2a516f335a46376684bc91 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -744,16 +744,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>   	return DRM_GPU_SCHED_STAT_RESET;
>   }
>   
> -static void
> -v3d_sched_skip_reset(struct drm_sched_job *sched_job)
> -{
> -	struct drm_gpu_scheduler *sched = sched_job->sched;
> -
> -	spin_lock(&sched->job_list_lock);
> -	list_add(&sched_job->list, &sched->pending_list);
> -	spin_unlock(&sched->job_list_lock);
> -}
> -
>   static enum drm_gpu_sched_stat
>   v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>   		    u32 *timedout_ctca, u32 *timedout_ctra)
> @@ -772,8 +762,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>   		*timedout_ctca = ctca;
>   		*timedout_ctra = ctra;
>   
> -		v3d_sched_skip_reset(sched_job);
> -		return DRM_GPU_SCHED_STAT_RESET;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>   	}
>   
>   	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> @@ -818,8 +807,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>   	if (job->timedout_batches != batches) {
>   		job->timedout_batches = batches;
>   
> -		v3d_sched_skip_reset(sched_job);
> -		return DRM_GPU_SCHED_STAT_RESET;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>   	}
>   
>   	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> 

This one is easy, it looks the same before and after so:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

