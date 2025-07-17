Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A8B08E9A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 15:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1315A10E049;
	Thu, 17 Jul 2025 13:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G6eeNa8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129E610E049
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 13:57:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E627B205B2;
 Thu, 17 Jul 2025 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752760622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2275GPVcwLTpmJUdVpObNcbF/MPydXKP4lwgHDAh/50=;
 b=G6eeNa8bfZ3sH7PALjjL6f4NVxtt0RGEsjafdIYFZi806KLKVXWwf5Vj3ic4A03Zqyi3+g
 aDNRPKIGBIchAJunIXi9PF4SBoraBQNM5CiVS/1weri8xQtdTpgDadWdao6njuBfKZWGUb
 fHuPLemZTEHiZ84u8tpNoFmCeIe1XgZS2C3AFUpEIo5f8Sj8+NsBRj1rIHIyQmSRosE7Jm
 pDcWjmlCA4xerpb/7YN+a8Wgxw+NDhhKwRWIKinB60lZAlnuFlMPyPjZ1lfhNi4zoQqPQj
 5aUKpHqZzn9DzcPfkonCWulJbCY3jjal5rwi/uJXuxuaElG626oUYxTEEdmx6A==
Date: Thu, 17 Jul 2025 15:56:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>, "Jyri Sarha" <jyri.sarha@iki.fi>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/tidss: encoder: convert to devm_drm_bridge_alloc()
Message-ID: <20250717155659.000eb000@booty>
In-Reply-To: <DBE5Z1SRJ086.NA0KUAWX1MS3@kernel.org>
References: <20250716134107.4084945-1-mwalle@kernel.org>
 <20250717094153.35f854b7@booty>
 <DBE5Z1SRJ086.NA0KUAWX1MS3@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhihrhhirdhsrghrhhgrsehikhhirdhfihdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgur
 dgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
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

Hello Jyri, Tomi, Michael,

On Thu, 17 Jul 2025 09:49:44 +0200
"Michael Walle" <mwalle@kernel.org> wrote:

> Hi,
> 
> thanks for taking a look!
> 
> > However allocating an encoder using a bridge alloc function (while we
> > used to call an encoder allocation function) looks counter-intuitive.
> >
> > We had discussed on IRC a different idea, adding a wrapper structure
> > around the bridge. Quoting your proposal:
> >
> >   struct tidss_encoder_bridge {
> >     struct drm_bridge bridge;
> >     struct tidss_encoder *encoder
> >   }
> >
> > and then in the bridge funcs go from drm_bridge to tidss_encoder_brigde
> > and use the pointer to get the original private struct.  
> 
> I was doing that until I've realized that meson/meson_encoder_* is
> doing it the way this patch does it.

Which was done by, er, myself. O:-)

To my excuse, meson was using *_encoder_alloc() but rather
devm_kzalloc() + drm_simple_encoder_init(), and the change was
semi-automated via a coccinelle script, so I didn't fully realize that.

> > That would be cleaner and more intuitive, but use a bit more memory and
> > have an additional pointer deref, thus I think we can live with the
> > patch you just sent, at least for now.  
> 
> I'm fine with changing it to the wrapper struct. It's your/the
> maintainers call :)

I think the driver maintainers opinion is more relevant, but in lack of
one I think we can take the patch as is, given it's already written.

Jyri, Tomi?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
