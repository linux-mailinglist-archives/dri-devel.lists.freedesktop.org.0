Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 045AB4A5AE9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C71210E3CC;
	Tue,  1 Feb 2022 11:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AE510E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:10:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 21F7B81221;
 Tue,  1 Feb 2022 12:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643713822;
 bh=4NxyB/iPq8vK/OmWYNhZGtIzuhTgDCFHMaXlwqjvY60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qSDG1T4hcUzQpZl+ZP1Nd2+t46wbuuQDFAimeiri9UaiHohQJ0cOHOaBLQ9ROkRkK
 2HiG1rGnOEMjIGb8imEWGAg37wNUNgZwYjmo5YgkREhPF7Wi7ssttJLbR1toT0RbEp
 H9HzNAz8AfgSq+JO/LIGnJQwobKR9Me2YaXhzI8uSUSdzI4m4Rit/tJ9Tsdv8RsNXv
 kWYRJYRad6CMaY9ro7w+RhvNaR36FwIHy+KRKNG49qX5L2/aG5+DGMUpILlHlz4stG
 idazeZtfyS7mDVCo8xTKKrcZFizJDinGxtMkZhOuxxnC8L4yAHpiqX4jO6AikZIzyO
 nlX3+NQ9EREfg==
Message-ID: <4f7d2ec6-cde9-4adf-141d-4e4651371bae@denx.de>
Date: Tue, 1 Feb 2022 12:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
Content-Language: en-US
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
References: <20220201110358.3530-1-cniedermaier@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220201110358.3530-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 12:03, Christoph Niedermaier wrote:
> If display timings were read from the devicetree using
> of_get_display_timing() and pixelclk-active is defined
> there, the flag DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE is
> automatically generated. Through the function
> drm_bus_flags_from_videomode() e.g. called in the
> panel-simple driver this flag got into the bus flags,
> but then in imx_pd_bridge_atomic_check() the bus flag
> check failed and will not initialize the display. The
> original commit fe141cedc433 does not explain why this
> check was introduced. So remove the bus flags check,
> because it stops the initialization of the display with
> valid bus flags.
> 
> Fixes: fe141cedc433 ("drm/imx: pd: Use bus format/flags provided by the bridge when available")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/imx/parallel-display.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index a8aba0141ce7..06cb1a59b9bc 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -217,14 +217,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
>   	if (!imx_pd_format_supported(bus_fmt))
>   		return -EINVAL;
>   
> -	if (bus_flags &
> -	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> -	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> -	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)) {
> -		dev_warn(imxpd->dev, "invalid bus_flags (%x)\n", bus_flags);
> -		return -EINVAL;
> -	}

+CC Boris
