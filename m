Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC5A275F6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D98E10E69F;
	Tue,  4 Feb 2025 15:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T6MDTz4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808BB10E69F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:34:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A96244419C;
 Tue,  4 Feb 2025 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738683246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/Em9LoxwWwGP0448VxgAWFBmtV9u0pV8rupxRXtPSE=;
 b=T6MDTz4MPGrdJ+ue3X6+YFfE9yra7WdG/e7UqeiS4aATqegni/6rka468bka1bpl3koatb
 t6gMYqSMts6r5/XmlGf63NKYRCqToM1+AyVlmSxOPG7rgJjE8/kDm6D06GlsRSqbU8pZY5
 jB+gXKHn4G0axdamk6uUb3oTzSUczQAoXSR2Gay+DtNJU646zBHQODG1yiAqsAdZFX+q6K
 Xo/kHyIajvdufJQbickn6Crm9wJNknmoi69KK3oDgNkRACqytVkoPrutegIZOJQXqMeDrv
 KLsH5+464ugBxTN5NbKI/9T/PesOlgi26EpNNodmxkm5VPk11i6Sezvx0f4AaA==
Date: Tue, 4 Feb 2025 16:34:04 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut
 <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Chauvet
 <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250204163404.0a6b6526@bootlin.com>
In-Reply-To: <20250204-chocolate-lionfish-of-luck-10ebb8@houat>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <20250108101907.410456-4-herve.codina@bootlin.com>
 <20250114-juicy-authentic-mushroom-cfcdfb@houat>
 <20250114135456.5366eb2a@bootlin.com>
 <20250116-archetypal-bulldog-of-expression-fcc937@houat>
 <20250117091213.647bf0e6@bootlin.com>
 <20250204-chocolate-lionfish-of-luck-10ebb8@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetieeutefffffffeevgefgudejvdeggfefudefueektdehjeegtefgtddvgfegtdenucffohhmrghinheptghrthgtrdihohhupdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhnghesl
 hhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
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

On Tue, 4 Feb 2025 16:17:10 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Fri, Jan 17, 2025 at 09:12:13AM +0100, Herve Codina wrote:
> > Hi Maxime,
> > 
> > On Thu, 16 Jan 2025 09:38:45 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > On Tue, Jan 14, 2025 at 01:54:56PM +0100, Herve Codina wrote:  
> > > > Hi Maxime,
> > > > 
> > > > On Tue, 14 Jan 2025 08:40:51 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > 
> > > > ...
> > > >     
> > > > > >  
> > > > > > +static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
> > > > > > +{
> > > > > > +	struct drm_atomic_state *state = ERR_PTR(-EINVAL);
> > > > > > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > > > > > +	struct drm_connector_state *connector_state;
> > > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > > +	struct drm_connector *connector;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Reset active outputs of the related CRTC.
> > > > > > +	 *
> > > > > > +	 * This way, drm core will reconfigure each components in the CRTC
> > > > > > +	 * outputs path. In our case, this will force the previous component to
> > > > > > +	 * go back in LP11 mode and so allow the reconfiguration of SN64DSI83
> > > > > > +	 * bridge.
> > > > > > +	 *
> > > > > > +	 * Keep the lock during the whole operation to be atomic.
> > > > > > +	 */
> > > > > > +
> > > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > > +
> > > > > > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > > +	if (IS_ERR(state)) {
> > > > > > +		err = PTR_ERR(state);
> > > > > > +		goto unlock;
> > > > > > +	}      
> > > > > 
> > > > > No, you must not allocate a new state for this, you need to reuse the
> > > > > existing state. You'll find it in bridge->base.state->state.    
> > > > 
> > > > Thanks for pointing that. I didn't know about bridge->base.state->state.
> > > > 
> > > > I will use that if using the state is still relevant (see next comment).
> > > >     
> > > > >     
> > > > > > +	state->acquire_ctx = &ctx;
> > > > > > +
> > > > > > +	connector = drm_atomic_get_old_connector_for_encoder(state,
> > > > > > +							     sn65dsi83->bridge.encoder);
> > > > > > +	if (!connector) {
> > > > > > +		err = -EINVAL;
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +
> > > > > > +	connector_state = drm_atomic_get_connector_state(state, connector);
> > > > > > +	if (IS_ERR(connector_state)) {
> > > > > > +		err = PTR_ERR(connector_state);
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +
> > > > > > +	err = drm_atomic_helper_reset_pipe(connector_state->crtc, &ctx);
> > > > > > +	if (err < 0)
> > > > > > +		goto unlock;      
> > > > > 
> > > > > And you'll find the crtc in bridge->encoder->crtc.    
> > > > 
> > > > I am a bit confused. I looked at the drm_encoder structure [1] and the crtc
> > > > field available in this structure should not be used by atomic drivers. They
> > > > should rely on &drm_connector_state.crtc.    
> > > 
> > > You're right, it's deprecated but used by most bridges anyway.
> > > 
> > > I made a series of changes after reviewing your series to address some
> > > issues with the current bridge API, most notably
> > > 
> > > https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org/  
> > 
> > Thanks for pointing that, indeed, it clarify many things!
> >   
> > >   
> > > > In my case, I have the feeling that I should get the ctrc from the current
> > > > state (i.e. bridge->base.state->state) using the sequence provided in this
> > > > current patch:
> > > >   Retrieve the connector with drm_atomic_get_old_connector_for_encoder()    
> > > 
> > > Retrieving the old connector makes no sense though. It's the connector
> > > that was formerly associated with your encoder. It might work, it might
> > > not, it's not what you're looking for.
> > >   
> > > >   Retrieve the connector state with drm_atomic_get_connector_state()    
> > > 
> > > drm_atomic_get_connector_state will allocate and pull the connector
> > > state into the drm_atomic_state, even if it wasn't part of it before, so
> > > it's not great. And you don't need it in the first place, you only need
> > > the current active CRTC.  
> > 
> > Yes, I agree with that, I only need the active CRTC.
> > 
> > I tried to get the current atomic_state from:
> >   1) bridge->base.state->state
> >   2) drm_bridge_state->base.state
> > 
> > In both cases, it is NULL. Looking at Sima's reply in your series
> > explained that:
> >   https://lore.kernel.org/dri-devel/Z4juJy7kKPbI2BDb@phenom.ffwll.local/
> > 
> > If I understood correctly those pointers are explicitly cleared.
> > 
> > So, with all of that, either:
> >   a) I wait for your series to be applied in order to use your the crtc field from
> >      drm_bridge_state added by:
> >        https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org/#t
> >   b) I use the old school bridge->encoder->crtc for the moment
> > 
> > Do you mind if I use the bridge->encoder->crtc way for the next iteration of
> > my series?  
> 
> Yeah, it makes sense.

I already send a wrong v4 (sorry) and a correct v5 with modifications in
this way :)

> 
> Still, it would be great if you could test my series on your setup and see if it helps :)

Of course, I can test updated version of your series.

I already try to get the current atomic_state exactly the same way as you do
in your series and the pointer is NULL in my case.

Best regards,
Hervé
