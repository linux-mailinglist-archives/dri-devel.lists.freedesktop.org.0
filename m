Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50423651478
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 21:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729F10E302;
	Mon, 19 Dec 2022 20:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6510E302
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 20:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671483295; bh=s1sQlm2kQ9grw8/lPjD8fVTCLGUGSAtcnGN7RJNWehY=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=B//zdFtnztVdGIAFg4MqqivQx36REsseZtlYZrGDsWfdCax8Ubb+XuF2qrIW1GFiT
 g+1IfTuuUHuWwKxSAGXJjdncksET5PFJw6D8UT4VYd5cyyk+1lJtNMFflChm1R3BDb
 LMneWYdAM0RUJT00YXAhVxaEVgeuDyyRVfuzrteA=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 19 Dec 2022 21:54:55 +0100 (CET)
X-EA-Auth: +xRRt2MufM8h78N2MJA9ct698ssjJ4j4PxrVbxeoZq07KNYf0g4LxEcigp3kTT9WpdEEFVAj78EU1GHr/d8GEKOOvFQINCSM
Date: Tue, 20 Dec 2022 02:24:50 +0530
From: Deepak R Varma <drv@mailo.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fsl-dcu: Remove redundant error logging
Message-ID: <Y6DPmlBgNGeH+TvU@qemulion>
References: <Y5Wwo6Gr1rJOdf3B@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5Wwo6Gr1rJOdf3B@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 11, 2022 at 03:57:47PM +0530, Deepak R Varma wrote:

Hello,
May I please request a review and feedback on this patch proposal?

Thank you,
./drv

> A call to platform_get_irq() already prints an error on failure within
> its own implementation. So printing another error based on its return
> value in the caller is redundant and should be removed. The clean up
> also makes if condition block braces unnecessary. Remove that as well.
>
> Issue identified using platform_get_irq.cocci coccicheck script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 8579c7629f5e..1ba7d95e1956 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -272,10 +272,8 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>  	}
>
>  	fsl_dev->irq = platform_get_irq(pdev, 0);
> -	if (fsl_dev->irq < 0) {
> -		dev_err(dev, "failed to get irq\n");
> +	if (fsl_dev->irq < 0)
>  		return fsl_dev->irq;
> -	}
>
>  	fsl_dev->regmap = devm_regmap_init_mmio(dev, base,
>  			&fsl_dcu_regmap_config);
> --
> 2.34.1
>


