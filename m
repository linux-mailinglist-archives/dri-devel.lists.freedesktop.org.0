Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4997A8AFB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F160710E52C;
	Wed, 20 Sep 2023 17:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC54610E525
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:56:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6CA3886BD2;
 Wed, 20 Sep 2023 19:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695232596;
 bh=zGSG+wQzXiReh5w92CS90m/6oNkexVzRGdXMFeGJshg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fVo7cOL+xBKWOLOdhDxX1rjXigBtoBcGgD025Bu4BCRdSjUkR8kKom6b9+D4Eqbcw
 y6qMZSFe3ALkv8I39p/WrECqEgaEm5iBLQ52nfoqYo6sz2vSvYtIqfRGqadnCktX88
 vKHNu9VL+N1qG6m3lZex9C4TWeSLY5UcOZ1jJNnTA66Meelub+E9ZIeG+anQPLz5D1
 dAfS9kb6r2f+6UTLud/HkoDBD0FZVbpaHkKHwkjtgEMTbFNcfJvMqrmQgyx/tXa4Ta
 XvxS1F9dTgThi7w8CPSCaps/SDRb/73jRZQ2LCPsKvZrks9zFdl3yCCNW5wAaV2wTl
 y3aECCkYklU6g==
Message-ID: <ef70eae2-97df-b244-a20e-3d7ec543365e@denx.de>
Date: Wed, 20 Sep 2023 19:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-3-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230920103126.2759601-3-l.stach@pengutronix.de>
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
> Allow drm_atomic_helper_commit_tail_rpm to setup all the plane
> state before the scanout is started.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index f5bfe8b52920..4acf6914a8d1 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -505,6 +505,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>   static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
>   				    struct drm_atomic_state *state)
>   {
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
>   	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
>   	struct drm_pending_vblank_event *event;
>   	u32 reg;
> @@ -513,6 +515,9 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
>   	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
>   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
>   
> +	if (drm_atomic_crtc_needs_modeset(crtc_state))
> +		lcdif_enable_controller(lcdif);
> +
>   	event = crtc->state->event;
>   	crtc->state->event = NULL;
>   
> @@ -552,7 +557,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
>   		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
>   		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
>   	}
> -	lcdif_enable_controller(lcdif);
>   
>   	drm_crtc_vblank_on(crtc);
>   }

Reviewed-by: Marek Vasut <marex@denx.de>
