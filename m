Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916087AF1E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9296610EE8B;
	Wed, 13 Mar 2024 18:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fLAQ/CSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92B410EE8B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:17:47 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33e9ba0eadcso51922f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710353866; x=1710958666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxB79hpmOYEV/Wa5xEjs3BbB8JPGXY5M54cM2DcOGjk=;
 b=fLAQ/CSxpRc9R+Tb4PPQZXZUYwTTaiZhCUOrq13mqjv6lQXfJhIoeFVGnAfGQrqB9m
 v4DZawDkt7BMYP96sRNiIzQxQtecMfd+58GneyHrY2trMoj9+8y/rvklHS1QVMyGpDhD
 7Q/JSxPm/s96K3uYU8gHKH8wLKZtgw7gbVtO6IOrhN6iRwahSwtaaVAjhEDb/GbtAW/w
 inYuaiA/iTeu1sX4TFqZdPTNaWttH94zhxeBAUGKg0BbKPqT4RBSU90YoEP+E/TwEBRY
 ub3tWeD6q378vuAw806OV5lE0r6/n8VOlck+FrJYz4NMS3MmZ+n5B9P1WZrCnbbZtSN/
 ovYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710353866; x=1710958666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxB79hpmOYEV/Wa5xEjs3BbB8JPGXY5M54cM2DcOGjk=;
 b=lHnil6l0NM3qg/zoIveWTsXvUBNIVnV+Lh8Lsie+5vEuPoF8KM3hbs+COs6JTTalsB
 q6TBhyC6xO20qXlBgOOJw9XiZp7i2BCa3rQ4h2ICA6OTxqYNfURzDP5Ov4EOvYZxYbwV
 tEOe4ti0RxCq86loydv4d5QZStHOS1eYmRncrlwOgWmVW7S9LC3ck2h/UuPrf7QKLlHk
 wsTyuaj5kz9XGtb9PJeFYcdpu1UT86cQRu0en2p8ufzRnMFofrPv3R4w3ERUwXSET/oo
 E76NBDsp9ulmV/4DSfO1NdqAoCXmkm8qBhwEqCoEMFJIjnxMXGWywi5Mw7zeCRFSO+z4
 jXHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpRgE2Hb/kFCdD6rKhxgtSFdhvEWtw2pYsCBh3iG1ytmK8cMBIVXft0yMdnimwMoVgmYYr7qe9yalRNcwB/qC71/T1euRd9P3EkacvfkNT
X-Gm-Message-State: AOJu0Yyh2M3DPZMPsOHj7DOZJMXl+o14OjLOdt9NTmkeFjIvWf4DTMrT
 HHgP0qRPvCBxn7pFrbTRNEaF0vzvRrLm5VdsCwh9GhvABYgViL4+
X-Google-Smtp-Source: AGHT+IGKbeIwigUlBRsdMhJK7OomlBsIup1DbJY8unvtALG2eksaRqlMkijulA70G2ebsv8fF6clmw==
X-Received: by 2002:a5d:644d:0:b0:33e:7896:a9d7 with SMTP id
 d13-20020a5d644d000000b0033e7896a9d7mr2108713wrw.67.1710353865784; 
 Wed, 13 Mar 2024 11:17:45 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 ch9-20020a5d5d09000000b0033eab3520a9sm4381264wrb.43.2024.03.13.11.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 11:17:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and maximum
 rate
Date: Wed, 13 Mar 2024 19:17:43 +0100
Message-ID: <3210009.5fSG56mABF@jernej-laptop>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Dne nedelja, 10. marec 2024 ob 14:21:11 CET je Frank Oltmanns napisal(a):
> The Allwinner SoC's typically have an upper and lower limit for their
> clocks' rates. Up until now, support for that has been implemented
> separately for each clock type.
> 
> Implement that functionality in the sunxi-ng's common part making use of
> the CCF rate liming capabilities, so that it is available for all clock
> types.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Cc: stable@vger.kernel.org

This looks pretty nice now.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_common.h |  3 +++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
> index 8babce55302f..ac0091b4ce24 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -44,6 +44,16 @@ bool ccu_is_better_rate(struct ccu_common *common,
>  			unsigned long current_rate,
>  			unsigned long best_rate)
>  {
> +	unsigned long min_rate, max_rate;
> +
> +	clk_hw_get_rate_range(&common->hw, &min_rate, &max_rate);
> +
> +	if (current_rate > max_rate)
> +		return false;
> +
> +	if (current_rate < min_rate)
> +		return false;
> +
>  	if (common->features & CCU_FEATURE_CLOSEST_RATE)
>  		return abs(current_rate - target_rate) < abs(best_rate - target_rate);
>  
> @@ -122,6 +132,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
>  
>  	for (i = 0; i < desc->hw_clks->num ; i++) {
>  		struct clk_hw *hw = desc->hw_clks->hws[i];
> +		struct ccu_common *common = hw_to_ccu_common(hw);
>  		const char *name;
>  
>  		if (!hw)
> @@ -136,6 +147,14 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
>  			pr_err("Couldn't register clock %d - %s\n", i, name);
>  			goto err_clk_unreg;
>  		}
> +
> +		if (common->max_rate)
> +			clk_hw_set_rate_range(hw, common->min_rate,
> +					      common->max_rate);
> +		else
> +			WARN(common->min_rate,
> +			     "No max_rate, ignoring min_rate of clock %d - %s\n",
> +			     i, name);
>  	}
>  
>  	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
> index 942a72c09437..329734f8cf42 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -31,6 +31,9 @@ struct ccu_common {
>  	u16		lock_reg;
>  	u32		prediv;
>  
> +	unsigned long	min_rate;
> +	unsigned long	max_rate;
> +
>  	unsigned long	features;
>  	spinlock_t	*lock;
>  	struct clk_hw	hw;
> 
> 




