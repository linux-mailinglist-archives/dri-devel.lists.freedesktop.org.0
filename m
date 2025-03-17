Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26017A65479
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6702610E41E;
	Mon, 17 Mar 2025 14:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j6ctwHsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6461010E41E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:56:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCFCD44208;
 Mon, 17 Mar 2025 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742223372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtpDF4LCM5OBZjUURemHi6I53UMKp/PEczf10l0EmfU=;
 b=j6ctwHsDmHzyLfcyPxHdOFcwr5JZAU/soF26rObmPq/Yp+oQA16mp4ed8gKJqotQIrdgNC
 9CVFbl63PpbKUIYjQK40Zw/kqvxrHq4jMGNokctx0KsAGs6PbkOrNs2Dz6s5myBz48fkiq
 Qs27La7lZQKiO8lGgt+FAK1c7YmM87UW9wptD2IE2kUMHQ9q9S34kQrUNK0V2NdayxTNIE
 98YvbP2hPlmodfgjFn3XIJdu8q0ziGagVhk6nhv+kHyYxhngWSFg9ZivFDoO1yCZZ254L4
 b3fW5C6X3FOhqWDmL9sfh/4gbd4Ke7ImLgdBeCpng6FiNKGBA/QpVYB2Bc0KRw==
Date: Mon, 17 Mar 2025 15:56:07 +0100
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
Message-ID: <20250317155607.68cff522@booty>
In-Reply-To: <20250314-daft-woodoo-cheetah-e029c5@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-daft-woodoo-cheetah-e029c5@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhms
 hhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
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

On Fri, 14 Mar 2025 19:21:01 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Fri, Mar 14, 2025 at 11:31:13AM +0100, Luca Ceresoli wrote:
> > This series improves the way DRM bridges are allocated and
> > initialized and makes them reference-counted. The goal of reference
> > counting is to avoid use-after-free by drivers which got a pointer
> > to a bridge and keep it stored and used even after the bridge has
> > been deallocated.
> > 
> > The overall goal is supporting Linux devices with a DRM pipeline
> > whose final components can be hot-plugged and hot-unplugged,
> > including one or more bridges. For more details see the big picture
> > [0].
> > 
> > DRM bridge drivers will have to be adapted to the new API, which is
> > pretty simple for most cases. Refcounting will have to be adopted
> > on the two sides: all functions returning a bridge pointer and all
> > code obtaining such a pointer. This series has just an overview of
> > some of those conversions, because for now the main goal is to
> > agree on the API.
> > 
> > Series layout:
> > 
> >  1. Add the new API and refcounting:
> > 
> >     drm/bridge: add devm_drm_bridge_alloc()
> >     drm/bridge: add support for refcounting
> > 
> >  2. get/put the reference in basic operations in the bridge core:
> > 
> >     drm/bridge: get/put the bridge reference in
> > drm_bridge_add/remove() drm/bridge: get/put the bridge reference in
> > drm_bridge_attach/detach()
> > 
> >  3. as an example of changes for bridge consumers, get a reference
> > for the bridge returned by drm_bridge_chain_get_first_bridge(),
> > have it put by all callers (all users will be covered later on
> > separately):
> > 
> >     drm/bridge: add a cleanup action for scope-based
> > drm_bridge_put() invocation drm/bridge: get the bridge returned by
> > drm_bridge_chain_get_first_bridge() drm/mxsfb: put the bridge
> > returned by drm_bridge_chain_get_first_bridge() drm/atomic-helper:
> > put the bridge returned by drm_bridge_chain_get_first_bridge()
> > drm/probe-helper: put the bridge returned by
> > drm_bridge_chain_get_first_bridge()
> > 
> >  4. convert a few bridge drivers (bridge providers) to the new API:
> > 
> >     drm/bridge: ti-sn65dsi83: use dynamic lifetime management
> >     drm/bridge: samsung-dsim: use dynamic lifetime management
> > 
> > This work was formerly a part of my v6 DRM bridge hotplug
> > series[0], now split as a standalone series with many improvements,
> > hence the "v7" version number.  
> 
> Except for one patch where I had comments, I think the series is in
> excellent shape. We're still missing a couple of things to close this
> topic though:
> 
>   - Converting the other bridge iterators/accessors to take / put the
> references

I sent a couple in this series as you had asked, to show how conversion
looks like. But I have a large part of this conversion partially done
already, and it is the largest part of the refcounting work in terms of
touched files due to the large number of drivers using the iterators
and accessors. Here are the functions to convert:

 A) drm_bridge_chain_get_first_bridge
 B) drm_bridge_get_prev_bridge
 C) drm_bridge_get_next_bridge
 D) drm_for_each_bridge_in_chain
 E) drm_bridge_connector_init
 F) of_drm_find_bridge

A) is present in this series as an example but I don't think it should
be applied until all bridge drivers are converted to
drm_bridge_alloc(). Otherwise for not-yet-converted bridge drivers we'd
have drm_bridge_get/put() operating on an uninitialized kref, and
__drm_bridge_free() called on non-refcounted bridges, so I think we'd
see fireworks.

In the previous iteration I used drm_bridge_is_refcounted() in
drm_bridge_get/put() to allow a progressive migration, but if we want
to convert everything in a single run we need to first convert all
bridges to drm_bridge_alloc() and then convert all accessors.

The same reasoning applies to patches 3-4 which add get/put to
drm_bridge_add/remove() and _attach/detach().

B) to E) are ready in my work branch, about 20 patches in total.
Indeed item E) is a special case but it is handled there too.

Item F) is the beast, because of the reverse call graph of
of_drm_find_bridge() which includes drm_of_find_panel_or_bridge() and
then *_of_get_bridge(), each having a few dozen callers, and leading
to the panel_bridge topic. I have converted maybe half of the users of
accessors in F), it's 35 patches but it's the easy half and I still need
to tackle to hardest ones.

>   - Mass converting the drivers to devm_drm_bridge_alloc

Again I sent a couple in this series as you had asked, to show how
conversion looks like for the typical bridge driver. There are ~70
drivers to convert in total and I think most will be easy as the two
examples presented here.

I think this should be merged entirely before merging any accessor
changes, as explained above.

>   - Documenting somewhere (possibly in drm_bridge_init?) that it
> really shouldn't be used anymore

I'm afraid there is no drm_bridge_init(), bridge drivers just do
[devm_]kzalloc and set fields explicitly. So I don't think there is a
place to document this.

However I used to have a documentation patch until v6 [0], and I think
it should be revived and resent at some point, after removing the
"legacy mode" as we are converting all drivers at once. BTW I also have
a kunittest patch that should be revived. Do you still prefer me to
resend these two patches as a separate series, waiting after the API in
this series is applied?

Overall, I think this could be the path forward, let me know if
youthink it should be done differently:

 A. have patches 1 and 2 of this series applied
    (why not, even patches 10-11)
 B. after (A), send series to convert all bridge drivers to new API
    (includes patches 10-11 of this series if not applied already)
 C. after (A), send documentation and kunittest patches
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
    (patches 3-4 in this series)
 E. after (B), send series to convert accessors (including patches 5-9
    in this series which convert drm_bridge_chain_get_first_bridge()
    and its users)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-18-9d6f2c9c3058@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
