Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C87AE761
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CA710E360;
	Tue, 26 Sep 2023 08:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C2210E360
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:06:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AFD8D66072AE;
 Tue, 26 Sep 2023 09:06:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695715598;
 bh=DNkzrB6xB46nwXnn/uIEbW0EYRfFZ+iNhweCVbOVwQw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E5ghLCBlBe5MVn6CZ4teUjynYKdeSRfx1tlahHjFVdi/7weU2mEN4gK+ujzjQT2kG
 OU7RhR4rGRDb+J0ejTfrUCqY5oM8AJ8ClTaWEHTY0HnHwwb/D0+OJTNsZEzq7k4nWr
 R0SRur5OgneaBDFntamiDNmwT11UaGM4nVaXbQAABS+FBl2JWkE39JQS9fffDwAklv
 sZyIJETX5GraA5/oCB92VEGTm1/bTLvWsSvlZxGLA9Iu6KD1Tnfhy4a26U2+TL6jMR
 tBIt9CdxxrVsLB/egnmf2AHYIPgAvGWz0S0SgwWJQgXo/9dExe6Y1nMFK761XX/GZE
 M051cHAj3Xlzg==
Message-ID: <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
Date: Tue, 26 Sep 2023 10:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to
 panel-simple
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 jitao.shi@mediatek.com, neil.armstrong@linaro.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com,
 quic_jesszhan@quicinc.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/09/23 00:00, Douglas Anderson ha scritto:
> In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> panel-simple") I moved a pile of panels out of panel-simple driver
> into the newly created panel-edp driver. One of those panels, however,
> shouldn't have been moved.
> 
> As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
> exynos5250-snow and exynos5420-peach-pit where it's clear that the
> panel is hooked up with LVDS. Furthermore, searching for datasheets I
> found one that makes it clear that this panel is LVDS.
> 
> As far as I can tell, I got confused because in commit 88d3457ceb82
> ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> downstream ChromeOS trees, it seems like some Mediatek boards are
> using a panel that they call "auo,b116xw03" that's an eDP panel. The
> best I can guess is that they actually have a different panel that has
> similar timing. If so then the proper panel should be used or they
> should switch to the generic "edp-panel" compatible.
> 
> When moving this back to panel-edp, I wasn't sure what to use for
> .bus_flags and .bus_format and whether to add the extra "enable" delay
> from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> backlight when power on"). I've added formats/flags/delays based on my
> (inexpert) analysis of the datasheet. These are untested.
> 
> NOTE: if/when this is backported to stable, we might run into some
> trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> jacuzzi: Move panel under aux-bus") this panel was used by
> "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> know what to suggest for that other than someone making up a bogus
> panel for jacuzzi that's just for the stable channel.
> 
> Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power on")
> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I haven't had a snow or peach-pit hooked up for debugging / testing
> for years. I presume that they must be broken and hope that this fixes
> them.

We could avoid backport breakages by avoiding to backport this to any kernel
that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi: Move
panel under aux-bus")... because creating a dummy panel to get two wrongs
right is definitely not ok.

Cheers,
Angelo

> 
>   drivers/gpu/drm/panel/panel-edp.c    | 29 -----------------------
>   drivers/gpu/drm/panel/panel-simple.c | 35 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index feb665df35a1..95c8472d878a 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -976,32 +976,6 @@ static const struct panel_desc auo_b116xak01 = {
>   	},
>   };
>   
> -static const struct drm_display_mode auo_b116xw03_mode = {
> -	.clock = 70589,
> -	.hdisplay = 1366,
> -	.hsync_start = 1366 + 40,
> -	.hsync_end = 1366 + 40 + 40,
> -	.htotal = 1366 + 40 + 40 + 32,
> -	.vdisplay = 768,
> -	.vsync_start = 768 + 10,
> -	.vsync_end = 768 + 10 + 12,
> -	.vtotal = 768 + 10 + 12 + 6,
> -	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> -};
> -
> -static const struct panel_desc auo_b116xw03 = {
> -	.modes = &auo_b116xw03_mode,
> -	.num_modes = 1,
> -	.bpc = 6,
> -	.size = {
> -		.width = 256,
> -		.height = 144,
> -	},
> -	.delay = {
> -		.enable = 400,
> -	},
> -};
> -
>   static const struct drm_display_mode auo_b133han05_mode = {
>   	.clock = 142600,
>   	.hdisplay = 1920,
> @@ -1725,9 +1699,6 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "auo,b116xa01",
>   		.data = &auo_b116xak01,
> -	}, {
> -		.compatible = "auo,b116xw03",
> -		.data = &auo_b116xw03,
>   	}, {
>   		.compatible = "auo,b133han05",
>   		.data = &auo_b133han05,
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index bb89e6d047bc..439d26928938 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -919,6 +919,38 @@ static const struct panel_desc auo_b101xtn01 = {
>   	},
>   };
>   
> +static const struct drm_display_mode auo_b116xw03_mode = {
> +	.clock = 70589,
> +	.hdisplay = 1366,
> +	.hsync_start = 1366 + 40,
> +	.hsync_end = 1366 + 40 + 40,
> +	.htotal = 1366 + 40 + 40 + 32,
> +	.vdisplay = 768,
> +	.vsync_start = 768 + 10,
> +	.vsync_end = 768 + 10 + 12,
> +	.vtotal = 768 + 10 + 12 + 6,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc auo_b116xw03 = {
> +	.modes = &auo_b116xw03_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 256,
> +		.height = 144,
> +	},
> +	.delay = {
> +		.prepare = 1,
> +		.enable = 200,
> +		.disable = 200,
> +		.unprepare = 500,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing auo_g070vvn01_timings = {
>   	.pixelclock = { 33300000, 34209000, 45000000 },
>   	.hactive = { 800, 800, 800 },
> @@ -4128,6 +4160,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "auo,b101xtn01",
>   		.data = &auo_b101xtn01,
> +	}, {
> +		.compatible = "auo,b116xw03",
> +		.data = &auo_b116xw03,
>   	}, {
>   		.compatible = "auo,g070vvn01",
>   		.data = &auo_g070vvn01,

