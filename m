Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F5A6A659
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 13:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A3210E03A;
	Thu, 20 Mar 2025 12:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jtWiv98f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880F610E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742474270;
 bh=2v6ILyqttbXUiv4liYlyocig8g6a+R2OPkWZP9wB3lI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jtWiv98fy9Al8vyV+M3JtrUh8RqEfqnXvhgoQmp8Prasqxqk4yqLbL1+t/HhBCNBT
 mMuwSiumysP9A9M0EdPDnKyJ4x3/BS++C5CD+35NvDyJc/iCeHg5dvaUuuOvYF2MFu
 8LLI5LdW6Jp12cSTwjwUmWCIUrIZor0i/KzZRPXtLAzfv2X3O4v2MJXhDMeGuHe47I
 DjJmyPmSqGRN1FchXbNK/kaQo21EC6EQlYS6U3/p7XAcEpeRN6IswL8Wmb+xItvsi8
 Wx+IoPNfaF7jNdTUkoegxHKdHO+qQifLIkRfiiC5KnsmHfjFhSfgj6Cm7JU8HXHen8
 gJ4MNiTOhPkDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E874F17E02AF;
 Thu, 20 Mar 2025 13:37:49 +0100 (CET)
Message-ID: <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
Date: Thu, 20 Mar 2025 13:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
> Currently, the panel set power, set gpio and enable the display link
> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
> panel_bridge_atomic_pre_enable, pointed by
> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
> atomic_pre_enable must not enable the display link
> 
> Since the DSI driver is properly inited by the DRM, the panel try to
> communicate with the panel before DSI is powered on.
> 

The panel driver shall still be able to send commands in the .prepare() callback
and if this is not happening anymore... well, there's a problem!

> To solve that, use stk_panel_enable to enable the display link because
> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
> on the DSI.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> index c0c95355b7435..bc3c4038bf4f5 100644
> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>   	gpiod_set_value(stk->enable_gpio, 1);
>   	mdelay(20);
>   	gpiod_set_value(stk->reset_gpio, 1);
> -	mdelay(10);
> -	ret = stk_panel_init(stk);
> -	if (ret < 0)
> -		goto poweroff;

Also, you're moving both init and set_display_on to the enable callback...
this is suboptimal.

You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
should have a .enable() callback that calls DISP ON, a .disable() callback that
calls DISP OFF, and .unprepare() that turns everything off.

Cheers,
Angelo

> -
> -	ret = stk_panel_on(stk);
> -	if (ret < 0)
> -		goto poweroff;
>   
>   	return 0;
>   
> -poweroff:
> -	regulator_disable(stk->supplies[POWER].consumer);
>   iovccoff:
>   	regulator_disable(stk->supplies[IOVCC].consumer);
>   	gpiod_set_value(stk->reset_gpio, 0);
> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>   	return ret;
>   }
>   
> +static int stk_panel_enable(struct drm_panel *panel)
> +{
> +	struct stk_panel *stk = to_stk_panel(panel);
> +	int ret;
> +
> +	ret = stk_panel_init(stk);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = stk_panel_on(stk);
> +
> +	return ret;
> +}
> +
>   static const struct drm_display_mode default_mode = {
>   		.clock = 163204,
>   		.hdisplay = 1200,
> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct drm_panel_funcs stk_panel_funcs = {
> +	.enable = stk_panel_enable,
>   	.unprepare = stk_panel_unprepare,
>   	.prepare = stk_panel_prepare,
>   	.get_modes = stk_panel_get_modes,
> 



