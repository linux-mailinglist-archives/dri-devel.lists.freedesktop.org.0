Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA2A60AE3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FD910E33B;
	Fri, 14 Mar 2025 08:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fIoKFoKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE8010E2F4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:11:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39CB844166;
 Fri, 14 Mar 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741939888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shPwwGXfHVuV1VEQPB00+dQj+dOnHg7agqnzcuOae+g=;
 b=fIoKFoKELP4821UfIVCOJ7r0oRx+ErLefYKp9XTh7WSH4cEVUWJiedNkCtFuxYms4hSMxu
 eERv4eaCRm7eD7vTzxbo2Yd5bpPbOXvkc8n7yoNaqR/GDSYlOh3ZY0Mx8ebCY7BAlbndwl
 nqqshu+8ScypJK0eDaRsnNPkAlXHe+LRax8aMccBkZiJXYcf78fa/sf3HpuSxb/Q36bK43
 EeepcpWqgGZZL1WGsf5AjGG+Xv2hXIhFvMlEdcdRP8Sb3c9HVSYIJgg7a/dMsNkABQaI8j
 pNdL7J5N3VFrE0/URRC9+BNzsRU1UslrHOsivGUh+9vbsKwQ8UbRq5kvRIBpeg==
Date: Fri, 14 Mar 2025 09:11:20 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
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
 <contact@paulk.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250314091120.366b5fd7@booty>
In-Reply-To: <20250313-flying-crab-of-diversity-fa1db0@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <20250313125656.70448d09@booty>
 <20250313-flying-crab-of-diversity-fa1db0@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgdttddvmedusggrjeemgeekfhejmedulegtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgdttddvmedusggrjeemgeekfhejmedulegthedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeejpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghomhdprhgtphhtt
 hhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
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

On Thu, 13 Mar 2025 19:07:17 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Thu, Mar 13, 2025 at 12:56:56PM +0100, Luca Ceresoli wrote:
> > Hello Maxime,
> > 
> > On Fri, 7 Feb 2025 12:47:51 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:  
> > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:  
> > > > DRM bridges are currently considered as a fixed element of a DRM card, and
> > > > thus their lifetime is assumed to extend for as long as the card
> > > > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > > > require DRM bridges to be added and removed to a DRM card without tearing
> > > > the card down. This is possible for connectors already (used by DP MST), so
> > > > add this possibility to DRM bridges as well.
> > > > 
> > > > Implementation is based on drm_connector_init() as far as it makes sense,
> > > > and differs when it doesn't. A difference is that bridges are not exposed
> > > > to userspace, hence struct drm_bridge does not embed a struct
> > > > drm_mode_object which would provide the refcount. Instead we add to struct
> > > > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > > > fields here) and instead of using the drm_mode_object_*() functions we
> > > > reimplement from those functions the few lines that drm_bridge needs for
> > > > refcounting.
> > > > 
> > > > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > > > bridge.
> > > > 
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> > > 
> > > So, a couple of general comments:
> > > 
> > > - I've said it a couple of times already, but I really think you're
> > >   making it harder than necessary for you here. This (and only this!)
> > >   should be the very first series you should be pushing. The rest can
> > >   only ever work if that work goes through, and it's already hard enough
> > >   as it is. So, split that patch into a series of its own, get that
> > >   merged, and then we will be able to deal with panels conversion and
> > >   whatever. That's even more true with panels since there's ongoing work
> > >   that will make it easier for you too. So the best thing here is
> > >   probably to wait.
> > > 
> > > - This patch really needs to be split into several patches, something
> > >   along the lines of:
> > > 
> > >   + Creating devm_drm_bridge_alloc()
> > >   + Adding refcounting
> > >   + Taking the references in all the needed places
> > >   + Converting a bunch of drivers  
> > 
> > After reading Anusha's "[PATCH RFC 0/2] drm/panel: Refcounted panel
> > allocation" [0] I think I need a clarification about the 4 steps you had
> > outlined in the above quoted text. Are you suggesting those are four
> > _series_, and you'd want to see a series only creating
> > devm_drm_bridge_alloc() as a first step, similarly to Anusha's work?
> > 
> > That was not my understanding so far, and so I've been working on a
> > series containing all 4 items, and it's growing very long due to item 3
> > needing to touch many dozen drivers which need to put a bridge (many
> > are identical oneliner patches though).  
> 
> I believe I've clarified it already in Anusha's series, but I think a

Yes, you have...

> reasonable series for *early* work would be the bullet points 1, 2, a
> bit of 3 and a bit of 4.

...but thanks for the extra clarification.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
