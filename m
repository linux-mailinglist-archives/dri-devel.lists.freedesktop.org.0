Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949DCA44861
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1549E10E697;
	Tue, 25 Feb 2025 17:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="b1bgoAoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0177D10E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:36:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D72644327;
 Tue, 25 Feb 2025 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740504984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pET0nVdSZvklJ9U7JwmtwIZwaF754aOJaksS3akpOXw=;
 b=b1bgoAoKCCoulVZ/+hkYrikGXdLVW+PYWXdFsYAHmUtmv+7fXhORJWESQsS+FW0nXnWcJ4
 m+FzZnZGqmBhnovsC0Dm32A5o5yQGtniD1TYq95llftKOeKwLwaaUJk3NxWhV5jubYErLx
 IHq+CS6PHy2FbUxz0IJDJdCj//oiFw1PDdjbohLjWNSpVWtArHcfh2AxGA6GOvgpQZhOqn
 1/2RbLRMuDk+Tn5XV97FMznO0VKfG6rsibEbgUKMDyGyPOcOqG5iLFV37pR29WVy8Mg5n7
 qu6D/POsD6AZG4dvNeK1bI87bgOwT3hIPBe2HiSYA1igxbCl2uxGX/06g1wxFA==
Date: Tue, 25 Feb 2025 18:36:21 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] drm/bridge: move bridges_show logic from
 drm_debugfs.c
Message-ID: <20250225183621.6b33684b@booty>
In-Reply-To: <878qpu56cm.fsf@intel.com>
References: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
 <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
 <878qpu56cm.fsf@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhro
 hhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

Hello Jani,

On Tue, 25 Feb 2025 18:36:41 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > In preparation to expose more info about bridges in debugfs, which will
> > require more insight into drm_bridge data structures, move the bridges_show
> > code to drm_bridge.c.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> I hate myself for doing this on a patch that's at v7... but here goes.

Please don't! :-) This patch is new in v7, and a different (and
definitely worse) approach was present in v6, but there was nothing
before.

> Perhaps consider moving the bridges debugfs creation and fops to
> drm_bridge.c instead of just adding
> drm_bridge_debugfs_show_encoder_bridges().
> 
> For example, add drm_bridge_debugfs_add(struct drm_encoder *encoder),
> which then contains the debugfs_create_file() call.

I think it should go in drm_encoder.c, not drm_bridge.c, right? Here we
are showing the bridges attached to an encoder, so the entry point is
each encoder.

On the other hand in patch 2 we should move the
drm_debugfs_global_add() code to drm_bridge.c, as it's showing bridges
ina encoder-independent way.

And finally drm_bridge should export the common
drm_bridge_debugfs_show_bridge() function to drm_encoder.c.

Do you think this is correct?

> Interestingly, this lets you drop a lot of #ifdef CONFIG_DEBUG_FS. The
> compiler optimizes the fops struct and the functions away when
> debugfs_create_file() becomes a stub for CONFIG_DEBUG_FS=n. It becomes
> all around cleaner.

This surely makes the idea interesting. Cleaner code is always welcome.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
