Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C446AAFB128
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887CD10E43A;
	Mon,  7 Jul 2025 10:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EVaz00KG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD34610E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:26:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31F65433D0;
 Mon,  7 Jul 2025 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751883978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CE14E8V2T2LtxsLXv6zS5h45KY7jrSk5T+yH92L/cQ=;
 b=EVaz00KGubhb7pqCQO5J1A+wDmnW9TZZjxYIjrzpWIDGrhILd0h4qrKvLKkZW9jJ8nTOR9
 +BJ47lgBzZDGkjtXzGfRbqQ/7o7UNZbGfs+Kn5aVjrYaFYNt/5DCwT+HXxqUI/lAL42rC5
 SAkPmA07QIoQahTO3pFSPtp4UEWItH9b0jhEmpz30Ck/Dx7+s4NBFKFYV/w4hi2rMczpRl
 IJHdW+OXvTT6J64sHd/r1K5+WTVgFt42e8XvqEmUuyYSKdo+eu28ez/ixSUoboqsOIrehf
 RT50TN4Jn4uZfyMI7QShcWwUIC62M5OYReezr858wF4Td1V/cGtVzJIUtI4xVw==
Date: Mon, 7 Jul 2025 12:25:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Damon Ding
 <damon.ding@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
Message-ID: <20250707122556.22c6f57f@booty>
In-Reply-To: <4e37e409-9e87-4e49-a296-9006fd552a5d@samsung.com>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat>
 <20250701160219.20dc7466@booty>
 <20250701-petite-mutant-starling-24bbe5@houat>
 <20250703175032.6f49f862@booty>
 <20250707-just-gray-sheep-1d8be4@houat>
 <4e37e409-9e87-4e49-a296-9006fd552a5d@samsung.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtp
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

Hi Marek, Maxime,

On Mon, 7 Jul 2025 12:12:51 +0200
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> On 07.07.2025 11:21, Maxime Ripard wrote:
> > On Thu, Jul 03, 2025 at 05:50:32PM +0200, Luca Ceresoli wrote:  
> >> On Tue, 1 Jul 2025 16:27:54 +0200
> >> Maxime Ripard <mripard@kernel.org> wrote:
> >>  
> >>> On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:  
> >>>> Hello Marek, Maxime,
> >>>>
> >>>> thanks Marek for spotting the issue and sending a patch!
> >>>>
> >>>> On Mon, 30 Jun 2025 18:44:24 +0200
> >>>> Maxime Ripard <mripard@kernel.org> wrote:
> >>>>      
> >>>>>> @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> >>>>>>   		return ret;
> >>>>>>   	}
> >>>>>>   
> >>>>>> -	ret = analogix_dp_create_bridge(drm_dev, dp);
> >>>>>> +	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> >>>>>>   	if (ret) {
> >>>>>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
> >>>>>>   		goto err_unregister_aux;  
> >>>>> It looks like you don't set bridge->driver_private anymore. Is it on purpose?  
> >>>> This looks correct to me. In current code, driver_private is used to
> >>>> hold a pointer to the driver private struct (struct
> >>>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
> >>>> enough, no pointer is needed. With the patch applied, driver_private
> >>>> becomes unused.  
> >>> Then we should remove it from the structure if it's unused.  
> >> Makes sense now that struct drm_bridge is meant to be always embedded
> >> in a driver-private struct. But several drivers are still using it, so
> >> those would need to be updated beforehand:
> >>
> >> $ git grep  -l driver_private -- drivers/gpu/drm/ | wc -l
> >> 23
> >> $  
> > Ah, you're right, sorry for the noise.
> >  
> >> So I think this patch should be taken as it fixes a regression. Do you
> >> agree on this?  
> > As far as I know, that commit only exists in drm-misc-next. Also, it
> > should have a Fixes tag.  
> 
> I wasn't sure which commit should be listed as Fixes tag in this case. 
> The mentioned 9c399719cfb9 ("drm: convert many bridge drivers from 
> devm_kzalloc() to devm_drm_bridge_alloc() API")?

Despite being somewhat orthogonal, I think it should be commit
a7748dd127ea ("drm/bridge: get/put the bridge reference in
drm_bridge_add/remove()") just because it is the very first commit in
the drm-misc-next history introducing a get/put pair, and thus
triggering the refcount warning.

I'm applying with that added.

Thanks both for the discussion.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
