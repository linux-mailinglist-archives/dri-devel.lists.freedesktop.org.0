Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E1A90D86
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CE810E9C0;
	Wed, 16 Apr 2025 20:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="CZ1BIkRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9694410E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 20:59:47 +0000 (UTC)
Date: Wed, 16 Apr 2025 16:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744837185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8Bbmvo4tKj5C4VL396l1mOEtkspO81djcj9UwqnEqU=;
 b=CZ1BIkRcDtnE3ZAKKbqB/V18JWsOvqYkhrDQnt+JxuvW0vple7/+cH/3qOVV0pXw7/uH3k
 qhJ8cgc3v+2Z3hulF0ARbwYJjt8QRAjk69ZWALAqefm/MOKoDRXxBaCgWjAQ8oArQKhdc8
 wfoS7NUIBuz+BcX/k/Nb/A4bNRGC/xMYebUsbtj168V0Ho/hB96o89rl++/Houxh7LQoqk
 8XxOT+O+qvM/uQbp3Ma9h/lhXOSxxN3j4AniP1jMh2S47mqw7jMDn/b3T6iXqg/G+696He
 TGNcgFqZ9AVsHbsdyF+wXayVs1rv7WtPLhJC5J0zz+jjPci9SB5/tGWbc6dlbw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm: adp: Remove pointless irq_lock spin lock
Message-ID: <aAAaPO0lc6jCZE-m@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-4-772699f13293@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-drm_adp_fixes-v1-4-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Apr 16, 2025 at 10:25:30PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> Interrupt handlers run with interrupts disabled so it is not necessary
> to protect them against reentrancy.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c6238fb059342eebafddd53650a499fea0079dea..abb42f57fe5984a8f0f4be7081fb6803866b5d5b 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -121,7 +121,6 @@ struct adp_drv_private {
>  	dma_addr_t mask_iova;
>  	int be_irq;
>  	int fe_irq;
> -	spinlock_t irq_lock;
>  	struct drm_pending_vblank_event *event;
>  };
>  
> @@ -488,8 +487,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
>  	u32 int_status;
>  	u32 int_ctl;
>  
> -	spin_lock(&adp->irq_lock);
> -
>  	int_status = readl(adp->fe + ADP_INT_STATUS);
>  	if (int_status & ADP_INT_STATUS_VBLANK) {
>  		drm_crtc_handle_vblank(&adp->crtc);
> @@ -507,7 +504,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
>  
>  	writel(int_status, adp->fe + ADP_INT_STATUS);
>  
> -	spin_unlock(&adp->irq_lock);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -572,8 +568,6 @@ static int adp_probe(struct platform_device *pdev)
>  	if (IS_ERR(adp))
>  		return PTR_ERR(adp);
>  
> -	spin_lock_init(&adp->irq_lock);
> -
>  	dev_set_drvdata(&pdev->dev, &adp->drm);
>  
>  	err = adp_parse_of(pdev, adp);
> 
> -- 
> 2.49.0
> 
> 
