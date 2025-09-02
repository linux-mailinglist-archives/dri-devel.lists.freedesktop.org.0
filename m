Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C44B3FEC5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCB10E68B;
	Tue,  2 Sep 2025 11:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mSGou2m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4B810E68B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:57:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1F4E1F748;
 Tue,  2 Sep 2025 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1756814235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfvmzc8qZmjMW4mhkIuHV/6a4hUMeSIVMoLiNUvK0Jk=;
 b=mSGou2m35QWKjYxVcVxQArlWxxMr6rCzPkBdM5epuolTdmwUn/CGj7/YzLOTl95SXL+rdW
 Qmd3zGWZxrgIIbKW+mP6eKYSh2nkdGGx6786bF2vat3cXwuFxalz19AWFtfU8BwLF7FqIb
 HwEk5o3aJ50JovfkLIaBcFPq6JbztM0XfPdvlM/XHM36dfzFSkWl4W5peWJIk4uv7J7mzE
 B4HnnnfW76VCNH6Op4IzHvCpnvsjzC1zrXXa2zqwc7EAjwhGIDfULGU/C/B2OzZzo4Qfiw
 0KqG+//FWeBZMHA88sTqW0lzVIhMgY0wWTGwFuhxHIhocwckKSxb5PZl2e22Cg==
Date: Tue, 2 Sep 2025 13:57:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <20250902135709.19e1ef54@booty>
In-Reply-To: <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
 <20250814183609.3788a6df@booty>
 <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrm
 hhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

Hello DRM maintainers,

On Wed, 20 Aug 2025 16:43:56 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
> > On Wed, 6 Aug 2025 00:55:02 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >   
> > > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:  
> > > > Add an equivalent of list_first_entry_or_null() to obtain the last element
> > > > of a list.    
> > > 
> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> > 
> > Thanks Andy!
> > 
> > However I'm not sure when and where this should be applied.
> > 
> > Except for this one patch, all patches in the series are for
> > drm-misc-next. Also, patch 1 is currently not needed by any other
> > series AFAIK.
> > 
> > Based on the above, is it correct to assume that the whole series can
> > be applied on drm-misc-next? (when other patches will have a
> > R-by/Ack-by of course)
> > 
> > Also, is Andy's A-by enough to apply this patch?  
> 
> The list.h is common for many, I think going via DRM with my Ack is enough
> based on the Git history of my changes in this file. But if you want more
> reliable source, get an Ack from Andrew Morton.

While applying this patch with dim on drm-misc-next, dim push-branch
failed because:

  dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Mandatory Maintainer Acked-by missing., aborting

Looking at the dim code, it is looking for a Reviewed- or Acked-by from
people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
--norolestats`. but that command returns an empty string, so it will
never allow me to push.

How can I get that commit pushed to drm-misc-next?

I think `dim push-branch -f` would work: am I supposed to use it?

(not sure my committer rights allow that)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
