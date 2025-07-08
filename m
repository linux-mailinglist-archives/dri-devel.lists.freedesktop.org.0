Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E21BAFCD46
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387E010E19D;
	Tue,  8 Jul 2025 14:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J9fSSb3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F81910E19D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 14:19:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC76644453;
 Tue,  8 Jul 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751984380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQx2MpPN2IuQhmgbUCoyo6ebaQZj/+m92+qxRxm2694=;
 b=J9fSSb3QQDqpDLGXw7eGlcku0grzq366UVw4DlS7xQUhmdOsnk5WaNm/bowiSSjj0l9AS8
 dni9cDCWTTdpUV4YUQ4GIsh+qzQOedBdzV5lE9z9uTL8rkcvn9qIZcusze9fzW03pXZjlO
 ipMestSLs/MYANhxNSHRYkF6Iv9bXp+hBp9Du3rSVz/vamOTWf+41GIxriBXa3JPDZ0QuN
 HeG8NGu/PeAfXNKckfhTi0NRyM2AUaqbOWzm/HbmWSs/IJlcbZqGD6ExMpLcp+AtBHGBzZ
 /s+UNfbIhcv9q2wOvBx5eRirnIJpaupMTbwTD1muknzJa8NyYF2exPbh/DGt9w==
Date: Tue, 8 Jul 2025 16:19:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Damon Ding
 <damon.ding@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
Message-ID: <20250708161915.421d241c@booty>
In-Reply-To: <20250707125954.5e0bbaa8@booty>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat>
 <20250701160219.20dc7466@booty>
 <20250701-petite-mutant-starling-24bbe5@houat>
 <20250703175032.6f49f862@booty>
 <ce9c6aa3-5372-468f-a4bf-5a261259e459@samsung.com>
 <20250707125954.5e0bbaa8@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhteduuefgheehleeihfejjeduvdeltddutddtveeltdfhheeguefgteehkefgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtp
 hhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
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

Hello Maxime, all,

On Mon, 7 Jul 2025 12:59:54 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> On Mon, 7 Jul 2025 11:07:26 +0200
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>=20
> > On 03.07.2025 17:50, Luca Ceresoli wrote: =20
> > > On Tue, 1 Jul 2025 16:27:54 +0200
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >   =20
> > >> On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:   =20
> > >>> Hello Marek, Maxime,
> > >>>
> > >>> thanks Marek for spotting the issue and sending a patch!
> > >>>
> > >>> On Mon, 30 Jun 2025 18:44:24 +0200
> > >>> Maxime Ripard <mripard@kernel.org> wrote:
> > >>>       =20
> > >>>>> @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_dev=
ice *dp, struct drm_device *drm_dev)
> > >>>>>   		return ret;
> > >>>>>   	}
> > >>>>>  =20
> > >>>>> -	ret =3D analogix_dp_create_bridge(drm_dev, dp);
> > >>>>> +	ret =3D drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > >>>>>   	if (ret) {
> > >>>>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > >>>>>   		goto err_unregister_aux;   =20
> > >>>> It looks like you don't set bridge->driver_private anymore. Is it =
on purpose?   =20
> > >>> This looks correct to me. In current code, driver_private is used to
> > >>> hold a pointer to the driver private struct (struct
> > >>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is=
 now
> > >>> enough, no pointer is needed. With the patch applied, driver_private
> > >>> becomes unused.   =20
> > >> Then we should remove it from the structure if it's unused.   =20
> > > Makes sense now that struct drm_bridge is meant to be always embedded
> > > in a driver-private struct. But several drivers are still using it, so
> > > those would need to be updated beforehand:
> > >
> > > $ git grep  -l driver_private -- drivers/gpu/drm/ | wc -l
> > > 23
> > > $
> > >
> > > So I think this patch should be taken as it fixes a regression. Do you
> > > agree on this?   =20
> >=20
> > Yes, please apply it as a fix :)
> >=20
> >=20
> > BTW, there are 2 more bridge drivers that need a fix similar to the=20
> > $subject patch:
> >=20
> > $ git grep "bridge =3D devm_kzalloc" drivers/gpu
> > drivers/gpu/drm/sti/sti_hda.c:=C2=A0 bridge =3D devm_kzalloc(dev,=20
> > sizeof(*bridge), GFP_KERNEL);
> > drivers/gpu/drm/sti/sti_hdmi.c: bridge =3D devm_kzalloc(dev,=20
> > sizeof(*bridge), GFP_KERNEL); =20
>=20
> Ouch. My grep logic was probably too clever and missed these obvious
> ones. I'm taking care of converting these ones later this week as time
> permits, unless patches are sent before.

I think I missed those two because I searched for all calls to
drm_bridge_add(), and converted matching drivers, but these two do now
call drm_bridge_add() at all.

I understand this probably works just fine, for non-DT hardware at
least. However, doesn't this look like wrong, from a DRM bridge API
point of view?

Right now I'm preparing patches to convert to devm_drm_bridge_alloc(),
but what about the following two additions:

 * add calls to drm_bridge_add/remove() in those drivers
 * add a WARN in drm_bridge_attach() if the bridge was not added

?

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
