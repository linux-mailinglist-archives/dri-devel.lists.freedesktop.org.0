Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B15232B5D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 07:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9C96E852;
	Thu, 30 Jul 2020 05:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865866E852
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 05:30:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7FC9E80472;
 Thu, 30 Jul 2020 07:30:09 +0200 (CEST)
Date: Thu, 30 Jul 2020 07:30:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/ingenic: ipu: Remove YUV422 from supported
 formats on JZ4725B
Message-ID: <20200730053008.GB1429781@ravnborg.org>
References: <20200730014626.83895-1-paul@crapouillou.net>
 <20200730014626.83895-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730014626.83895-3-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=v78H7Btl7ZNRre8BH3sA:9
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 03:46:25AM +0200, Paul Cercueil wrote:
> When configuring the IPU for packed YUV 4:2:2, depending on the scaling
> ratios given by the source and destination resolutions, it is possible
> to crash the IPU block beyond repair, to the point where a software
> reset of the IP does not fix it.

"beyond repair" - I read this as the HW is fried and you cannot make it
work again whatsoever.
Here it is stated that a software reset does not fix it.
If a power cycle fixes it please state so - both here and in the comment
in the code below. So people are not scared away and think they will
damage their HW.

	Sam

This can happen anytime, in the first
> few frames, or after dozens of minutes. The same crash also happens when
> the IPU is fully controlled by the LCD controller (in that case no HW
> register is written at any moment after startup), which points towards a
> hardware bug.
> 
> Thanksfully multiplanar YUV is not affected.
> 
> Until this bug is fixed or worked around, address this issue by removing
> support for YUV 4:2:2 on the IPU of the JZ4725B.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-ipu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 7eae56fa92ea..f4f0abcd6692 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -795,10 +795,16 @@ static int ingenic_ipu_remove(struct platform_device *pdev)
>  }
>  
>  static const u32 jz4725b_ipu_formats[] = {
> +	/*
> +	 * While officially supported, packed YUV 4:2:2 formats can cause
> +	 * random hardware crashes on JZ4725B, beyond repair, under certain
> +	 * circumstances. It seems to happen with some specific resize ratios.
> +	 * Until a proper workaround or fix is found, disable these formats.
>  	DRM_FORMAT_YUYV,
>  	DRM_FORMAT_YVYU,
>  	DRM_FORMAT_UYVY,
>  	DRM_FORMAT_VYUY,
> +	*/
>  	DRM_FORMAT_YUV411,
>  	DRM_FORMAT_YUV420,
>  	DRM_FORMAT_YUV422,
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
