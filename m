Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240DA2F63F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB8E10E381;
	Mon, 10 Feb 2025 18:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fwbAeiNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3C10E381
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:00:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19B2E4438D;
 Mon, 10 Feb 2025 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739210456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLvilWAr6/r4XQUyGykRRYSHZD3CpFx0ya/iAbnhKO4=;
 b=fwbAeiNwkIBpRQwsQ4TQbxuKwoxM+IU6ebX2SzkjnGXhrUmgv3ZlQqTKedGhHXgZpdR31s
 OZPSJVQNo2xvimu9leek3AF5+YxploGEuGNGDzrL+iJsWrlCtVA1A/aYzkpHysMOtEPUf7
 dhBJiGnfzA3pObM3ubJgCJ9QvhQjanscl4XACSz5eARYJXe6KsZ6sfB7DQrSvDVF2xmXvv
 YpNrdcxCUNjT8//gUFDB1zjxCl50MhpvO//cE/8Eqf4nZ0TEw/kDybWL5LvNxulFOVWOHw
 kUrKfA9Kh9SXMewM7kuYDDA2m8OuGpucozBr0d6W3iU/JK1T9xFsst/xIRwkWw==
Date: Mon, 10 Feb 2025 19:00:50 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <20250210190050.784a2236@booty>
In-Reply-To: <k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
 <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
 <20250207114401.7869b422@booty>
 <k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghom
 hdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
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

Hi Dmitry,

On Fri, 7 Feb 2025 21:57:30 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Fri, Feb 07, 2025 at 11:44:01AM +0100, Luca Ceresoli wrote:
> > On Fri, 7 Feb 2025 05:17:43 +0200
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >   
> > > On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:  
> > > > Add a devm/drmm action to these functions so the bridge reference is
> > > > dropped automatically when the caller is removed.    
> > > 
> > > I think the get() should go to the underlying of_drm_bridge_find() function.  
> > 
> > It is done in the following patch.
> > 
> > Indeed I could swap patches 15 and 16 for clarity. Or I could squash
> > together patches 14+15+16, as they are various parts or the refcounted
> > bridge implementation, but I felt like keeping them separated would
> > help reviewing.  
> 
> I think most of refcounting should be introduced as a single patch,
> otherwise you risk having memory leaks or disappearing bridges.

In principle there is no need to add all of this atomically in a single
commit, provided that all patches adding refcounting in the
infrastructure code is applied before patches to drivers using
refcounting.

> > > Also it really feels like it's an overkill to keep the wrappers. After
> > > getting bridge being handled by the panel code would it be possible to
> > > drop all of them?  
> > 
> > Do you mean having only drm_of_get_bridge_by_node(), without any devm
> > or drmm variant? I'm not sure it is a good idea. Most DRM code (well,
> > all of it, technically) is currently unable of working with refcounted
> > bridges, but if they use the devm variant they will put the ref when
> > they disappear.
> >   
> > > Then this patch might introduce one new devm_
> > > function? Or are drmm_ functions actually being used to store data in
> > > the drmm-managed memory?  
> > 
> > Which devm function are you thinking about? Sorry, I'm not following
> > here.  
> 
> drmm_of_get_bridge() / devm_of_get_bridge(). I have a feeling (which of
> course might be wrong), that they were used somewhat randomly in some
> cases.

Again not sure I get you, sorry. What's wrong in
devm_drm_of_get_bridge(), and what would the new function you proposed
be doing? I think a couple lines of pseudocode would clarify this.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
