Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178C91A1372
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 20:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4976E8C6;
	Tue,  7 Apr 2020 18:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1976E8C6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 18:18:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6FAD8804D5;
 Tue,  7 Apr 2020 20:18:06 +0200 (CEST)
Date: Tue, 7 Apr 2020 20:18:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] video: fbdev: don't print error message on
 platform_get_irq() failure
Message-ID: <20200407181805.GC6356@ravnborg.org>
References: <20200406053450.8380-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406053450.8380-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=R5C9hjxsAAAA:8
 a=X_j5bIVzEBSOzoI8NEYA:9 a=CjuIK1q_8ugA:10 a=KpS7wOGxO9l4JKx0McS0:22
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
Cc: alexandre.belloni@bootlin.com, b.zolnierkie@samsung.com,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tang Bin

On Mon, Apr 06, 2020 at 01:34:50PM +0800, Tang Bin wrote:
> The platform_get_irq() can print error message,so remove the redundant
> dev_err() here.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index d567f5d56..1e2521925 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1114,7 +1114,6 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
>  
>  	sinfo->irq_base = platform_get_irq(pdev, 0);
>  	if (sinfo->irq_base < 0) {
> -		dev_err(dev, "unable to get irq\n");
>  		ret = sinfo->irq_base;
>  		goto stop_clk;
>  	}

Thanks, applied to drm-misc-next. The fix will appear in kernel 5.8

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
