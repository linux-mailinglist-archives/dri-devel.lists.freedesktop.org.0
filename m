Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADF44C18B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0831D6E147;
	Wed, 10 Nov 2021 12:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3566E147
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 12:48:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id A47AA1F45536
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636548511; bh=jwsdJub026Wwb55SAebMDORQGiD7sU4q5d/5s4UeTkg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sOaxVK8iLM1IIiBSNuKl6RpdA3raabAR4Ef1dztCdzH8+31hU+41orsEBRtAJa5ZD
 lzais0ceb8fIGpwmYySyCXqg5WDtNTwqOsgbUEBrxHF1/l0/umaNzTQ90nTBGJNN3t
 3Gavr8rcHvETpLlBtSuUUlW6w4cMVq19fUfGw084oPfHF2IgpvgmVhg6xtyRlr/gAA
 pF8SJb+mHHNJ3wHyuznBSr+gctQ1Tamq2N3WS4eUYuCbF8OMkO9xcyxcZIyHKV108k
 3uaPHvwWLwtk6zR5qwJPAzhsrlPoXY5lxetg9LfdnJjBzIGQxUSbecR3T1HoJ18Se9
 7w+D6MwjybfsQ==
Subject: Re: [PATCH v2 3/3] drm/bridge: parade-ps8640: Perform full poweroff
 if poweron fails
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 a.hajda@samsung.com
References: <20211102093618.114928-1-angelogioacchino.delregno@collabora.com>
 <20211102093618.114928-3-angelogioacchino.delregno@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6a1ee7d7-abc7-ed9f-fca0-91a0950b13a8@collabora.com>
Date: Wed, 10 Nov 2021 14:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102093618.114928-3-angelogioacchino.delregno@collabora.com>
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
> In function ps8640_bridge_poweron(), in case of a failure not relative
> to the regulators enablement, the code was disabling the regulators but
> the gpio changes that happened during the poweron sequence were not
> being reverted back to a clean poweroff state.
> 
> Since it is expected that, when we enter ps8640_bridge_poweron(), the
> powerdown and reset GPIOs are both in active state exactly as they were
> left in the poweroff function before, we can simply call function
> __ps8640_bridge_poweroff() in the failure case, reverting every change
> that was done during the power on sequence.
> 
> Of course it was chosen to call the poweroff function instead of adding
> code to revert the GPIO changes to the poweron one to avoid duplicating
> code, as we would be doing exactly what the poweroff function does.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 41f5d511d516..ef1b51d8b676 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -344,7 +344,7 @@ static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>   
>   	if (ret < 0) {
>   		DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
> -		goto err_regulators_disable;
> +		goto err_poweroff;
>   	}
>   
>   	msleep(50);
> @@ -360,23 +360,22 @@ static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>   	ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
>   	if (ret < 0) {
>   		DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
> -		goto err_regulators_disable;
> +		goto err_poweroff;
>   	}
>   
>   	/* Switch access edp panel's edid through i2c */
>   	ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
>   	if (ret < 0) {
>   		DRM_ERROR("failed write PAGE2_I2C_BYPASS: %d\n", ret);
> -		goto err_regulators_disable;
> +		goto err_poweroff;
>   	}
>   
>   	ps_bridge->powered = true;
>   
>   	return 0;
>   
> -err_regulators_disable:
> -	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> -			       ps_bridge->supplies);
> +err_poweroff:
> +	__ps8640_bridge_poweroff(ps_bridge);
>   
>   	return ret;
>   }
> 
