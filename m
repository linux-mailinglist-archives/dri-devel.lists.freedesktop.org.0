Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CB11BE8E8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 22:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952A16EB22;
	Wed, 29 Apr 2020 20:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8F6EB22
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 20:46:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 333BE20025;
 Wed, 29 Apr 2020 22:46:15 +0200 (CEST)
Date: Wed, 29 Apr 2020 22:46:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/bridge: fix stack usage warning on old gcc
Message-ID: <20200429204613.GA24103@ravnborg.org>
References: <20200428215408.4111675-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428215408.4111675-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=mDV3o1hIAAAA:8 a=e5mUnYsNAAAA:8
 a=ZNoC2qXWVDHt2F1EEv0A:9 a=CjuIK1q_8ugA:10 a=_FVE-zBwftR9WsbkzFJk:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Tue, Apr 28, 2020 at 11:53:54PM +0200, Arnd Bergmann wrote:
> Some older versions of gcc badly optimize code that passes
> an inline function argument into another function by reference,
> causing huge stack usage:
> 
> drivers/gpu/drm/bridge/tc358768.c: In function 'tc358768_bridge_pre_enable':
> drivers/gpu/drm/bridge/tc358768.c:840:1: error: the frame size of 2256 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> 
> Use a temporary variable as a workaround and add a comment pointing
> to the gcc bug.
> 
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, pushed to drm-misc-next with Tomi's r-b.

	Sam

> ---
>  drivers/gpu/drm/bridge/tc358768.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 1b39e8d37834..6650fe4cfc20 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -178,6 +178,8 @@ static int tc358768_clear_error(struct tc358768_priv *priv)
>  
>  static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
>  {
> +	/* work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715 */
> +	int tmpval = val;
>  	size_t count = 2;
>  
>  	if (priv->error)
> @@ -187,7 +189,7 @@ static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
>  	if (reg < 0x100 || reg >= 0x600)
>  		count = 1;
>  
> -	priv->error = regmap_bulk_write(priv->regmap, reg, &val, count);
> +	priv->error = regmap_bulk_write(priv->regmap, reg, &tmpval, count);
>  }
>  
>  static void tc358768_read(struct tc358768_priv *priv, u32 reg, u32 *val)
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
