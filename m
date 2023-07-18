Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DA757F1B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EBD10E176;
	Tue, 18 Jul 2023 14:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9210E176
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 14:12:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 092EA863A4;
 Tue, 18 Jul 2023 16:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689689575;
 bh=LqI6QML+7gGasxegG0v5NraYwwvIqZdSegF8MSP2jvE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mtwUzxjxuesQ0AnCfKXB43tdn0e4bKwqL3MQjFhbnIUng+f0BDe6eP72boABvn1+E
 dMZmXhsYkfyUL+87iM+iifObgH29VtPoNxCslX33BrGi9XL63H5VvHVAnVXhjoIPs+
 k6F84m+KgMXUJTze8s3mpMYx2+uoEIPY3bYe+dCSGS3juBzZDKs3o67EvDtaZd8WGl
 q1BDbHTgwOWOxSkQqbXZs/wtvEQ2PakE4ZmnvPrmpFDhBfnwHfI2+RPy0liN0Ztqa8
 jsdP/g/aZFdLn0rgCCRuk28+JZhSsPydVMlenaiYvfEn3UT4VP/4C2XBVu45+29ai/
 aSQV3+f8sDUTQ==
Message-ID: <55f0d6b7-c0a8-3ea9-ea4b-23115ed8ec97@denx.de>
Date: Tue, 18 Jul 2023 16:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org
References: <CGME20230718131920eucas1p2741bb07ea78b94afed99b8e5b74acee3@eucas1p2.samsung.com>
 <20230718131859.3114135-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230718131859.3114135-1-m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 15:18, Marek Szyprowski wrote:
> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
> doesn't report empty level of packer header FIFO. In case of those SoCs,
> use the old way of waiting for empty command tranfsfer FIFO, removed
> recently by commit 14806c641582 ("Drain command transfer FIFO before
> transfer").
> 
> Fixes: 14806c641582 ("Drain command transfer FIFO before transfer")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> If I remember right, the problem with waiting for the empty command
> transfer FIFO was there from the begging of the Exynos DSI driver and
> Tomash Figa and Andrzej Hajda used a workaround based on waiting until
> the DSIM_SFR_HEADER_FULL bit gets cleared. So far it worked well enough
> on the older Exynos SoCs, but indeed there is no point using it on the
> properly working hardware, like Exynos 5433 or IMX.
> 
> Marek Szyprowski
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 11 +++++++++--
>   include/drm/bridge/samsung-dsim.h     |  1 +
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 9b7a00bafeaa..80eb268d5868 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -412,6 +412,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
>   	.m_min = 41,
>   	.m_max = 125,
>   	.min_freq = 500,
> +	.has_broken_fifoctrl_emptyhdr = 1,
>   };
>   
>   static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
> @@ -428,6 +429,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
>   	.m_min = 41,
>   	.m_max = 125,
>   	.min_freq = 500,
> +	.has_broken_fifoctrl_emptyhdr = 1,
>   };
>   
>   static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
> @@ -1009,8 +1011,13 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
>   	do {
>   		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
>   
> -		if (reg & DSIM_SFR_HEADER_EMPTY)
> -			return 0;
> +		if (!dsi->driver_data->has_broken_fifoctrl_emptyhdr) {
> +			if (reg & DSIM_SFR_HEADER_EMPTY)
> +				return 0;
> +		} else {
> +			if (!(reg & DSIM_SFR_HEADER_FULL))
> +				return 0;

Would it make sense to at least wait a little bit on the old hardware , 
so the data can actually leave the FIFO and be put on the line ?

I mean, imagine you have e.g. a byte of the FIFO space available (i.e. 
FIFO is not full), and you attempt to put in two bytes. The FIFO would 
overflow. If you wait a bit, then there is a chance this overflow 
condition is avoided.
