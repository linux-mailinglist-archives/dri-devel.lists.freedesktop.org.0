Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CBB1C3DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D280E10E3D5;
	Wed,  6 Aug 2025 09:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MNy6BW9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D948410E3D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 09:56:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AAB51FD33;
 Wed,  6 Aug 2025 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754474199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URKB1mHsqhAynryiTP+/5gH3zHuLJzJnR0Qk30y2VY0=;
 b=MNy6BW9cqY/rzWePMhe4LstzwcW0lFTrwQ8Pe+ponNzzOS0JNFX3LuvQSXN9sdrwBqylEW
 u1VlzkGQjtw2lwAURUBO6Bg4qDzMUnIqwiZakTC+ojDEviDwezrmDBr5PXeazeDfyCvhes
 pm5ebXjwEnfwZguJazaJaA/AHyir6I2CFDplDGmyXIyqV9K+uLRLFK+BaPTfAKaRsREcbA
 RZRYcJjRlVWTJBJv3HtIwkgAVbARiW/HkHeENdcwNE3S7JsYIW4qF2joDB5WYuhg3IYRRK
 84gKJW072y+pjRJrw1U4k8kImNLfsywhjTjA1IaPX7XNapDAfa51JeIF+ioJXQ==
Date: Wed, 6 Aug 2025 11:56:35 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
Message-ID: <20250806115635.58fb5ae2@booty>
In-Reply-To: <20250806095224.527938-1-victor.liu@nxp.com>
References: <20250806095224.527938-1-victor.liu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
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

Hello Liu,

On Wed,  6 Aug 2025 17:52:24 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
> NULL pointer, so use IS_ERR() to check the returned pointer.
> While at it, on failure, return ERR_CAST(dp) instead of
> ERR_PTR(-ENOMEM) in order not to depend on devm_drm_bridge_alloc()
> error code implementation.
> 
> Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> - Return ERR_CAST(dp) on failure.  (Luca)
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index ed35e567d117..efe534977d12 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1474,8 +1474,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  
>  	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
>  				   &analogix_dp_bridge_funcs);
> -	if (!dp)
> -		return ERR_PTR(-ENOMEM);
> +	if (IS_ERR(dp))
> +		return ERR_CAST(dp);

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
