Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80224FD08
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 13:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAF489C28;
	Mon, 24 Aug 2020 11:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E86A89C28
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O0ghGm5L+2WoN6SjDvrmivUt079RCiVuAqMqQ4o7fNg=; b=NcSmPXPqDgNFdFVCwrel9mWRe
 SJmIrrhGue9LyVFUKHm2hq7pQtMcAUkXlu7ko5Fj9UyzuWzZxaPQ2egSf58+A1lI84uQloFO3bU4d
 LhRP1NVNB3l2aGjJPN9Etge3U5PO5afxCg2BytBuFwZmx+t3tC2/fvq8ulDA4EbJ97aY7W9ZoQuX6
 dSu2w0is645d9mvOKN+JeH1/IurFaaqxK/e0VNBUEaYrgMD4XrZNhuKfVvFy2p06sLabrRKyGrFbm
 Oi09TWbXs4c2nQI+7PnngEnM9V6EFri3qhdWtRFsfNtzp4N0izdyd3ZPjHHtFVnP0vl/ezu06iQ4s
 ILUcPljJQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56530)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kAB3v-0008VB-86; Mon, 24 Aug 2020 12:54:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kAB3t-0007O5-QS; Mon, 24 Aug 2020 12:54:53 +0100
Date: Mon, 24 Aug 2020 12:54:53 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: always start/stop scheduler in timeout
 processing
Message-ID: <20200824115453.GI1551@shell.armlinux.org.uk>
References: <20200824110248.5998-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824110248.5998-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 01:02:48PM +0200, Lucas Stach wrote:
> The drm scheduler currently expects that the stop/start sequence is always
> executed in the timeout handling, as the job at the head of the hardware
> execution list is always removed from the ring mirror before the driver
> function is called and only inserted back into the list when starting the
> scheduler.
> 
> This adds some unnecessary overhead if the timeout handler determines
> that the GPU is still executing jobs normally and just wished to extend
> the timeout, but a better solution requires a major rearchitecture of the
> scheduler, which is not applicable as a fix.
> 
> Fixes: 135517d3565b drm/scheduler: Avoid accessing freed bad job.)
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

From a brief test, this seems to fix the problem, thanks.

Tested-by: Russell King <rmk+kernel@armlinux.org.uk>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 4e3e95dce6d8..cd46c882269c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -89,12 +89,15 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
>  	u32 dma_addr;
>  	int change;
>  
> +	/* block scheduler */
> +	drm_sched_stop(&gpu->sched, sched_job);
> +
>  	/*
>  	 * If the GPU managed to complete this jobs fence, the timout is
>  	 * spurious. Bail out.
>  	 */
>  	if (dma_fence_is_signaled(submit->out_fence))
> -		return;
> +		goto out_no_timeout;
>  
>  	/*
>  	 * If the GPU is still making forward progress on the front-end (which
> @@ -105,12 +108,9 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
>  	change = dma_addr - gpu->hangcheck_dma_addr;
>  	if (change < 0 || change > 16) {
>  		gpu->hangcheck_dma_addr = dma_addr;
> -		return;
> +		goto out_no_timeout;
>  	}
>  
> -	/* block scheduler */
> -	drm_sched_stop(&gpu->sched, sched_job);
> -
>  	if(sched_job)
>  		drm_sched_increase_karma(sched_job);
>  
> @@ -120,6 +120,7 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
>  
>  	drm_sched_resubmit_jobs(&gpu->sched);
>  
> +out_no_timeout:
>  	/* restart scheduler after GPU is usable again */
>  	drm_sched_start(&gpu->sched, true);
>  }
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
