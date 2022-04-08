Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A24F92AF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D1D10E1A0;
	Fri,  8 Apr 2022 10:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9D10E1A0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:15:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D22C91F46D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412947;
 bh=/D4CZAKLnqdj/M80cIjvlVohAFtB9g0GsYprmX56/1Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ivhbUs03MisYCUDf6ZujZd2gEirPb969jXJoo/opKjOEuxtjINybODsRYd6F7qIcB
 2Li4i2TDM4OW6lJQfqiSkrEXot8X2bcjIgr56bNi5hMYG/pZLuXJPQiUotJh/0uoZF
 6Nab4iFRxZPzyUh8f/NpoAMy0Iu8T3hRUxMpNshT/q4dddfmZ2ZcY5fQIJpW00tXQx
 ElfMG6ckF6/DXWy29b69mmZbyKNK22gCWvlxw7T7rNiAXBhJLWZ1ksayxVwW40LiEE
 ZJXxpETS1fW8ejpDvZfoL60gkXPYto0oO0OIaC4SMA2pVRpstrTM7Ogaua7Hst2/g9
 Gw7UZaRFn15KA==
Message-ID: <63867ed3-0c2a-207f-df91-ad1f6ec1d550@collabora.com>
Date: Fri, 8 Apr 2022 12:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/bridge: anx7625: Use irq flags from devicetree
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20220408013356.673732-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408013356.673732-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/04/22 03:33, Nícolas F. R. A. Prado ha scritto:
> Read the irq flags, like which edge to trigger on, from the devicetree
> and use those when registering the irq instead of hardcoding them.
> In case none was specified, fallback to falling edge trigger.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 6516f9570b86..97d954b8cc12 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2588,6 +2588,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	struct anx7625_platform_data *pdata;
>   	int ret = 0;
>   	struct device *dev = &client->dev;
> +	unsigned long irqflags;
>   
>   	if (!i2c_check_functionality(client->adapter,
>   				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
> @@ -2639,10 +2640,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   			goto free_hdcp_wq;
>   		}
>   
> +		irqflags = irq_get_trigger_type(client->irq);

Nicolas, this is not necessary... what are you trying to solve?

> +		if (!irqflags)
> +			irqflags = IRQF_TRIGGER_FALLING;

...and this is already done for you by __setup_irq(), check kernel/irq/manage.c.

> +
>   		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
>   						NULL, anx7625_intr_hpd_isr,
> -						IRQF_TRIGGER_FALLING |
> -						IRQF_ONESHOT,
> +						irqflags | IRQF_ONESHOT,
>   						"anx7625-intp", platform);
Partial devm_request_threaded_irq() flow, to make you understand what's going on:

devm_request_threaded_irq() -> request_threaded_irq() -> __setup_irq()


That said, congrats for solving that external display issue, but I'm sure that this
commit is not part of any solution and, if it is, you should recheck your machine's
DT, as the mistake must be there, then!

Cheers,
Angelo

