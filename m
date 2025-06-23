Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384BAE4600
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E041610E1FF;
	Mon, 23 Jun 2025 14:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oQkLm/T6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F1910E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:09:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 531EE443B1;
 Mon, 23 Jun 2025 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750687754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tTqzFXucfoLXojG6cheHnIsoX2Ng1HXB6wnPXyTTz+E=;
 b=oQkLm/T6QHfWzh5bGMAbnsCa34uI46vKHRhUpHxX5NE0IaJr2zYoPsHc7EzUtZVsSFVfGS
 I8AltFv5PRy/XTgp7ujqzUS6QWK+GQpLAbxpIgm4eEguFNa2zGavOb5z6UXDIGNJ0p+Qqu
 lZSnNWMzP9Rpbk9uYt7Oe++HnqFKnKj28Bu0pkl50yyVyU142lKiFpbpIAJZoa0hq07xOL
 sR3SBQfRmZnFrG51fUxbR3vDd1urvXDs7MR8Pp5PY2fS1YMZ/ReSwfMsg2Vaa9pUufqhkY
 WSZrgEam039YLW+BxLoOTU2Pwbe78g/vCpmGGMx28FIwrnpedTjp/WD4tMVEDw==
Date: Mon, 23 Jun 2025 16:09:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Marek Vasut
 <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 3/5] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250623160909.7d11cfee@booty>
In-Reply-To: <6ed34611-d2fe-4c9c-8b00-0939ac407e07@nxp.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-3-0321845fcafb@bootlin.com>
 <6ed34611-d2fe-4c9c-8b00-0939ac407e07@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
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

On Mon, 23 Jun 2025 11:06:37 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index dbd42cc1da87f82ef9cd4ccc70cdecbe56035174..21311cf5efee7d26c80316bffe80dd2bfed02238 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  	struct drm_connector *connector;
> >  	struct drm_encoder *encoder;
> >  	struct drm_bridge_state *bridge_state;
> > -	struct drm_bridge *bridge;
> >  	u32 bus_format, bus_flags;
> >  	bool format_set = false, flags_set = false;
> >  	int ret, i;
> > @@ -448,6 +447,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  
> >  	/* Try to find consistent bus format and flags across first bridges. */
> >  	for_each_new_connector_in_state(state, connector, connector_state, i) {
> > +		struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
> > +
> >  		if (!connector_state->crtc)
> >  			continue;  
> 
> To avoid the unnecessary cleanup for !connector_state->crtc, I would write:
> 
> -8<-
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>         struct drm_connector *connector;
>         struct drm_encoder *encoder;
>         struct drm_bridge_state *bridge_state;
> -       struct drm_bridge *bridge;
>         u32 bus_format, bus_flags;
>         bool format_set = false, flags_set = false;
>         int ret, i;
> @@ -453,7 +452,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>  
>                 encoder = connector_state->best_encoder;
>  
> -               bridge = drm_bridge_chain_get_first_bridge(encoder);
> +               struct drm_bridge *bridge __free(drm_bridge_put) =
> +                               drm_bridge_chain_get_first_bridge(encoder);

Good idea, I probably didn't think about it because I was grown up in a
world where all declarations must before the code. :-)

Changing this in v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
