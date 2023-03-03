Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FFE6A9BDE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 17:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1011110E6FF;
	Fri,  3 Mar 2023 16:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C34710E6FF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 16:39:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F06E085D4B;
 Fri,  3 Mar 2023 17:39:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1677861589;
 bh=TN7NnFQ2txDIeFfMl3uXWT5MmtmyknvQI0VggkpKraw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=axscIPKiSKYU3IIc3IZaW81sdBLbq5gqFeSeGzc63BqpneLMJ3eNkOFynwrc0orje
 9Av/Qq9Wjh7XgSf+aKNAu21WPoKSCR4Yc2Rmq9m5HXpLQxuG85cVSSYhh9p0FPP4Xz
 xOa9kwmhycJdFJO0n35t2xiSHvU6ocDAh7ZIwBFICvG9HcgnzbodRT6nZvD26dsj6M
 I+LDnhafS+/eBRWgqe95P1X7AN+VQOFYguNlzVpO4Vxc5MMlAvLvZ7lXXCwqDq2za1
 NF1bQyD6PNRVZL87PwIL3egq/8NS7Ed/fbBVr/3iUBRUYYPu5+bdEaBs5ipjHnJze/
 4W68PEYpieofA==
Message-ID: <384a9d83-cf4e-34c8-bee6-073edfd4683c@denx.de>
Date: Fri, 3 Mar 2023 17:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v15 01/16] drm: exynos: dsi: Drop explicit call to bridge
 detach
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-2-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230303145138.29233-2-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/23 15:51, Jagan Teki wrote:
> Exynos DSI already converted into a bridge driver, so bridge
> detach will suppose happened during bridge chain removal done
> by the bridge core.
> 
> Drop the explicit call chain to detach the bridge.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v15, v13, v12, v11:
> - none
> Changes for v10:
> - new patch
> 
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 06d6513ddaae..df15501b1075 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_device *drm = dsi->encoder.dev;
>   
> -	if (dsi->out_bridge->funcs->detach)
> -		dsi->out_bridge->funcs->detach(dsi->out_bridge);
>   	dsi->out_bridge = NULL;
>   
>   	if (drm->mode_config.poll_enabled)

Considering also the discussion in v15 12/16

Reviewed-by: Marek Vasut <marex@denx.de>
