Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7754495160
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19710E498;
	Thu, 20 Jan 2022 15:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030E210E498
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 20AE41F45362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642692356;
 bh=8+iuI55GEe2f55qKCFzj4slDIPT5+kv1gU6x/pdsBWs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GTb4GYgETr0dGmKkiXlgmJg7q/i9Jobg8xDglDVLE1yiD9nqSCfbJ6YOsd7BirHkD
 MpqsMfqmuNcZ+/1ceXPqJt5YiQxspgDj8/6fwrcKtbxzqDMxkf0CJd+BvzYKQk1wCa
 znonQ211B4GgUX0BhXhUSWLOh0spevMCXUj4FkR3Hs2qri6R4TuaWaDpcmVZmfnE84
 N6QN0FEQe2Vx+L2ongu551azvIgenLYGdYwfHrlOJz7/5zAPq6bHoPz1y5cyXrCzIo
 EyzdhCTvcMM3srz9WawMdAtHs/6Gs83C9GqliWKX7cG1GQ5+h/XPDjwyc/QfyJOinP
 MCe8ry4JrqplA==
Subject: Re: [PATCH v11] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
References: <20220114091502.333083-1-allen.chen@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f4696a8d-5c1d-1007-7814-b2e6cbe334ae@collabora.com>
Date: Thu, 20 Jan 2022 16:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114091502.333083-1-allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <hermes.wu@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-yi Wang <hsinyi@chromium.org>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/01/22 10:14, allen ha scritto:
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
> 
> From: Allen Chen <allen.chen@ite.com.tw>
> Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
> v10 -> v11 : remove drm_bridge_new_crtc_state
> ---
>   drivers/gpu/drm/bridge/Kconfig      |    8 +
>   drivers/gpu/drm/bridge/Makefile     |    1 +
>   drivers/gpu/drm/bridge/ite-it6505.c | 3352 +++++++++++++++++++++++++++
>   3 files changed, 3361 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
> 

...snip...

> +static const struct of_device_id it6505_of_match[] = {
> +	{ .compatible = "ite,it6505" },
> +	{ }
> +};

If you want to have a DT compatible and DT properties, you have to also add
dt-bindings (yaml) for this driver, otherwise, any SoC/device DT will fail
the dt binding check.... So, please, add that.

For the driver by itself, though:

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +static struct i2c_driver it6505_i2c_driver = {
> +	.driver = {
> +		.name = "it6505",
> +		.of_match_table = it6505_of_match,
> +		.pm = &it6505_bridge_pm_ops,
> +	},
> +	.probe = it6505_i2c_probe,
> +	.remove = it6505_i2c_remove,
> +	.shutdown = it6505_shutdown,
> +	.id_table = it6505_id,
> +};
> +
> +module_i2c_driver(it6505_i2c_driver);
> +
> +MODULE_AUTHOR("Allen Chen <allen.chen@ite.com.tw>");
> +MODULE_DESCRIPTION("IT6505 DisplayPort Transmitter driver");
> +MODULE_LICENSE("GPL v2");
> 

