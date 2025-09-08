Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27015B49020
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2D10E511;
	Mon,  8 Sep 2025 13:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ELWspVjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383D010E511
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:49:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C7BE43A2C;
 Mon,  8 Sep 2025 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1757339344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4zg/MS2ypS3p4PtLlZA9FLQz8rryNo9UTfoVCChXPY=;
 b=ELWspVjsv2DLJL32Pe9zvNkx5Wob90PiYx1aQik6ijW8EmwGZSrDPefI2el9DyPNuLMINc
 dvEWg9rKLAsDoC6EWbCB+Qn7lAI1Bhcuc0JCHEtfMefjAx6tPbcBA0Jr83UjjJChg01LE2
 vQLYX7AjUqNx9wdqNV72tYVKrpznfeDgfrStRb4Ap8cdu3S8lcvG8ka1J0MFxVLLp/om+/
 80z8MaOxjC+esqpJFpY+XFYoftEKRx7VIxp9qGYAvJFSOQ8u7aSW844Mb1hNj0oIG/EiCo
 oYjlrY0YKlCsmI47HbC6aweCLtP7AGtLxXBYAuj/3QZ7gMya2hCp8zInHFdADw==
Date: Mon, 8 Sep 2025 15:49:01 +0200
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
Message-ID: <20250908154901.64f1a639@booty>
In-Reply-To: <20250820131302.6a2da5ef@booty>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghro
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

Hello Maxime,

On Wed, 20 Aug 2025 13:13:02 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > > +	/*
> > > +	 * sn65dsi83_atomic_disable() should release some resources, but it
> > > +	 * cannot if we call drm_bridge_unplug() before it can
> > > +	 * drm_bridge_enter(). If that happens, let's release those
> > > +	 * resources now.
> > > +	 */
> > > +	if (ctx->disable_resources_needed) {
> > > +		if (!ctx->irq)
> > > +			sn65dsi83_monitor_stop(ctx);
> > > +
> > > +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > > +		usleep_range(10000, 11000);
> > > +
> > > +		regulator_disable(ctx->vcc);
> > > +	}    
> > 
> > I'm not sure you need this. Wouldn't registering a devm action do the
> > same thing?  
> 
> Good idea, thanks. I'll give it a try.

I'm catching up with this series after being busy a few weeks...

I looked at this, but contrary my initial impression I think it would
not be an improvement.

The reason is at least one of these cleanup actions (namely the
regulator_disable()) must be done only if there is a matching enable,
which is in atomic_pre_enable. This is why I introduced a flag in the
first place.

I'm not sure which usage of devres you had in mind, but I see two
options.

Option 1: in probe, add a devres action to call a function like:

sn65dsi83_cleanups()
{
	if (ctx->disable_resources_needed) {
		/* the same cleanups */
	}    
}

But that is just a more indirect way of doing the same thing, and
relies on the same flag.

Option 2: have a function to unconditionally do the cleanups:

sn65dsi83_cleanups()
{
	/* the same cleanups (no if) */
}

And then:
 * in atomic_pre_enable, instead of setting the flag
   add a devres action to call sn65dsi83_cleanups()
 * in atomic_disable, instead of clearing the flag
   remove the devres action

Even this option looks like more complicated and less readable code
to do the same thing.

Do you have in mind a better option that I haven't figured out?

If you don't, I think this part of the patch should stay as is.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
