Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DDAFE402
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786F210E76E;
	Wed,  9 Jul 2025 09:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EzxlljvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A610E76E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 09:22:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F20F343295;
 Wed,  9 Jul 2025 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752052977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyzA1qG8ea4Vn/tEOSB1hFQNopWYEwcryzJ/5h8sQ1g=;
 b=EzxlljvAv8uWoRdGFXnEvEBumb1iiwgdAiuGQwWzXyezwkPOaS9kv+oRpMont6qiiOTnH4
 WhhpJM4h2RE5zbIPkygC3enhAeUVqim+g3kdqC+VPndTXiyER7kcKWehAfE5uPir3UjM5e
 KydoUFFlRGWGSOi9XApotEp1rSQYjq/GGUrctxZb9RG0hZ4eVRp4oMec97wXD684WGpRvq
 VkA1qhKgq9+fK2h7Xc2KM9tKxsmFhQpJNbbMLdG/j+ID9Jwjpvvei2YdqSPxsY1j0bXMEg
 OfeLTprxMkZSAN0ttysvlpzQ6drbsZ4FZM+1GoixiwG9CxO2WeWvmiZn2kr3zg==
Date: Wed, 9 Jul 2025 11:22:31 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/sti: hda: convert to devm_drm_bridge_alloc() API
Message-ID: <20250709112231.05aa90bc@booty>
In-Reply-To: <20250709-foamy-neon-woodpecker-eea693@houat>
References: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
 <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-2-6285de8c3759@bootlin.com>
 <20250709-foamy-neon-woodpecker-eea693@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgrihhnrdhvohhlmhgrthesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehrghgrlhhlrghishhpohhusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtp
 hhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhm
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

On Wed, 9 Jul 2025 09:32:28 +0200
Maxime Ripard <mripard@kernel.org> wrote:

...

> > @@ -677,7 +683,6 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
> >  	struct drm_encoder *encoder;
> >  	struct sti_hda_connector *connector;
> >  	struct drm_connector *drm_connector;
> > -	struct drm_bridge *bridge;
> >  	int err;
> >  
> >  	/* Set the drm device handle */
> > @@ -693,13 +698,7 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
> >  
> >  	connector->hda = hda;
> >  
> > -	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
> > -	if (!bridge)
> > -		return -ENOMEM;
> > -
> > -	bridge->driver_private = hda;
> > -	bridge->funcs = &sti_hda_bridge_funcs;
> > -	drm_bridge_attach(encoder, bridge, NULL, 0);
> > +	drm_bridge_attach(encoder, &hda->bridge, NULL, 0);  
> 
> It's not entirely related, but the connector is also allocated right
> before and could be moved into the structure instead of storing a
> pointer.
> 
> Either way,
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Given this patch as-is is fixing a (potentially invisible) bug due to
using the old bridge allocation policy, and the connector allocation
change is an improvements but not a fix, I'll apply as is.

BTW, as a side effect, this series is removing two users of
bridge->driver_private :)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
