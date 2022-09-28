Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCA5ED3FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 06:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250D310E250;
	Wed, 28 Sep 2022 04:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F4F10E250
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 04:44:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7EEA4847FF;
 Wed, 28 Sep 2022 06:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664340263;
 bh=FdUBlRQRSdzw0m7u2CK01elPLVjRQEMH1sVFiWNR/+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hy+hGVUuMvNd0f3LxLGmTDZFt/T28hsFU7ehDLwiAjb7uDATBKkCwNtNHLspvQ0fi
 sfFzuQor0Kx6LTuWebdviklZlzN1UiyGp7Xbu9WVl5Hp+kuOxPXfXw0n9teyAr+1kN
 +tSoHZnuPLonwvQALZJSb1/py+w6uhCM3Q0+hNy5/xZXUtdDtC154/RblFcAx5nweR
 ztD0qWNgyYf31IsZhMqvqANoOhyGkZ3aqqFSJZKdte+smCefqzFh1cFsCphJ01TcDn
 7uNzvSvW9S00lXsUfDRrKlNf/7oewG00O4LPboYk/+JAFebtZT6XvMr78aAeqabBfu
 QkrOPdtHHca5w==
Message-ID: <3238a605-884c-1e09-47c0-d41ba82d1c12@denx.de>
Date: Wed, 28 Sep 2022 06:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
 <10cec491-f27d-5084-cfca-bbf9c0ec0cb6@denx.de>
 <YzOpbC2+cTFcfB0b@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YzOpbC2+cTFcfB0b@pendragon.ideasonboard.com>
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
 Daniel Scally <dan.scally@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 03:54, Laurent Pinchart wrote:
> Hi Marek,

Hi,

>>> +	/*
>>> +	 * The CSC differentiates between "YCbCr" and "YUV", but the reference
>>> +	 * manual doesn't detail how they differ. Experiments showed that the
>>> +	 * luminance value is unaffected, only the calculations involving chroma
>>> +	 * values differ. The YCbCr mode behaves as expected, with chroma values
>>> +	 * being offset by 128. The YUV mode isn't fully understood.
>>> +	 */
>>> +	if (!in_yuv && out_yuv) {
>>> +		/* RGB -> YCbCr */
>>> +		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
>>> +		       lcdif->base + LCDC_V8_CSC0_CTRL);
>>> +
>>> +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
>>> +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
>>> +		       lcdif->base + LCDC_V8_CSC0_COEF0);
>>> +		writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
>>> +		       lcdif->base + LCDC_V8_CSC0_COEF1);
>>> +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
>>> +		       lcdif->base + LCDC_V8_CSC0_COEF2);
>>> +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
>>> +		       lcdif->base + LCDC_V8_CSC0_COEF3);
>>> +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
>>> +		       lcdif->base + LCDC_V8_CSC0_COEF4);
>>> +		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
>>> +		       lcdif->base + LCDC_V8_CSC0_COEF5);
>>
>> Would it make sense to turn the above ^ into a nice coeffs table like
>> the lcdif_yuv2rgb_coeffs table used in the else if branch below ?
> 
> I thought about that, and decided to leave it as-is given that only one
> encoding and quantization range is supported. It could be nice to fix
> this, but it would then involve work in the dw-hdmi driver to select the
> quantization through the AVI infoframe, as well as more work here to
> pick a default based on the device capabilites reported through EDID.
> I've decided not to explore that rabbit hole :-)
> 
> This being said, the coefficients could be moved to a table already even
> without support for multiple encodings or ranges. Feel free to add a
> patch on top, I'll review it :-)

I'll just add it to the end of my todo list ...

>>> +	} else if (in_yuv && !out_yuv) {
>>> +		/* YCbCr -> RGB */
>>> +		const u32 *coeffs =
>>> +			lcdif_yuv2rgb_coeffs[plane_state->color_encoding]
>>> +					    [plane_state->color_range];
>>> +
>>> +		writel(CSC0_CTRL_CSC_MODE_YCbCr2RGB,
>>> +		       lcdif->base + LCDC_V8_CSC0_CTRL);
>>> +
>>> +		writel(coeffs[0], lcdif->base + LCDC_V8_CSC0_COEF0);
>>> +		writel(coeffs[1], lcdif->base + LCDC_V8_CSC0_COEF1);
>>> +		writel(coeffs[2], lcdif->base + LCDC_V8_CSC0_COEF2);
>>> +		writel(coeffs[3], lcdif->base + LCDC_V8_CSC0_COEF3);
>>> +		writel(coeffs[4], lcdif->base + LCDC_V8_CSC0_COEF4);
>>> +		writel(coeffs[5], lcdif->base + LCDC_V8_CSC0_COEF5);
>>> +	} else {
>>> +		/* RGB -> RGB, YCbCr -> YCbCr: bypass colorspace converter. */
>>> +		writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
>>> +	}
>>>    }
>>>    
>>>    static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
>>
>> [...]
>>
>>> @@ -469,6 +593,11 @@ static const u64 lcdif_modifiers[] = {
>>>    
>>>    int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>>>    {
>>> +	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601)
>>> +				      | BIT(DRM_COLOR_YCBCR_BT709)
>>> +				      | BIT(DRM_COLOR_YCBCR_BT2020);
>>> +	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE)
>>> +				   | BIT(DRM_COLOR_YCBCR_FULL_RANGE);
>>
>> Nitpick, is the | operator in front OK, or should it be at the end of
>> the line ?
> 
> I'll move it to the end of the line.

Thanks. Let's wait a bit for the other reviews and then let's apply this 
all.
