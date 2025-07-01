Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32AAEFC11
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8D610E0A1;
	Tue,  1 Jul 2025 14:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="choOrvm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C377410E0A1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:23:34 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 250E5581E0A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:02:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59F964421D;
 Tue,  1 Jul 2025 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751378553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wNiSpbzQknJpKVfuVw5tskrSeR1nY2LZ1EcYx9joOU=;
 b=choOrvm4wSWYRsKjBg19VNuSjpFFlK/jUrYsdOuCwcJ7+20T59YYQdyAdR3yN6RxxjTYpO
 +dh1vXk78wl2LP+efCf/aHl7bhaRhukymtns7nsDvf4kreWZznvb+bKXlccpJJRWBhdN6Y
 X07PAHZrlU6orM6IdwfMJQm9wW1Trxkt56pcseHJ9IZ7ZKdMe3+M4FsLlib15zrLCuT6Qm
 9kX89aINRxyY69v5QlkOilyuZm/gA/gqM/VDMxoPneEo8JLeK2rQWbXQkwD/22UPjYNOtp
 QXj1fcXA1tpMqHTcncnS6OfqPxVwG7FFK1lgVE9sIbo+ouZk/GLfssqRSZS2pg==
Date: Tue, 1 Jul 2025 16:02:19 +0200
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
Message-ID: <20250701160219.20dc7466@booty>
In-Reply-To: <20250630-famous-dark-boar-89bed7@houat>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphephedurddujeelrddutdefrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeehuddrudejledruddtfedrheehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtt
 hhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
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

Hello Marek, Maxime,

thanks Marek for spotting the issue and sending a patch!

On Mon, 30 Jun 2025 18:44:24 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> > @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> >  		return ret;
> >  	}
> >  
> > -	ret = analogix_dp_create_bridge(drm_dev, dp);
> > +	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> >  	if (ret) {
> >  		DRM_ERROR("failed to create bridge (%d)\n", ret);
> >  		goto err_unregister_aux;  
> 
> It looks like you don't set bridge->driver_private anymore. Is it on purpose?

This looks correct to me. In current code, driver_private is used to
hold a pointer to the driver private struct (struct
analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
enough, no pointer is needed. With the patch applied, driver_private
becomes unused.

Thus I think the patch is correct:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
