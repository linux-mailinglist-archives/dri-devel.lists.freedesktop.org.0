Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C4B2C8F6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 18:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFECD10E62F;
	Tue, 19 Aug 2025 16:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="b5FCqyVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1170B10E62F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 16:01:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27D8B4432F;
 Tue, 19 Aug 2025 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1755619302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltpNMif16os2+Ik15uMFCGv0wNTw+E/lpUi+uydO/XY=;
 b=b5FCqyVAX8LmMpQZDLg2qoroHaf7LnQSIkv96cIxOlz7XoGvYEjX3b9L+xkYLPrC6aqSx2
 QU4Rzd73UEjSwGcl7fllMe17Ke9Bn48ahV3HDzYBQCgvZZxUb75pGYy+MDjjCxAweKCJ2p
 sqNxJ1VX9FHQ5leEOnuqw/Huwm9OdpsyjbdoOf814+vNOES62kW/XK37tiuZh7BL8CBeEv
 EtKxVRK7b6v76qkrpvrY7bujRPu2jcBayT0GejagkjxenTZT8rEal905FuD6pK4UMaRfh3
 SiXXyIKH/pr/Y9WQ3ikxHRZY1EfvQ1fc1AIlhE4Phz+vdZ8PDpMPGtaNJ5/7lA==
Date: Tue, 19 Aug 2025 18:01:37 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Chaoyi Chen
 <chaoyi.chen@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/9] drm/bridge: add
 drm_for_each_bridge_in_chain_scoped()
Message-ID: <20250819180137.28ca89c0@booty>
In-Reply-To: <7gpqrxlxxuarbp5b7bycukbbjdcuonlhn4zm6xinnrlqzrbeu7@rrpcwxnxxrag>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
 <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-3-edb6ee81edf1@bootlin.com>
 <7gpqrxlxxuarbp5b7bycukbbjdcuonlhn4zm6xinnrlqzrbeu7@rrpcwxnxxrag>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheehledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
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

Hi Maxime,

On Tue, 19 Aug 2025 15:47:06 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> > +/**
> > + * drm_for_each_bridge_in_chain_scoped - iterate over all bridges attached
> > + *                                       to an encoder
> > + * @encoder: the encoder to iterate bridges on
> > + * @bridge: a bridge pointer updated to point to the current bridge at each
> > + *	    iteration
> > + *
> > + * Iterate over all bridges present in the bridge chain attached to @encoder.
> > + *
> > + * Automatically gets/puts the bridge reference while iterating, and puts
> > + * the reference even if returning or breaking in the middle of the loop.
> > + */
> > +#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)		\
> > +	for (struct drm_bridge *bridge __free(drm_bridge_put) =		\
> > +	     drm_bridge_chain_get_first_bridge(encoder);		\  
> 
> So my understanding is that the initial value of bridge would be cleaned
> up with drm_bridge_put...
> 
> > +	     bridge;							\
> > +	     bridge = drm_bridge_get_next_bridge_and_put(bridge))  
> 
> ... but also when iterating?
> 
> So if we have more than 0 values, we put two references?

No, this is not the case. The __free action is executed only when
exiting the entire for loop, not a single iteration.

This is consistent with the fact that the loop variable is persistent
across iterations.

I tested this macro in both cases:

 * looping over the entire chain the final value of @bridge will be
   NULL and the cleanup action won't call drm_bridge_put()
 * breaking before the last element, @bridge is non-NULL and the
   cleanup action does call drm_bridge_put()

See examples such as for_each_child_of_node_scoped() and other OF
iterators which work in the same way (which is no coincidence, I used
them as starting point for writing this patch).

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
