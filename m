Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6FEB2BE4E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF2710E586;
	Tue, 19 Aug 2025 10:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eHDzkgcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEB110E586
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:01:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74D1D43192;
 Tue, 19 Aug 2025 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1755597702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFeOuo3C+LD3wY1Ey4Q0b2fLMCcGgtn4xZLXy86gnqE=;
 b=eHDzkgccaumhYy47ovtESxgB1pkGVcF4qMMtRi0hQepRITouNAM6obLy/DYytNx0RdBQuL
 w4DXMHxdszcKaxSSZ23XB9TvSBu9qwkuqegnVz/15+0+xVDPBQ9fKfVPR4c6udVwlHwZO9
 0Du+GyB83MUoMvJ8y9rep3/uPNqcZwRMsn/5P9WDqZSuJHc28JdM98n8XOTUG7xYGTvsCh
 V6gVfPmVwhIT2WPH8OKRQL/jR82iRlJl4xfigQlb7m16ann+TuvfUYyNBWY1ohiST1Qb5f
 +yloICecyJBYi8kBpeQbrm9lrE24R42/3sp7y9g1mwSTgKVBTRWd0h+r8erOng==
Date: Tue, 19 Aug 2025 12:01:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
Message-ID: <20250819120138.6f656ae6@booty>
In-Reply-To: <20250808152001.122f2da6@booty>
References: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
 <20250728-diligent-brainy-hyena-109dde@houat>
 <20250728194430.082f9952@booty>
 <20250731-tactful-jellyfish-of-perspective-cb0324@houat>
 <20250808152001.122f2da6@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheehvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhul
 hgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
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

On Fri, 8 Aug 2025 15:20:01 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > > Some drawbacks of current code are because at every DSI attach/detach,
> > > the samsung-dsim does drm_bridge_add/remove() itself:
> > > 
> > >  * To me this looks like a bad design, the samsung-dsim is always
> > >    present and not hotpluggable, so why should it add/remove itself?
> > > 
> > >  * I have a debugfs patch to show in $BUDUGFS/dri/bridges_removed all
> > >    the removes bridges: bridges after drm_bridge_remove() but not yet
> > >    freed because refcount still > 0. But it causes crashes due to the
> > >    samsung-dsim going backwards from "removed" to "added", and further
> > >    hacks are needed to avoid this crash.

I went back to my old debugfs series, updated it and sent a new
iteration:
https://lore.kernel.org/r/20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com

There you can see the lines added to drm_bridge_add() for handing
"un-removed" bridges.

It's a few lines of code only, but I don't feel very happy with them. I
look forward to knowing your opinion about those few lines.

So there were 3 issues I mentioned as reasons for this patch to
samsung-dsim (only purely technical ones, not counting the "looks like
a bad design" reason):

 1. debugfs needs special care for un-removed bridges: see this e-mail
 2. interferes with .gone flag: ruled out, N/A
 3. needs a horrible hack in hotplug-bridge

No news about issue 3. I'm going to experiment with removing the
hotplug-bridge but that will take time (as a prerequisite I most likely
need to remove the "always connected" DSI connector first). Stay
tuned...

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
