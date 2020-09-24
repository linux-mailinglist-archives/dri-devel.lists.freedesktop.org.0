Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76027703F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8396E3F9;
	Thu, 24 Sep 2020 11:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE166E3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:48:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B8D22FD;
 Thu, 24 Sep 2020 13:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600948123;
 bh=Ku59FHbrLdQSTznO6nume9uJ54TlRBNwQq6KpZJezFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mB79bVmsTtZz75/4bJkg0h8XDc8NoE82S9oDnom30tUiaqvaP4ZEd1ldimP69kP1w
 Fg9yoxBySxV7xsmolRxTEmR9c1fO95XAsAgdCEXXgAw2FPF18PFGBBRZNprvReEQ1Y
 2lMPUs83LC+YTskNCi+YOixdvlRtHYTGDZxfW8q4=
Date: Thu, 24 Sep 2020 14:48:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
Message-ID: <20200924114810.GB3968@pendragon.ideasonboard.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923083057.113367-1-tomi.valkeinen@ti.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Sep 23, 2020 at 11:30:57AM +0300, Tomi Valkeinen wrote:
> On x64 we get:
> 
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
> 
> The registers are 32 bit, so fix by casting to u32.

I wonder if we need a BIT32 macro... This is a common issue, it would be
nice to handle it in the macros that define register fields.

> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 621ebdbff8a3..d0c65610ebb5 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -748,7 +748,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
>  	 * bridge should already be detached.
>  	 */
>  	if (mhdp->bridge_attached)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  
>  	spin_unlock(&mhdp->start_lock);
> @@ -1689,7 +1689,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  
>  	/* Enable SW event interrupts */
>  	if (hw_ready)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  
>  	return 0;
> @@ -2122,7 +2122,7 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
>  
>  	/* Enable SW event interrupts */
>  	if (mhdp->bridge_attached)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  }
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
