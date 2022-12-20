Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD03652DF4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11010E42F;
	Wed, 21 Dec 2022 08:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D660910E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 13:02:12 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6CE456D;
 Tue, 20 Dec 2022 14:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671541331;
 bh=lNwpBXMbmhBLeOzbMEaPW9nHJmZ7obkuA7HfGtvKB5k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KnN0Qq3h6/7NCd4ZEtfGAuj7BYpCsqPwRLFQaXqPD2L8fDIk9bpuLDrdVr9PNWpOP
 QKL+fjTm7D26zqJd7EnfQvbhVKeowGTJNSpzxVFqQqAUb+jVhm2A6HRVRnGPhyveo+
 yLus0JXYHAfhhkmI4f0cI7piV65lWgAHs44EWxn8=
Message-ID: <0cde4a68-220a-915b-c8df-6f3b8f23d486@ideasonboard.com>
Date: Tue, 20 Dec 2022 15:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 4/5] drm/tidss: Add IO CTRL and Power support for OLDI
 TX in am625
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
 <20221119173019.15643-5-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221119173019.15643-5-a-bhatia1@ti.com>
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

Hi,

On 19/11/2022 19:30, Aradhya Bhatia wrote:
> The ctrl mmr module of the AM625 is different from the AM65X SoC. Thus
> the ctrl mmr registers that supported the OLDI TX power have become
> different in AM625 SoC.
> 
> Add IO CTRL support and control the OLDI TX power for AM625.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c      | 55 ++++++++++++++++++------
>   drivers/gpu/drm/tidss/tidss_dispc_regs.h | 37 +++++++++++-----
>   2 files changed, 70 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 472226a83251..f26129fb1d8f 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -930,21 +930,52 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
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
> +		val = power ? 0 : AM65X_OLDI_PWRDN_TX;
> +
> +		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT0_IO_CTRL,
> +				   AM65X_OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT1_IO_CTRL,
> +				   AM65X_OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT2_IO_CTRL,
> +				   AM65X_OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT3_IO_CTRL,
> +				   AM65X_OLDI_PWRDN_TX, val);
> +		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_CLK_IO_CTRL,
> +				   AM65X_OLDI_PWRDN_TX, val);
> +
> +	} else if (dispc->feat->subrev == DISPC_AM625) {
> +		if (power) {
> +			switch (dispc->oldi_mode) {
> +			case OLDI_SINGLE_LINK_SINGLE_MODE:
> +				/* Power down OLDI TX 1 */
> +				val = AM625_OLDI1_PWRDN_TX;
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
> +				val = AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX;
> +				break;
> +			}
> +		} else {
> +			/* Power down both the OLDI TXes */
> +			val = AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX;
> +		}
> +
> +		regmap_update_bits(dispc->oldi_io_ctrl, AM625_OLDI_PD_CTRL,
> +				   AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX, val);
> +	}
>   }
>   
>   static void dispc_set_num_datalines(struct dispc_device *dispc,
> @@ -2841,7 +2872,7 @@ int dispc_init(struct tidss_device *tidss)
>   		dispc->vp_data[i].gamma_table = gamma_table;
>   	}
>   
> -	if (feat->subrev == DISPC_AM65X) {
> +	if (feat->oldi_supported) {
>   		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
>   		if (r)
>   			return r;

I think it makes more sense to test the SoC version here, rather than 
the generic "oldi_supported". And if the same function is used for 
am625, maybe rename the func to "_am6xx_".

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

