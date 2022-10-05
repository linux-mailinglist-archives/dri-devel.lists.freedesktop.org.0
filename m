Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93415F5132
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 10:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058CC10E14E;
	Wed,  5 Oct 2022 08:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 676D310E14E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 08:53:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A69FB113E;
 Wed,  5 Oct 2022 01:53:40 -0700 (PDT)
Received: from [10.57.32.80] (unknown [10.57.32.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E4E3F67D;
 Wed,  5 Oct 2022 01:53:32 -0700 (PDT)
Message-ID: <e2133dd4-c99a-ac51-b47e-112d6ff9517d@arm.com>
Date: Wed, 5 Oct 2022 09:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sched: add missing NULL check in
 drm_sched_get_cleanup_job v2
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Arvind.Yadav@amd.com, andrey.grodzovsky@amd.com,
 Arunpravin.PaneerSelvam@amd.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org
References: <20221004132831.134986-1-christian.koenig@amd.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20221004132831.134986-1-christian.koenig@amd.com>
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

On 04/10/2022 14:28, Christian König wrote:
> Otherwise we would crash if the job is not resubmitted.
> 
> v2: fix second usage of s_fence->parent as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ce86b03e8386..4cc59bae38dd 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -919,7 +919,8 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  	job = list_first_entry_or_null(&sched->pending_list,
>  				       struct drm_sched_job, list);
>  
> -	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
> +	if (job && (!job->s_fence->parent ||
> +		    dma_fence_is_signaled(job->s_fence->parent))) {
>  		/* remove job from pending_list */
>  		list_del_init(&job->list);
>  
> @@ -929,7 +930,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  		next = list_first_entry_or_null(&sched->pending_list,
>  						typeof(*next), list);
>  
> -		if (next) {
> +		if (next && job->s_fence->parent) {
>  			next->s_fence->scheduled.timestamp =
>  				job->s_fence->parent->timestamp;
>  			/* start TO timer for next job */

