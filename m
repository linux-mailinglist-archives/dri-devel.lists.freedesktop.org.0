Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B53765B3AC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5911C10E1A1;
	Mon,  2 Jan 2023 15:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E389C10E1A1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:01:05 +0000 (UTC)
Received: from [192.168.2.142] (109-252-113-89.nat.spd-mgts.ru
 [109.252.113.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 285AA660036F;
 Mon,  2 Jan 2023 15:01:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672671664;
 bh=392aCK5zvC3760hphwyYCztxZyVO+abdWqHC/ZYXiic=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=G/KEjpqEps0Fsq05QmjZaf2SWu9iiN10CTCAJOlIfXG/fGXORGJ8jdIMuVHn29yJr
 bXcyb34EulV8JoQ/liv4AXpIu5QZzK7O9g9zuIKcoHoCtw6E5+tQV1WOoOD7R/iCYg
 jrtarf3GNQnMQ8TbbYxWdH7BGCej6XVpeOhx7KLSR0uTPn278A6RCuLV9/B7E/Bbtn
 Z+3CACqLWTj2v3W/EkNVJyqnBbq3GM+EfcQzV33LL6Gbq+M99hcI2igLcPyXHY3w7U
 uwF2jZD8WTVY3wmrna4BUTCg426pdvDSpLrXv7vysMtepZ/t+v1CYBMKGYs1RAfVDS
 OKhFhau5I00cA==
Message-ID: <8cc1a92d-aa47-f330-21da-eb61601d47d2@collabora.com>
Date: Mon, 2 Jan 2023 18:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1] drm/scheduler: Fix lockup in drm_sched_entity_kill()
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
References: <20221123001303.533968-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20221123001303.533968-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 03:13, Dmitry Osipenko wrote:
> The drm_sched_entity_kill() is invoked twice by drm_sched_entity_destroy()
> while userspace process is exiting or being killed. First time it's invoked
> when sched entity is flushed and second time when entity is released. This
> causes a lockup within wait_for_completion(entity_idle) due to how completion
> API works.
> 
> Calling wait_for_completion() more times than complete() was invoked is a
> error condition that causes lockup because completion internally uses
> counter for complete/wait calls. The complete_all() must be used instead
> in such cases.
> 
> This patch fixes lockup of Panfrost driver that is reproducible by killing
> any application in a middle of 3d drawing operation.
> 
> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index fe09e5be79bd..15d04a0ec623 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -81,7 +81,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	init_completion(&entity->entity_idle);
>  
>  	/* We start in an idle state. */
> -	complete(&entity->entity_idle);
> +	complete_all(&entity->entity_idle);
>  
>  	spin_lock_init(&entity->rq_lock);
>  	spsc_queue_init(&entity->job_queue);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 6ce04c2e90c0..857ec20be9e8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1026,7 +1026,7 @@ static int drm_sched_main(void *param)
>  		sched_job = drm_sched_entity_pop_job(entity);
>  
>  		if (!sched_job) {
> -			complete(&entity->entity_idle);
> +			complete_all(&entity->entity_idle);
>  			continue;
>  		}
>  
> @@ -1037,7 +1037,7 @@ static int drm_sched_main(void *param)
>  
>  		trace_drm_run_job(sched_job, entity);
>  		fence = sched->ops->run_job(sched_job);
> -		complete(&entity->entity_idle);
> +		complete_all(&entity->entity_idle);
>  		drm_sched_fence_scheduled(s_fence);
>  
>  		if (!IS_ERR_OR_NULL(fence)) {

Applied to drm-misc-next-fixes

-- 
Best regards,
Dmitry

