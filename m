Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7385C5F074A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0A410EBEF;
	Fri, 30 Sep 2022 09:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 595F110EBEF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 09:12:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9993615A1;
 Fri, 30 Sep 2022 02:12:51 -0700 (PDT)
Received: from [10.1.31.20] (e122027.cambridge.arm.com [10.1.31.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B11F23F73B;
 Fri, 30 Sep 2022 02:12:43 -0700 (PDT)
Message-ID: <2f9fccae-afc6-20f8-4ffb-6a09294d840c@arm.com>
Date: Fri, 30 Sep 2022 10:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm/sched: add missing NULL check in
 drm_sched_get_cleanup_job
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 andrey.grodzovsky@amd.com, Arunpravin.PaneerSelvam@amd.com,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org
References: <20220929180151.139751-1-christian.koenig@amd.com>
 <20220929180151.139751-2-christian.koenig@amd.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220929180151.139751-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2022 19:01, Christian König wrote:
> Otherwise we would crash if the job is not resubmitted.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4f2395d1a791..23e5e8275dc7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -829,7 +829,8 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  	job = list_first_entry_or_null(&sched->pending_list,
>  				       struct drm_sched_job, list);
>  
> -	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
> +	if (job && (!job->s_fence->parent ||
> +		    dma_fence_is_signaled(job->s_fence->parent))) {
>  		/* remove job from pending_list */
>  		list_del_init(&job->list);
>  

Sadly there's another use further down, so this isn't a complete fix:

> 		/* cancel this job's TO timer */
> 		cancel_delayed_work(&sched->work_tdr);
> 		/* make the scheduled timestamp more accurate */
> 		next = list_first_entry_or_null(&sched->pending_list,
> 						typeof(*next), list);
> 
> 		if (next) {
> 			next->s_fence->scheduled.timestamp =
> 				job->s_fence->parent->timestamp;

From the comment I presume that just skipping this section (when parent
is NULL) would be fine.

Steve
