Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BF4CA3D7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA710E86A;
	Wed,  2 Mar 2022 11:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0E10E86A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 192CAFB03;
 Wed,  2 Mar 2022 12:35:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Le1pHLclBSLN; Wed,  2 Mar 2022 12:34:59 +0100 (CET)
Date: Wed, 2 Mar 2022 12:34:57 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Remove superfluous write to
 NWL_DSI_IRQ_MASK register
Message-ID: <Yh9WYZ5pA/MUyZFx@qwark.sigxcpu.org>
References: <20220216085842.1973868-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216085842.1973868-1-victor.liu@nxp.com>
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
Cc: robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,
On Wed, Feb 16, 2022 at 04:58:42PM +0800, Liu Ying wrote:
> To initialize register NWL_DSI_IRQ_MASK, it's enough to write it
> only once in function nwl_dsi_init_interrupts().
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index af07eeb47ca0..fcc4a2889ad4 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -333,17 +333,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
>  
>  static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
>  {
> -	u32 irq_enable;
> -
> -	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, 0xffffffff);
> -	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);
> -
> -	irq_enable = ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
> -			    NWL_DSI_RX_PKT_HDR_RCVD_MASK |
> -			    NWL_DSI_TX_FIFO_OVFLW_MASK |
> -			    NWL_DSI_HS_TX_TIMEOUT_MASK);
> +	u32 irq_enable = ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
> +				NWL_DSI_RX_PKT_HDR_RCVD_MASK |
> +				NWL_DSI_TX_FIFO_OVFLW_MASK |
> +				NWL_DSI_HS_TX_TIMEOUT_MASK);
>  
>  	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, irq_enable);
> +	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);

Works fine here. I thought it was due to some hw quirk but can't find
any note in it so:

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Thanks,
 -- Guido

>  
>  	return nwl_dsi_clear_error(dsi);
>  }
> -- 
> 2.25.1
> 
