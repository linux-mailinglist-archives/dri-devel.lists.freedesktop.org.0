Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870013B5D11
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 13:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556B76E433;
	Mon, 28 Jun 2021 11:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61B26E431
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 11:18:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 699321F4241C;
 Mon, 28 Jun 2021 12:18:15 +0100 (BST)
Date: Mon, 28 Jun 2021 13:18:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: Declare entity idle only after HW submission
Message-ID: <20210628131811.792d4cad@collabora.com>
In-Reply-To: <daf5e20d60c967d57d0a32e782cc3c294ed11de4.camel@pengutronix.de>
References: <20210624140850.2229697-1-boris.brezillon@collabora.com>
 <daf5e20d60c967d57d0a32e782cc3c294ed11de4.camel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Jun 2021 11:46:08 +0200
Lucas Stach <l.stach@pengutronix.de> wrote:

> Am Donnerstag, dem 24.06.2021 um 16:08 +0200 schrieb Boris Brezillon:
> > The panfrost driver tries to kill in-flight jobs on FD close after
> > destroying the FD scheduler entities. For this to work properly, we
> > need to make sure the jobs popped from the scheduler entities have
> > been queued at the HW level before declaring the entity idle, otherwise
> > we might iterate over a list that doesn't contain those jobs.
> > 
> > Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>  
> 
> Not sure how much it's worth to review my own suggestion, but the
> implementation looks correct to me.
> I don't see any downsides for the existing drivers and it solves the
> race window for drivers that want to cancel jobs on the HW submission
> queue, without introducing yet another synchronization point.
> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Queued to drm-misc-next.

Thanks,

Boris

> 
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 81496ae2602e..aa776ebe326a 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -811,10 +811,10 @@ static int drm_sched_main(void *param)
> >  
> >  		sched_job = drm_sched_entity_pop_job(entity);
> >  
> > -		complete(&entity->entity_idle);
> > -
> > -		if (!sched_job)
> > +		if (!sched_job) {
> > +			complete(&entity->entity_idle);
> >  			continue;
> > +		}
> >  
> >  		s_fence = sched_job->s_fence;
> >  
> > @@ -823,6 +823,7 @@ static int drm_sched_main(void *param)
> >  
> >  		trace_drm_run_job(sched_job, entity);
> >  		fence = sched->ops->run_job(sched_job);
> > +		complete(&entity->entity_idle);
> >  		drm_sched_fence_scheduled(s_fence);
> >  
> >  		if (!IS_ERR_OR_NULL(fence)) {  
> 
> 

