Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928185ED276
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 03:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0091A10E163;
	Wed, 28 Sep 2022 01:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1335F10E163
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 01:09:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 46D02836C5;
 Wed, 28 Sep 2022 03:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664327352;
 bh=AHdNn/SjX0xhnu6XjIAgTwKx7NtQADE/truQMBaxWyk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i5PuXu8Fth5K7HYOFVNWPz7c3nU+OZRu8aJzvFVHUvip9CXbn1z6pmdC2CTvE0bcl
 sxIhYk6R87RvD7ubMaHsGV3GWmOcBf3odvxqsPREWoyLcxekxU9KiK2H+tw07dVV7M
 AUKHzAa33RBdfDjxPaSVydYkPFDBrGK8MLVxQd6n+y5LYkYOztgnJBF8VVRuU+P9ap
 6KfYgh1g0h4zfFapDEA9rC8IQaNLsoxzIIA67E4uW7tmPJR3adFYqBxfopxNui2cif
 kq+FrBQ68kho91u9gPQfLYf5QUwp1BrdATiIqyMcXbzYI7E975qZUZzkvmcRlsrJeY
 6wMl94Jq6UQ6A==
Message-ID: <10cec491-f27d-5084-cfca-bbf9c0ec0cb6@denx.de>
Date: Wed, 28 Sep 2022 03:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 02:58, Laurent Pinchart wrote:

[...]

> +	/*
> +	 * The CSC differentiates between "YCbCr" and "YUV", but the reference
> +	 * manual doesn't detail how they differ. Experiments showed that the
> +	 * luminance value is unaffected, only the calculations involving chroma
> +	 * values differ. The YCbCr mode behaves as expected, with chroma values
> +	 * being offset by 128. The YUV mode isn't fully understood.
> +	 */
> +	if (!in_yuv && out_yuv) {
> +		/* RGB -> YCbCr */
> +		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> +		       lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
> +		       lcdif->base + LCDC_V8_CSC0_COEF0);
> +		writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
> +		       lcdif->base + LCDC_V8_CSC0_COEF1);
> +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
> +		       lcdif->base + LCDC_V8_CSC0_COEF2);
> +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
> +		       lcdif->base + LCDC_V8_CSC0_COEF3);
> +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
> +		       lcdif->base + LCDC_V8_CSC0_COEF4);
> +		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF5);

Would it make sense to turn the above ^ into a nice coeffs table like 
the lcdif_yuv2rgb_coeffs table used in the else if branch below ?

> +	} else if (in_yuv && !out_yuv) {
> +		/* YCbCr -> RGB */
> +		const u32 *coeffs =
> +			lcdif_yuv2rgb_coeffs[plane_state->color_encoding]
> +					    [plane_state->color_range];
> +
> +		writel(CSC0_CTRL_CSC_MODE_YCbCr2RGB,
> +		       lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +		writel(coeffs[0], lcdif->base + LCDC_V8_CSC0_COEF0);
> +		writel(coeffs[1], lcdif->base + LCDC_V8_CSC0_COEF1);
> +		writel(coeffs[2], lcdif->base + LCDC_V8_CSC0_COEF2);
> +		writel(coeffs[3], lcdif->base + LCDC_V8_CSC0_COEF3);
> +		writel(coeffs[4], lcdif->base + LCDC_V8_CSC0_COEF4);
> +		writel(coeffs[5], lcdif->base + LCDC_V8_CSC0_COEF5);
> +	} else {
> +		/* RGB -> RGB, YCbCr -> YCbCr: bypass colorspace converter. */
> +		writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> +	}
>   }
>   
>   static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)

[...]

> @@ -469,6 +593,11 @@ static const u64 lcdif_modifiers[] = {
>   
>   int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>   {
> +	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601)
> +				      | BIT(DRM_COLOR_YCBCR_BT709)
> +				      | BIT(DRM_COLOR_YCBCR_BT2020);
> +	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE)
> +				   | BIT(DRM_COLOR_YCBCR_FULL_RANGE);

Nitpick, is the | operator in front OK, or should it be at the end of 
the line ?

Besides those nitpicks:

Reviewed-by: Marek Vasut <marex@denx.de>
