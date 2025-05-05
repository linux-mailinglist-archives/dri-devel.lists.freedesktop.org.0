Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53315AA9747
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E441C10E40A;
	Mon,  5 May 2025 15:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IsYdCFfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6158010E409;
 Mon,  5 May 2025 15:20:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 389214398E;
 Mon,  5 May 2025 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746458432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9TG3OmSzS8fUS1eTfStK5VQAKwBeZ4see00hs7EtDk=;
 b=IsYdCFfoHd/qOi+gYYbWTZx9rAYgOwGSN0Eo0YXJnG9B/edlJPMStRCvc+FLKq4wqI/fPT
 1o0tp81lbGpBiMxcF7EkxBNQLTJ4AW8TE1s3h+3Ao+ryG1FR1N7lvwzYWEpMgHLMK1rp98
 XLYJTZyxXDkzfobqUvTulr2czf0EOlP64GFNT5AXkWvxB73odvQWCI/huAFffxIc01O/x+
 jInLvozRhnoxnrD5dAmxc9jlW2nmyCQlvuE4hqgOHFPF/9cYlCwYazKn2p5pp5dpHdAi5j
 SFvCWFSAfDRERL7wOxHamZgj6g3QGMXJO/fr/76NFpGY1qnmq1cAlxnaFpAo5A==
Date: Mon, 5 May 2025 17:20:27 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250505172027.25af7721@booty>
In-Reply-To: <20250505-beneficial-fossa-of-weather-67c676@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
 <20250428-wild-condor-of-defiance-cadf60@houat>
 <20250428172516.79058e22@booty>
 <20250505-beneficial-fossa-of-weather-67c676@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
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

On Mon, 5 May 2025 08:23:26 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Apr 28, 2025 at 05:25:16PM +0200, Luca Ceresoli wrote:
> > Hi Maxime,
> > 
> > On Mon, 28 Apr 2025 13:39:23 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:  
> > > > This is the new API for allocating DRM bridges.
> > > > 
> > > > The devm lifetime management of this driver is peculiar. The underlying
> > > > device for the panel_bridge is the panel, and the devm lifetime is tied the
> > > > panel device (panel->dev). However the panel_bridge allocation is not
> > > > performed by the panel driver, but rather by a separate entity (typically
> > > > the previous bridge in the encoder chain).
> > > > 
> > > > Thus when that separate entoty is destroyed, the panel_bridge is not
> > > > removed automatically by devm, so it is rather done explicitly by calling
> > > > drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> > > > panel_bridge in current code, so update it as well to put the bridge
> > > > reference instead.
> > > > 
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> > > 
> > > This looks fine, but we need a TODO entry to clean this up later on, and
> > > a comment on devm_drm_put_bridge that this is inherently unsafe and
> > > must not be used.  
> > 
> > Ah, I see, OK.
> > 
> > Quick draft:
> > 
> >  /**
> >   * devm_drm_put_bridge - Release a bridge reference obtained via devm
> >   * @dev: device that got the bridge via devm
> >   * @bridge: pointer to a struct drm_bridge obtained via devm
> >   *
> >   * Same as drm_bridge_put() for bridge pointers obtained via devm functions
> >   * such as devm_drm_bridge_alloc().
> > + *
> > + * This function is a temporary workaround and MUST NOT be used. Manual
> > + * handling of bridge lifetime is inherently unsafe.
> >   */  
> 
> That part looks good to me
> 
> > and:
> > 
> > -	devm_kfree(panel_bridge->panel->dev, bridge);
> > +       /* TODO remove this after reworking panel_bridge lifetime */
> > +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
> >  }
> > 
> > Does it look good enough?  
> 
> That too, but I was talking about an entry in
> https://www.kernel.org/doc/html/latest/gpu/todo.html

Ah, sure!

I queued this for v3, if you have better suggestions don't hesitate to
let me know:

-----8<-----

Remove devm_drm_put_bridge()
----------------------------

Due to how the panel bridge handles the drm_bridge object lifetime, special
care must be taken to dispose of the drm_bridge object when the
panel_bridge is removed. This is currently managed using
devm_drm_put_bridge(), but that is an unsafe, temporary workaround. To fix
that, the DRM panel lifetime needs to be reworked. After the rework is
done, remove devm_drm_put_bridge() and the TODO in drm_panel_bridge_remove().

Contact: Maxime Ripard <mripard@kernel.org>,
         Luca Ceresoli <luca.ceresoli@bootlin.com>

Level: Intermediate

-----8<-----

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
