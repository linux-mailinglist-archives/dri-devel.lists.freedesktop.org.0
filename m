Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAC67A47D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EA510E250;
	Tue, 24 Jan 2023 21:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D87D10E250
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:00:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 132DE85695;
 Tue, 24 Jan 2023 22:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674594040;
 bh=CFHQq7q8sTru4dXSQdzAXmnaFqMSTjmWlhBAf6OibxQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qAPZJGsbGa2GGX96R14Wjxs7NCLgz29rsYNkCtIpXo6vybS5eBxx+eWRDKVPULY5x
 NnvSRzo1IOuSlDovE+zLPMQuA0La+3POmUYYYsfahneGNs8i/tx8nnbJTHSp8HKOvj
 zIv/z1JOsSJdcLFWgFhlyBAZZrNV3tNTx5/q7WsOj6ciJu57V3KeT6+UUXsgGjk8jX
 OyyfvEPWHrf8bZVj6jUZPhFFNvIQY5pYSHo216TeQ5k/W8pzOBYHl8rO0Ey4HOvSnt
 SIIN1+tLOZeCzBRVyFvByPaww6ilNiFxkaFpwbZIrNIp1JtyF2+FVfZutvXUhYuQlC
 w17uu5w62lT5g==
Message-ID: <351938c4-c66e-36c9-21aa-96b41b9ee8f8@denx.de>
Date: Tue, 24 Jan 2023 22:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 08/18] drm: exynos: dsi: Handle proper host
 initialization
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-9-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-9-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/23 16:12, Jagan Teki wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Host transfer() in the DSI master will invoke only when the DSI commands
> are sent from DSI devices like DSI Panel or DSI bridges and this host
> the transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> 
> Handling DSI host initialization in transfer calls misses the controller
> setup for I2C configured DSI bridges.
> 
> This patch updates the DSI host initialization by calling host to init
> from bridge pre_enable as the bridge pre_enable API is invoked by core
> as it is common across all classes of DSI device drivers.
> 
> The host init during pre_enable is conditional and not invoked for Exynos
> as existing downstream drm panels and bridges in Exynos are expecting
> the host initialization during DSI transfer.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Although this probably needs to be revisited.
