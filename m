Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C47A8AFD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A46910E530;
	Wed, 20 Sep 2023 17:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA1A10E525
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:56:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7567A86BDE;
 Wed, 20 Sep 2023 19:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695232597;
 bh=Dego5ZFECI6K8hlnXLU1eWaBL362exYmkDXYRqbegG4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d18ccH+Lef0eMuIiVDtTjSuQcsC1yimo+uAxtzyM/Hj2RE2GC9nrNVaIpqYt87bCA
 p9SjF/95ji94KZTaVVEH93Ge6ODaX4d5jINgyZtZt6TJS679IA675P0Z7uKgOsQ/oH
 qPY1L6pvTTfetMEIBWE+M67XY/fGaddk2Owakbr/hYiiftHsFTbATq7Th9fWh1F1WP
 XXdCvceN4IpunX7zM5CTFRyDgTFjSMmKvDKG7b74FT9UFoSssWmoteiqLm0H0zc6Ht
 VYdR81eb4xHnz3Hh2OXQ2MB4KEgqKUujQzZVCTtc7Ty7HY3xDj4acma563ctPLAuL7
 9urTdY0uQqI6A==
Message-ID: <73aa0552-f3d3-d15d-5f60-c0eb4cfe07a4@denx.de>
Date: Wed, 20 Sep 2023 19:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/5] drm: lcdif: remove superfluous setup of framebuffer
 DMA address
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-4-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230920103126.2759601-4-l.stach@pengutronix.de>
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
> Now that the plane state is fully programmed into the hardware before
> the scanout is started there is no need to program the plane framebuffer
> DMA address from the CRTC atomic_enable anymore.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 4acf6914a8d1..33a082366b25 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -541,7 +541,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
>   									    crtc->primary);
>   	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
>   	struct drm_device *drm = lcdif->drm;
> -	dma_addr_t paddr;
>   
>   	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
>   
> @@ -549,15 +548,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
>   
> -	/* Write cur_buf as well to avoid an initial corrupt frame */
> -	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> -	if (paddr) {
> -		writel(lower_32_bits(paddr),
> -		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> -		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> -		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> -	}
> -
>   	drm_crtc_vblank_on(crtc);
>   }

Reviewed-by: Marek Vasut <marex@denx.de>
