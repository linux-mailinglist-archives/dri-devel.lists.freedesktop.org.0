Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D2CED0BF
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 14:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5E410E0DA;
	Thu,  1 Jan 2026 13:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CM/Xe6rR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5D210E0DA
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 13:30:50 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b79e7112398so2019688966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767274249; x=1767879049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYFcWOoKq+KBoqMm8CjRRZHSPMnEotpFNX6puxiVQPQ=;
 b=CM/Xe6rRClzs0gcUHXHXa69RHb8Ds4mR0y5j4kf0ydtwqIDlHqHV4xijjxJkFWj+TR
 bmzJSLuXu9WcQvkyTtXw/9KsjpS7dSUc2ndQ188ABMHef3VONp1Jo7tHlKDsUuzqXtRE
 62T15MuWbnJhx4yqq4M3ShzFoPbn9F+9U7VU3jAcJYTr0aSwrjxBT3bnEQ34DidEIaDf
 Z8yzrAJbOMtib0RxtaF+7A1iARTN18E2WvkIz4pR477ic7ETeqb9tOepMX483pL8vDtG
 0vO1C2Ej+/6FVsnbDYiaRkq5vIoPXJFefIPhL6iEBVAQyr/ZtZs/DXnjPH6T4gawIdG2
 5o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767274249; x=1767879049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nYFcWOoKq+KBoqMm8CjRRZHSPMnEotpFNX6puxiVQPQ=;
 b=sGExgeloohwWbQLaShRU5OKFNaWR+C3XrN+oMBwYsJhDWC5pRZ+o2vsHrsW5srBnLv
 i4h2TzlmIC0xu30MXA0XHOQdz/VMPBsBNbF2A0zRncyZXbX1QeH8gVqtbCw6b+6bmAKd
 3gT5oChkYwCdCrpXZjJs+VggOMnroKg3UaFDyjlJb5zn/82eHCUyTN45VUIOXgpsfPLT
 iSgVbUNaO1DrkyspO2wuEvRzTEZGaE5ves3FaI+nk3NiauIdvJ4RqSXfHfVgcy86J9Hr
 63uy06x9T9WQ9RwuoZPMKMDa+WiBvKbSaaHadSwC7LT8pmLJ7Hvp5SltWuhYe7rH02bQ
 14ZA==
X-Gm-Message-State: AOJu0YwD4v8troVozzeUrNyhYy+r30WDHQQlZMyUdsIe1S/B1sXzK/qd
 rtFyOx8DViKoUDxhaE4hElekCfyYaxDJh1RqnOOyH4J5wDTBddVCkYqUVGT5eg==
X-Gm-Gg: AY/fxX7KBGEHIW6DLqSwgU5Kx8566HCBHwcP+JXMceRlY6H1umatBmh5qjWdyXW4pok
 lPlnUS2cBV+kp0JkKtZQvE3/gnlo7IFE8VCVAjPunVx6uH0rPdfwmMpUdZO4+Nrq51qkBe4JguN
 geqHhR5qM6oGN/nBtnKdEdJTWz7c+s7KXIjYIHFOIlsdhyY6FjdXIl+KBu3zCP9vmOktGvBe3Cb
 N2f0viuLt1vBOCVAJb8iZssyrlia3tnLi046DIinTJ8iKmvM+TBt/On6iTg0yf0uX3MVSSqd9sK
 PlJNY/91C6YAiPsrTdu01RMUOt0rmT/tpIeVynvyjD5+fiGFxWQckg+I9bw3UQA8/NTZ1voTFFg
 uVqdSA/8aff7z745OZWCD77V84KArqauZVp+ir6mby6Yg3S7/QS3jxUuehvAM7DVokQd6A8r5OQ
 L2Jk/CQJFu1T39hR9UCdloqKNS3aHf2NDUo03yfv9YwhZsUJMsjnbY
X-Google-Smtp-Source: AGHT+IHSjWs9CYZhcvdj5cVVkaLc3zVulfavOSCCOSt0EHKf4IbpPpsINQxiuTLxCgXpJTSjqhF04w==
X-Received: by 2002:a05:600c:350b:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-47d1958ef07mr422127645e9.29.1767267743033; 
 Thu, 01 Jan 2026 03:42:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19362345sm691419225e9.6.2026.01.01.03.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 03:42:22 -0800 (PST)
Date: Thu, 1 Jan 2026 11:42:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
Message-ID: <20260101114221.6a401790@pumpkin>
In-Reply-To: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Dec 2025 15:56:10 +0100
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:

> Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
> in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
> is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
> in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
> is passed to __ffs() to calculate back the divider out of the value again.
> 
> Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
> function and call the function from both rcar_mipi_dsi_parameters_calc()
> and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
> and avoid unnecessarily storing the divider value in setup_info at all.
> 
> This rework has a slight side-effect, in that it should allow the compiler
> to better evaluate the code and avoid compiler warnings about variable
> value overflows, which can never happen.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 35 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 4ef2e3c129ed7..875945bf8255b 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -84,7 +84,6 @@ struct dsi_setup_info {
>  	unsigned long fout;
>  	u16 m;
>  	u16 n;
> -	u16 vclk_divider;
>  	const struct dsi_clk_config *clkset;
>  };
>  
> @@ -335,10 +334,24 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
>   * Hardware Setup
>   */
>  
> +static unsigned int rcar_mipi_dsi_vclk_divider(struct rcar_mipi_dsi *dsi,
> +					       struct dsi_setup_info *setup_info)
> +{
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_V3U:
> +	default:
> +		return (setup_info->clkset->vco_cntrl >> 4) & 0x3;
> +
> +	case RCAR_DSI_V4H:
> +		return (setup_info->clkset->vco_cntrl >> 3) & 0x7;
> +	}
> +}
> +
>  static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>  				   unsigned long fin_rate,
>  				   unsigned long fout_target,
> -				   struct dsi_setup_info *setup_info)
> +				   struct dsi_setup_info *setup_info,
> +				   u16 vclk_divider)

There is no need for this to be u16, unsigned int will generate better code.

>  {
>  	unsigned int best_err = -1;
>  	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>  			if (fout < info->fout_min || fout > info->fout_max)
>  				continue;
>  
> -			fout = div64_u64(fout, setup_info->vclk_divider);
> +			fout = div64_u64(fout, vclk_divider);

Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
So pass the bit number instead.

>  
>  			if (fout < setup_info->clkset->min_freq ||
>  			    fout > setup_info->clkset->max_freq)
> @@ -390,7 +403,9 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	unsigned long fout_target;
>  	unsigned long fin_rate;
>  	unsigned int i;
> +	unsigned int div;
>  	unsigned int err;
> +	u16 vclk_divider;
>  
>  	/*
>  	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
> @@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  
>  	fin_rate = clk_get_rate(clk);
>  
> +	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
> +
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
>  	default:
> -		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +		vclk_divider = BIT_U32(div);
>  		break;
>  
>  	case RCAR_DSI_V4H:
> -		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +		vclk_divider = BIT_U32(div + 1);
>  		break;
>  	}
>  
> -	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
>  
>  	/* Find hsfreqrange */
>  	setup_info->hsfreq = setup_info->fout * 2;
> @@ -439,7 +456,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	dev_dbg(dsi->dev,
>  		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
>  		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
> -		setup_info->vclk_divider, setup_info->fout, fout_target,
> +		vclk_divider, setup_info->fout, fout_target,
>  		err / 100, err % 100);
>  
>  	dev_dbg(dsi->dev,
> @@ -653,11 +670,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
>  	default:
> -		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
> +		vclkset |= VCLKSET_DIV_V3U(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));

What is going on here?
	rcar_mipi_dsi_vclk_divider() is (setup_info->clkset->vco_cntrl >> 4) & 0x3
	VCLKSET_DIV_V3U(n)		FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
	VCLKSET_DIV_V3U_MASK is		GENMASK_U32(5, 4)
Looks like a very complicated way of saying:
		vclkset |= setup_info->clkset->vco_cntrl & VCLKSET_DIV_V3U_MASK;

It might be a semi-accident that the bit numbers match.
But I also suspect it is also semi-deliberate.

>  		break;
>  
>  	case RCAR_DSI_V4H:
> -		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> +		vclkset |= VCLKSET_DIV_V4H(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));

That one looks like it needs the 'subtract one' done somewhere.
Maybe:
		vclkset |= (setup_info->clkset->vco_cntrl - (1u << 3)) &
			VCLKSET_DIV_V4U_MASK;
Although you may want to write the '8' in a different (longer) way :-)

	David
			
>  		break;
>  	}
>  

