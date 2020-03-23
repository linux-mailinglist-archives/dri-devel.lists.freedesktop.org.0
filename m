Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201C19008E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B176E3A8;
	Mon, 23 Mar 2020 21:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ABF6E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:44:01 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D01395C0BDA;
 Mon, 23 Mar 2020 22:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1584999839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYUXMt96vTA1DBt6YufQKN1yw1Z26O+ROwEesd7PbFc=;
 b=gk7fFsO+IOzMk2QTIYlYpoHxt9YIQMVmPK2BuSz2pkeGsZHu8egC1LMCECYsgLD/lnMs/m
 rdMtCEffADkI93WZii2tN/j5dtA68chGE4EDK+ZDF9IolN+J3s7dKRdLi9mP8FtgyOi3Nz
 uWf/yXjQ8/N2ru6MKDmSgPu/Lhxw+XE=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:43:59 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 06/21] drm: mxsfb: Pass mxsfb_drm_private pointer to
 mxsfb_reset_block()
In-Reply-To: <20200309195216.31042-7-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-7-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <0849d2109fe085152e032e937496a0d7@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:52, Laurent Pinchart wrote:
> The mxsfb_reset_block() function isn't special, pass it the
> mxsfb_drm_private pointer instead of a pointer to the base address.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index 8b6339316929..be60c4021e2f 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -166,21 +166,21 @@ static int clear_poll_bit(void __iomem *addr, u32 mask)
>  	return readl_poll_timeout(addr, reg, !(reg & mask), 0, RESET_TIMEOUT);
>  }
>  
> -static int mxsfb_reset_block(void __iomem *reset_addr)
> +static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
>  {
>  	int ret;
>  
> -	ret = clear_poll_bit(reset_addr, MODULE_SFTRST);
> +	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
>  	if (ret)
>  		return ret;
>  
> -	writel(MODULE_CLKGATE, reset_addr + MXS_CLR_ADDR);
> +	writel(MODULE_CLKGATE, mxsfb->base + MXS_CLR_ADDR);
>  
> -	ret = clear_poll_bit(reset_addr, MODULE_SFTRST);
> +	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
>  	if (ret)
>  		return ret;
>  
> -	return clear_poll_bit(reset_addr, MODULE_CLKGATE);
> +	return clear_poll_bit(mxsfb->base, MODULE_CLKGATE);
>  }
>  
>  static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
> @@ -213,7 +213,7 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb)
>  	 */
>  
>  	/* Mandatory eLCDIF reset as per the Reference Manual */
> -	err = mxsfb_reset_block(mxsfb->base);
> +	err = mxsfb_reset_block(mxsfb);
>  	if (err)
>  		return;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
