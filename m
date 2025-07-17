Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB4B08967
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 11:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C6710E13F;
	Thu, 17 Jul 2025 09:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="bqWLdI83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1531A10E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:37:40 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56H9b60e2705714;
 Thu, 17 Jul 2025 04:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752745026;
 bh=grVloWar2O621fo+lHDBYQS6zJaquwGGstUgJpQKtxI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=bqWLdI83FpU0lpfxPEaArnuH/G6gIqCUioxaySxEYehblTjj1rEGffjtNwJhNDC7x
 GIGPl4rGSOjYyF4bWbpIai6ox4QPEhcWgWDjeceje+nkyXfR7ddQB6M6jipgM7OcoW
 IaK4tvBOmfm1d4DyTRiUjKIlH6ujF0GWx2n1Hg/A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56H9b5Io2698835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 17 Jul 2025 04:37:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 04:37:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 04:37:05 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56H9awA31949552;
 Thu, 17 Jul 2025 04:36:59 -0500
Message-ID: <8728de80-f154-46fa-a8a6-da40cb5fdc65@ti.com>
Date: Thu, 17 Jul 2025 15:06:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/17] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, Francesco Dolcini <francesco@dolcini.it>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Parth Pancholi
 <parth.pancholi@toradex.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-17-862c841dbe02@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-17-862c841dbe02@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi

Thanks for the patch.

On 18/06/25 15:29, Tomi Valkeinen wrote:
> While the cdns-dsi does not support DSI burst mode, the burst mode is
> essentially DSI event mode with more versatile clocking and timings.
I don't fully agree with this statement, DSI burst mode and DSI event 
mode are two different things having separate requirements. DSI burst 
mode maps to MIPI_DSI_MODE_VIDEO_BURST. I don't see a separate flag for 
event mode but I guess,

> Thus cdns-dsi doesn't need to fail if the DSI peripheral driver requests
> MIPI_DSI_MODE_VIDEO_BURST.

MIPI_DSI_MODE_VIDEO_BURST is currently not supported by the cadence DSI 
host driver, so only if DSI peripheral driver is saying that burst mode 
is the only one it supports in that case only we should fail.

> 
> In my particular use case, this allows the use of ti-sn65dsi83 driver.
> 
> Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
> Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 114d883c65dc..09b289f0fcbf 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1052,10 +1052,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
>   	if (output->dev)
>   		return -EBUSY;
>   
> -	/* We do not support burst mode yet. */
> -	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> -		return -ENOTSUPP;
> -

Removing this check also gives a false impression that burst mode is 
supported by the driver and can also lead to failures too in case device 
is only supporting burst mode.

I think it makes sense to fail only if burst mode is the only one being 
supported by the device, something like below should work I believe,

if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST == 
MIPI_DSI_MODE_VIDEO_BURST)
		return -ENOTSUPP;

Regards
Devarsh

>   	/*
>   	 * The host <-> device link might be described using an OF-graph
>   	 * representation, in this case we extract the device of_node from
> 
