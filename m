Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C63B5B8A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E60D6E3EC;
	Mon, 28 Jun 2021 09:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8D36E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:46:10 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lxnqD-0008Gq-GN; Mon, 28 Jun 2021 11:46:09 +0200
Message-ID: <daf5e20d60c967d57d0a32e782cc3c294ed11de4.camel@pengutronix.de>
Subject: Re: [PATCH] drm/sched: Declare entity idle only after HW submission
From: Lucas Stach <l.stach@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 28 Jun 2021 11:46:08 +0200
In-Reply-To: <20210624140850.2229697-1-boris.brezillon@collabora.com>
References: <20210624140850.2229697-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 24.06.2021 um 16:08 +0200 schrieb Boris Brezillon:
> The panfrost driver tries to kill in-flight jobs on FD close after
> destroying the FD scheduler entities. For this to work properly, we
> need to make sure the jobs popped from the scheduler entities have
> been queued at the HW level before declaring the entity idle, otherwise
> we might iterate over a list that doesn't contain those jobs.
> 
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>

Not sure how much it's worth to review my own suggestion, but the
implementation looks correct to me.
I don't see any downsides for the existing drivers and it solves the
race window for drivers that want to cancel jobs on the HW submission
queue, without introducing yet another synchronization point.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

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


