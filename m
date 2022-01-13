Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED548D353
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3810E2AE;
	Thu, 13 Jan 2022 08:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2E010E2AE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 08:04:55 +0000 (UTC)
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id 7v68nVqnqniux7v68nzdc1; Thu, 13 Jan 2022 09:04:52 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 13 Jan 2022 09:04:52 +0100
X-ME-IP: 90.126.236.122
Message-ID: <2e676870-11f2-b5fa-faf1-d6633e801a5a@wanadoo.fr>
Date: Thu, 13 Jan 2022 09:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
References: <20220113073158.2171673-1-hsinyi@chromium.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220113073158.2171673-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 13/01/2022 à 08:31, Hsin-Yi Wang a écrit :
> Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
> handled by driver detach.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Xin Ji <xji@analogixsemi.com>
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 0b858c78abe8b6..dbe708eb3bcf11 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   		return -ENODEV;
>   	}
>   
> -	platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> +	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
>   	if (!platform) {
>   		DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
>   		return -ENOMEM;
> @@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	if (ret) {
>   		if (ret != -EPROBE_DEFER)
>   			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> -		goto free_platform;
> +		return ret;
>   	}
>   
>   	platform->client = client;
> @@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	if (!platform->hdcp_workqueue) {
>   		dev_err(dev, "fail to create work queue\n");
>   		ret = -ENOMEM;
> -		goto free_platform;
> +		return ret;
>   	}
>   
>   	platform->pdata.intp_irq = client->irq;
> @@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	if (platform->hdcp_workqueue)
>   		destroy_workqueue(platform->hdcp_workqueue);
>   
> -free_platform:
> -	kfree(platform);
> -
>   	return ret;
>   }
>   

Hi,

you also need to update anx7625_i2c_remove() accordingly, otherwise you 
introduce a double free.

CJ


