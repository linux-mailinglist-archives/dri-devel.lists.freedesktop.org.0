Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF86E3C84
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B310E116;
	Sun, 16 Apr 2023 22:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD8510E116
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 22:02:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 438B585C9B;
 Mon, 17 Apr 2023 00:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681682564;
 bh=JXOO0HH7hgkSuYOF/8TS6jyPZhhE7U1JS+DTKN8pPds=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OoV12WlRdtE7Or0xGRTZE3jHnaCPBOcm80TQHxHgMiKO03ci3JoUjDzCS7OvLD5RX
 wU6uCJQAEK6aUAFm8GF3cf4tO7q4F6/z5Sy9ufHVMAkxPYWzhFR9RiZpmECV+Wcouq
 3KGXmT6HhVJdJg1PFlhHy0h+ObJdi+t+SUd+NNkwLnbasypWl1Qld9ddAKVcPH2rGP
 BdFWfuqzty3Pnm7huZDiQdFnBfEw/LRan04973rt4yjhun34SHjkOWouxTGUTMmFwg
 utIevBBGrwgDnIJ4kac+l6nc5gDz7JhpXwVfyOog+tTmX3hUzbU8BMpV1oaiDkiEz+
 7CvOwJlN1vNrA==
Message-ID: <6bfeb8aa-f4f4-4b24-a070-108e5553ad48@denx.de>
Date: Mon, 17 Apr 2023 00:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230415104104.5537-1-aford173@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230415104104.5537-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/23 12:40, Adam Ford wrote:
> If there is more than one lane, the HFP, HBP, and HSA is calculated in
> bytes/pixel, then they are divided amongst the different lanes with some
> additional overhead. This is necessary to achieve higher resolutions while
> keeping the pixel clocks lower as the number of lanes increase.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 40 +++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index e0a402a85787..1ccbad4ea577 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -215,6 +215,7 @@
>   #define DSI_RX_FIFO_SIZE		256
>   #define DSI_XFER_TIMEOUT_MS		100
>   #define DSI_RX_FIFO_EMPTY		0x30800002
> +#define DSI_HSYNC_PKT_OVERHEAD	6
>   
>   #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
>   
> @@ -879,13 +880,40 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
>   			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
>   		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
>   
> -		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
> -			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
> -		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> +		/*
> +		 * If there is more than one lane, the HFP, HBP, and HSA
> +		 * is calculated in bytes/pixel, then they are divided
> +		 * amongst the different lanes with some additional
> +		 * overhead correction
> +		 */

Did you find any confirmation of this in the MX8M* datasheet or at least 
by measuring the DSI data lanes with a scope ?

It would be real cool if this could be confirmed somehow, and we could 
rule out that this tweaking of HSA/HSE/... stuff isn't related to either 
LP-HS transition timing calculation this driver is missing, OR, 
incorrect flags in various bridge/panel drivers like commit:

ca161b259cc84 ("drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA 
and EOT packet")

