Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09DCB2DA95
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99E910E6F0;
	Wed, 20 Aug 2025 11:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TlfxQRPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9503610E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:13:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88DC443292;
 Wed, 20 Aug 2025 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1755688385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ou3MSRgBG8cP602wOscwCCqhc/Oa+T0DZwTTZNBffYE=;
 b=TlfxQRPi7CCIbzE9v7GFaL7B4qSx0xwJC2B3ssCV6ueN+1gXFc6zORcuq9Sk8Xxcnk83Gy
 lGxCe6BMFQhgEyOf5BTdumULIco7b7+Pz4BVy+XwmjivQ7+Y7X8RJqeMCiQEN+F8sijIHO
 dRmhlReSijd+b9G3cg1p3hZA16sNytLVZ2F1rkMkkwE2VKFOMzm504vS3gniWL35/b9Qkx
 w2G85zGZ3MKYj/VJTCHAAqqbeyb/AYzKQulY1pjhiRifd9lNjVKZStPlTVVy56oOlvfS8R
 uS09Gk3wVnnTMrvjmKhtDPJG12kXpVXXLQvJAcQkGC7DVQOh2zM/D+pUPcRZgg==
Date: Wed, 20 Aug 2025 13:13:02 +0200
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
Message-ID: <20250820131302.6a2da5ef@booty>
In-Reply-To: <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

On Tue, 19 Aug 2025 14:29:32 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> > @@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2c_client *client)
> >  {
> >  	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
> >  
> > +	drm_bridge_unplug(&ctx->bridge);
> >  	drm_bridge_remove(&ctx->bridge);  
> 
> Shouldn't we merge drm_bridge_unplug with the release part of
> devm_drm_bridge_alloc?

I'm not sure I got what you are suggesting here, sorry.

Do you mean that __devm_drm_bridge_alloc() should add a devres action
to call drm_bridge_unplug(), so the unplug is called implicitly and
does not need to be called explicitly by all drivers?

If that's what you mean, I don't think that would work. Unless I'm
missing something, devres actions are always invoked just after the
driver .remove callback. But we need to call drm_bridge_unplug() at the
beginning (or just before) .remove, at least for drivers that need to do
something in .remove that cannot be done by devm.

In pseudocode:

mybridge_remove()
{
  drm_bridge_unplug(); <-- explicit call as in my patch
  xyz_disable();
  drm_bridge_unplug(); <-- implicitly done by devres
}

We want xyz_disable() to be done after drm_bridge_unplug(), so other
code paths using drm_bridge_enter/exit() won't mess with xyz.

devres actions cannot be added to be executed _before_ .remove, AFAIK.

> > +	/*
> > +	 * sn65dsi83_atomic_disable() should release some resources, but it
> > +	 * cannot if we call drm_bridge_unplug() before it can
> > +	 * drm_bridge_enter(). If that happens, let's release those
> > +	 * resources now.
> > +	 */
> > +	if (ctx->disable_resources_needed) {
> > +		if (!ctx->irq)
> > +			sn65dsi83_monitor_stop(ctx);
> > +
> > +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > +		usleep_range(10000, 11000);
> > +
> > +		regulator_disable(ctx->vcc);
> > +	}  
> 
> I'm not sure you need this. Wouldn't registering a devm action do the
> same thing?

Good idea, thanks. I'll give it a try.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
