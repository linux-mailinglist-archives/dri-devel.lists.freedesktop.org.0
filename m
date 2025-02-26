Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01BA45D33
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA34C10E1E9;
	Wed, 26 Feb 2025 11:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Td3icDVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7730610E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:32:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94DDA43427;
 Wed, 26 Feb 2025 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740569532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oH5TLqPmHN4KHoh4+pmfs4/A09QxMx7XTAwVuGzjhTM=;
 b=Td3icDVMjfODTdz85wp+A9sqtpo5jnYcHFQiTsczw97eA0Q8BUpWznYBtWeKUOeZYI7u5h
 w26SzXlsnJZGs+H7yLiPOWaW1eSFh0mM8HXQDroR2XzUvIkwajVVEa3pWH6cPEXFpZvAx0
 jaeXR6YmzNVBkf7T95z2pRdlRRFnLKJZ8YkepVulLaKLtn1jb4BStR4ADeAInFJnrSSfyE
 GreRQUtd5snefUyi32TrLlJLWv9r2Yt7xBNJNUFGqMtnHO/Awy6zPovYDyvoa3CZCDU8dC
 MCmF4kUJi0m5fc7Glz5TYL4qtsvRqpqfti2/r///uSXpKyCADmpUnZc+Ee9d1g==
Date: Wed, 26 Feb 2025 12:32:08 +0100
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
Message-ID: <20250226123208.272e7766@booty>
In-Reply-To: <871pvl6g1t.fsf@intel.com>
References: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
 <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
 <878qpu56cm.fsf@intel.com> <20250225183621.6b33684b@booty>
 <871pvl6g1t.fsf@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhro
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

On Tue, 25 Feb 2025 20:21:50 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > Hello Jani,
> >
> > On Tue, 25 Feb 2025 18:36:41 +0200
> > Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >  
> >> On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:  
> >> > In preparation to expose more info about bridges in debugfs, which will
> >> > require more insight into drm_bridge data structures, move the bridges_show
> >> > code to drm_bridge.c.
> >> >
> >> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> >> 
> >> I hate myself for doing this on a patch that's at v7... but here goes.  
> >
> > Please don't! :-) This patch is new in v7, and a different (and
> > definitely worse) approach was present in v6, but there was nothing
> > before.
> >  
> >> Perhaps consider moving the bridges debugfs creation and fops to
> >> drm_bridge.c instead of just adding
> >> drm_bridge_debugfs_show_encoder_bridges().
> >> 
> >> For example, add drm_bridge_debugfs_add(struct drm_encoder *encoder),
> >> which then contains the debugfs_create_file() call.  
> >
> > I think it should go in drm_encoder.c, not drm_bridge.c, right? Here we
> > are showing the bridges attached to an encoder, so the entry point is
> > each encoder.  
> 
> I'm still thinking drm_bridge.c, because it's about bridges and their
> details. The encoder shouldn't care about bridge implementation details.

Ah, I think I now get what you mean.

Current code is:

drm_encoder_register_all()                             [drm_encoder.c]
 -> drm_debugfs_encoder_add                            [drm_debugfs.c]
   -> debugfs_create_file("bridges"...  &bridges_fops) [drm_debugfs.c]
                                    [bridges_fops is in drm_debugfs.c]

Moving the last 2 lines to drm_bridge.c and into a new function we'd
have:

drm_encoder_register_all()                             [drm_encoder.c]
 -> drm_debugfs_encoder_add [*]                        [drm_debugfs.c]
  -> drm_bridge_debugfs_add_encoder_bridges_file (NEW) [drm_bridge.c]
   -> debugfs_create_file("bridges"...  &bridges_fops) [drm_bridge.c]
                                    [bridges_fops is in drm_bridge.c]

Potentially [*] could be moved to drm_encoder.c, but that is not bridge
related and can be done as a future step.

Is this what you had in mind?

> > On the other hand in patch 2 we should move the
> > drm_debugfs_global_add() code to drm_bridge.c, as it's showing bridges
> > ina encoder-independent way.  
> 
> Agreed on that.
> 
> > And finally drm_bridge should export the common
> > drm_bridge_debugfs_show_bridge() function to drm_encoder.c.  
> 
> Disagree. That will still require the EXPORT and #ifdefs around
> CONFIG_DEBUG_FS.

With the above-sketched idea I agree we wouldn't need to export
drm_bridge_debugfs_show_bridge().

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
