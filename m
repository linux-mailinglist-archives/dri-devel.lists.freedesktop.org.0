Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41697B51E2B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BD210E10E;
	Wed, 10 Sep 2025 16:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IScuGs4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6A910E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:48:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5C2294E40BA4;
 Wed, 10 Sep 2025 16:48:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 365CE606D4;
 Wed, 10 Sep 2025 16:48:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 196D2102F28A8; 
 Wed, 10 Sep 2025 18:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757522882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LT2pdz7Z3NCO0Y4ooBCD3GxfpwJ9fLBoOs3KJyv+Iic=;
 b=IScuGs4xj81gT1eBiedKgCoo3JOg7z4DU78MOyknA31lSy6JnSX6NUsMSLmtXDiOfjA/y7
 NjS6NizfRliphi5fXLCw8jKyAY/X9b1+GrbuC32f5MqJ3CQb49qr50RHvemgRHaazE3yeh
 aFZGzl204nYoK/n7oJITO8Z/kYCBqTaSNlPeBYPtU6Kp8Urz6K4r/wU/kv26wta9/43iEM
 EljXhucpmtvlD1igzaA/qn/tBKgy0M5vy4GmGwV32f7630geu8ASsl3Ff1bxHZYxgJ+X2T
 FoKJ1Mg8Cr4ij7o7Grz8zokwUCsXCO8Z9W7OIzMAzJ97qH+JnZMIyO+78R5T6Q==
Date: Wed, 10 Sep 2025 18:47:52 +0200
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
Message-ID: <20250910184752.6c42f004@booty>
In-Reply-To: <20250910-glittering-serval-of-piety-b32844@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
 <20250908154906.16693078@booty>
 <20250910-glittering-serval-of-piety-b32844@houat>
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

On Wed, 10 Sep 2025 12:59:12 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Sep 08, 2025 at 03:49:06PM +0200, Luca Ceresoli wrote:
> > Hi Maxime,
> > 
> > On Wed, 27 Aug 2025 09:46:03 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > On Wed, Aug 20, 2025 at 01:13:02PM +0200, Luca Ceresoli wrote:  
> > > > Hello Maxime,
> > > > 
> > > > On Tue, 19 Aug 2025 14:29:32 +0200
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >     
> > > > > > @@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2c_client *client)
> > > > > >  {
> > > > > >  	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
> > > > > >  
> > > > > > +	drm_bridge_unplug(&ctx->bridge);
> > > > > >  	drm_bridge_remove(&ctx->bridge);      
> > > > > 
> > > > > Shouldn't we merge drm_bridge_unplug with the release part of
> > > > > devm_drm_bridge_alloc?    
> > > > 
> > > > I'm not sure I got what you are suggesting here, sorry.
> > > > 
> > > > Do you mean that __devm_drm_bridge_alloc() should add a devres action
> > > > to call drm_bridge_unplug(), so the unplug is called implicitly and
> > > > does not need to be called explicitly by all drivers?    
> > > 
> > > Yes
> > >   
> > > > If that's what you mean, I don't think that would work. Unless I'm
> > > > missing something, devres actions are always invoked just after the
> > > > driver .remove callback.    
> > > 
> > > Yes, they are called in reverse order of registration, after remove.
> > >   
> > > > But we need to call drm_bridge_unplug() at the beginning (or just
> > > > before) .remove, at least for drivers that need to do something in
> > > > .remove that cannot be done by devm.
> > > > 
> > > > In pseudocode:
> > > > 
> > > > mybridge_remove()
> > > > {
> > > >   drm_bridge_unplug(); <-- explicit call as in my patch
> > > >   xyz_disable();
> > > >   drm_bridge_unplug(); <-- implicitly done by devres
> > > > }
> > > > 
> > > > We want xyz_disable() to be done after drm_bridge_unplug(), so other
> > > > code paths using drm_bridge_enter/exit() won't mess with xyz.    
> > > 
> > > It's not clear to me why doing it before xyz_disable() is important
> > > here? If anything, it would prevent from disabling the hardware for
> > > example, even though you still have your memory mapping, clocks, power
> > > domains, regulators, etc. to properly disable it.
> > > 
> > > You're still correct that it's a bad idea though because we want to do
> > > it before we start freeing all those, so it needs to execute as the
> > > before the devm actions ...
> > >   
> > > > devres actions cannot be added to be executed _before_ .remove, AFAIK.    
> > > 
> > > ... and we can't do that either.  
> > 
> > I understand your words as "the drm_bridge_unplug() is OK where it is,
> > your patch is OK in this respect". Correct?
> > 
> > So if this is correct, and my reply on the devres cleanups is also
> > correct (other reply in this thread), that means the whole patch is OK.  
> 
> I'm still confused why it's so important than in your example
> xyz_disable must be called after drm_bridge_unplug.

Let me clarify with an example.

As I wrote in another reply, I have moved from a flag
(disable_resources_needed) to a devres action as you had suggested, but
the example here is based on the old flag because it is more explicit,
code would be executed in the same order anyway, and, well, because I
had written the example before the devres action conversion.

Take these two functions (stripped versions of the actual ones):

/* Same as proposed, but with _unplug moved at the end */
static void sn65dsi83_remove()
{
	struct sn65dsi83 *ctx = i2c_get_clientdata(client);

	drm_bridge_remove(&ctx->bridge);
	
	/* 
	 * I moved the following code to a devm action, but keeping it
	 * explicit here for the discussion
	 */
	if (ctx->disable_resources_needed) {
		sn65dsi83_monitor_stop(ctx);
		regulator_disable(ctx->vcc);
	}
	
	drm_bridge_unplug(&ctx->bridge);     // At the end!
}

static void sn65dsi83_atomic_disable()
{
	if (!drm_bridge_enter(bridge, &idx))
		return;

	/* These 3 lines will be replaced by devm_release_action() */
	ctx->disable_resources_needed = false;
	sn65dsi83_monitor_stop(ctx);
	regulator_disable(ctx->vcc);

	drm_bridge_exit(idx);
}

Here the xyz_disable() in my pseudocode is the sn65dsi83_monitor_stop()
+ regulator_disable().

If sn65dsi83_remove() and sn65dsi83_atomic_disable() were to happen
concurrently, this sequence of events could happen:

1. atomic_disable:  drm_bridge_enter() -> OK, can go
2. remove:          drm_bridge_remove()
3. remove:          sn65dsi83_monitor_stop()
4. remove:          regulator_disable()
5. remove:          drm_bridge_unplug() -- too late to stop atomic_disable
6. atomic_disable:  ctx->disable_resources_needed = false -- too late to stop .remove
7. atomic_disable:  sn65dsi83_monitor_stop() -- twice, maybe no problem
8. atomic_disable:  regulator_disable() -- Twice, en/disable imbalance!

So there is an excess regulator disable, which is an error. I don't see
how this can be avoided if the drm_bridge_unplug() is called after the
regulator_disable().

Let me know whether this clarifies the need to _unplug at the beginning
of the .remove function.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
