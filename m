Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C2F651BD0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 08:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A9710E08A;
	Tue, 20 Dec 2022 07:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 578 seconds by postgrey-1.36 at gabe;
 Tue, 20 Dec 2022 07:42:12 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354AE10E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 07:42:12 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id AEEBC5C03AF;
 Tue, 20 Dec 2022 08:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1671521520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/z0MB0ZIFP6aeujFH0p44anRHbnTFFLRrIGfOtCkCsA=;
 b=wgXLk1fPwI5tusswIE/FVXABCqdMsTd4Ewelb8wZZfeqOiyccCdgwwMycuAL9xayASQ5OP
 NPl6uRIVPAqWR3ncZNOHxYkBz9ZHZQJKSUf2V1sxdsTKuqrAAmgiWFIEth433dZFi6IG9F
 84bJ8jwNDilNZ+t8o29aIl5LA+nVjVU=
MIME-Version: 1.0
Date: Tue, 20 Dec 2022 08:32:00 +0100
From: Stefan Agner <stefan@agner.ch>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/fsl-dcu: Remove redundant error logging
In-Reply-To: <Y5Wwo6Gr1rJOdf3B@qemulion>
References: <Y5Wwo6Gr1rJOdf3B@qemulion>
Message-ID: <cbc2c587a04324f807a9c3d8d221f289@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Alison Wang <alison.wang@nxp.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-11 11:27, Deepak R Varma wrote:
> A call to platform_get_irq() already prints an error on failure within
> its own implementation. So printing another error based on its return
> value in the caller is redundant and should be removed. The clean up
> also makes if condition block braces unnecessary. Remove that as well.
> 
> Issue identified using platform_get_irq.cocci coccicheck script.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
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
