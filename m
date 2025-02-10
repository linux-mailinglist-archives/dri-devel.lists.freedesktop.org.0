Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82452A2F4D1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 18:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8215F10E5C5;
	Mon, 10 Feb 2025 17:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YWszMeci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81A810E5C5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:12:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D32544373;
 Mon, 10 Feb 2025 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739207529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSNY8yEIRI4HKXCEeF0JHuMeMGhBRILsMQ09C7o2Cbg=;
 b=YWszMecidwQTKrqGrAVbj6OTHr9EL5rMJgmtORrJBINil5kipGA/9EAELC4Zg7+pdlRYL3
 6yfQWyzxyfQRrKmCH268JewbhwJNla42k1iRVFcFw+edw2OyPMmUEVMlc0im5owuyT/ciX
 T43chFvA87slybxRx+0tNEjdOrusiIXNTjbIOQHwffJMHkKKDz6zjI+m2zE7jHg+1BEene
 V4i6hxeFPIv8Dx1WuZ//OWffftNYseblG9cRL01c/2D/sv2PCxBOIzQkOvQMKvlhjGPcHE
 itVGlC8/l8j6TyCcyWQd7SZqpTQBELIPzaHqlIYTXr/3jA/qfXTnZR1LniwJxw==
Date: Mon, 10 Feb 2025 18:12:03 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Paul Kocialkowski
 <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210181203.36798a31@booty>
In-Reply-To: <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
 <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdpr
 hgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrgh
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

Hello Maxime, Dmitry,

On Mon, 10 Feb 2025 16:23:44 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org>
> wrote:
> >
> > On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote:  
> > > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:  
> > > > Hi,
> > > >
> > > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:  
> > > > > DRM bridges are currently considered as a fixed element of a
> > > > > DRM card, and thus their lifetime is assumed to extend for as
> > > > > long as the card exists. New use cases, such as hot-pluggable
> > > > > hardware with video bridges, require DRM bridges to be added
> > > > > and removed to a DRM card without tearing the card down. This
> > > > > is possible for connectors already (used by DP MST), so add
> > > > > this possibility to DRM bridges as well.
> > > > >
> > > > > Implementation is based on drm_connector_init() as far as it
> > > > > makes sense, and differs when it doesn't. A difference is
> > > > > that bridges are not exposed to userspace, hence struct
> > > > > drm_bridge does not embed a struct drm_mode_object which
> > > > > would provide the refcount. Instead we add to struct
> > > > > drm_bridge a refcount field (we don't need other struct
> > > > > drm_mode_object fields here) and instead of using the
> > > > > drm_mode_object_*() functions we reimplement from those
> > > > > functions the few lines that drm_bridge needs for refcounting.
> > > > >
> > > > > Also add a new devm_drm_bridge_alloc() macro to allocate a
> > > > > new refcounted bridge.
> > > > >
> > > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > > >
> > > > So, a couple of general comments:
> > > >
> > > > - I've said it a couple of times already, but I really think
> > > > you're making it harder than necessary for you here. This (and
> > > > only this!) should be the very first series you should be
> > > > pushing. The rest can only ever work if that work goes through,
> > > > and it's already hard enough as it is. So, split that patch
> > > > into a series of its own, get that merged, and then we will be
> > > > able to deal with panels conversion and whatever. That's even
> > > > more true with panels since there's ongoing work that will make
> > > > it easier for you too. So the best thing here is probably to
> > > > wait.  

The idea you proposed was to handle the issues current panel bridge
code adds to the hotplug work by adding a .destroy callback and some
more devm magic. I explored the idea but even after some clarifications
from you it still didn't appear clearly doable and correct to me. And
even in the case it were perfectly correct and doable, it is based on
adding more complexity and "magic" on top of a topic that is already
hard to understand: panel_bridge lifetime.

So I opted for the other way: rework panel_bridge code so its lifetime
is clear and as one would expect (panel_bridge lifetime == panel
lifetime).

Possibly more work for me, but now it's done and it's in these patches
so why waiting?

This work has made the hotplug work on top of it way cleaner, and you
can also see the good cleanup in the samsung-dsim driver in patch 11.

I'm at work to apply the improvements suggested by Dmitry and send a
new version, and I'm fine with applying more fixes as needed.

And after this "basic" panel_bridge, more cleanups and rationalization
can be done at any moment, in order to make the panel and panel_bridge
even closer, and remove the code duplication.

> > > Luca and I had a quick chat on this during FOSDEM. I really think
> > > that panel (part of the) series can go in first as it fixes a
> > > very well known bug _and_ allows a pretty good cleanup to a whole
> > > set of drivers.  
> >
> > I don't necessarily disagree on principle, but if you state that it
> > can get first, and fixes a known problem (which one?), then it
> > should be a separate, standalone, series.  
> 
> A problem of panel bridges having the wrong lifetime because of devm_
> attachment to a wrong device and so either being kept for too long or
> being destroyed too early.

Exactly, because panel_bridge is usually created in the consumer driver
context, so the devm calls get a struct device pointer to the consumer,
not the panel itself (more in patch 8).

> > Ever-expanding features are bad for both the reviewers and the
> > contributors, even more so when the discussion happens off-list.
> >  
> > > With all those panel / bridge wrappers gone we should be able to
> > > see a clearer picture of what individual drivers are doing. In
> > > other words, which memory and which code actually hosts and uses
> > > internal 'next_bridge' reference.
> > >  
> > > > - This patch really needs to be split into several patches,
> > > > something along the lines of:
> > > >
> > > >   + Creating devm_drm_bridge_alloc()
> > > >   + Adding refcounting
> > > >   + Taking the references in all the needed places
> > > >   + Converting a bunch of drivers  

OK, I can split it.

> > > The last two parts seem troublematic to me, but, I must admit, I
> > > didn't spend so much time reviewing all drm_bridge usage
> > > patterns.  
> >
> > Why? the third one is already done by that patch, the fourth can
> > relatively easily be done using coccinelle.  
> 
> I have doubts about cocci. It doesn't have a way to know, what is the
> lifetime of the references to the reference-holding memory. Maybe I'm
> missing a point there.

I haven't looked into that, but I think coccinelle would be helpful in
adding the needed gets, but probably not for the puts, which are
usually more complex to get right.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
