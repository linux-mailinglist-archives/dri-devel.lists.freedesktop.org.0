Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECBB51DD4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33BE10E2F2;
	Wed, 10 Sep 2025 16:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zr7tmHzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB5910E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:35:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 064B2C6B3A3;
 Wed, 10 Sep 2025 16:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9F1A606D4;
 Wed, 10 Sep 2025 16:35:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57FD4102F292B; 
 Wed, 10 Sep 2025 18:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757522099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X2b6+Nl1KIR1LF6HdKe9hNfppcCRQR7JbvwrsgEtuuY=;
 b=zr7tmHzHIJb8fsqhH5CSxTqc7cBc4qfgcCHpVhfiOjZvoFh3BFCEn7apF3H6VxngpnQZK7
 KZ4SxLqZQSA+eGH1PZ3K+b/Gq1oaNYQnPofWeQlCXUwBkDX72zCReycxQPGaVviCj6R33k
 5bzbvYesJRL+NjKoWUx5dwruJCZ5blf1caEf07+wOoZjATlNbTh75Whhppl+CLK5IPEN3K
 p2QvOUZqxElzV8sfPcZa/4wc7DeQCcu0s0l0OIi27goVrzcWsOnzW946HsDjj8DoclKWV+
 sz815RByWtUiakpOedJHD4IHhMcoH1tmyUoz7GmbOsTikPhMbgjot2tey7d7PA==
Date: Wed, 10 Sep 2025 18:34:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20250910183440.3fe50fac@booty>
In-Reply-To: <20250910-amazing-camouflaged-barracuda-bb79cb@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty> <20250908154901.64f1a639@booty>
 <20250910-amazing-camouflaged-barracuda-bb79cb@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Maxime,

On Wed, 10 Sep 2025 09:52:21 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Sep 08, 2025 at 03:49:01PM +0200, Luca Ceresoli wrote:
> > Hello Maxime,
> > 
> > On Wed, 20 Aug 2025 13:13:02 +0200
> > Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >   
> > > > > +	/*
> > > > > +	 * sn65dsi83_atomic_disable() should release some resources, but it
> > > > > +	 * cannot if we call drm_bridge_unplug() before it can
> > > > > +	 * drm_bridge_enter(). If that happens, let's release those
> > > > > +	 * resources now.
> > > > > +	 */
> > > > > +	if (ctx->disable_resources_needed) {
> > > > > +		if (!ctx->irq)
> > > > > +			sn65dsi83_monitor_stop(ctx);
> > > > > +
> > > > > +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > > > > +		usleep_range(10000, 11000);
> > > > > +
> > > > > +		regulator_disable(ctx->vcc);
> > > > > +	}      
> > > > 
> > > > I'm not sure you need this. Wouldn't registering a devm action do the
> > > > same thing?    
> > > 
> > > Good idea, thanks. I'll give it a try.  
> > 
> > I'm catching up with this series after being busy a few weeks...
> > 
> > I looked at this, but contrary my initial impression I think it would
> > not be an improvement.
> > 
> > The reason is at least one of these cleanup actions (namely the
> > regulator_disable()) must be done only if there is a matching enable,
> > which is in atomic_pre_enable. This is why I introduced a flag in the
> > first place.
> > 
> > I'm not sure which usage of devres you had in mind, but I see two
> > options.
> > 
> > Option 1: in probe, add a devres action to call a function like:
> > 
> > sn65dsi83_cleanups()
> > {
> > 	if (ctx->disable_resources_needed) {
> > 		/* the same cleanups */
> > 	}    
> > }
> > 
> > But that is just a more indirect way of doing the same thing, and
> > relies on the same flag.
> > 
> > Option 2: have a function to unconditionally do the cleanups:
> > 
> > sn65dsi83_cleanups()
> > {
> > 	/* the same cleanups (no if) */
> > }
> > 
> > And then:
> >  * in atomic_pre_enable, instead of setting the flag
> >    add a devres action to call sn65dsi83_cleanups()
> >  * in atomic_disable, instead of clearing the flag
> >    remove the devres action
> > 
> > Even this option looks like more complicated and less readable code
> > to do the same thing.
> > 
> > Do you have in mind a better option that I haven't figured out?  
> 
> Would using devm_add_action in atomic_pre_enable, and
> devm_release_action in atomic_post_disable work?
> 
> That way, if you have a typical enable / disable cycle, the action will
> get registered and executed properly, and if you only have an enable but
> no matching disable, it will be collected after remove.

So you're OK with option 2. I just implemented it, works well and the
resulting code is a bit cleaner. Queued for v2.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
