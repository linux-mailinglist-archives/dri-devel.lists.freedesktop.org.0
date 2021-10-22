Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E22437F0D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 22:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62D66EDCA;
	Fri, 22 Oct 2021 20:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41C36EDCA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 20:02:31 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C6A9583178;
 Fri, 22 Oct 2021 22:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634932949;
 bh=LvTOOeRAv/khzIytVw36PjPaHd1n/KPKj62DMIdK7/Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0Eo2PWoSjGfwdUrKY13nHIrUnz1LBo9OgX9hETDoVdtwktvZFYUKh2bK0Imin8xPe
 ZWB6iSmcsCYAVto+kn4LMKAL7ZUKvLJfUPfJlpzyTkO8D7arI4STRO+u8OxaWeN/AT
 tmxar9kHU8e4h/s/hX1WuNm0cM07t/M1YDwmFSilDW+X+QKyuH1bdG0Q+qb9UsgXlN
 0HUVo25EngKCvBX8v4Ms0c8pBKFe2QIQBy3IaruKslJzIiZnHcQhCkJdJgLulh4KhA
 MYXnsYubSdJlirldCLFYIb3MUykEDPf4jjjx/u+ckfHRswAudDW5Ii2rWwJC/M0zjK
 aHP6rk519hpZw==
Subject: Re: [PATCH v5 13/21] drm/bridge: sn65dsi83: Fix bridge removal
To: Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, dri-devel@lists.freedesktop.org
References: <20211021073947.499373-1-maxime@cerno.tech>
 <20211021073947.499373-14-maxime@cerno.tech>
From: Marek Vasut <marex@denx.de>
Message-ID: <ecbad89b-f849-6725-98de-3b405890d96c@denx.de>
Date: Fri, 22 Oct 2021 22:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211021073947.499373-14-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/21/21 9:39 AM, Maxime Ripard wrote:
> Commit 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach
> callback") moved the unregistration of the bridge DSI device and bridge
> itself to the detach callback.
> 
> While this is correct for the DSI device detach and unregistration, the
> bridge is added in the driver probe, and should thus be removed as part
> of its remove callback.
> 
> Cc: Marek Vasut <marex@denx.de>
> Fixes: 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach callback")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 52030a82f3e1..3bfd07caf8d7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -297,7 +297,6 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
>   
>   	mipi_dsi_detach(ctx->dsi);
>   	mipi_dsi_device_unregister(ctx->dsi);
> -	drm_bridge_remove(&ctx->bridge);
>   	ctx->dsi = NULL;
>   }
>   
> @@ -693,6 +692,7 @@ static int sn65dsi83_remove(struct i2c_client *client)
>   {
>   	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
>   
> +	drm_bridge_remove(&ctx->bridge);
>   	of_node_put(ctx->host_node);
>   
>   	return 0;

Yes, the above is correct, thanks.

Reviewed-by: Marek Vasut <marex@denx.de>
