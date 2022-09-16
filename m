Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF01C5BA90F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3752310ED07;
	Fri, 16 Sep 2022 09:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77B710ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 09:12:09 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oZ7OI-00086D-FG; Fri, 16 Sep 2022 11:12:06 +0200
Message-ID: <e862234a3aef84bbf7fbe6258b634f81fb691972.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/scheduler: track GPU active time per entity
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Fri, 16 Sep 2022 11:12:05 +0200
In-Reply-To: <69924bc6-d249-35b2-a942-a43a9293558e@amd.com>
References: <20220908181013.3214205-1-l.stach@pengutronix.de>
 <69924bc6-d249-35b2-a942-a43a9293558e@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 08.09.2022 um 14:33 -0400 schrieb Andrey Grodzovsky:
> On 2022-09-08 14:10, Lucas Stach wrote:
> > Track the accumulated time that jobs from this entity were active
> > on the GPU. This allows drivers using the scheduler to trivially
> > implement the DRM fdinfo when the hardware doesn't provide more
> > specific information than signalling job completion anyways.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
> >   include/drm/gpu_scheduler.h            | 7 +++++++
> >   2 files changed, 13 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 76fd2904c7c6..24c77a6a157f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -847,6 +847,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> >   
> >   	spin_unlock(&sched->job_list_lock);
> >   
> > +	if (job) {
> > +		job->entity->elapsed_ns += ktime_to_ns(
> > +			ktime_sub(job->s_fence->finished.timestamp,
> > +				  job->s_fence->scheduled.timestamp));
> > +	}
> > +
> >   	return job;
> 
> 
> Looks like you making as assumption that drm_sched_entity will always be 
> allocated using kzalloc ? Isn't it a bit dangerous assumption ?
> 
No, drm_sched_entity_init() memsets the whole struct to 0 before
initializing any members that need more specific init values.

Regards,
Lucas

> Andrey
> 
> 
> >   }
> >   
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index addb135eeea6..573bef640664 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -196,6 +196,13 @@ struct drm_sched_entity {
> >   	 * drm_sched_entity_fini().
> >   	 */
> >   	struct completion		entity_idle;
> > +	/**
> > +	 * @elapsed_ns
> > +	 *
> > +	 * Records the amount of time where jobs from this entity were active
> > +	 * on the GPU.
> > +	 */
> > +	uint64_t elapsed_ns;
> >   };
> >   
> >   /**


