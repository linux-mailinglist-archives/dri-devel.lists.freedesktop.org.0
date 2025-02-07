Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02B9A2BE99
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B846C10EA70;
	Fri,  7 Feb 2025 08:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Jt11DHRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5422810EA79
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 08:53:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9912442CE;
 Fri,  7 Feb 2025 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738918404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKxj3pSD0UwzMwdxWit8kdJvq0oc5hRaBZzxFkTM46k=;
 b=Jt11DHRqH/hXBBUEMf6EkKmyU63Y9/C8UFL/hQXT+cT/sBvJcPNHnTdb21tQMKpXIIaS8n
 Tjy72dAH3yPLxX3dqKeROQm5keBVXaUjd58v3UNMxIspmoEGRvwT69peKmMTNn0e6daa3V
 al+b+2v6RA3XNUzYrjh+Ey+kJLdoxAbWb8xNz01kb1g5TW7VMLqikmvXvt4uv+Fj1KkHc1
 DzrZkzZzMjh0JRsawywnNJabEBCijVEZfARH8y0/h/S76bj5yLmPNv8qg/6yDyiExoH/JF
 SR5yL1Mt/orv91qMJq3j0p//MLNZTzIkWXA7UVywXc+HYC491xHAPngeJJyqBA==
Date: Fri, 7 Feb 2025 09:53:18 +0100
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
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <20250207095318.2fc8d54e@booty>
In-Reply-To: <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
 <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
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

On Fri, 7 Feb 2025 05:03:13 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:28PM +0100, Luca Ceresoli wrote:
> > Supporting hardware whose final part of the DRM pipeline can be physically
> > removed requires the ability to detach all bridges from a given point to
> > the end of the pipeline.
> > 
> > Introduce a variant of drm_encoder_cleanup() for this.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changes in v6: none
> > Changes in v5: none
> > Changes in v4: none
> > Changes in v3: none
> > 
> > Changed in v2:
> >  - fix a typo in a comment
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
> >  include/drm/drm_encoder.h     |  1 +
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  }
> >  EXPORT_SYMBOL(drm_encoder_cleanup);
> >  
> > +/**
> > + * drm_encoder_cleanup_from - remove a given bridge and all the following
> > + * @encoder: encoder whole list of bridges shall be pruned
> > + * @bridge: first bridge to remove
> > + *
> > + * Removes from an encoder all the bridges starting with a given bridge
> > + * and until the end of the chain.
> > + *
> > + * This should not be used in "normal" DRM pipelines. It is only useful for
> > + * devices whose final part of the DRM chain can be physically removed and
> > + * later reconnected (possibly with different hardware).
> > + */
> > +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
> > +{
> > +	struct drm_bridge *next;
> > +
> > +	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
> > +		drm_bridge_detach(bridge);
> > +}
> > +EXPORT_SYMBOL(drm_encoder_cleanup_from);  
> 
> Shouldn't drm_encoder_cleanup() also use this function?

Sure. I'll do it in v7.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
