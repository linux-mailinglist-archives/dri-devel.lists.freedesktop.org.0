Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FB5FC56D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D3510E471;
	Wed, 12 Oct 2022 12:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A4710E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 12:35:55 +0000 (UTC)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3E794D3;
 Wed, 12 Oct 2022 14:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665578154;
 bh=SABepyC6xSzkfB6VOqh+GnwmvujnNWZ7ncgar8IFJdw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qi05bfq/gn7Xb0QkKBWcTU9IFqq8zn04oe7yBc7LirX5PdjJumR7PCkJeB86JP8yA
 I6YjpuKkKIgyYchDY20gT2W+5UBXYS9KLDOgDsR19WAUsbPXJMG2WtTatKqbMqUdPl
 IHWFC0MiImG/wKX6fWoO4N94a0z+wqBZSR2WU33E=
Message-ID: <7df3e5bc-8d37-5f55-1666-9ea88f0c59ce@ideasonboard.com>
Date: Wed, 12 Oct 2022 15:35:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH v5 6/6] drm/tidss: Enable Dual and Duplicate Modes for
 OLDI
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-7-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220928175223.15225-7-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 20:52, Aradhya Bhatia wrote:
> The AM625 DSS IP contains 2 OLDI TXes which can work to enable 2
> duplicated displays of smaller resolutions or enable a single Dual Link
> display with a higher resolution (1920x1200).
> 
> Configure the necessary register to enable and disable the OLDI TXes
> with necessary modes configurations.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 68444e0cd8d7..fd7f49535f0c 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1003,8 +1003,8 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
>   	int count = 0;
>   
>   	/*
> -	 * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
> -	 * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
> +	 * For the moment MASTERSLAVE, and SRC bits of DISPC_VP_DSS_OLDI_CFG are
> +	 * set statically to 0.
>   	 */

While at it, maybe say "are always set to 0". At least to me that's much 
more understandable.

>   
>   	if (fmt->data_width == 24)
> @@ -1021,6 +1021,30 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
>   
>   	oldi_cfg |= BIT(0); /* ENABLE */
>   
> +	switch (dispc->oldi_mode) {
> +	case OLDI_MODE_OFF:
> +		oldi_cfg &= ~BIT(0); /* DISABLE */

Hmm, do we call this if OLDI_MODE_OFF? The current code always enabled 
OLDI here, so I presume we call this only when we actually want to 
enable it.

> +		break;
> +
> +	case OLDI_SINGLE_LINK_SINGLE_MODE:
> +		/* All configuration is done for this mode.  */
> +		break;
> +
> +	case OLDI_SINGLE_LINK_CLONE_MODE:
> +		oldi_cfg |= BIT(5); /* CLONE MODE */
> +		break;
> +
> +	case OLDI_DUAL_LINK_MODE:
> +		oldi_cfg |= BIT(11); /* DUALMODESYNC */
> +		oldi_cfg |= BIT(3); /* data-mapping field also indicates dual-link mode */
> +		break;
> +
> +	default:
> +		dev_warn(dispc->dev, "%s: Incorrect oldi mode. Returning.\n",
> +			 __func__);
> +		return;
> +	}
> +
>   	dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>   
>   	while (!(oldi_reset_bit & dispc_read(dispc, DSS_SYSSTATUS)) &&

