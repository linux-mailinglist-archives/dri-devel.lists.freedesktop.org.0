Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B53AB404
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 14:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2D76E0F5;
	Thu, 17 Jun 2021 12:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DB66E0F5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:49:56 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C4816829FC;
 Thu, 17 Jun 2021 14:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623934194;
 bh=Dtqg3l61I/gmYm7TbcR8sP9/Lbw3U1Y0YsrSuDuMyOQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=wfBPqfmyLiYjB5PE8vFJMQRA+lfjCL8os+SHPtvoaN5tC3AcXRjP42ZPLh6kuYBe8
 xId+iZeIGqHEau3CjdyWehMMR57wQTGJZR9mtnEKjyEjFDFr8mTxEs7SXQiAocu5fh
 TxUrsm7x5cOs44qOEUBe/oZjZwNSdxBuM+iftd4ERSzC/1L3N7p4jDN/Q/Am4XVDFm
 Crz32AP8bDQyb26NVw//hxhnek3c7JbTIlFGtNp5fmAYRJQukRXOD+CVZUzgaTc8eX
 RmwVdLS6HZKnfFmFDVrIC0pQS4dmT8/yblzHCiI+SK6aF4pHg7CHYaLOWFDWXDl7BS
 xQjojvy+XXNww==
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix null pointer dereference in
 remove callback
To: Jonathan Liu <net147@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210617111925.162120-1-net147@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <99e8032d-9a40-77a2-51a2-14bd8c3913cd@denx.de>
Date: Thu, 17 Jun 2021 14:49:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617111925.162120-1-net147@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/17/21 1:19 PM, Jonathan Liu wrote:
> If attach has not been called, unloading the driver can result in a null
> pointer dereference in mipi_dsi_detach as ctx->dsi has not been assigned
> yet.
> 
> Fixes: ceb515ba29ba6b ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 750f2172ef08..8e9f45c5c7c1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -671,8 +671,11 @@ static int sn65dsi83_remove(struct i2c_client *client)
>   {
>   	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
>   
> -	mipi_dsi_detach(ctx->dsi);
> -	mipi_dsi_device_unregister(ctx->dsi);
> +	if (ctx->dsi) {
> +		mipi_dsi_detach(ctx->dsi);
> +		mipi_dsi_device_unregister(ctx->dsi);
> +	}
> +
>   	drm_bridge_remove(&ctx->bridge);
>   	of_node_put(ctx->host_node);

Looks OK to me.

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
