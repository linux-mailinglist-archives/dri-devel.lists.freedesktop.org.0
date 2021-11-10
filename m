Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274444C17A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCAC6E0BE;
	Wed, 10 Nov 2021 12:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277D26E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 12:42:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id B677A1F45422
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636548155; bh=ZsdqjNJRTzFZxNm9jZSSqsLxhmhLOYqnDc2uooP2j4s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UY7+1wlDPgAYmS8fH5yNoKPbqU3ypTNCdTx5M1AUZspII1o1AWL/PACLBfyZSdH3T
 Qj02/9mxmAGUOY6J6zEnDw0gHcierAn1+t9d/QKQwdlROSvQatKPajO0Bkxk5L99C2
 ZgFX/psZdl4NMT+rW6JRbQzM1es+mmYX+Gu1OEW5Vu/os5VlMrP2OjNE5Z2tNYDL3m
 PFU3EyRjbKyRCJIQNTLMVWS5RpLv1ilP7TLbungFd84idK3Hm1+UCHUssLwfRKRV7A
 DYC11vpP7u0kU1y8z4E+W/yeHPF2N20rHefr6EJWPBg8NM3C79rW/akkKeEr4f+1s2
 Icwv+4/bByHTg==
Subject: Re: [PATCH v2 1/3] drm/bridge: parade-ps8640: Don't try to enable VDO
 if poweron fails
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 a.hajda@samsung.com
References: <20211102093618.114928-1-angelogioacchino.delregno@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <18ac7077-2926-0817-e3bf-023187bbc4f3@collabora.com>
Date: Wed, 10 Nov 2021 14:42:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102093618.114928-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02.11.21 11:36, AngeloGioacchino Del Regno wrote:
> If the bridge cannot get powered on, there's no reason to try to
> communicate with it: change the ps8640_bridge_poweron function to
> return an error value to the caller, so that we can avoid calling
> ps8640_bridge_vdo_control() in ps8640_pre_enable() if the poweron
> sequence fails.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 4b36e4dc78f1..8c5402947b3c 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -293,19 +293,19 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>   	return 0;
>   }
>   
> -static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
> +static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>   {
>   	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
>   	int ret, status;
>   
>   	if (ps_bridge->powered)
> -		return;
> +		return 0;
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
>   				    ps_bridge->supplies);
>   	if (ret < 0) {
>   		DRM_ERROR("cannot enable regulators %d\n", ret);
> -		return;
> +		return ret;
>   	}
>   
>   	gpiod_set_value(ps_bridge->gpio_powerdown, 0);
> @@ -352,11 +352,13 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>   
>   	ps_bridge->powered = true;
>   
> -	return;
> +	return 0;
>   
>   err_regulators_disable:
>   	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
>   			       ps_bridge->supplies);
> +
> +	return ret;
>   }
>   
>   static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
> @@ -381,7 +383,9 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>   	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>   	int ret;
>   
> -	ps8640_bridge_poweron(ps_bridge);
> +	ret = ps8640_bridge_poweron(ps_bridge);
> +	if (ret)
> +		return;
>   
>   	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
>   	if (ret < 0)
> 
