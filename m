Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CF6E3C90
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFC310E27A;
	Sun, 16 Apr 2023 22:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63FF10E27A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 22:08:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4337685C9B;
 Mon, 17 Apr 2023 00:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681682890;
 bh=P7xgL3CLNT5Y3Sll/H8HmI7CJlMVMPUZvFIyj+/G2Es=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IFxe2W0JkWDjpMS0PlKCOZBrlL1kiU60vH9dAdyi76jMrkP1rDZo2hDMtoRmYU/bE
 qxo5KYa25KfGg+ictSmyAqM0a+7q8NyGxqAD8BG5sIMWofER5JAOy4KE97nX7ZJi2e
 uORzWh7kIXBq7TQ0XEd4naZE7zocSVmLIABYfPP8g6HW0jan20a4eeKofjV4R/W9UN
 5lRgWq8Og+PoMmPlci4SToa3PObg6iCZzfbuAlFVBRyRoTZVEEgvmNPTCr9+RzuCIJ
 CWW3PPU2LBpMCGZcm4zgH3RJ9LdRBqzSMWVqJVKCg79G8MYQNHJhnRcgZXBy7j+4+m
 sMtN4/g4HyRmQ==
Message-ID: <7eed74e8-9f67-a410-3cec-f61a6db85238@denx.de>
Date: Mon, 17 Apr 2023 00:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-3-aford173@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230415104104.5537-3-aford173@gmail.com>
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

On 4/15/23 12:41, Adam Ford wrote:
> Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
> having an entry in the device tree for samsung,pll-clock-frequency.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 9fec32b44e05..73f0c3fbbdf5 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
>   	struct device_node *node = dev->of_node;
>   	int ret;
>   
> -	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
> -				       &dsi->pll_clk_rate);
> -	if (ret < 0)
> -		return ret;
> -
>   	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
>   				       &dsi->burst_clk_rate);
>   	if (ret < 0)

Does this break compatibility with old samsung DTs ?
