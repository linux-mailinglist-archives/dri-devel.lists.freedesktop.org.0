Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B93519B25
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2A210FCC8;
	Wed,  4 May 2022 09:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF16310FCC8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:06:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nmAxm-0003AG-CF; Wed, 04 May 2022 11:06:26 +0200
Message-ID: <f570e9b926f05fe5af6ae9a52754681e691fc0eb.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: avoid cleaning up sched_job when submit
 succeeded
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 04 May 2022 11:06:25 +0200
In-Reply-To: <YnI1/0Hw2GB9phaH@phenom.ffwll.local>
References: <20220429191731.2187339-1-l.stach@pengutronix.de>
 <YnI1/0Hw2GB9phaH@phenom.ffwll.local>
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 04.05.2022 um 10:14 +0200 schrieb Daniel Vetter:
> On Fri, Apr 29, 2022 at 09:17:31PM +0200, Lucas Stach wrote:
> > While the labels may mislead the casual reader, the tail of the function
> > etnaviv_ioctl_gem_submit is always executed, as a lot of the structures
> > set up in this function need to be cleaned up regardless of whether the
> > submit succeeded or failed.
> > 
> > An exception is the newly added drm_sched_job_cleanup, which must only
> > be called when the submit failed before handing the job to the
> > scheduler.
> > 
> > Fixes: b827c84f5e84 ("drm/etnaviv: Use scheduler dependency handling")
> > Reported-by: Michael Walle <michael@walle.cc>
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > Daniel, please apply to the appropriate drm-misc branch to make sure
> > this ends up in the same pullrequest as the offending commit.
> 
> Apologies on being behind on emails, I just came to the same conclusion.
> 
> Except there's one issue, the error path for sync_file_create is after a
> successful call to drm_sched_entity_push_job(), so in that case we must
> again _not_ call drm_sched_job_cleanup. So we need to change that goto
> err_submit_job to goto err_submit_put and maybe add a comment about why.
> 
> Can you pls respin?
> 
Just did that.

In general I don't like this freestanding and quite non-obvious error
handling for the sched_job and would like to move this into the etnaviv
submit_cleanup routine, but to do so I would need a reliable way to
detect if drm_sched_job_init was successfully called on the job. This
seems like a bit more change than I would like to add on top of the
current patches at this point. I'll take a note to clean this up later,
once the regression is fixed.

Regards,
Lucas

> Thanks, Daniel
> 
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > index 98bb5c9239de..bf2a400f59c9 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > @@ -607,7 +607,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
> >  	args->fence = submit->out_fence_id;
> >  
> >  err_submit_job:
> > -	drm_sched_job_cleanup(&submit->sched_job);
> > +	if (ret)
> > +		drm_sched_job_cleanup(&submit->sched_job);
> >  err_submit_put:
> >  	etnaviv_submit_put(submit);
> >  
> > -- 
> > 2.30.2
> > 
> 


