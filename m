Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE15FC54C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499E10E459;
	Wed, 12 Oct 2022 12:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11A010E459
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 12:29:45 +0000 (UTC)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42C864D3;
 Wed, 12 Oct 2022 14:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665577783;
 bh=FkBCv6pEvsGGQqHOfNJdbLxsNAfo7ByjcETs+0FV8AQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UdoUWbG1UZr3SiMqrKWoL+LkDVtWju/PBA7ZEx6RIh9BCdoUQ5qjH6zYl3/5Xp9Ke
 uZ9zryUClhATO4npOY8580r+g8fezLS68ldLmgrdSg0ZlDb5/k3H6k1EVuEKckzL7f
 TEBIJXgIKbZATPIGmH7WODzKRm8wl8elYGdaMx+w=
Message-ID: <708ae70e-dc1b-1079-8442-06cbea228e99@ideasonboard.com>
Date: Wed, 12 Oct 2022 15:29:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH v5 5/6] drm/tidss: Add IO CTRL and Power support for
 OLDI TX in am625
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-6-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220928175223.15225-6-a-bhatia1@ti.com>
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
> The ctrl mmr module of the AM625 is different from the AM65X SoC. Thus
> the ctrl mmr registers that supported the OLDI TX power have become
> different in AM625 SoC.
> 
> Add IO CTRL support and control the OLDI TX power for AM625.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c      | 55 ++++++++++++++++++------
>   drivers/gpu/drm/tidss/tidss_dispc_regs.h |  6 +++
>   2 files changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 88008ad39b55..68444e0cd8d7 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -921,21 +921,52 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
>   
>   static void dispc_oldi_tx_power(struct dispc_device *dispc, bool power)
>   {
> -	u32 val = power ? 0 : OLDI_PWRDN_TX;
> +	u32 val;
>   
>   	if (WARN_ON(!dispc->oldi_io_ctrl))
>   		return;
>   
> -	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
> -			   OLDI_PWRDN_TX, val);
> -	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
> -			   OLDI_PWRDN_TX, val);
> -	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
> -			   OLDI_PWRDN_TX, val);
> -	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
> -			   OLDI_PWRDN_TX, val);
> -	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
> -			   OLDI_PWRDN_TX, val);
> +	if (dispc->feat->subrev == DISPC_AM65X) {
> +		val = power ? 0 : OLDI_PWRDN_TX;
> +
> +		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
> +				   OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
> +				   OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
> +				   OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
> +				   OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
> +				   OLDI_PWRDN_TX, val);
> +
> +	} else if (dispc->feat->subrev == DISPC_AM625) {
> +		if (power) {
> +			switch (dispc->oldi_mode) {
> +			case OLDI_SINGLE_LINK_SINGLE_MODE:
> +				/* Power down OLDI TX 1 */
> +				val = OLDI1_PWRDN_TX;
> +				break;
> +
> +			case OLDI_SINGLE_LINK_CLONE_MODE:
> +			case OLDI_DUAL_LINK_MODE:
> +				/* No Power down */
> +				val = 0;
> +				break;
> +
> +			default:
> +				/* Power down both the OLDI TXes */
> +				val = OLDI0_PWRDN_TX | OLDI1_PWRDN_TX;
> +				break;
> +			}
> +		} else {
> +			/* Power down both the OLDI TXes */
> +			val = OLDI0_PWRDN_TX | OLDI1_PWRDN_TX;
> +		}

Ugh, I hate power-down bits. So you "enable" it to disable it =). What's 
the default value or the register here? Or will this always be called? 
I.e. if we only use DPI, do we power down the OLDIs somewhere (or does 
it matter)?

> +
> +		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_PD_CTRL,
> +				   OLDI0_PWRDN_TX | OLDI1_PWRDN_TX, val);
> +	}
>   }
>   
>   static void dispc_set_num_datalines(struct dispc_device *dispc,
> @@ -2831,7 +2862,7 @@ int dispc_init(struct tidss_device *tidss)
>   		dispc->vp_data[i].gamma_table = gamma_table;
>   	}
>   
> -	if (feat->subrev == DISPC_AM65X) {
> +	if (feat->subrev == DISPC_AM65X || feat->subrev == DISPC_AM625) {
>   		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
>   		if (r)
>   			return r;
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> index 13feedfe5d6d..510bee70b3b8 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> @@ -238,6 +238,12 @@ enum dispc_common_regs {
>   #define OLDI_DAT3_IO_CTRL			0x0C
>   #define OLDI_CLK_IO_CTRL			0x10
>   
> +/* Only for AM625 OLDI TX */
> +#define OLDI_PD_CTRL				0x100
> +#define OLDI_LB_CTRL				0x104
> +
>   #define OLDI_PWRDN_TX				BIT(8)
> +#define OLDI0_PWRDN_TX				BIT(0)
> +#define OLDI1_PWRDN_TX				BIT(1)

Maybe these (the new and old ones) should be platform-prefixed. And 
organized so that the register and its bits are together.

  Tomi

