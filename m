Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F157799BD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 23:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA2310E702;
	Fri, 11 Aug 2023 21:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B510E702;
 Fri, 11 Aug 2023 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9e2bYpNV4u3oz16fmxCSXzOQbIabD/H7drAZFVklVag=; b=n5ZRQFp4MTv7dxynOty3U2G+LB
 hOQ7H8EL4qKuM8vLHBbOlBtbMzwm425ZuqbvCZopgdVBWCZXkUsSjmOvUiJO9xGlfE83PIiohjLoU
 wSRF/UB61aqLnk7lC8mLTPoXKqptS48/ir0NlwouzF7YSNITOL+mAcixuUhcQ7AcltNgyXSVo6wrK
 ztXyl7neQbjLm3H545zNsZVXh8olWXWJANYs8y6uM3urm7hWlV80bwh5T8hPhohvu9C7pdyHPReKJ
 /kvPj4/eUXz7U1MeJJ8IZDaAdcKUPUBfUUhSHR3Q2pd1wn5lhtbyFtO0XJAHRTGE2JbP0v5NmC2Kp
 dJ9NKIvQ==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qUZur-00HJd9-G2; Fri, 11 Aug 2023 23:43:29 +0200
Message-ID: <830e7e1b-7a7b-e9c4-ad97-eba03bbf1728@igalia.com>
Date: Fri, 11 Aug 2023 18:43:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-3-matthew.brost@intel.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/9] drm/sched: Move schedule policy to scheduler /
 entity
In-Reply-To: <20230811023137.659037-3-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

I'm not sure in which tree you plan to apply this series, but if you
plan to apply it on drm-misc-next, it would be nice to rebase on top of
it. It would make it easier for driver maintainers to review it.

Apart from the small nit below it, I tested the Xe tree on v3d and 
things seems to be running smoothly.

On 8/10/23 23:31, Matthew Brost wrote:
> Rather than a global modparam for scheduling policy, move the scheduling
> policy to scheduler / entity so user can control each scheduler / entity
> policy.
> 
> v2:
>    - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>    - Only include policy in scheduler (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
>   drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
>   drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
>   drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
>   drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
>   drivers/gpu/drm/scheduler/sched_main.c     | 23 +++++++++++++++------
>   drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
>   include/drm/gpu_scheduler.h                | 20 ++++++++++++------
>   10 files changed, 72 insertions(+), 26 deletions(-)
> 

[...]

>   
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 38e092ea41e6..5e3fe77fa991 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_bin_sched_ops, NULL,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>   	if (ret)
>   		return ret;
>   
> @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_render_sched_ops, NULL,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,

Small nit: s/ULL/NULL

Best Regards,
- Maíra

> +			     v3d->drm.dev);
>   	if (ret)
>   		goto fail;
>   
> @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_tfu_sched_ops, NULL,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>   	if (ret)
>   		goto fail;
>   
> @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_csd_sched_ops, NULL,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> +				     v3d->drm.dev);
>   		if (ret)
>   			goto fail;
>   
> @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_cache_clean_sched_ops, NULL,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +				     NULL, "v3d_cache_clean",
> +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
>   		if (ret)
>   			goto fail;
>   	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 278106e358a8..897d52a4ff4f 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -72,11 +72,15 @@ enum drm_sched_priority {
>   	DRM_SCHED_PRIORITY_UNSET = -2
>   };
>   
> -/* Used to chose between FIFO and RR jobs scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR    0
> -#define DRM_SCHED_POLICY_FIFO  1
> +/* Used to chose default scheduling policy*/
> +extern int default_drm_sched_policy;
> +
> +enum drm_sched_policy {
> +	DRM_SCHED_POLICY_DEFAULT,
> +	DRM_SCHED_POLICY_RR,
> +	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_COUNT,
> +};
>   
>   /**
>    * struct drm_sched_entity - A wrapper around a job queue (typically
> @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
>    *              guilty and it will no longer be considered for scheduling.
>    * @score: score to help loadbalancer pick a idle sched
>    * @_score: score used when the driver doesn't provide one
> + * @sched_policy: Schedule policy for scheduler
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
>    * @pause_submit: pause queuing of @work_submit on @submit_wq
> @@ -514,6 +519,7 @@ struct drm_gpu_scheduler {
>   	int				hang_limit;
>   	atomic_t                        *score;
>   	atomic_t                        _score;
> +	enum drm_sched_policy		sched_policy;
>   	bool				ready;
>   	bool				free_guilty;
>   	bool				pause_submit;
> @@ -525,7 +531,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   struct workqueue_struct *submit_wq,
>   		   uint32_t hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,
