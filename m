Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B876D72CD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 06:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8298E10E056;
	Wed,  5 Apr 2023 04:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DA310E056
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 04:00:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40241905;
 Wed,  5 Apr 2023 06:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680667228;
 bh=AHIsH12us0GQXr96+co1pM5tm6f1rwXMYmg/pzvTPKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pooJfr1XDvgME43QEgTlYSUpVUYybfLU0cWmbZr7oDqvCrthUz0qvO+CV5VboHV1Y
 O+dTxiMHIdV/bt2cbr5wOAPTgYB0thySLTlGuJPERoz2wMISGAaMv6aeYDydy3EH60
 /GRJwLeqUl8/zAV4afqGU+dio76Eoz17bkcD/vjc=
Date: Wed, 5 Apr 2023 07:00:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 4/5] drm: shmobile: Add missing call to
 drm_fbdev_generic_setup()
Message-ID: <20230405040035.GJ9915@pendragon.ideasonboard.com>
References: <cover.1680273039.git.geert+renesas@glider.be>
 <fd4cf33c68fd103228cf4e6d76959827b187230b.1680273039.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd4cf33c68fd103228cf4e6d76959827b187230b.1680273039.git.geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Mar 31, 2023 at 04:48:10PM +0200, Geert Uytterhoeven wrote:
> Set up generic fbdev emulation, to enable support for the Linux console.
> 
> Use 16 as the preferred depth, as that is a good compromise between
> colorfulness and resource utilization, and the default of the fbdev
> driver.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index faacfee24763b1d4..30493ce874192e3e 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_module.h>
>  #include <drm/drm_probe_helper.h>
> @@ -271,6 +272,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_irq_uninstall;
>  
> +	drm_fbdev_generic_setup(ddev, 16);
> +
>  	return 0;
>  
>  err_irq_uninstall:

-- 
Regards,

Laurent Pinchart
