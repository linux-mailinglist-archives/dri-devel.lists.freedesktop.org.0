Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB1B86ABA7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 10:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EA110E7B7;
	Wed, 28 Feb 2024 09:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="5Kl+5hJu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9570E10E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709113896;
 bh=G22s0wkjpFNZosDALoAG8Ufc1M9DBCSDGtlIAeBbjoc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=5Kl+5hJufOEgvXzaCb1w2RqImqwe5YOsnx7tri7w5EMx3e6ocSZI7w6/me2KaH+aj
 mI0XZaEqLMVmEwkIzCs7OuUnFcXX1hyz8LIA/GHEepkIz1Mz0/iHKIceFzcZbwiL8n
 OjaUcWOejQbd1b+uxoTuNhtDLo14ts7xH/eCa3EMJ7z6AmqOAu4CJ+5kC56C2sXxDq
 C/7o9UCqy/Or1uka7QFaCGvDwoKuWA12XTk7R5V00ghlUDmEXkhbvQhwv6W1Npvkma
 keuTjoJdYLiSBwVb6uR3jlNXP0rdnl9oyJy2ZWFLxYqLtMR3c9ZqRz97eMS7GhuXxL
 csPBL71Kryc9w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4279F3780029;
 Wed, 28 Feb 2024 09:51:35 +0000 (UTC)
Message-ID: <4c57d1f6-3114-4789-94d4-03e78852cbef@collabora.com>
Date: Wed, 28 Feb 2024 10:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: anx7625: Don't log an error when DSI host
 can't be found
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <rfoss@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240226-anx7625-defer-log-no-dsi-host-v1-1-242b1af31884@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226-anx7625-defer-log-no-dsi-host-v1-1-242b1af31884@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/02/24 22:20, Nícolas F. R. A. Prado ha scritto:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Fixes: 269332997a16 ("drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host was not found")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 29d91493b101..4ee5614a2623 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2076,10 +2076,8 @@ static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
>   	};
>   
>   	host = of_find_mipi_dsi_host_by_node(ctx->pdata.mipi_host_node);
> -	if (!host) {
> -		DRM_DEV_ERROR(dev, "fail to find dsi host.\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!host)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "fail to find dsi host.\n");

Agreed, but while at it:
  1. This is not the only driver doing this, so you might as well go fix all of them
     in a series (toshiba tcxxxx, lontium, chipone.... check them, the error message
     is exactly the same even, that'd take 3 seconds);
  2. I've just noticed that, in this driver, of_node_put() is never called for the
     `mipi_host_node`, so the reference is never dropped... but that can come later
     and not necessarily in the eventual series that fixes the err message strategy.

In the meanwhile, for this commit

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   
>   	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
>   	if (IS_ERR(dsi)) {
> 
> ---
> base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
> change-id: 20240226-anx7625-defer-log-no-dsi-host-c3f9ccbcb287
> 
> Best regards,

