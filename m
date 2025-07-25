Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17635B120FA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EB610E9E6;
	Fri, 25 Jul 2025 15:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gOe7LK/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C590D10E9E6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:32:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC9F443370;
 Fri, 25 Jul 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753457574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUw48bVGzQDtnzpFCZ6F0zUPopLUUADYRFUd0lfoHsE=;
 b=gOe7LK/fGYNTmz+SyIELCjPFaJaCHIQ1cZCxpO6F/7sKlMOxRRHmUVPl7IAXCdbmAmgzzJ
 qhK1BlYOirxaOuv7zUtH+7p+NHrT7W6MoGw6U1vHfQA3q6tieo1SqT5AB7M/5eaJxkGkDh
 83V53TpmJLyk2exzGH7/QY3Nr79ar/ovL9WHSEUPkTnM/j18kUW2laDfMW3XjN4q70C7Bn
 d4RvcOiRc1ArRt3EaCCaQHPmX90dMQCNFor+oGojqc5TmT1eBTWfPQ7A+mhqaGcjJZp8H7
 E3OoJs+8MH+AAVPMtTkqeQ2oGKbCKz9KUKrzwRmSNF45iIk+nck7NEh0a/V7Dg==
Date: Fri, 25 Jul 2025 17:32:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 00/32] drm/mipi-dsi: avoid DSI host drivers to have
 pointers to DSI devices
Message-ID: <20250725173248.4cdca9e4@booty>
In-Reply-To: <20250725-juicy-falcon-of-climate-d87ea6@houat>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
 <20250707-strange-warm-bear-cb4ee8@houat>
 <20250707115853.128f2e6f@booty> <20250707121319.1e40a73a@booty>
 <20250725-juicy-falcon-of-climate-d87ea6@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhop
 ehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
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

On Fri, 25 Jul 2025 17:22:47 +0200
Maxime Ripard <mripard@kernel.org> wrote:

...

> > The question is: should a DSI host bridge driver:
> > 
> >  A) wait for a DSI device to .attach before drm_bridge_add()ing itself,
> >     or
> >  B) drm_bridge_add() itself unconditionally, and let the DSI device
> >     .attach whenever it happens?
> > 
> > A) is what many drivers (IIRC the majority) does. It implies the card
> > will not be populated until .attach, which in the hotplug case could
> > happen very late
> > 
> > B) is done by a few drivers and allows the card to appear in the
> > hotplug case without the device, which is needed for hotplug.
> > 
> > I had tried simply moving drm_bridge_add() from .attach to probe in
> > the samsung-dsim driver in the pase but that would not work. Now I did
> > yet another check at the code and I suspect it can be done with a small
> > additional change, but cannot access the hardware to test it currently.
> > 
> > Answering this last question might change and simplify the requirements
> > discussed in the (very lengthy, sorry about that) discussion above.  
> 
> You're not going to like the answer too much, but I think that it is
> that "nobody knows".
> 
> The bad news is that I can't give you an answer, but the good one is
> that it gives us some leeway.
> 
> As I said in my previous mail, we should probably figure it out,
> document it, and then make it work for your drivers. Once we have a
> documentation we can point to, the rest will fall in line.

Thanks for taking time to reply this!

I just sent a patch to do the mentioned change in samsung-dsim [0] to
start discussion on real code. I'd appreciate if you could prioritize
that patch over all other patches I have sent.

[0] https://lore.kernel.org/all/20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
