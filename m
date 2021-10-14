Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83142E16F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07F46EC22;
	Thu, 14 Oct 2021 18:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A5C6EC22
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:37:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id d606b18b-2d1d-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 18:37:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5DB1C194B6A;
 Thu, 14 Oct 2021 20:37:50 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:37:40 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
Subject: Re: [PATCH v3 3/7] drm/kmb: Remove clearing DPHY regs
Message-ID: <YWh49L+uuSWS2Skg@ravnborg.org>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-3-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013233632.471892-3-anitha.chrisanthus@intel.com>
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

On Wed, Oct 13, 2021 at 04:36:28PM -0700, Anitha Chrisanthus wrote:
> From: Edmund Dea <edmund.j.dea@intel.com>
> 
> Don't clear the shared DPHY registers common to MIPI Rx and MIPI Tx during
> DSI initialization since this was causing MIPI Rx reset. Rest of the
> writes are bitwise, so will not affect Mipi Rx side.
> 
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>

As Edmund is author, he should be listed first. The s-o-b lines
expressed the order.
With this fixed.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index 86e8e7943e89..a0669b842ff5 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -1393,11 +1393,6 @@ int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
>  		mipi_tx_init_cfg.lane_rate_mbps = data_rate;
>  	}
>  
> -	kmb_write_mipi(kmb_dsi, DPHY_ENABLE, 0);
> -	kmb_write_mipi(kmb_dsi, DPHY_INIT_CTRL0, 0);
> -	kmb_write_mipi(kmb_dsi, DPHY_INIT_CTRL1, 0);
> -	kmb_write_mipi(kmb_dsi, DPHY_INIT_CTRL2, 0);
> -
>  	/* Initialize mipi controller */
>  	mipi_tx_init_cntrl(kmb_dsi, &mipi_tx_init_cfg);
>  
> -- 
> 2.25.1
