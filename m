Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DBEA462B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5210E822;
	Wed, 26 Feb 2025 14:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YVmqFcjk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796A10E822
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:28:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85F5844279;
 Wed, 26 Feb 2025 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740580100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srlQpvYJmp4WGJbQ2gOhstlghcIxLLDbBOH3Hms1G1E=;
 b=YVmqFcjk0U4E+e7zKuj6Rpt4rxnNlmQ/mknWE7cS2QlmyRYYG1pX0skomC3EzGSFK0+D0F
 LofQCcAcczK0rToLqkgTL6IcBlrchx6Td+Em78I4vSLNbZiWK81HGy3XvZ4r9UK2BY2m+s
 t4y9WnK03LesL2wCljRBBavDBr7cQcUGTVz+SqalkLwcf72W6+PuUyj9YfmeNtygDQ7AL2
 mQM1gdT5t/e1zEh2tTHsacPJtCQUZfENXAk/U235HEbS8uFItYZ5vSwAM2o94jAhPbDzwS
 EC5ezudhpnVxZ2B1Yw5qFD9iXvELunSAI9SqyWyf+7aI5kLws9yeteiVn2k+6w==
Date: Wed, 26 Feb 2025 15:28:13 +0100
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
Message-ID: <20250226152813.4a1ad218@booty>
In-Reply-To: <20250211-merciful-nyala-of-justice-a4fabb@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <20250210181252.5ee028d4@booty>
 <20250211-merciful-nyala-of-justice-a4fabb@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepj
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

Hi Maxime,

On Tue, 11 Feb 2025 14:10:50 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Feb 10, 2025 at 06:12:52PM +0100, Luca Ceresoli wrote:
> > Hello Maxime,
> > 
> > On Fri, 7 Feb 2025 12:47:51 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
> > > > --- a/include/drm/drm_bridge.h
> > > > +++ b/include/drm/drm_bridge.h
> > > > @@ -31,6 +31,7 @@
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_mode_object.h>
> > > >  #include <drm/drm_modes.h>
> > > > +#include <drm/drm_print.h>
> > > >  
> > > >  struct device_node;
> > > >  
> > > > @@ -863,6 +864,22 @@ struct drm_bridge {
> > > >  	const struct drm_bridge_timings *timings;
> > > >  	/** @funcs: control functions */
> > > >  	const struct drm_bridge_funcs *funcs;
> > > > +
> > > > +	/**
> > > > +	 * @container_offset: Offset of this struct within the container
> > > > +	 * struct embedding it. Used for refcounted bridges to free the
> > > > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > > > +	 * legacy bridges.
> > > > +	 */
> > > > +	size_t container_offset;    
> > > 
> > > This shouldn't be in there. You can create an intermediate structure and
> > > store both pointers for the action to consume.  
> > 
> > You mean to store container_offset + refcount + is_refcounted?  
> 
> No, I meant for the private structure pointer and the drm_bridge
> pointer. refcount should be in drm_bridge, and I think is_refcounted
> should be dropped.

Storing the container pointer instead of the offset is a good idea, it
will allow to get rid of is_refcounted: drm_bridge_is_refcounted() can
just return "container != NULL" instead of "bridge->is_refcounted". So
far so good.

I'm not sure about the intermediate struct you have in mind though.

Do you mean:

struct drm_bridge_pointers {
    struct drm_bridge *bridge;
    void              *container;
}

?

If that's what you mean, should it be embedded in drm_struct or
allocated separately?

If you mean to embed that struct in drm_bridge, then I the drm_bridge
pointer inside the intermediate struct would be useless.

If instead you mean to embed it in drm_struct: I'm not sure I see much
benefit except maybe not exposing the container pointer to drm_bridge
users, but I see a drawbacks: at the last put we need to find the
container pointer to free from a struct kref pointer, which can work
only if the container pointer is in the same struct as struct kref.

Additionally, the consuming action for that struct just needs a
drm_bridge pointer:

     static void drm_bridge_put_void(void *data)
     {
	struct drm_bridge *bridge = (struct drm_bridge *)data;

	drm_bridge_put(bridge);
     }

Can you clarify this? I'd love to have this cleanup in the next
iteration.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
