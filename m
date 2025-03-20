Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5BA6A09C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 08:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D810E59C;
	Thu, 20 Mar 2025 07:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fajab6of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939CD10E59C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:41:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E3C84436F;
 Thu, 20 Mar 2025 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742456486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmPdfR67O2wcc6/RI+Tc9AyY4rjn6JD2dOIfEvFlJnQ=;
 b=Fajab6ofQy9GQKOL1lDcWQfm/0zyroqQRlF4ltPWxT9DK3Kz2DXP4fiTBAuRaWBovUj2Cq
 7Xs65a44MCIogTqhY9yE+Pbjp+uATyM3uGz8ZXBovdasbw4nY74FcibRBPw15cVC5B//HL
 HoE79L729ZJJC2p0S2zTI6MKh5g6VFJAR5pV3gUeTNOpVL9Bk7zrb72rG67qGTRwhtUEmP
 doGblm+y8jR0MsywXUhEFuv1zt7JHUkmCFEJPi/JlSYAhD2EBPzsvfS9haVYm4wtkorHyP
 nZ64j9pnqZIyUM2/BSBuYi5mvWIKq1K7tmjyz/E7reZ1jTkV0dPNeOZ858B90w==
Date: Thu, 20 Mar 2025 08:41:18 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with
 bridge refcount
Message-ID: <20250320084118.347bafc9@booty>
In-Reply-To: <20250319-stylish-lime-mongoose-0a18ad@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-daft-woodoo-cheetah-e029c5@houat>
 <20250317155607.68cff522@booty>
 <20250319-stylish-lime-mongoose-0a18ad@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
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

Hello Mazime,

On Wed, 19 Mar 2025 17:16:53 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Mar 17, 2025 at 03:56:07PM +0100, Luca Ceresoli wrote:
> > Hello Maxime,
> > 
> > On Fri, 14 Mar 2025 19:21:01 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Fri, Mar 14, 2025 at 11:31:13AM +0100, Luca Ceresoli wrote:  
> > > > This series improves the way DRM bridges are allocated and
> > > > initialized and makes them reference-counted. The goal of reference
> > > > counting is to avoid use-after-free by drivers which got a pointer
> > > > to a bridge and keep it stored and used even after the bridge has
> > > > been deallocated.
> > > > 
> > > > The overall goal is supporting Linux devices with a DRM pipeline
> > > > whose final components can be hot-plugged and hot-unplugged,
> > > > including one or more bridges. For more details see the big picture
> > > > [0].
> > > > 
> > > > DRM bridge drivers will have to be adapted to the new API, which is
> > > > pretty simple for most cases. Refcounting will have to be adopted
> > > > on the two sides: all functions returning a bridge pointer and all
> > > > code obtaining such a pointer. This series has just an overview of
> > > > some of those conversions, because for now the main goal is to
> > > > agree on the API.
> > > > 
> > > > Series layout:
> > > > 
> > > >  1. Add the new API and refcounting:
> > > > 
> > > >     drm/bridge: add devm_drm_bridge_alloc()
> > > >     drm/bridge: add support for refcounting
> > > > 
> > > >  2. get/put the reference in basic operations in the bridge core:
> > > > 
> > > >     drm/bridge: get/put the bridge reference in
> > > > drm_bridge_add/remove() drm/bridge: get/put the bridge reference in
> > > > drm_bridge_attach/detach()
> > > > 
> > > >  3. as an example of changes for bridge consumers, get a reference
> > > > for the bridge returned by drm_bridge_chain_get_first_bridge(),
> > > > have it put by all callers (all users will be covered later on
> > > > separately):
> > > > 
> > > >     drm/bridge: add a cleanup action for scope-based
> > > > drm_bridge_put() invocation drm/bridge: get the bridge returned by
> > > > drm_bridge_chain_get_first_bridge() drm/mxsfb: put the bridge
> > > > returned by drm_bridge_chain_get_first_bridge() drm/atomic-helper:
> > > > put the bridge returned by drm_bridge_chain_get_first_bridge()
> > > > drm/probe-helper: put the bridge returned by
> > > > drm_bridge_chain_get_first_bridge()
> > > > 
> > > >  4. convert a few bridge drivers (bridge providers) to the new API:
> > > > 
> > > >     drm/bridge: ti-sn65dsi83: use dynamic lifetime management
> > > >     drm/bridge: samsung-dsim: use dynamic lifetime management
> > > > 
> > > > This work was formerly a part of my v6 DRM bridge hotplug
> > > > series[0], now split as a standalone series with many improvements,
> > > > hence the "v7" version number.    
> > > 
> > > Except for one patch where I had comments, I think the series is in
> > > excellent shape. We're still missing a couple of things to close this
> > > topic though:
> > > 
> > >   - Converting the other bridge iterators/accessors to take / put the
> > > references  
> > 
> > I sent a couple in this series as you had asked, to show how conversion
> > looks like. But I have a large part of this conversion partially done
> > already, and it is the largest part of the refcounting work in terms of
> > touched files due to the large number of drivers using the iterators
> > and accessors. Here are the functions to convert:
> > 
> >  A) drm_bridge_chain_get_first_bridge
> >  B) drm_bridge_get_prev_bridge
> >  C) drm_bridge_get_next_bridge
> >  D) drm_for_each_bridge_in_chain
> >  E) drm_bridge_connector_init
> >  F) of_drm_find_bridge
> > 
> > A) is present in this series as an example but I don't think it should
> > be applied until all bridge drivers are converted to
> > drm_bridge_alloc(). Otherwise for not-yet-converted bridge drivers we'd
> > have drm_bridge_get/put() operating on an uninitialized kref, and
> > __drm_bridge_free() called on non-refcounted bridges, so I think we'd
> > see fireworks.
> > 
> > In the previous iteration I used drm_bridge_is_refcounted() in
> > drm_bridge_get/put() to allow a progressive migration, but if we want
> > to convert everything in a single run we need to first convert all
> > bridges to drm_bridge_alloc() and then convert all accessors.
> > 
> > The same reasoning applies to patches 3-4 which add get/put to
> > drm_bridge_add/remove() and _attach/detach().  
> 
> Agreed.
> 
> > B) to E) are ready in my work branch, about 20 patches in total.
> > Indeed item E) is a special case but it is handled there too.
> > 
> > Item F) is the beast, because of the reverse call graph of
> > of_drm_find_bridge() which includes drm_of_find_panel_or_bridge() and
> > then *_of_get_bridge(), each having a few dozen callers, and leading
> > to the panel_bridge topic. I have converted maybe half of the users of
> > accessors in F), it's 35 patches but it's the easy half and I still need
> > to tackle to hardest ones.  
> 
> One thing to keep in mind is that, while it's not correct, if the bridge
> has been allocated with devm_drm_bridge_alloc, it's not worse either. If
> you're not getting a reference to your pointer, the point is buggy,
> sure, but it's just as buggy as before, and in the same situations.
> 
> So we can make that gradually if it's more convenient.

I see your point, right. And definitely doing it in gradually will help.

> One way to solve it would be that, for example, of_drm_find_bridge is
> oddly named according to our convention and it would make more sense to
> be called drm_of_find_bridge().
> 
> So maybe we can just create drm_of_find_bridge() that takes a reference,
> make of_drm_find_bridge() deprecated in favour of drm_of_find_bridge(),
> add a TODO, and call it a day. People will gradually switch to the new
> API over time.

Thanks for the suggestion, I will certainly try this way when I get
back to the accessor conversion work. While increasing the number of
deprecated functions is not great, I'm starting to suspect a conversion
of _all_ the of_drm_find_bridge() users at once is not realistic.

> > >   - Documenting somewhere (possibly in drm_bridge_init?) that it
> > > really shouldn't be used anymore  
> > 
> > I'm afraid there is no drm_bridge_init(), bridge drivers just do
> > [devm_]kzalloc and set fields explicitly. So I don't think there is a
> > place to document this.  
> 
> Oh, right.
> 
> Then, drm_bridge_add() would be a good candidate too to mention that
> bridges must be allocated using devm_drm_bridge_alloc().

Sure. I'll add such a comment.

> > Overall, I think this could be the path forward, let me know if
> > youthink it should be done differently:
> > 
> >  A. have patches 1 and 2 of this series applied
> >     (why not, even patches 10-11)  
> 
> I had some comments on patch 2, but it's ok for me on principle.

Sorry, my wording was not clear. I really meant "have patches 1 and 2 of
this series applied after the improvements proposed". So hopefully the
v8 I'm sending today-ish. I'm going to send only patches 1, 2, 10 and
11. The other patches are not meant to be merged now, so I'm resending
them when appropriate.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
