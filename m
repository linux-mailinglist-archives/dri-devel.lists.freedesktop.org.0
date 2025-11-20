Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802CC71E23
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC9610E083;
	Thu, 20 Nov 2025 02:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hKhq+dNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA3210E083
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:45:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp
 [39.110.208.21])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 165B46A8;
 Thu, 20 Nov 2025 03:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763606621;
 bh=pgDnyPCQ4kOR1m6vsWTDpXSA6ZeXyjGx2I/7FDoMTVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hKhq+dNUijD4c/HYvb7id4RDo3f2v9AwGz/QfwVnCVHx617S3njPxRV0RPH8/tRuf
 RwO2CJXP5fXpnU8+boz5Vc0MNM/+uiafyhqILK4rM+QQoDGGQZ7CvL38COlC8WzxRQ
 EDEPPHccSoDTVNeJC77HWCdHieb7xWt+5W3deAIQ=
Date: Thu, 20 Nov 2025 11:45:23 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Message-ID: <20251120024523.GI10711@pendragon.ideasonboard.com>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 19, 2025 at 12:41:52PM +0200, Tomi Valkeinen wrote:
> On 19/11/2025 11:19, Maxime Ripard wrote:
> > On Tue, Nov 18, 2025 at 07:10:47PM +0100, Linus Walleij wrote:
> >> On Tue, Nov 18, 2025 at 4:44 PM Maxime Ripard <mripard@kernel.org> wrote:
> >>> On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> >>>> On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
> >>
> >>>>> +/**
> >>>>> + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
> >>>>
> >>>> Based on the function name, it feels that the nem commit tail and
> >>>> modeset enable/disable helpers reached a point where we may want to
> >>>> reconsider the design instead of adding new functions with small
> >>>> differences in behaviour that will end up confusing driver developers.
> >>>
> >>> Agreed, and I'd go even further than that: we don't want every odd order
> >>> in the core. And if some driver has to break the order we document in
> >>> some way it should be very obvious.
> >>
> >> Is this just a comment on this patch 3/3?
> >>
> >> Or do you mean that Mareks new callback
> >> drm_atomic_helper_commit_modeset_enables_crtc_early()
> >> from patch 1/2 should go straight into the R-Car driver as well
> >> and that
> >> drm_atomic_helper_commit_modeset_disables_crtc_late()
> >> patch 2/2 should also go into my driver, even if this
> >> is a comment on patch 3/3?
> >>
> >> Both patches 1 & 2 have a lot to do with ordering, this is
> >> why I ask.
> > 
> > I mean, it applies to all your three patches and Marek's: helpers are
> > here to provide a default implementation. We shouldn't provide a default
> > implementation for a single user. All your patches enable to create
> > defaults for a single user.
> 
> Two users so far: Renesas and ST-Ericsson.

Only MCDE uses the new drm_atomic_helper_commit_tail_crtc_early_late()
function, while the new
drm_atomic_helper_commit_modeset_enables_crtc_early() helper is used
directly by R-Car DU to implement its commit tail handler, and by
drm_atomic_helper_commit_tail_crtc_early_late().

> > So my point is that none of those functions should be helpers.
> > 
> >> We already have
> >> drm_atomic_helper_commit_tail()
> >> drm_atomic_helper_commit_tail_rpm()
> > 
> > The former has 5 users, the latter 13. And it's already confusing enough
> > and regression-prone as it is.
> > 
> >> Does one more or less really matter? Maybe, I'm not sure,
> >> but if it's just this one patch that is the problem I can surely
> >> do it that way since we're only calling public functions.
> >>
> >> Pushing the first two patches would be more problematic,
> >> because they call a lot of functions that are local to the
> >> drm atomic helpers.
> > 
> > I'm totally fine with making more internal functions public though.
> 
> While I generally agree with that, I still wonder if an implementation
> in the core is better here. Perhaps a flag in struct drm_driver, instead
> of new set of helpers.
> 
> Moving this to the driver would require (with a quick glance) exposing
> the following functions:
> 
> crtc_enable
> crtc_disable
> crtc_set_mode
> encoder_bridge_pre_enable
> encoder_bridge_enable
> encoder_bridge_disable
> encoder_bridge_post_disable
> 
> Not impossible to expose, but making a private function public does
> require work in validating the function for more general use, and adding
> kernel docs.
> 
> Handling this in the core would act as documentation too, so instead of
> the driver doing things in a different way "hidden" inside the driver,
> it would be a standard quirk, clearly documented.
> 
> Also, I'm also not sure how rare this quirk is. In fact, I feel we're
> missing ways to handle the enable/disable related issues in the core
> framework. In these patches we're talking about the case where the SoC's
> DSI host needs an incoming pclk to operate, and panels need to do
> configuration before the video stream is enabled. But the exact same
> problem could be present with an external DSI bridge, and then we can't
> fix it in the crtc driver.
> 
> So the question becomes "does any component in the pipeline need the
> video stream's clock to operate". But then, it doesn't help if the crtc
> output is enabled early if any bridge in between does not also enable
> its output early. So it all gets a bit complex.

Are we getting close to a point where we all know the bridge model will
need to be reworked extensively, and everybody hopes someone else will
do it ? :-)

> And sometimes the clocks go backward: the entity on the downstream side
> provides a clock backwards, to the source entity...
> 
> But I digress. I think initially we should just look for a clean fix for
> the platforms affected:
> 
> - Add the implementation into the drivers?
> - Add helpers to the core?
> - Add a flag of some kind so the core can do the right thing?

drm_atomic_helper_commit_modeset_enables_crtc_early() would be more
cumbersome to implement manually in drivers as most of the functions it
calls are not exported. drm_atomic_helper_commit_tail_crtc_early_late()
shouldn't be difficult to implement in the MCDE driver.

> I made a quick test with the flag approach, below. It's not many lines,
> but... Ugh, it does feel like a hack.

Without seeing the code I can already imagine how this would feel like a
hack, so I agree not to go that way.

> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index d5ebe6ea0acb..8225aae43e3b 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1341,9 +1341,13 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
> >  {
> >         encoder_bridge_disable(dev, state);
> >  
> > -       crtc_disable(dev, state);
> > +       if (!dev->driver->crtc_early_on)
> > +               crtc_disable(dev, state);
> >  
> >         encoder_bridge_post_disable(dev, state);
> > +
> > +       if (dev->driver->crtc_early_on)
> > +               crtc_disable(dev, state);
> >  }
> >  
> >  /**
> > @@ -1682,9 +1686,13 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
> >  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> >                                               struct drm_atomic_state *state)
> >  {
> > +       if (dev->driver->crtc_early_on)
> > +               crtc_enable(dev, state);
> > +
> >         encoder_bridge_pre_enable(dev, state);
> >  
> > -       crtc_enable(dev, state);
> > +       if (!dev->driver->crtc_early_on)
> > +               crtc_enable(dev, state);
> >  

-- 
Regards,

Laurent Pinchart
