Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A05ED16F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA610E1BB;
	Wed, 28 Sep 2022 00:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7710E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:12:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7ED8784DF9;
 Wed, 28 Sep 2022 02:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664323940;
 bh=SAQ3HIj52OZ1ShnpJWdI7kriDpGDTOkcDA31l1Uy5b8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y18Yd70cb900JUU/WvSg9LwROxySsaBA3jFc8LznznMyFE51jE8IfIKxsQupj8S5p
 1innVE2nWYEoV+o1az/kYSzOwcBngPbWfd3wDJLyh6Pj1eXrVfuIshZz/Cok64qtQ+
 UVHzbBBJn148asOU1ztVgK95nRIl68f5BFeoR3irc+bnaDZ45Px8T6V7UwaPFoLfz5
 ETCzQZdyWIcINmK/bo1+Zwn2QVqg0C3krMMjONnyZpfJuCMrO41fwXzDmz8jo2xlGd
 dlMIYpFsbeKwJkOfvzEs94vnTmQlQ0RIN3A5MOdJQllwZuiQyJDCVFV6fCNdt3kFwf
 N+kZ3IJzCzA4w==
Message-ID: <303e8be8-41a6-e63f-f2f5-6fc3271886ed@denx.de>
Date: Wed, 28 Sep 2022 02:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-4-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220927233821.8007-4-laurent.pinchart@ideasonboard.com>
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

On 9/28/22 01:38, Laurent Pinchart wrote:
> Up to and including v1.3, HDMI supported limited quantization range only
> for YCbCr. HDMI v1.4 introduced selectable quantization ranges, but this
> features isn't supported in the dw-hdmi driver that is used in
> conjunction with the LCDIF in the i.MX8MP. The HDMI YCbCr output is thus
> always advertised in the AVI infoframe as limited range.
> 
> The LCDIF driver, on the other hand, configures the CSC to produce full
> range YCbCr. This mismatch results in loss of details and incorrect
> colours. Fix it by switching to limited range YCbCr.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 1f22ea5896d5..ba84b51598b3 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -53,16 +53,16 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
>   		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
>   		       lcdif->base + LCDC_V8_DISP_PARA);
>   
> -		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> -		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
>   		       lcdif->base + LCDC_V8_CSC0_COEF0);
> -		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> +		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
>   		       lcdif->base + LCDC_V8_CSC0_COEF1);
> -		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
>   		       lcdif->base + LCDC_V8_CSC0_COEF2);
> -		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
>   		       lcdif->base + LCDC_V8_CSC0_COEF3);
> -		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
>   		       lcdif->base + LCDC_V8_CSC0_COEF4);
>   		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
>   		       lcdif->base + LCDC_V8_CSC0_COEF5);

Would it make sense to use the same coeffs as csc2_coef_bt601_lim in 
drivers/media/platform/nxp/imx-pxp.c , since the block is most likely 
identical ?
