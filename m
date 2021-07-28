Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125AD3D887D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57C6E5D2;
	Wed, 28 Jul 2021 07:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651FB6E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:04:47 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1ae17007-ef72-11eb-9082-0050568c148b;
 Wed, 28 Jul 2021 07:04:52 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 09D24194B83;
 Wed, 28 Jul 2021 09:05:05 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:04:42 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 01/14] drm/kmb: Enable LCD DMA for low TVDDCV
Message-ID: <YQEBirrNA+G+GnuP@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,
On Tue, Jul 27, 2021 at 05:31:13PM -0700, Anitha Chrisanthus wrote:
> From: Edmund Dea <edmund.j.dea@intel.com>
> 
> There's an undocumented dependency between LCD layer enable bits [2-5]
> and the AXI pipelined read enable bit [28] in the LCD_CONTROL register.
> The proper order of operation is:
> 
> 1) Clear AXI pipelined read enable bit
> 2) Set LCD layers
> 3) Set AXI pipelined read enable bit
> 
> With this update, LCD can start DMA when TVDDCV is reduced down to 700mV.
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Patch is missing your s-o-b.

> ---
>  drivers/gpu/drm/kmb/kmb_drv.c   | 14 ++++++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.c | 15 +++++++++++++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index 96ea1a2c11dd..c0b1c6f99249 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -203,6 +203,7 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
>  	unsigned long status, val, val1;
>  	int plane_id, dma0_state, dma1_state;
>  	struct kmb_drm_private *kmb = to_kmb(dev);
> +	u32 ctrl = 0;
>  
>  	status = kmb_read_lcd(kmb, LCD_INT_STATUS);
>  
> @@ -227,6 +228,19 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
>  				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
>  						    kmb->plane_status[plane_id].ctrl);
>  
> +				ctrl = kmb_read_lcd(kmb, LCD_CONTROL);
> +				if (!(ctrl & (LCD_CTRL_VL1_ENABLE |
> +				    LCD_CTRL_VL2_ENABLE |
> +				    LCD_CTRL_GL1_ENABLE |
> +				    LCD_CTRL_GL2_ENABLE))) {
> +					/* If no LCD layers are using DMA,
> +					 * then disable DMA pipelined AXI read
> +					 * transactions.
> +					 */
> +					kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> +							    LCD_CTRL_PIPELINE_DMA);
> +				}
> +
This function could benefit from a few helper functions to avoid all the
indent. But this is un-related to this patch.

>  				kmb->plane_status[plane_id].disable = false;
>  			}
>  		}
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
> index d5b6195856d1..2888dd5dcc2c 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -427,8 +427,14 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
>  
>  	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
>  
> -	/* FIXME no doc on how to set output format,these values are
> -	 * taken from the Myriadx tests
> +	/* Enable pipeline AXI read transactions for the DMA
> +	 * after setting graphics layers. This must be done
> +	 * in a separate write cycle.
> +	 */
> +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_PIPELINE_DMA);
> +
> +	/* FIXME no doc on how to set output format,these values are taken
                                                    ^ add space
> +	 * from the Myriadx tests
>  	 */
>  	out_format |= LCD_OUTF_FORMAT_RGB888;
>  
> @@ -526,6 +532,11 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
>  		plane->id = i;
>  	}
>  
> +	/* Disable pipeline AXI read transactions for the DMA
> +	 * prior to setting graphics layers
> +	 */
> +	kmb_clr_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_PIPELINE_DMA);
> +
>  	return primary;
>  cleanup:
>  	drmm_kfree(drm, plane);

With the two nits fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
