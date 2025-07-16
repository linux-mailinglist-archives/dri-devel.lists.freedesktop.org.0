Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B512B07F2B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 22:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FD610E686;
	Wed, 16 Jul 2025 20:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YlKnhmFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1ED10E3CB;
 Wed, 16 Jul 2025 20:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ppxfpSf65xvjZfrNvinYo7lLll+dj5JSlDCraqqONkU=; b=YlKnhmFMI9K8g1s6rn+FZwP9gA
 TckLo6iD9hsSqQ0YwfQ3wb7KBnpe6O7D2Yc2+xgZnpXVehZVPeZ69nRWK9v4FiiBDNM+MQ++uQv6Z
 9NYbCMxgf5B3rxzmT+krGE8uXC0Hfmqzgh/bFeE9TR2mICThS44n9p2sJ+bE2A1uEpUsbfFMZS3jQ
 sK/y7r8SNdtsiPEiVP6rNd1Wqk28SxmSvjb9+D1UAPogfu8Fpwzh1B00s0pwOxaVf/zwGKe5alyCb
 Q8/rjj/qKXO6rrSFAPj0v68/F7KBvSXdF0fJbrxwAhPVRDlqTnJAwTFwWe8PB2PHaHWtZkGhdnlXp
 7Bsa+/lw==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uc98Q-00HU9t-4z; Wed, 16 Jul 2025 22:53:50 +0200
Message-ID: <849175e5-37ff-46fc-a298-93fc4679a68a@igalia.com>
Date: Wed, 16 Jul 2025 17:53:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Consolidate drm_sched_job_timedout
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250716144832.62494-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250716144832.62494-1-tvrtko.ursulin@igalia.com>
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

On 16/07/25 11:48, Tvrtko Ursulin wrote:
> Reduce to one spin_unlock for hopefully a little bit clearer flow in the
> function. It may appear that there is a behavioural change with the
> drm_sched_start_timeout_unlocked() now not being called if there were
> initially no jobs on the pending list, and then some appeared after
> unlock, however if the code would rely on the TDR handler restarting
> itself then it would fail to do that if the job arrived on the pending
> list after the check.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 36 ++++++++++++--------------
>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e2cda28a1af4..60ae600590dc 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -556,17 +556,15 @@ static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sc
>   
>   static void drm_sched_job_timedout(struct work_struct *work)
>   {
> -	struct drm_gpu_scheduler *sched;
> +	struct drm_gpu_scheduler *sched =
> +		container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> +	enum drm_gpu_sched_stat status;
>   	struct drm_sched_job *job;
> -	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET;
> -
> -	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
>   	/* Protects against concurrent deletion in drm_sched_get_finished_job */
>   	spin_lock(&sched->job_list_lock);
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
> -
>   	if (job) {
>   		/*
>   		 * Remove the bad job so it cannot be freed by a concurrent
> @@ -575,23 +573,23 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		 * cancelled, at which point it's safe.
>   		 */
>   		list_del_init(&job->list);
> -		spin_unlock(&sched->job_list_lock);
> +	}
> +	spin_unlock(&sched->job_list_lock);
>   
> -		status = job->sched->ops->timedout_job(job);
> +	if (!job)
> +		return;
>   
> -		/*
> -		 * Guilty job did complete and hence needs to be manually removed
> -		 * See drm_sched_stop doc.
> -		 */
> -		if (sched->free_guilty) {
> -			job->sched->ops->free_job(job);
> -			sched->free_guilty = false;
> -		}
> +	status = job->sched->ops->timedout_job(job);
>   
> -		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
> -			drm_sched_job_reinsert_on_false_timeout(sched, job);
> -	} else {
> -		spin_unlock(&sched->job_list_lock);
> +	/*
> +	 * Guilty job did complete and hence needs to be manually removed. See
> +	 * documentation for drm_sched_stop.
> +	 */
> +	if (sched->free_guilty) {
> +		job->sched->ops->free_job(job);
> +		sched->free_guilty = false;
> +	} else if (status == DRM_GPU_SCHED_STAT_NO_HANG) {
> +		drm_sched_job_reinsert_on_false_timeout(sched, job);
>   	}
>   
>   	if (status != DRM_GPU_SCHED_STAT_ENODEV)

