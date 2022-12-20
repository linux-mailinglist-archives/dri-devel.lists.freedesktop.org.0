Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125E652DE6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB310E420;
	Wed, 21 Dec 2022 08:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F57310E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 13:04:17 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82A6056D;
 Tue, 20 Dec 2022 14:04:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671541456;
 bh=ZvxB9T70TZ+qvTHqWsyTCrDs0kOqGqkVtT2zxrsKU+M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hfe8povylTwTJG50jVH0Tn86842ASz9JpSTsbusSKKZes9PP6XL5b5jd/sDohCNTq
 vyb1DV8if6dwIrMQ37CmKoPNnxvP2rjgWz59tfsW8UG/PgasyHhqBQvWWwB1FG+N57
 FjRtiEzmfPSgLw0YXs9+kWhWajNsiJo2fq6HYRA4=
Message-ID: <84977593-4671-7582-d5f2-cf69755f1145@ideasonboard.com>
Date: Tue, 20 Dec 2022 15:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/5] drm/tidss: Enable Dual and Duplicate Modes for OLDI
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
 <20221119173019.15643-6-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221119173019.15643-6-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/11/2022 19:30, Aradhya Bhatia wrote:
> The AM625 DSS IP contains 2 OLDI TXes which can work together to enable 2
> cloned displays of or even a single dual-link display with higher
> resolutions like WUXGA (1920x1200@60fps) with a reduced OLDI clock
> frequency.
> 
> Configure the necessary register to enable and disable the OLDI TXes
> with required modes configurations.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index f26129fb1d8f..cf43de6216a5 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1012,8 +1012,8 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
>   	int count = 0;
>   
>   	/*
> -	 * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
> -	 * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
> +	 * For the moment MASTERSLAVE, and SRC bits of DISPC_VP_DSS_OLDI_CFG are
> +	 * always set to 0.
>   	 */
>   
>   	if (fmt->data_width == 24)
> @@ -1030,6 +1030,26 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
>   
>   	oldi_cfg |= BIT(0); /* ENABLE */
>   
> +	switch (dispc->oldi_mode) {
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

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

