Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8567E16D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B60E10E2C1;
	Fri, 27 Jan 2023 10:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFFB10E2C1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:20:07 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pLLq1-0000hR-S8; Fri, 27 Jan 2023 11:20:05 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pLLq1-0003ck-L9; Fri, 27 Jan 2023 11:20:05 +0100
Date: Fri, 27 Jan 2023 11:20:05 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/2] gpu: ipu-v3: pre: add dynamic buffer layout
 reconfiguration
Message-ID: <20230127102005.GB28023@pengutronix.de>
References: <20230126184744.921758-1-l.stach@pengutronix.de>
 <20230126184744.921758-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126184744.921758-2-l.stach@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 07:47:44PM +0100, Lucas Stach wrote:
> imx-drm doesn't mandate a modeset when the framebuffer modifier changes,
> but currently the tile prefetch and resolve (TPR) configuration of the
> PRE is only set up on the initial modeset.
> 
> As the TPR configuration is double buffered, same as all the other PRE
> states, we can support dynamic reconfiguration of the buffer layout from
> one frame to another. As switching between (super-)tiled and linear
> prefetch needs to touch the CTRL register make sure to do the
> reconfiguration inside the safe window.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/ipu-v3/ipu-pre.c | 59 +++++++++++++++++++++++++++++-------
>  drivers/gpu/ipu-v3/ipu-prg.c |  2 +-
>  drivers/gpu/ipu-v3/ipu-prv.h |  2 +-
>  3 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
> index befffc85a146..e8d9792827dd 100644
> --- a/drivers/gpu/ipu-v3/ipu-pre.c
> +++ b/drivers/gpu/ipu-v3/ipu-pre.c
> @@ -99,8 +99,12 @@ struct ipu_pre {
>  
>  	struct {
>  		bool		in_use;
> +		uint64_t	modifier;
> +		unsigned int	height;
>  		unsigned int	safe_window_end;
>  		unsigned int	bufaddr;
> +		u32		ctrl;
> +		u8		cpp;
>  	} cur;
>  };
>  
> @@ -173,6 +177,11 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
>  	u32 active_bpp = info->cpp[0] >> 1;
>  	u32 val;
>  
> +	pre->cur.bufaddr = bufaddr;
> +	pre->cur.height = height;
> +	pre->cur.modifier = modifier;
> +	pre->cur.cpp = info->cpp[0];
> +
>  	/* calculate safe window for ctrl register updates */
>  	if (modifier == DRM_FORMAT_MOD_LINEAR)
>  		pre->cur.safe_window_end = height - 2;
> @@ -181,7 +190,6 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
>  
>  	writel(bufaddr, pre->regs + IPU_PRE_CUR_BUF);
>  	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
> -	pre->cur.bufaddr = bufaddr;
>  
>  	val = IPU_PRE_PREF_ENG_CTRL_INPUT_PIXEL_FORMAT(0) |
>  	      IPU_PRE_PREF_ENG_CTRL_INPUT_ACTIVE_BPP(active_bpp) |
> @@ -223,28 +231,56 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
>  	}
>  	writel(val, pre->regs + IPU_PRE_TPR_CTRL);
>  
> -	val = readl(pre->regs + IPU_PRE_CTRL);
> -	val |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE |
> -	       IPU_PRE_CTRL_SDW_UPDATE;
> +	pre->cur.ctrl = readl(pre->regs + IPU_PRE_CTRL);
> +	pre->cur.ctrl |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE;
>  	if (modifier == DRM_FORMAT_MOD_LINEAR)
> -		val &= ~IPU_PRE_CTRL_BLOCK_EN;
> +		pre->cur.ctrl &= ~IPU_PRE_CTRL_BLOCK_EN;
>  	else
> -		val |= IPU_PRE_CTRL_BLOCK_EN;
> -	writel(val, pre->regs + IPU_PRE_CTRL);
> +		pre->cur.ctrl |= IPU_PRE_CTRL_BLOCK_EN;
> +	writel(pre->cur.ctrl | IPU_PRE_CTRL_SDW_UPDATE,
> +	       pre->regs + IPU_PRE_CTRL);
>  }
>  
> -void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
> +void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr)
>  {
>  	unsigned long timeout = jiffies + msecs_to_jiffies(5);
>  	unsigned short current_yblock;
> +	unsigned int safe_window_end = pre->cur.safe_window_end;
>  	u32 val;
>  
> -	if (bufaddr == pre->cur.bufaddr)
> +	if (bufaddr == pre->cur.bufaddr &&
> +	    modifier == pre->cur.modifier)
>  		return;
>  
>  	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
>  	pre->cur.bufaddr = bufaddr;
>  
> +	if (modifier != pre->cur.modifier) {
> +		val = readl(pre->regs + IPU_PRE_TPR_CTRL);
> +		val &= ~IPU_PRE_TPR_CTRL_TILE_FORMAT_MASK;
> +		if (modifier != DRM_FORMAT_MOD_LINEAR) {
> +			/* only support single buffer formats for now */
> +			val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SINGLE_BUF;
> +			if (modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED)
> +				val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SUPER_TILED;
> +			if (pre->cur.cpp == 2)
> +				val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_16_BIT;
> +		}
> +		writel(val, pre->regs + IPU_PRE_TPR_CTRL);
> +
> +		if (modifier == DRM_FORMAT_MOD_LINEAR)
> +			pre->cur.ctrl &= ~IPU_PRE_CTRL_BLOCK_EN;
> +		else
> +			pre->cur.ctrl |= IPU_PRE_CTRL_BLOCK_EN;
> +
> +		if (modifier == DRM_FORMAT_MOD_LINEAR)
> +			pre->cur.safe_window_end = pre->cur.height - 2;
> +		else
> +			pre->cur.safe_window_end = DIV_ROUND_UP(pre->cur.height, 4) - 1;

Could you extract the same code from ipu_pre_configure() into a separate
function, say ipu_pre_configure_modifier(), instead, and call that from
both places?

regards
Philipp
