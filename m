Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6361F29C941
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8A6EC31;
	Tue, 27 Oct 2020 19:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6194F6EC2F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:51:58 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1230E2006D;
 Tue, 27 Oct 2020 20:51:54 +0100 (CET)
Date: Tue, 27 Oct 2020 20:51:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, robdclark@chromium.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: panel: simple: Allow timing constraints, not
 fixed delays
Message-ID: <20201027195152.GA457661@ravnborg.org>
References: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
 <20201027171459.GA2097755@ulmo>
 <20201027192318.GR401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027192318.GR401619@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=vq_p0UsYEco_LHjtCy4A:9
 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 08:23:18PM +0100, Daniel Vetter wrote:
> On Tue, Oct 27, 2020 at 06:14:59PM +0100, Thierry Reding wrote:
> > On Tue, Oct 27, 2020 at 09:45:54AM -0700, Douglas Anderson wrote:
> > > The simple panel code currently allows panels to define fixed delays
> > > at certain stages of initialization.  These work OK, but they don't
> > > really map all that clearly to the requirements presented in many
> > > panel datasheets.  Instead of defining a fixed delay, those datasheets
> > > provide a timing diagram and specify a minimum amount of time that
> > > needs to pass from event A to event B.
> > > 
> > > Because of the way things are currently defined, most panels end up
> > > over-delaying.  One prime example here is that a number of panels I've
> > > looked at define the amount of time that must pass between turning a
> > > panel off and turning it back on again.  Since there is no way to
> > > specify this, many developers have listed this as the "unprepare"
> > > delay.  However, if nobody ever tried to turn the panel on again in
> > > the next 500 ms (or whatever the delay was) then this delay was
> > > pointless.  It's better to do the delay only in the case that someone
> > > tried to turn the panel on too quickly.
> > > 
> > > Let's support specifying delays as constraints.  We'll start with the
> > > one above and also a second one: the minimum time between prepare
> > > being done and doing the enable.  On the panel I'm looking at, there's
> > > an 80 ms minimum time between HPD being asserted by the panel and
> > > setting the backlight enable GPIO.  By specifying as a constraint we
> > > can enforce this without over-delaying.  Specifically the link
> > > training is allowed to happen in parallel with this delay so adding a
> > > fixed 80 ms delay isn't ideal.
> > > 
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > 
> > >  drivers/gpu/drm/panel/panel-simple.c | 51 ++++++++++++++++++++++++----
> > >  1 file changed, 44 insertions(+), 7 deletions(-)
> > 
> > This has always been bugging me a bit about the current setup, so I very
> > much like this idea.
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 2be358fb46f7..cbbe71a2a940 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -92,6 +92,19 @@ struct panel_desc {
> > >  		unsigned int unprepare;
> > >  	} delay;
> > >  
> > > +	/**
> > > +	 * @prepare_to_enable_ms: If this many milliseconds hasn't passed after
> > > +	 *                        prepare finished, add a delay to the start
> > > +	 *                        of enable.
> > > +	 * @unprepare_to_prepare_ms: If this many milliseconds hasn't passed
> > > +	 *                           unprepare finished, add a delay to the
> > > +	 *                           start of prepare.
> > 
> > I find this very difficult to understand and it's also not clear from
> > this what exactly the delay is. Perhaps this can be somewhat clarified
> > Something like the below perhaps?
> > 
> > 	@prepare_to_enable_ms: The minimum time, in milliseconds, that
> > 	    needs to have passed between when prepare finished and enable
> > 	    may begin. If at enable time less time has passed since
> > 	    prepare finished, the driver waits for the remaining time.
> 
> Also maybe split the kerneldoc into the sub-structure (this should work I
> think), so that you can go really wild on formatting :-)
I have a patch somewhere where I inlined all the comments and polished
them a bit. Will try to dig it up in the weekend.
It was motivated by a small W=1 detour.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
