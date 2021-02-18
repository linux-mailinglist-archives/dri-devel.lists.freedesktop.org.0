Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BD731EBEA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDB789FDD;
	Thu, 18 Feb 2021 15:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD00189FDD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ff+FTU7SvLmNZ/JPL30ui7Ao9Mqdc2Jbqcc1xF/9yas=; b=ma0atgC7QBf0qx5N8R8Ev9iHZU
 unW0n/HdlduFQrc9zegOT7nig+wkP4QbTKp1AQwsGwXan/AxZAYVgF7gfFkatCDfzNLCOBsoXYsMk
 FoJ3g4HhtUTDk0voh/tXVYLHWtKMttRiwYQ/kVoEAXYCz8rRHN6uoyhxGArPjf5B4ObAjO1H6ooCr
 cBjs5DzVx/1kUJ52xt4lxAG94sq1LWO61BNXfmQUGALs3L5a5nbZx2uRkS+fBlP9CWShmcHb8JaRu
 cIjyKr8WZlBw1Z44qlNkrE79y0qqobJI/bkEsZqyMe58wynYGLFExI4KnSMqGXnqAlVr2OmLC+jTR
 QcGpuXxg==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1lClhn-0001oI-1J; Thu, 18 Feb 2021 17:59:03 +0200
MIME-Version: 1.0
Date: Thu, 18 Feb 2021 17:59:00 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/tilcdc: replace spin_lock_irqsave by spin_lock in
 hard IRQ
In-Reply-To: <1612751576-42512-1-git-send-email-tiantao6@hisilicon.com>
References: <1612751576-42512-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <309972c40d497d70e3c5959dca2a32d2@iki.fi>
X-Sender: jyri.sarha@iki.fi
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-08 4:32, Tian Tao wrote:
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

I merge to this drm-misc-next soon.

Best regards,
Jyri

> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index 3021370..b3e38e9 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -904,13 +904,12 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc 
> *crtc)
>  	tilcdc_clear_irqstatus(dev, stat);
> 
>  	if (stat & LCDC_END_OF_FRAME0) {
> -		unsigned long flags;
>  		bool skip_event = false;
>  		ktime_t now;
> 
>  		now = ktime_get();
> 
> -		spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
> +		spin_lock(&tilcdc_crtc->irq_lock);
> 
>  		tilcdc_crtc->last_vblank = now;
> 
> @@ -920,21 +919,21 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc 
> *crtc)
>  			skip_event = true;
>  		}
> 
> -		spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, flags);
> +		spin_unlock(&tilcdc_crtc->irq_lock);
> 
>  		drm_crtc_handle_vblank(crtc);
> 
>  		if (!skip_event) {
>  			struct drm_pending_vblank_event *event;
> 
> -			spin_lock_irqsave(&dev->event_lock, flags);
> +			spin_lock(&dev->event_lock);
> 
>  			event = tilcdc_crtc->event;
>  			tilcdc_crtc->event = NULL;
>  			if (event)
>  				drm_crtc_send_vblank_event(crtc, event);
> 
> -			spin_unlock_irqrestore(&dev->event_lock, flags);
> +			spin_unlock(&dev->event_lock);
>  		}
> 
>  		if (tilcdc_crtc->frame_intact)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
