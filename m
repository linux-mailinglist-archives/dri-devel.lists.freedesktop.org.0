Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B77A8AFC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A841810E531;
	Wed, 20 Sep 2023 17:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A75A10E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:56:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6E38186BE1;
 Wed, 20 Sep 2023 19:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695232598;
 bh=v9ctbSa6+X3M+pofEXhCjN2ZqkfsWRMCu6w2Udy3yjA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rJjuV92cbXq3nWR+D5Cf8t9Q6elbrXKNAKhFZYDLmFi4I+1MEjv5UXkXNS0I6KX5O
 OSaiq3j/EO9wtes/mwCaX9IHWEWBTdrFL/z/epmdHv59nhcRPwuYJV2acKVTtt4OIo
 wf+wY3Qpp8Qrg8HeOtWC/xRUgG+hHGSEbQ4kt1g7a0I1IpQsVatJRtJ9eUjlY0/eLu
 5D27t0S9QZI1aXcIqvpbvt4hw40yItC3CFJLLic0ydCGGe3J0Cd2XrGBQO5T+0ZZ/Z
 5NrX46fQWH44NzS+tZE/vNWNHgmggVfQMdwerqCOHWyEnBaB/fH4xXO1M1ZVy9LNHg
 k2sbkGaeYdmDg==
Message-ID: <c01540fa-b99a-96d8-95f9-aae582afcf80@denx.de>
Date: Wed, 20 Sep 2023 19:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/5] drm: lcdif: move pitch setup to plane atomic update
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-5-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230920103126.2759601-5-l.stach@pengutronix.de>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/20/23 12:31, Lucas Stach wrote:
> The buffer pitch may change when switching the buffer on a
> atomic update. As the register is double buffered it can be
> safely changed while the display is active.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 33a082366b25..3ebf55d06027 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -327,19 +327,6 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
>   	writel(CTRLDESCL0_1_HEIGHT(m->vdisplay) |
>   	       CTRLDESCL0_1_WIDTH(m->hdisplay),
>   	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> -
> -	/*
> -	 * Undocumented P_SIZE and T_SIZE bitfields written in the downstream
> -	 * driver. Those bitfields control the AXI burst size. As of now there
> -	 * are two known values:
> -	 *  1 - 128Byte
> -	 *  2 - 256Byte
> -	 * Downstream sets this to 256B burst size to improve the memory access
> -	 * efficiency so set it here too.
> -	 */
> -	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> -	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
> -	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
>   }
>   
>   static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> @@ -689,6 +676,19 @@ static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
>   		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
>   		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
>   	}
> +
> +	/*
> +	 * Undocumented P_SIZE and T_SIZE bitfields written in the downstream
> +	 * driver. Those bitfields control the AXI burst size. As of now there
> +	 * are two known values:
> +	 *  1 - 128Byte
> +	 *  2 - 256Byte
> +	 * Downstream sets this to 256B burst size to improve the memory access
> +	 * efficiency so set it here too.
> +	 */
> +	writel(CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> +	       CTRLDESCL0_3_PITCH(new_pstate->fb->pitches[0]),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
>   }
>   
>   static bool lcdif_format_mod_supported(struct drm_plane *plane,

Reviewed-by: Marek Vasut <marex@denx.de>
