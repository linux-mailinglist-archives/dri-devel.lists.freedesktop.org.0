Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186437DE279
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 15:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCD110E712;
	Wed,  1 Nov 2023 14:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3581010E712
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 14:52:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6609D8D;
 Wed,  1 Nov 2023 15:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698850340;
 bh=2N+rxYBjTg0nbZrq/+syijKoKFja+UWUxR5qLWephfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uhS2zwvCPuVJv5mmxHrxR9FU/isx+0Dey/e5AuJssAZNV1lz5yzw3eeEENdp/8nqa
 FvgE5Tinsj3zZOaOQm/d1XhR0vfCAzoNj8B/MdITsZdU/BnSnVn9gHqKC+E5mRO3th
 +DC6MKUOa76mC9E8hxQp9vF9VwnLAGqyLdvuoIdk=
Date: Wed, 1 Nov 2023 16:52:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 09/10] drm/tidss: IRQ code cleanup
Message-ID: <20231101145243.GY12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-9-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-9-45149e0f9415@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 01, 2023 at 11:17:46AM +0200, Tomi Valkeinen wrote:
> The IRQ setup code is overly complex. All we really need to do is
> initialize the related fields in struct tidss_device, and request the
> IRQ.
> 
> We can drop all the HW accesses, as they are pointless: the driver will
> set the IRQs correctly when it needs any of the IRQs, and at probe time
> we have done a reset, so we know that all the IRQs are masked by default
> in the hardware.

Even for K2G ?

> Thus we can combine the tidss_irq_preinstall() and
> tidss_irq_postinstall() into the tidss_irq_install() function, drop the
> HW accesses, and drop the use of spinlock, as this is done at init time
> and there can be no races.
> 
> We can also drop the HW access from the tidss_irq_uninstall(), as the
> driver will anyway disable and suspend the hardware at remove time.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c |  2 ++
>  drivers/gpu/drm/tidss/tidss_irq.c | 54 ++++++---------------------------------
>  2 files changed, 10 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 64914331715a..37693f30d98b 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -138,6 +138,8 @@ static int tidss_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, tidss);
>  
> +	spin_lock_init(&tidss->wait_lock);
> +
>  	ret = dispc_init(tidss);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize dispc: %d\n", ret);
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
> index 0c681c7600bc..604334ef526a 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -93,33 +93,21 @@ void tidss_irq_resume(struct tidss_device *tidss)
>  	spin_unlock_irqrestore(&tidss->wait_lock, flags);
>  }
>  
> -static void tidss_irq_preinstall(struct drm_device *ddev)
> -{
> -	struct tidss_device *tidss = to_tidss(ddev);
> -
> -	spin_lock_init(&tidss->wait_lock);
> -
> -	tidss_runtime_get(tidss);
> -
> -	dispc_set_irqenable(tidss->dispc, 0);
> -	dispc_read_and_clear_irqstatus(tidss->dispc);
> -
> -	tidss_runtime_put(tidss);
> -}
> -
> -static void tidss_irq_postinstall(struct drm_device *ddev)
> +int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
>  {
>  	struct tidss_device *tidss = to_tidss(ddev);
> -	unsigned long flags;
> -	unsigned int i;
> +	int ret;
>  
> -	tidss_runtime_get(tidss);
> +	if (irq == IRQ_NOTCONNECTED)
> +		return -ENOTCONN;
>  
> -	spin_lock_irqsave(&tidss->wait_lock, flags);
> +	ret = request_irq(irq, tidss_irq_handler, 0, ddev->driver->name, ddev);
> +	if (ret)
> +		return ret;
>  
>  	tidss->irq_mask = DSS_IRQ_DEVICE_OCP_ERR;
>  
> -	for (i = 0; i < tidss->num_crtcs; ++i) {
> +	for (unsigned int i = 0; i < tidss->num_crtcs; ++i) {
>  		struct tidss_crtc *tcrtc = to_tidss_crtc(tidss->crtcs[i]);
>  
>  		tidss->irq_mask |= DSS_IRQ_VP_SYNC_LOST(tcrtc->hw_videoport);
> @@ -127,28 +115,6 @@ static void tidss_irq_postinstall(struct drm_device *ddev)
>  		tidss->irq_mask |= DSS_IRQ_VP_FRAME_DONE(tcrtc->hw_videoport);
>  	}
>  
> -	tidss_irq_update(tidss);
> -
> -	spin_unlock_irqrestore(&tidss->wait_lock, flags);
> -
> -	tidss_runtime_put(tidss);
> -}
> -
> -int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
> -{
> -	int ret;
> -
> -	if (irq == IRQ_NOTCONNECTED)
> -		return -ENOTCONN;
> -
> -	tidss_irq_preinstall(ddev);
> -
> -	ret = request_irq(irq, tidss_irq_handler, 0, ddev->driver->name, ddev);
> -	if (ret)
> -		return ret;
> -
> -	tidss_irq_postinstall(ddev);
> -
>  	return 0;
>  }
>  
> @@ -156,9 +122,5 @@ void tidss_irq_uninstall(struct drm_device *ddev)
>  {
>  	struct tidss_device *tidss = to_tidss(ddev);
>  
> -	tidss_runtime_get(tidss);
> -	dispc_set_irqenable(tidss->dispc, 0);
> -	tidss_runtime_put(tidss);
> -
>  	free_irq(tidss->irq, ddev);
>  }
> 

-- 
Regards,

Laurent Pinchart
