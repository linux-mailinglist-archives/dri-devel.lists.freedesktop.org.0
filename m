Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB21BD6A9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 09:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F546EA79;
	Wed, 29 Apr 2020 07:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A116EA79
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:56:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03T7uN8w007867;
 Wed, 29 Apr 2020 02:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588146983;
 bh=n4pmfRipX17yviyXCDK8at/AM0pg14P8PWeY9w6wQmA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XDfkkNuUPYbFAV2lKtYm2z5y+m4/7Qo7STPFfnkln0JgNbc19/pUDC16TTyYK5sXU
 nucf2/Vc057I3eFohiLDCxffAjvn4V7jzRRwHQMobraXzKpC5x7rTcq6jFO4loa1TL
 0HeWsLMASeQNvQ4qgAkJK0RYBVKc6/W/G/SaptDo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03T7uNgE116017
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Apr 2020 02:56:23 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 02:56:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 02:56:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03T7uJJV074144;
 Wed, 29 Apr 2020 02:56:20 -0500
Subject: Re: [PATCH] drm/bridge: fix stack usage warning on old gcc
To: Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <a.hajda@samsung.com>, Neil
 Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20200428215408.4111675-1-arnd@arndb.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <22ee464b-f59a-69a3-b669-f821d567fbf5@ti.com>
Date: Wed, 29 Apr 2020 10:56:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428215408.4111675-1-arnd@arndb.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2020 00:53, Arnd Bergmann wrote:
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
> ---
>   drivers/gpu/drm/bridge/tc358768.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 1b39e8d37834..6650fe4cfc20 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -178,6 +178,8 @@ static int tc358768_clear_error(struct tc358768_priv *priv)
>   
>   static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
>   {
> +	/* work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715 */
> +	int tmpval = val;
>   	size_t count = 2;
>   
>   	if (priv->error)
> @@ -187,7 +189,7 @@ static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
>   	if (reg < 0x100 || reg >= 0x600)
>   		count = 1;
>   
> -	priv->error = regmap_bulk_write(priv->regmap, reg, &val, count);
> +	priv->error = regmap_bulk_write(priv->regmap, reg, &tmpval, count);
>   }
>   
>   static void tc358768_read(struct tc358768_priv *priv, u32 reg, u32 *val)
> 

tc358768_write is not inline. What is the inline function here? Or is tc358768_write optimized to 
inline by the compiler?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
