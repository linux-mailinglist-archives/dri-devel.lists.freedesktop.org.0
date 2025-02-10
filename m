Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E81A2F4D8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 18:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0BB10E01F;
	Mon, 10 Feb 2025 17:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Tlq770IU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D63610E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:12:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E739C204A1;
 Mon, 10 Feb 2025 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739207578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vaaae8hQdMGufW3kcWL9HQNxyaHZJe5tDaHlQP6TfTU=;
 b=Tlq770IUZi4waDyXJuAoriXPcY7QhbuWE3xjbPY80elH9wemxJPpuiUWhDIseMMrVpch6T
 /2wTid2FdGg5/5WlsjIRkQlnKMavZHfIBjB6maPDp20dx53EfKnCQTYgzMe1XeCXM1r11W
 nUT3wf3EimcK5HqoszZRpS6Uf6V5mBmY0KpnkoiyTt/8zKCNHOHqI9Q1xc8vnoTAcFauT+
 1OwFaFp+wNHYLlG1WqAxwBo1y6H7BN94vB/jBWDjvHTltnX9B5i2BKmsr685RhgV+c0chb
 XezviekNgqBC9kG6ttrvlpVRXpaWFuHwHFqGftCNf9ZywKfVpByQlydu7Nvk8w==
Date: Mon, 10 Feb 2025 18:12:52 +0100
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
Message-ID: <20250210181252.5ee028d4@booty>
In-Reply-To: <20250207-ingenious-daffodil-dugong-51be57@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepj
 hgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
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

On Fri, 7 Feb 2025 12:47:51 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -31,6 +31,7 @@
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_mode_object.h>
> >  #include <drm/drm_modes.h>
> > +#include <drm/drm_print.h>
> >  
> >  struct device_node;
> >  
> > @@ -863,6 +864,22 @@ struct drm_bridge {
> >  	const struct drm_bridge_timings *timings;
> >  	/** @funcs: control functions */
> >  	const struct drm_bridge_funcs *funcs;
> > +
> > +	/**
> > +	 * @container_offset: Offset of this struct within the container
> > +	 * struct embedding it. Used for refcounted bridges to free the
> > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > +	 * legacy bridges.
> > +	 */
> > +	size_t container_offset;  
> 
> This shouldn't be in there. You can create an intermediate structure and
> store both pointers for the action to consume.

You mean to store container_offset + refcount + is_refcounted?

It can be named drm_bridge_object maybe, as it is somewhat resembling
struct drm_mode_object?

> > +	/**
> > +	 * @refcount: reference count for bridges with dynamic lifetime
> > +	 * (see drm_bridge_init)
> > +	 */
> > +	struct kref refcount;
> > +	/** @is_refcounted: this bridge has dynamic lifetime management */
> > +	bool is_refcounted;
> > +  
> 
> I'm not sure we want to treat both paths separately too. It'll require
> to update most of/all the drivers, but it's not too hard with
> coccinelle:
> 
> virtual patch
> 
> @@
> identifier f;
> identifier b, c, d;
> expression bf;
> type T;
> @@
> 
>  f(...)
>  {
> 	...
> -	T *c;
> +	T *c;
> 	...
> -	c = devm_kzalloc(d, ...);
> +	c = devm_drm_bridge_alloc(d, T, b, bf);
> 	...
> -	c->b.funcs = bf;
> 	...
> 	drm_bridge_add(&c->b);
> 	...
>  }
> 
> We need to add a bit more variations (like kzalloc vs devm_kzalloc,
> drm_bridge_add vs devm_drm_bridge_add, etc.), but it should be a good
> first approximation

Sure, this can be useful, thanks.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
