Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32CC9B3BF
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 11:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11D410E382;
	Tue,  2 Dec 2025 10:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iIn386uI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F232910E382
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 10:56:08 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-64080ccf749so7797460a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 02:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764672967; x=1765277767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ehri81yPiQwv2TtMVBNaIP6q+no9/49Tq7gYw/RdK/w=;
 b=iIn386uI/hxfK19PwqcDWjXwA1nkjdnjKSkTB78BiHe2ztr4KuSq+MVFpHlVOondTH
 +T0eSQepfMfqdudWQWoiIFZoQwymqfQozgMtL8CVtjmyrqDXI/NI447VXF53EZuHxse5
 HdJXTHic8Ks3YHE6SuLlEYMjBmBk9+oQW6VB+ZUWZgu+hFbB6OXPowbOJf+16uRqG9Wy
 QYC9zghAHK0nOy+cEgItx/qMcsWHV0FPmmtN29Z97cgFFpB5sKqE07QH974jRxVYTNfB
 u7lEMhtIBuyYgSu4TvV2fNtwW12G2rPoxHm4W7e5Xn/nQFyGM8oliqQCxfK7HHX+VXHb
 HwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764672967; x=1765277767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ehri81yPiQwv2TtMVBNaIP6q+no9/49Tq7gYw/RdK/w=;
 b=uieWcCV7kMiO2MRnNhjutgwaG6Orr1c+rI44TCPFgTsWaT+s5VgO0spFpQFk1u0ENQ
 85BIhprotVh4c4OccBU4EKGyRadiV6s9UmB0Bw2IIXyJxW5FQqoH6GcLJQbfmepT7gfy
 5eYHYN27uFBXDGYAYxGbbx1DgNVEYapJFiuSD6fbHcxv+v01VRerGh0U+hnwHHGdWpQF
 zwOHv9pKdnkdwqpsQZZeYpB5cPiy5ggbqOztbahH1PwIZ9MO1M3ZEIpI5/DQd7WsZcIQ
 zstSArPPoSlP2r2pAIroIb7hYrk39ofIIygxrKt5dA6IMSiHxWI0QHPGdL133Z0H+y0j
 GlkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+DjiFd2+eA/TpGm3D6ABIkpP+0AivoR2mkLi/TOH51YDd+2VJgl0Bjl1tatNsEYOKIPIPyszy2j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgri4DONs8PRzECzqzX3kBgHjfOmc7f2ZPzr6iDtmTA8x3ZrLN
 fRtrcAoE+twgyikXRwechKxJk0/9MBm3XV09eKjtLLRq05SZC5ghGAVF
X-Gm-Gg: ASbGncs0E2kuOrykCCxPmcmJ7/rl7EZRQt2WrvRtcgHK5NBma3odwWFnp6HA/0RRZni
 ZVUYdmUs8rmHROYaMLreId5D/1sT73JYhHst0c17epytNsybCdFeFX2PiWNFTiH68Gbu3c9Qe+3
 G17GN3lVR9/Mo+yCEPfvs9aPm0wjGTi03XGR7l71Tv5hqB8loAv1jDJMgygyTk7oHp9MgD+RrMc
 LhWzoSv3RiBGwTVWydcw4ub4uLfjO/NfdHuSnQLwhEYqmKDnh8FrEwae8EiAdQIGX8DloZY/b2x
 fCGAI/uZEnJPBqGQpOwC2qALSXxzkw1SDrMtc3XqmaG06oZVrhMEjVbFCjEvtmdTzrvIouQRYzH
 9BhFA2g6VJV7l+coI2hjFHJEmbFt2LEoYWXJwnFEYm+N93CB30dNH8D2SgnGYDLsj5YjSotY0M6
 qmIxFOI2Yehh1flO+ho0VTH0va9dlcUDKSLPvl0fMxMx6CMJqCAA==
X-Google-Smtp-Source: AGHT+IGDWo9fAKrIqK6pOzWcubTiXGsGXBZvWB+hJAa+IdynlbdlFuxAhEoOWusf+Q1ptI8yJnHO7A==
X-Received: by 2002:a05:6402:4405:b0:640:c95c:be17 with SMTP id
 4fb4d7f45d1cf-64555cd8ccfmr40873221a12.16.1764672967228; 
 Tue, 02 Dec 2025 02:56:07 -0800 (PST)
Received: from [10.251.131.228] (93-44-9-97.ip94.fastwebnet.it. [93.44.9.97])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751061e14sm16962796a12.31.2025.12.02.02.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 02:56:06 -0800 (PST)
Message-ID: <19d4abb7-551b-4c86-aee0-a3ae7b054ba9@gmail.com>
Date: Tue, 2 Dec 2025 11:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Philippe Schenker <philippe.schenker@impulsing.ch>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
References: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 27/11/2025 09:42, Luca Ceresoli wrote:
> On hardware based on Toradex Verdin AM62 the recovery mechanism added by
> commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery
> mechanism") has been reported [0] to make the display turn on and off and
> and the kernel logging "Unexpected link status 0x01".
> 
> According to the report, the error recovery mechanism is triggered by the
> PLL_UNLOCK error going active. Analysis suggested the board is unable to
> provide the correct DSI clock neede by the SN65DSI84, to which the TI
> SN65DSI84 reacts by raising the PLL_UNLOCK, while the display still works
> apparently without issues.
> 
> On other hardware, where all the clocks are within the components
> specifications, the PLL_UNLOCK bit does not trigger while the display is in
> normal use. It can trigger for e.g. electromagnetic interference, which is
> a transient event and exactly the reason why the error recovery mechanism
> has been implemented.
> 
> Idelly the PLL_UNLOCK bit could be ignored when working out of
> specification, but this requires to detect in software whether it triggers
> because the device is working out of specification but visually correctly
> for the user or for good reasons (e.g. EMI, or even because working out of
> specifications but compromising the visual output).
> 
> The ongoing analysis as of this writing [1][2] has not yet found a way for
> the driver to discriminate among the two cases. So as a temporary measure
> mask the PLL_UNLOCK error bit unconditionally.
> 
> [0] https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42
> [1] https://lore.kernel.org/all/b71e941c-fc8a-4ac1-9407-0fe7df73b412@gmail.com/
> [2] https://lore.kernel.org/all/20251125103900.31750-1-francesco@dolcini.it/
> 
> Closes: https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42
> Cc: stable@vger.kernel.org # 6.15+
> Co-developed-by: Hervé Codina <herve.codina@bootlin.com>
> Signed-off-by: Hervé Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Francesco, Emanuele, João: can you please apply this patch and report
> whether the display on the affected boards gets back to working as before?
> 
> Cc: João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>
> Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 033c44326552..fffb47b62f43 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -429,7 +429,14 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
>  	 */
>  
>  	ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> -	if (ret || irq_stat) {
> +
> +	/*
> +	 * Some hardware (Toradex Verdin AM62) is known to report the
> +	 * PLL_UNLOCK error interrupt while working without visible
> +	 * problems. In lack of a reliable way to discriminate such cases
> +	 * from user-visible PLL_UNLOCK cases, ignore that bit entirely.
> +	 */
> +	if (ret || irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK) {
>  		/*
>  		 * IRQ acknowledged is not always possible (the bridge can be in
>  		 * a state where it doesn't answer anymore). To prevent an
> @@ -654,7 +661,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>  	if (ctx->irq) {
>  		/* Enable irq to detect errors */
>  		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
> -		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
> +		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff & ~REG_IRQ_EN_CHA_PLL_UNLOCK_EN);
>  	} else {
>  		/* Use the polling task */
>  		sn65dsi83_monitor_start(ctx);
> 
> ---
> base-commit: c884ee70b15a8d63184d7c1e02eba99676a6fcf7
> change-id: 20251126-drm-ti-sn65dsi83-ignore-pll-unlock-4a28aa29eb5c
> 
> Best regards,

Hi Luca,
the display works correctly with this patch, thanks!

Kind regards.

Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
