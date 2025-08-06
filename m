Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299DB1C38B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA210E0CD;
	Wed,  6 Aug 2025 09:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jLiteBcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167A510E0CD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 09:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE6634316E;
 Wed,  6 Aug 2025 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754473314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZJODZEXyM0Btp0NhLuGNYblMjw4tGSyhRayjb63qFI=;
 b=jLiteBcScsmmXTcEUSGgHxsf8j8XdYx5gBw8FkcF1+UFbSGMiT0WnvzGql8tP6gQEVFzs+
 IAW6FTdSIIl2OF9EuRKGfu4Sn0zs/yBWIZsQbryjQc6yPbsErpcGetBVlwEOXX2kElONoS
 +7Oddy4b1DyuQkM7/6jLfd3txWtrK2Gx/9W78JpNyryIfI/SFIFDqPWZraWyhberKpgkHD
 BMXxWxC3KnAxydFAfSEoPRilYuEexSnz3w4oU6y8gqqK4wH2hHqEpVcoOmKRK6t0tgJobT
 JvJl6LCxkVRHfT82g/Ujx2EiCfRbtfDHHDiKMx/BYkNPaZ7FtKrgij1fA418vg==
Date: Wed, 6 Aug 2025 11:41:50 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
Message-ID: <20250806114150.57e1ad97@booty>
In-Reply-To: <b5556cbe-76ed-4ddd-9b76-5896c2e1520c@nxp.com>
References: <20250806085424.518274-1-victor.liu@nxp.com>
 <20250806112641.7af982e3@booty>
 <b5556cbe-76ed-4ddd-9b76-5896c2e1520c@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrt
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

On Wed, 6 Aug 2025 17:38:17 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 08/06/2025, Luca Ceresoli wrote:
> > Hello Liu,
> > 
> > On Wed,  6 Aug 2025 16:54:24 +0800
> > Liu Ying <victor.liu@nxp.com> wrote:
> >   
> >> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
> >> NULL pointer, so use IS_ERR() to check the returned pointer.
> >>
> >> Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> index ed35e567d117..86cf898a09bb 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> @@ -1474,7 +1474,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
> >>  
> >>  	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
> >>  				   &analogix_dp_bridge_funcs);
> >> -	if (!dp)
> >> +	if (IS_ERR(dp))
> >>  		return ERR_PTR(-ENOMEM);  
> > 
> > Good catch, thanks!
> > 
> > You fix is correct but now I realized one additional fix is needed in
> > the following line:
> > 
> > -		return ERR_PTR(-ENOMEM);
> > +		return ERR_PTR(dp);  
> 
> You mean ERR_CAST(dp)?

Ah, indeed!

> > Can you send a v2 with that fixed?  
> 
> I find devm_drm_bridge_alloc() always returns ERR_PTR(-ENOMEM) in this
> driver context, so it seems fine to keep the existing ERR_PTR(-ENOMEM).
> If you prefer ERR_CAST(dp), I may send v2 to use ERR_CAST(dp).

The documentation says:

 * Returns:                  
 * Pointer to new bridge, or ERR_PTR on failure.

So let's follow that, which is a (relatively) immutable contract, and
not the implementation which might change over time.

This is also what all callers of devm_drm_bridge_alloc() do, unless I
missed something.

Thanks,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
