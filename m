Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695FB6E3C8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB310E23B;
	Sun, 16 Apr 2023 22:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F8C10E23B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 22:07:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 452BF85C9B;
 Mon, 17 Apr 2023 00:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681682838;
 bh=QKvk9+XBBRlUqKsk7bMr4Ef6sOzUUDhjPGcAEetatRM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UP2ewFEoUfz1Yxj8B3hg6QGvA+Tbdz7mVY7qFBYqT2SCIrLfSbPbSRGQCHOqWJWrc
 ORWUzUa6iPefZDb6K9QPJ47F0588aUJAQqJfqIJDLrCjbFg8mZQyKOdfVVSdugvhlf
 gj3D72BnNkyEWxlYU7o2ADx3rs+ftCsWsZYjpWZX2rxj4/vjSMHDAVxnhl3NgzCnaK
 fym/KOdj8BoGIcRYR24bj7QS3pc6jGir33VGXmdOpeLdRRhO1Szaq+qe5Nex0gzHIl
 IXbDVIOcy07IXnLtFjpNSuOZ3NWTPrR5Goli1tE2C5BFwzljvUCHiki9C6EcLQvg1X
 VPxHxEsrbigSA==
Message-ID: <414febc4-aab1-95ec-ac2e-e82a3f881d01@denx.de>
Date: Mon, 17 Apr 2023 00:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-2-aford173@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230415104104.5537-2-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
> According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
> and max values for M and  the frequency range for the VCO_out
> calculator were incorrect.  This also appears to be the case for the
> imx8mn and imx8mp.
> 
> To fix this, make new variables to hold the min and max values of m
> and the minimum value of VCO_out, and update the PMS calculator to
> use these new variables instead of using hard-coded values to keep
> the backwards compatibility with other parts using this driver.

[...]

>   static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
> @@ -470,6 +485,9 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
>   	 */
>   	.pll_p_offset = 14,
>   	.reg_values = imx8mm_dsim_reg_values,
> +	.m_min = 64,
> +	.m_max = 1023,
> +	.vco_min = 1050,

You might want to call this 'min_freq' since there is a 'max_freq' which 
seems to indicate what VCO max frequency is.

Note that the same datasheet contains the following information:
"
MIPI_DPHY_M_PLLPMS field descriptions

12–4 PMS_M
Specifies the PLL PMS value for the M divider
NOTE: The programmable divider range should be within 25 to 125 to 
ensure PLL stability.
NOTE: The M and P divider values should be considered together to ensure 
VCO ouput frequency
(VCO_out) range is between 350 MHz to 750 MHz.
Please refer to the topic DPHY PLL for more information.
"
