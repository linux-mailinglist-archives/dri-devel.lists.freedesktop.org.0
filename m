Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D45B3B327C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07396EC42;
	Thu, 24 Jun 2021 15:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20E7B6EC25
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:24:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EAF7ED1;
 Thu, 24 Jun 2021 08:24:57 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42D8E3F719;
 Thu, 24 Jun 2021 08:24:56 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: Declare entity idle only after HW submission
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210624140850.2229697-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <bd6a44e5-7de9-3ab2-38da-06cd680fe1a3@arm.com>
Date: Thu, 24 Jun 2021 16:24:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624140850.2229697-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2021 15:08, Boris Brezillon wrote:
> The panfrost driver tries to kill in-flight jobs on FD close after
> destroying the FD scheduler entities. For this to work properly, we
> need to make sure the jobs popped from the scheduler entities have
> been queued at the HW level before declaring the entity idle, otherwise
> we might iterate over a list that doesn't contain those jobs.
> 
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 81496ae2602e..aa776ebe326a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -811,10 +811,10 @@ static int drm_sched_main(void *param)
>  
>  		sched_job = drm_sched_entity_pop_job(entity);
>  
> -		complete(&entity->entity_idle);
> -
> -		if (!sched_job)
> +		if (!sched_job) {
> +			complete(&entity->entity_idle);
>  			continue;
> +		}
>  
>  		s_fence = sched_job->s_fence;
>  
> @@ -823,6 +823,7 @@ static int drm_sched_main(void *param)
>  
>  		trace_drm_run_job(sched_job, entity);
>  		fence = sched->ops->run_job(sched_job);
> +		complete(&entity->entity_idle);
>  		drm_sched_fence_scheduled(s_fence);
>  
>  		if (!IS_ERR_OR_NULL(fence)) {
> 

