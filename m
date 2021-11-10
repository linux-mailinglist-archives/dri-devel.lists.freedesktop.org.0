Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3255244C17E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962066E135;
	Wed, 10 Nov 2021 12:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F946E135
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 12:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id B493E1F45477
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636548252; bh=UMtO2IEIb9liiv4GEnJ/KRnLSOBjGePRppyxukrmtSY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mNvXs4akh9UACLvEBnjWYlK+qVtuLUFHG7bIgyZ/5u3gbZp3izHdr2jRkstgFD8m4
 PnMPiV+7r+GNcq7RUmpHqto+K6vh8oD42HlSNJajwrDqM9v9VtJMbEj8MQYAd3RILj
 N4nKoKG65IWr7s9xPu3lzhDjXVNaPh3+Nm90M73dGvB7fj7UaX4ZK5HjiHHB+UiF5G
 Zi9Qw/1z+td7m2M9fyfjNQASCb8yMd7ROc5TgEkbErWKmwCJ4dwr4x+6pEaAmxIWVN
 1jnLgyWYJ8IVd/DQxVC7n/SLZ/T2deD/RpAHznlmKeBGJEoRDWmTuCa0QTPyAatHSB
 R/DCoca2NGcMA==
Subject: Re: [PATCH v2 2/3] drm/bridge: parade-ps8640: Move real poweroff
 action to new function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 a.hajda@samsung.com
References: <20211102093618.114928-1-angelogioacchino.delregno@collabora.com>
 <20211102093618.114928-2-angelogioacchino.delregno@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <d2fe91c8-ab29-7706-80f4-fe6619f07327@collabora.com>
Date: Wed, 10 Nov 2021 14:44:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102093618.114928-2-angelogioacchino.delregno@collabora.com>
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
> In preparation for varying the poweron error handling in function
> ps8640_bridge_poweron(), move function ps8640_bridge_poweroff() up
> and also move the actual logic to power off the chip to a new
> __ps8640_bridge_poweroff() function.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c | 37 ++++++++++++++------------
>   1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 8c5402947b3c..41f5d511d516 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -293,6 +293,26 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>   	return 0;
>   }
>   
> +static void __ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
> +{
> +	gpiod_set_value(ps_bridge->gpio_reset, 1);
> +	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
> +	if (regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +				   ps_bridge->supplies)) {
> +		DRM_ERROR("cannot disable regulators\n");
> +	}

That '{' is redundant

Thanks,
Danfa

> +}
> +
> +static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
> +{
> +	if (!ps_bridge->powered)
> +		return;
> +
> +	__ps8640_bridge_poweroff(ps_bridge);
> +
> +	ps_bridge->powered = false;
> +}
> +
>   static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>   {
>   	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> @@ -361,23 +381,6 @@ static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>   	return ret;
>   }
>   
> -static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
> -{
> -	int ret;
> -
> -	if (!ps_bridge->powered)
> -		return;
> -
> -	gpiod_set_value(ps_bridge->gpio_reset, 1);
> -	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
> -	ret = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> -				     ps_bridge->supplies);
> -	if (ret < 0)
> -		DRM_ERROR("cannot disable regulators %d\n", ret);
> -
> -	ps_bridge->powered = false;
> -}
> -
>   static void ps8640_pre_enable(struct drm_bridge *bridge)
>   {
>   	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> 
