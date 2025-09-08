Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B5B49021
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A64610E51A;
	Mon,  8 Sep 2025 13:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dzYUrE+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402EE10E51A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:49:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DEEF43A28;
 Mon,  8 Sep 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1757339348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiPoiA09kCRQsZO7G/mkcjC5y5kAdNXv8UqvN5aY7o8=;
 b=dzYUrE+uGmhjenuz7HJfAvbMQsuLUTbU4ysJxkdgOVoOjyqf+NeUXng1TE52/+LXkpWhSm
 THN5L/9Rd48psOcOa1aM7s/sePVKzd0scSzBgKIMHFm4C/C9JrsZOAEBX3LvoNJKEZoOQt
 2DvKfuxOtYhGd2fnSN0c9HryDMZ6cDAC3jRB4paaPNUC9HpUMOgWoaG75PMcrv9IiYclDl
 pKBE0D8VuY0EOKYRY0uYJ97SxBJ+qidu2cJex0VNG8cbN8nWzOOY24JIO/eAPT9plYT/kG
 hqQqNXt2dTvBsiASaQfTT8Q5fDP/oScHudyYn19C3SQVs052Vz5qG9TZ7olihQ==
Date: Mon, 8 Sep 2025 15:49:06 +0200
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
Message-ID: <20250908154906.16693078@booty>
In-Reply-To: <20250827-charming-arcane-stingray-cfb8b6@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejfedtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegheffjeffkeduhfekkeelgfejueehkeffleehjefgieejheeileektddthfejtdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghro
 hdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
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

On Wed, 27 Aug 2025 09:46:03 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Aug 20, 2025 at 01:13:02PM +0200, Luca Ceresoli wrote:
> > Hello Maxime,
> > 
> > On Tue, 19 Aug 2025 14:29:32 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > > @@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2c_client *client)
> > > >  {
> > > >  	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
> > > >  
> > > > +	drm_bridge_unplug(&ctx->bridge);
> > > >  	drm_bridge_remove(&ctx->bridge);    
> > > 
> > > Shouldn't we merge drm_bridge_unplug with the release part of
> > > devm_drm_bridge_alloc?  
> > 
> > I'm not sure I got what you are suggesting here, sorry.
> > 
> > Do you mean that __devm_drm_bridge_alloc() should add a devres action
> > to call drm_bridge_unplug(), so the unplug is called implicitly and
> > does not need to be called explicitly by all drivers?  
> 
> Yes
> 
> > If that's what you mean, I don't think that would work. Unless I'm
> > missing something, devres actions are always invoked just after the
> > driver .remove callback.  
> 
> Yes, they are called in reverse order of registration, after remove.
> 
> > But we need to call drm_bridge_unplug() at the beginning (or just
> > before) .remove, at least for drivers that need to do something in
> > .remove that cannot be done by devm.
> > 
> > In pseudocode:
> > 
> > mybridge_remove()
> > {
> >   drm_bridge_unplug(); <-- explicit call as in my patch
> >   xyz_disable();
> >   drm_bridge_unplug(); <-- implicitly done by devres
> > }
> > 
> > We want xyz_disable() to be done after drm_bridge_unplug(), so other
> > code paths using drm_bridge_enter/exit() won't mess with xyz.  
> 
> It's not clear to me why doing it before xyz_disable() is important
> here? If anything, it would prevent from disabling the hardware for
> example, even though you still have your memory mapping, clocks, power
> domains, regulators, etc. to properly disable it.
> 
> You're still correct that it's a bad idea though because we want to do
> it before we start freeing all those, so it needs to execute as the
> before the devm actions ...
> 
> > devres actions cannot be added to be executed _before_ .remove, AFAIK.  
> 
> ... and we can't do that either.

I understand your words as "the drm_bridge_unplug() is OK where it is,
your patch is OK in this respect". Correct?

So if this is correct, and my reply on the devres cleanups is also
correct (other reply in this thread), that means the whole patch is OK.

Let me know if I'm wrong. :-)

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
